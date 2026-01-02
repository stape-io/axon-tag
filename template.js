const BigQuery = require('BigQuery');
const computeEffectiveTldPlusOne = require('computeEffectiveTldPlusOne');
const createRegex = require('createRegex');
const encodeUriComponent = require('encodeUriComponent');
const generateRandom = require('generateRandom');
const getAllEventData = require('getAllEventData');
const getCookieValues = require('getCookieValues');
const getContainerVersion = require('getContainerVersion');
const getEventData = require('getEventData');
const getRequestHeader = require('getRequestHeader');
const getTimestampMillis = require('getTimestampMillis');
const getType = require('getType');
const JSON = require('JSON');
const logToConsole = require('logToConsole');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const Object = require('Object');
const parseUrl = require('parseUrl');
const sendHttpRequest = require('sendHttpRequest');
const sha256Sync = require('sha256Sync');
const setCookie = require('setCookie');

/*==============================================================================
==============================================================================*/

const eventData = getAllEventData();

if (shouldExitEarly(data, eventData)) return;

const mappedData = mapEvent(data, eventData);
setClientIdCookie(data, mappedData[0].user_data.client_id);
setClickIdCookies(data, mappedData[0].user_data.aleid, mappedData[0].user_data.alart);

const validationMessage = validateMappedData(mappedData[0]);
if (validationMessage) {
  log({
    Name: 'Axon',
    Type: 'Message',
    EventName: mappedData[0].name,
    Message: 'Request was not sent.',
    Reason: validationMessage
  });
  return data.gtmOnFailure();
}

sendEvent(data, mappedData);

if (data.useOptimisticScenario) {
  return data.gtmOnSuccess();
}

/*==============================================================================
  Vendor related functions
==============================================================================*/

function parseClickIdFromUrl(eventData, clickIdKey) {
  const url = eventData.page_location || getRequestHeader('referer');
  if (!url) return;

  const urlSearchParams = parseUrl(url).searchParams;
  return urlSearchParams[clickIdKey];
}

function getClickIdByIdKeyForUserData(eventData, clickIdKey) {
  const clickIdKeyToCookieName = {
    aleid: 'axeid',
    alart: 'axart'
  };

  const clickIdFromUrl = parseClickIdFromUrl(eventData, clickIdKey);
  if (clickIdFromUrl) return clickIdFromUrl;

  const clickIdFromServerCookie = getCookieValues(clickIdKeyToCookieName[clickIdKey])[0];
  if (clickIdFromServerCookie) return clickIdFromServerCookie;

  const clickIdFromJSCookie = getCookieValues('_' + clickIdKeyToCookieName[clickIdKey])[0];
  if (clickIdFromJSCookie) return clickIdFromJSCookie;
}

function setClickIdCookies(data, aleid, alart) {
  if (!isUIFieldTrue(data.setClickIdCookie) || (!aleid && !alart)) {
    return;
  }

  const cookieOptions = {
    domain: getCookieDomain(data.clickIdCookieDomain),
    samesite: data.clickIdCookieSameSite || 'none',
    path: '/',
    secure: true,
    httpOnly: !!data.clickIdCookieHttpOnly,
    'max-age': 60 * 60 * 24 * makeInteger(data.clickIdCookieExpiration || 365)
  };

  if (aleid) setCookie('axeid', aleid, cookieOptions, false);
  if (alart) setCookie('axart', alart, cookieOptions, false);
}

function getClientIdForUserData(data, eventData) {
  const clientIdFromServerCookie = getCookieValues('axcid')[0] || getCookieValues('axwrt')[0];
  if (clientIdFromServerCookie) return clientIdFromServerCookie;

  const clientIdFromJSCookie = getCookieValues('_axwrt')[0];
  if (clientIdFromJSCookie) return clientIdFromJSCookie;

  if (eventData.client_id) return eventData.client_id;

  if (isUIFieldTrue(data.setClientIdCookie)) return generateUUID();
}

function setClientIdCookie(data, clientId) {
  if (!isUIFieldTrue(data.setClientIdCookie)) return;

  const cookieOptions = {
    domain: getCookieDomain(data.clientIdCookieDomain),
    samesite: data.clientIdCookieSameSite || 'none',
    path: '/',
    secure: true,
    httpOnly: !!data.clientIdCookieHttpOnly,
    'max-age': 60 * 60 * 24 * makeInteger(data.clientIdCookieExpiration || 365)
  };

  if (clientId) setCookie('axcid', clientId, cookieOptions, false);

  // Ref: https://support.axon.ai/en/growth/promoting-your-websites/axon-pixel-integration/google-tag-manager#enhanced-user-identification-recommended
  const axwrt = getCookieValues('_axwrt')[0];
  if (axwrt) {
    cookieOptions.httpOnly = false;
    setCookie('axwrt', axwrt, cookieOptions, false);
  }
}

function mapEventName(data, eventData) {
  if (data.eventType === 'inherit') {
    const eventName = eventData.event_name;
    const gaToAxonEventName = {
      page_view: 'page_view',
      view_item: 'view_item',
      view_cart: 'view_cart',
      add_to_cart: 'add_to_cart',
      remove_from_cart: 'remove_from_cart',
      begin_checkout: 'begin_checkout',
      add_payment_info: 'add_payment_info',
      generate_lead: 'generate_lead',
      purchase: 'purchase',
      login: 'login',
      sign_up: 'sign_up',
      search: 'search',
      view_search_results: 'search',
      subscribe: 'subscribe',
      app_open: 'app_open'
    };

    return gaToAxonEventName[eventName] || eventName;
  }

  return data.eventType === 'standard' ? data.eventNameStandard : undefined;
}

function addServerEventData(data, eventData, serverEvent) {
  if (isUIFieldTrue(data.autoMapServerEventDataParameters)) {
    serverEvent.event_time = getTimestampMillis();
    if (eventData.page_location) serverEvent.event_source_url = eventData.page_location;
    else if (eventData.screen_class && eventData.screen_name) {
      serverEvent.event_source_url = eventData.screen_class + '.' + eventData.screen_name;
    }
    if (eventData.event_id || eventData.eventId) {
      serverEvent.dedupe_id = makeString(eventData.event_id) || makeString(eventData.eventId);
    }
  }

  if (data.hasOwnProperty('eventTimestamp')) {
    serverEvent.event_time = data.eventTimestamp ? makeInteger(data.eventTimestamp) : undefined;
  }
  if (data.hasOwnProperty('eventSourceUrl')) {
    serverEvent.event_source_url = data.eventSourceUrl
      ? makeString(data.eventSourceUrl)
      : undefined;
  }
  if (data.hasOwnProperty('dedupeId')) {
    serverEvent.dedupe_id = data.dedupeId ? makeString(data.dedupeId) : undefined;
  }

  return serverEvent;
}

function formatItem(data, item) {
  const itemIdKey = data.itemIdKey ? data.itemIdKey : 'item_id';
  const formattedItem = {};
  if (item[itemIdKey]) formattedItem.item_id = makeString(item[itemIdKey]);
  if (item.image_url) formattedItem.image_url = makeString(item.image_url);
  if (isValidValue(item.item_category_id) && makeInteger(item.item_category_id)) {
    formattedItem.item_category_id = makeInteger(item.item_category_id);
  }
  if (item.item_name) formattedItem.item_name = makeString(item.item_name);
  if (item.item_variant) formattedItem.item_variant_id = makeString(item.item_variant);
  if (isValidValue(item.price)) formattedItem.price = makeNumber(item.price);
  if (item.affiliation) formattedItem.affiliation = makeString(item.affiliation);
  if (isValidValue(item.discount)) formattedItem.discount = makeNumber(item.discount);
  if (item.item_brand) formattedItem.item_brand = makeString(item.item_brand);
  // Required for 'add_to_cart', 'remove_from_cart' and 'purchase' events
  formattedItem.quantity = item.quantity ? makeInteger(item.quantity) : 1;
  return formattedItem;
}

function addEventData(data, eventData, serverEvent) {
  const eventPayloadData = {};

  if (isUIFieldTrue(data.autoMapEventDataParameters)) {
    let currencyFromItems;
    let valueFromItems;

    let items = eventData.items;
    if (getType(items) === 'string') items = JSON.parse(items);
    if (getType(items) === 'array' && items.length > 0) {
      eventPayloadData.items = [];
      valueFromItems = 0;
      currencyFromItems = items[0].currency;
      items.forEach((i) => {
        const formattedItem = formatItem(data, i);
        valueFromItems += formattedItem.quantity
          ? formattedItem.quantity * formattedItem.price
          : formattedItem.price;
        eventPayloadData.items.push(formattedItem);
      });
    }

    if (isValidValue(eventData.value)) eventPayloadData.value = makeNumber(eventData.value);
    else if (isValidValue(valueFromItems)) eventPayloadData.value = valueFromItems;

    if (isValidValue(eventData.tax)) eventPayloadData.tax = makeNumber(eventData.tax);
    if (isValidValue(eventData.shipping)) {
      eventPayloadData.shipping = makeNumber(eventData.shipping);
    }

    const currency = eventData.currency || currencyFromItems;
    if (currency) eventPayloadData.currency = makeString(currency);

    if (eventData.transaction_id) {
      eventPayloadData.transaction_id = makeString(eventData.transaction_id);
    }

    if (eventData.search_term) eventPayloadData.search_term = makeString(eventData.search_term);
    if (eventData.method) eventPayloadData.method = makeString(eventData.method);

    if (
      serverEvent.name === 'search' &&
      getType(eventPayloadData.items) === 'array' &&
      eventPayloadData.items.length > 0
    ) {
      eventPayloadData.results = eventPayloadData.items;
      eventPayloadData.items = undefined;
    }
  }

  if (data.eventDataParametersList) {
    const castValueByKey = (key, value) => {
      switch (key) {
        case 'value':
        case 'shipping':
        case 'tax':
          if (!isValidValue(value)) return undefined;
          return makeNumber(value);
        case 'items':
        case 'results':
          let items = value;
          if (getType(items) === 'string') items = JSON.parse(items);
          if (getType(items) === 'array' && items.length > 0) {
            return items.map((i) => formatItem(data, i));
          }
          return undefined;
        default:
          if (!value) return undefined;
          return makeString(value);
      }
    };
    data.eventDataParametersList.forEach((d) => {
      eventPayloadData[d.name] = castValueByKey(d.name, d.value);
    });
  }

  serverEvent.data = eventPayloadData;

  return eventPayloadData;
}

function getEmailAddressFromEventData(eventData) {
  const eventDataUserData = eventData.user_data || {};

  const email =
    eventData.email ||
    eventData.email_address ||
    eventDataUserData.email ||
    eventDataUserData.email_address ||
    eventDataUserData.sha256_email ||
    eventDataUserData.sha256_email_address;

  const emailType = getType(email);

  if (emailType === 'string') return email;
  else if (emailType === 'array' || emailType === 'object') return email[0];
}

function getPhoneNumberFromEventData(eventData) {
  const eventDataUserData = eventData.user_data || {};

  // sha256_* parameter cannot be used because the hash used by Google
  // takes into account the '+' prefix, whereas Axon doesn't.
  const phone =
    eventData.phone ||
    eventData.phone_number ||
    eventDataUserData.phone ||
    eventDataUserData.phone_number;

  const phoneType = getType(phone);

  if (phoneType === 'string') return phone;
  else if (phoneType === 'array' && phoneType === 'object') return phone[0];
}

function getUserAddressFromEventData(eventData) {
  const eventDataUserData = eventData.user_data || {};

  let eventDataUserDataAddress = {};
  const addressType = getType(eventDataUserData.address);
  if (addressType === 'object' || addressType === 'array') {
    eventDataUserDataAddress = eventDataUserData.address[0] || eventDataUserData.address;
  }

  return {
    postalCode: eventDataUserDataAddress.postal_code,
    country: eventDataUserDataAddress.country
  };
}

function addUserData(data, eventData, serverEvent) {
  const userData = {
    esi: data.eventSource
  };

  if (isUIFieldTrue(data.autoMapUserDataParameters)) {
    ['aleid', 'alart'].forEach((clickIdKey) => {
      const clickId = getClickIdByIdKeyForUserData(eventData, clickIdKey);
      if (clickId) userData[clickIdKey] = clickId;
    });

    const clientId = getClientIdForUserData(data, eventData);
    if (clientId) userData.client_id = clientId;

    const axwrt =
      getCookieValues('axwrt')[0] /* Server cookie */ ||
      getCookieValues('_axwrt')[0]; /* JS cookie */
    if (axwrt) userData.axwrt = axwrt;

    if (eventData.ga_session_id) {
      userData.sid = (userData.client_id || '') + makeString(eventData.ga_session_id);
    }

    if (eventData.user_id) userData.user_id = makeString(eventData.user_id);
    if (eventData.ip_override) userData.client_ip_address = eventData.ip_override;
    if (eventData.user_agent) userData.client_user_agent = eventData.user_agent;

    let mobileDeviceId = eventData['x-ga-resettable_device_id'];
    if (mobileDeviceId && mobileDeviceId !== '00000000-0000-0000-0000-000000000000') {
      userData.ifa = mobileDeviceId;
    }
    if (eventData['x-ga-vendor_device_id']) {
      userData.idfv = eventData['x-ga-vendor_device_id'];
    }

    let platform = makeString(eventData['x-ga-platform'] || '').toLowerCase();
    if (platform === 'android' || platform === 'ios') userData.os = platform;

    const email = getEmailAddressFromEventData(eventData);
    if (email) userData.email = email;

    const phone = getPhoneNumberFromEventData(eventData);
    if (phone) userData.phone = phone;

    const address = getUserAddressFromEventData(eventData);
    if (address.postalCode && address.country_code === 'US') userData.zip = address.postalCode;
    if (address.country) userData.country_code = address.country;
  }

  if (data.operatingSystem) userData.os = data.operatingSystem;

  if (data.userDataParametersList) {
    data.userDataParametersList.forEach((d) => (userData[d.name] = d.value));
  }

  serverEvent.user_data = userData;

  return serverEvent;
}

function addMeasurementPartnerData(data, eventData, serverEvent) {
  if (!data.addMeasurementData) return serverEvent;

  const measurementData = {};

  if (isUIFieldTrue(data.autoMapMeasurementDataParameters)) {
    if (eventData.customer_type === 'new') measurementData.is_new_customer = true;
    else if (eventData.customer_type === 'returning') measurementData.is_new_customer = false;
    measurementData.last_visit_ts = getTimestampMillis();
    if (
      getType(eventData['x-ga-mp2-user_properties']) === 'object' &&
      eventData['x-ga-mp2-user_properties'].first_open_time
    ) {
      measurementData.first_visit_ts = eventData['x-ga-mp2-user_properties'].first_open_time;
    }
  }

  // Required
  measurementData.is_claimable = isValidValue(data.isClaimable) ? !!data.isClaimable : false;
  measurementData.attribution_model = data.attributionModel || 'LAST_CLICK';
  measurementData.attribution_lookback_window_hours =
    makeInteger(data.attributionLookbackWindow) || undefined;
  measurementData.accounting_mode = data.accountingMode || 'CASH';
  measurementData.attribution_share = isValidValue(data.attributionShare)
    ? makeNumber(data.attributionShare)
    : 1;

  // Optional
  if (data.campaignId) measurementData.campaign_id = makeString(data.campaignId);
  if (data.creativeSetId) measurementData.creative_set_id = makeString(data.creativeSetId);
  if (data.hasOwnProperty('isNewCustomer') && isValidValue(data.isNewCustomer))
    measurementData.is_new_customer = !!data.isNewCustomer;
  if (data.firstPurchaseTimestamp) {
    measurementData.first_purchase_ts = makeInteger(data.firstPurchaseTimestamp);
  }
  if (data.lastPurchaseTimestamp) {
    measurementData.last_purchase_ts = makeInteger(data.lastPurchaseTimestamp);
  }
  if (isValidValue(data.isNewVisitor)) measurementData.is_new_visitor = !!data.isNewVisitor;

  if (data.hasOwnProperty('firstVisitTimestamp')) {
    measurementData.first_visit_ts = data.firstVisitTimestamp
      ? makeInteger(data.firstVisitTimestamp)
      : undefined;
  }
  if (data.hasOwnProperty('lastVisitTimestamp')) {
    measurementData.last_visit_ts = data.lastVisitTimestamp
      ? makeInteger(data.lastVisitTimestamp)
      : undefined;
  }

  serverEvent.measurement_partner_data = measurementData;

  return serverEvent;
}

function normalizeBasedOnSchemaKey(schemaKey, value) {
  const normalizePhoneNumber = (phoneNumber) => {
    if (!phoneNumber) return phoneNumber;
    const nonDigitsRegex = createRegex('[^0-9]', 'g');
    return phoneNumber.replace(nonDigitsRegex, '');
  };

  switch (schemaKey) {
    case 'phone':
      return normalizePhoneNumber(value);
    default:
      return value;
  }
}

function hashDataIfNeeded(serverEvent) {
  const userData = serverEvent.user_data;
  const hasUserData = getType(userData) === 'object' && Object.entries(userData).length > 0;
  if (hasUserData) {
    const userDataKeysToHash = ['email', 'phone'];
    userDataKeysToHash.forEach((key) => {
      const value = userData[key];
      if (!value) return;
      userData[key] = hashData(normalizeBasedOnSchemaKey(key, value));
    });
  }

  return serverEvent;
}

function mapEvent(data, eventData) {
  const serverEvent = {
    name: mapEventName(data, eventData)
  };
  const mappedData = [serverEvent];

  addServerEventData(data, eventData, serverEvent);
  addEventData(data, eventData, serverEvent);
  addUserData(data, eventData, serverEvent);
  addMeasurementPartnerData(data, eventData, serverEvent);
  hashDataIfNeeded(serverEvent);

  return mappedData;
}

function validateMappedData(serverEvent) {
  // It only performs basic validation. It doesn't check all the required parameters.
  const userRequiredIdentifiersList = [
    'aleid',
    'axwrt',
    'client_id',
    'alart',
    'user_id',
    'email',
    'phone'
  ];

  if (userRequiredIdentifiersList.every((identifier) => !serverEvent.user_data[identifier])) {
    return (
      'At least one of the required user identifiers must be included: ' +
      userRequiredIdentifiersList.join(', ')
    );
  }

  const serverEventRequiredParametersList = ['name', 'event_time', 'event_source_url'];

  if (serverEventRequiredParametersList.some((parameter) => !serverEvent[parameter])) {
    return (
      'At least one of the required server event parameters must be included: ' +
      serverEventRequiredParametersList.join(', ')
    );
  }
}

function sendEvent(data, mappedData) {
  const requestUrl = 'https://b.applovin.com/v1/event?pixel_id=' + enc(data.pixelId);
  const requestOptions = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: data.apiKey
    }
  };
  const eventName = mappedData[0].name;

  log({
    Name: 'Axon',
    Type: 'Request',
    EventName: eventName,
    RequestMethod: requestOptions.method,
    RequestUrl: requestUrl,
    RequestBody: mappedData
  });

  return sendHttpRequest(requestUrl, requestOptions, JSON.stringify(mappedData))
    .then((response) => {
      log({
        Name: 'Axon',
        Type: 'Response',
        EventName: eventName,
        ResponseStatusCode: response.statusCode,
        ResponseHeaders: response.headers,
        ResponseBody: response.body
      });

      if (!data.useOptimisticScenario) {
        if (response.statusCode === 200) {
          return data.gtmOnSuccess();
        } else if (response.statusCode === 400 || response.statusCode === 401) {
          return data.gtmOnFailure();
        }
      }
    })
    .catch((error) => {
      log({
        Name: 'Axon',
        Type: 'Message',
        EventName: eventName,
        Message: 'API call failed or timed out.',
        Reason: JSON.stringify(error)
      });
      if (!data.useOptimisticScenario) return data.gtmOnFailure();
    });
}

/*==============================================================================
  Helpers
==============================================================================*/

function shouldExitEarly(data, eventData) {
  const url = eventData.page_location || getRequestHeader('referer');

  if (!isConsentGivenOrNotRequired(data, eventData)) {
    data.gtmOnSuccess();
    return true;
  }

  if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) {
    data.gtmOnSuccess();
    return true;
  }
}

function isValidValue(value) {
  const valueType = getType(value);
  return valueType !== 'null' && valueType !== 'undefined' && value !== '';
}

function isUIFieldTrue(field) {
  return [true, 'true'].indexOf(field) !== -1;
}

function getCookieDomain(defaultCookieDomain) {
  return !defaultCookieDomain || defaultCookieDomain === 'auto'
    ? computeEffectiveTldPlusOne(getEventData('page_location') || getRequestHeader('referer')) ||
        'auto'
    : defaultCookieDomain;
}

function isSHA256HexHashed(value) {
  if (!value) return false;
  const valueStr = makeString(value);
  const hexRegex = '^[A-Fa-f0-9]{64}$';
  return valueStr.match(hexRegex) !== null;
}

function isHashed(value) {
  if (!value) return false;
  return isSHA256HexHashed(value);
}

function hashData(value) {
  if (!value) return value;

  const type = getType(value);

  if (value === 'undefined' || value === 'null') return undefined;

  if (type === 'array') {
    return value.map((val) => hashData(val));
  }

  if (type === 'object') {
    return Object.keys(value).reduce((acc, val) => {
      acc[val] = hashData(value[val]);
      return acc;
    }, {});
  }

  if (isHashed(value)) return value;

  return sha256Sync(makeString(value).trim().toLowerCase(), {
    outputEncoding: 'hex'
  });
}

function random() {
  return generateRandom(1000000000000000, 10000000000000000) / 10000000000000000;
}

function generateUUID() {
  function s(n) {
    return h((random() * (1 << (n << 2))) ^ getTimestampMillis()).slice(-n);
  }
  function h(n) {
    return (n | 0).toString(16);
  }
  return [
    s(4) + s(4),
    s(4),
    '4' + s(3),
    h(8 | (random() * 4)) + s(3),
    getTimestampMillis().toString(16).slice(-10) + s(2)
  ].join('-');
}

function enc(data) {
  if (['null', 'undefined'].indexOf(getType(data)) !== -1) data = '';
  return encodeUriComponent(makeString(data));
}

function isConsentGivenOrNotRequired(data, eventData) {
  if (data.adStorageConsent !== 'required') return true;
  if (eventData.consent_state) return !!eventData.consent_state.ad_storage;
  const xGaGcs = eventData['x-ga-gcs'] || ''; // x-ga-gcs is a string like "G110"
  return xGaGcs[2] === '1';
}

function log(rawDataToLog) {
  const logDestinationsHandlers = {};
  if (determinateIsLoggingEnabled()) logDestinationsHandlers.console = logConsole;
  if (determinateIsLoggingEnabledForBigQuery()) logDestinationsHandlers.bigQuery = logToBigQuery;

  rawDataToLog.TraceId = getRequestHeader('trace-id');

  const keyMappings = {
    // No transformation for Console is needed.
    bigQuery: {
      Name: 'tag_name',
      Type: 'type',
      TraceId: 'trace_id',
      EventName: 'event_name',
      RequestMethod: 'request_method',
      RequestUrl: 'request_url',
      RequestBody: 'request_body',
      ResponseStatusCode: 'response_status_code',
      ResponseHeaders: 'response_headers',
      ResponseBody: 'response_body'
    }
  };

  for (const logDestination in logDestinationsHandlers) {
    const handler = logDestinationsHandlers[logDestination];
    if (!handler) continue;

    const mapping = keyMappings[logDestination];
    const dataToLog = mapping ? {} : rawDataToLog;

    if (mapping) {
      for (const key in rawDataToLog) {
        const mappedKey = mapping[key] || key;
        dataToLog[mappedKey] = rawDataToLog[key];
      }
    }

    handler(dataToLog);
  }
}

function logConsole(dataToLog) {
  logToConsole(JSON.stringify(dataToLog));
}

function logToBigQuery(dataToLog) {
  const connectionInfo = {
    projectId: data.logBigQueryProjectId,
    datasetId: data.logBigQueryDatasetId,
    tableId: data.logBigQueryTableId
  };

  dataToLog.timestamp = getTimestampMillis();

  ['request_body', 'response_headers', 'response_body'].forEach((p) => {
    dataToLog[p] = JSON.stringify(dataToLog[p]);
  });

  BigQuery.insert(connectionInfo, [dataToLog], { ignoreUnknownValues: true });
}

function determinateIsLoggingEnabled() {
  const containerVersion = getContainerVersion();
  const isDebug = !!(
    containerVersion &&
    (containerVersion.debugMode || containerVersion.previewMode)
  );

  if (!data.logType) {
    return isDebug;
  }

  if (data.logType === 'no') {
    return false;
  }

  if (data.logType === 'debug') {
    return isDebug;
  }

  return data.logType === 'always';
}

function determinateIsLoggingEnabledForBigQuery() {
  if (data.bigQueryLogType === 'no') return false;
  return data.bigQueryLogType === 'always';
}
