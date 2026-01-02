___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Axon (AppLovin) Server API",
  "categories": [
    "ADVERTISING",
    "CONVERSIONS",
    "REMARKETING"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": "stape.io",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAUCAYAAABmvqYOAAAABmJLR0QA/wD/AP+gvaeTAAADeklEQVQ4jaWSTYiVVRjHf89z3ve898umKXJ0/GhMM80+ZxgdFctF0qaidFqV1CJaRIIVBO1iNkUQuZKiFq0KGnBhQZsCQ0pUptQwsgmSxCFzvDNzP2bu3Pu+52lxZ8RAnaEe+MPh8Jzf+XHOIyyikhFblxbYbwV8cBxkpZxazDlZqKH0hd2RLufnkKMr5MHy1IqXeLiyTX5f6Kwu1BCavKoVurQCrgJaoZT81tq/GPObw9+3B1sT7NYKuCroXDpPpv1be6ce/19wmeVAOsN9WuGkVtsXxGU7d/vxtE9UP+jrs/g/wd2bNijT7GQW6lMsdVWaWoWezxsNcerwutEXZ165qdx1d1+0nCvyCwlrzAMeCp18V5w2v/arma04wZyAykTTkvUjR2R80eZ+lje0zhqpg9ZB6jBzmQ2rjjZLFisWK0QKsXYm+Wxo0eb5J2xFcPxqnhIJmG+HhKH+07NjOD5EFZy0o5IF0d7jh+XMgubxdHjXTVtp3ljqQJ2LaZn3ju1MPpZIR4gFYoFIIFZHjgMLmndtbw4EkR9SJ5JGQuqU0DZ/rnlIPgMYeKq1XUSPoiIWCcFD5iH17Dn9kRy6Adzkzr7GsdTJltQpWSSkTkgjPVb7RraD2Hzn1kEbzmIG58GZh+D5o9bBvefflsZ8XzS/2LixvjdryhbnBOeMNCiqUu5sznza058+E3xjqXnVtKSXpuJsOCm6HcHTNQcm86yJHK8B7/zLfNOmv0u+kZxLI+kOsTvjC/FEknPLI8KlycrUDvMxFntC4kgLQisvjK9wR2QJK5coYwWlaDG9maceEu65sE/GrprfWo7eCjku5m5LylE+fsAAg9r45XIHzl3vr+iYCJsnlulkJeGRmoco5nwu8KdzDAEvAUR7+ht3zUSy2/LRhjbUMITp6fpICNmjN4KLUcjV+CnrpFs9iKen5ekJMT3LvrTNfz0pJ7S1xO1zebdBMZT2bIqFC5VyeeC61GsqvhK2RTnORkWICu24IqvdLbwOEIlJLHMzM289eWV8zMxWGYwi9iPCqIjVzCRglBDWGjyEsYnz4Pow9Yh6mIufg4dPROQFQUoByLLsRL1a/dZJbu+ps92jNzPvftlWZ5M8r8JOV2DXHLilnoNXp+XZx2bvzzJ92rCLWTMePvy9VBd6kmtr3aglrRqDznO3i/l6dL0cB/gHjFNYOfMtHc4AAAAASUVORK5CYII\u003d",
    "description": "Send events to AppLovin via Axon Server-to-Server API."
  },
  "containerContexts": [
    "SERVER"
  ],
  "description": "Axon Server Side Tag."
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "configGroup",
    "subParams": [
      {
        "type": "RADIO",
        "name": "eventType",
        "displayName": "Event Name Setup Method",
        "radioItems": [
          {
            "value": "standard",
            "displayValue": "Standard",
            "subParams": [
              {
                "type": "SELECT",
                "name": "eventNameStandard",
                "selectItems": [
                  {
                    "value": "page_view",
                    "displayValue": "page_view"
                  },
                  {
                    "value": "view_item",
                    "displayValue": "view_item"
                  },
                  {
                    "value": "view_cart",
                    "displayValue": "view_cart"
                  },
                  {
                    "value": "add_to_cart",
                    "displayValue": "add_to_cart"
                  },
                  {
                    "value": "remove_from_cart",
                    "displayValue": "remove_from_cart"
                  },
                  {
                    "value": "begin_checkout",
                    "displayValue": "begin_checkout"
                  },
                  {
                    "value": "add_payment_info",
                    "displayValue": "add_payment_info"
                  },
                  {
                    "value": "purchase",
                    "displayValue": "purchase"
                  },
                  {
                    "value": "generate_lead",
                    "displayValue": "generate_lead"
                  },
                  {
                    "value": "login",
                    "displayValue": "login"
                  },
                  {
                    "value": "sign_up",
                    "displayValue": "sign_up"
                  },
                  {
                    "value": "search",
                    "displayValue": "search"
                  },
                  {
                    "value": "subscribe",
                    "displayValue": "subscribe"
                  },
                  {
                    "value": "app_open",
                    "displayValue": "app_open"
                  }
                ],
                "simpleValueType": true,
                "defaultValue": "page_view",
                "displayName": "Event Name",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "alwaysInSummary": true
              }
            ]
          },
          {
            "value": "inherit",
            "subParams": [],
            "displayValue": "Inherit from client",
            "help": "If the request follows the \u003cb\u003eGoogle Analytics 4 (GA4)\u003c/b\u003e event naming schema, the following event names will be mapped to Axon event names:\n\u003cbr/\u003e\u003cbr/\u003e \n\u003cul\u003e \n\u003cli\u003epage_view \u003c/li\u003e \n\u003cli\u003eview_item\u003c/li\u003e\n\u003cli\u003eview_cart\u003c/li\u003e\n\u003cli\u003eadd_to_cart\u003c/li\u003e\n\u003cli\u003eremove_from_cart\u003c/li\u003e\n\u003cli\u003ebegin_checkout\u003c/li\u003e\n\u003cli\u003eadd_payment_info\u003c/li\u003e\n\u003cli\u003epurchase\u003c/li\u003e\n\u003cli\u003egenerate_lead\u003c/li\u003e\n\u003cli\u003elogin\u003c/li\u003e\n\u003cli\u003esign_up\u003c/li\u003e\n\u003cli\u003esearch\u003c/li\u003e\n\u003cli\u003eview_search_results → search\u003c/li\u003e\n\u003cli\u003esubscribe\u003c/li\u003e\n\u003cli\u003eapp_open\u003c/li\u003e\n\u003c/ul\u003e\n\u003cbr/\u003e\nAny other event names will cause the event to fail. Check the \u003ca href\u003d\"https://support.axon.ai/en/growth/promoting-your-websites/axon-pixel-\u003c/a\u003eintegration/events-and-objects\"\u003elist of supported event names."
          }
        ],
        "simpleValueType": true,
        "defaultValue": "standard"
      },
      {
        "type": "TEXT",
        "name": "apiKey",
        "displayName": "API Access Token",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Input the API Access Token you are given."
      },
      {
        "type": "TEXT",
        "name": "pixelId",
        "displayName": "Pixel ID",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Your AppLovin Pixel ID."
      },
      {
        "type": "SELECT",
        "name": "eventSource",
        "displayName": "Event Source",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": "web",
            "displayValue": "web"
          },
          {
            "value": "app",
            "displayValue": "app"
          }
        ],
        "simpleValueType": true,
        "help": "The platform where the event happened.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "defaultValue": "web"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "idCookiesSettings",
    "displayName": "Client ID and Click ID Settings",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "SELECT",
        "name": "setClientIdCookie",
        "displayName": "Set Client ID cookie (Web only)",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": false,
            "displayValue": "false"
          },
          {
            "value": true,
            "displayValue": "true"
          }
        ],
        "simpleValueType": true,
        "help": "If \u003cb\u003efalse\u003c/b\u003e, and if an existing Client ID cookie is found or was added to the \u003ci\u003eUser Data Parameters\u003c/i\u003e, it will still be sent in the request but not stored as a cookie. It also won\u0027t be auto-generated.\n\u003cbr/\u003e\u003cbr/\u003e\nIf \u003cb\u003etrue\u003c/b\u003e, the Client ID will be sent in the request and stored as the \u003ci\u003eaxcid\u003c/i\u003e cookie by server GTM. If it\u0027s not found in the possible sources, it will be auto-generated and set in the cookie. \n\u003cbr/\u003e\nThe \u003ci\u003e_axwrt\u003c/i\u003e JS script cookie will also be rewritten into the \u003ci\u003eaxwrt\u003c/i\u003e, but never as HTTP Only cookie. \u003ca href\u003d\"https://support.axon.ai/en/growth/promoting-your-websites/axon-pixel-integration/google-tag-manager#enhanced-user-identification-recommended\"\u003eLearn more\u003c/a\u003e.\n\u003cbr/\u003e\u003cbr/\u003e\nThe Client ID is, in this order, sourced from:\n\u003cul\u003e\n\u003cli\u003e\u003ci\u003eaxcid\u003c/i\u003e cookie from server GTM\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eaxwrt\u003c/i\u003e cookie from server GTM\u003c/li\u003e\n\u003cli\u003e\u003ci\u003e_axwrt\u003c/i\u003e cookie from the JS script\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eClient ID\u003c/i\u003e from the User Data Parameters section\u003c/li\u003e\n\u003c/ul\u003e",
        "defaultValue": true,
        "subParams": [
          {
            "type": "GROUP",
            "name": "clientIdCookieSettingsGroup",
            "displayName": "Client ID Cookie Settings",
            "groupStyle": "ZIPPY_CLOSED",
            "subParams": [
              {
                "type": "TEXT",
                "name": "clientIdCookieDomain",
                "displayName": "Cookie Domain",
                "simpleValueType": true,
                "defaultValue": "auto",
                "valueHint": "example.com",
                "help": "Use this option to override the cookie domain. \n\u003cbr\u003e \nEnter your website\u0027s top-level domain as a fixed value (e.g., example.com). \n\u003cbr\u003e\n If left empty or using the \"auto\" value, the domain will be automatically determined using the following priority: \u003cul\u003e \n\u003cli\u003eDomain of the \u003ci\u003epage_location\u003c/i\u003e Event Data parameter (if present).\u003c/li\u003e\n\u003cli\u003eDomain of the \u003ci\u003eReferer\u003c/i\u003e header (if present).\u003c/li\u003e\n\u003cli\u003eDomain of the \u003ci\u003eForwarded\u003c/i\u003e header (if present).\u003c/li\u003e\n\u003cli\u003eDomain of the \u003ci\u003eX-Forwarded-Host\u003c/i\u003e header (if present).\u003c/li\u003e\n\u003cli\u003eDomain of the \u003ci\u003eHost\u003c/i\u003e header.\u003c/li\u003e\n\u003c/ul\u003e",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              },
              {
                "type": "TEXT",
                "name": "clientIdCookieExpiration",
                "displayName": "Cookie Expiration",
                "simpleValueType": true,
                "defaultValue": 365,
                "valueUnit": "days",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              },
              {
                "type": "SELECT",
                "name": "clientIdCookieSameSite",
                "displayName": "Cookie SameSite",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": "none",
                    "displayValue": "None"
                  },
                  {
                    "value": "lax",
                    "displayValue": "Lax"
                  },
                  {
                    "value": "strict",
                    "displayValue": "Strict"
                  }
                ],
                "simpleValueType": true,
                "defaultValue": "none",
                "help": "\u003ca href\u003d\"https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value\"\u003eLearn more\u003c/a\u003e."
              },
              {
                "type": "SELECT",
                "name": "clientIdCookieHttpOnly",
                "displayName": "Cookie HTTP Only Flag",
                "macrosInSelect": false,
                "selectItems": [
                  {
                    "value": false,
                    "displayValue": "false"
                  },
                  {
                    "value": true,
                    "displayValue": "true"
                  }
                ],
                "simpleValueType": true,
                "defaultValue": false
              }
            ],
            "enablingConditions": [
              {
                "paramName": "setClientIdCookie",
                "paramValue": false,
                "type": "NOT_EQUALS"
              }
            ]
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "setClickIdCookie",
        "displayName": "Set Click ID cookie (Web only)",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": false,
            "displayValue": "false"
          },
          {
            "value": true,
            "displayValue": "true"
          }
        ],
        "simpleValueType": true,
        "help": "If \u003cb\u003efalse\u003c/b\u003e, and if existing \u003ci\u003ealart\u003c/i\u003e and \u003ci\u003ealeid\u003c/i\u003e Click IDs cookies or URL parameters are found or were added to the \u003ci\u003eUser Data Parameters\u003c/i\u003e, they will still be sent in the request but not stored as cookies.\n\u003cbr/\u003e\u003cbr/\u003e\nIf \u003cb\u003etrue\u003c/b\u003e, the Click IDs will be sent in the request and stored as the \u003ci\u003eaxart\u003c/i\u003e and \u003ci\u003eaxeid\u003c/i\u003e cookies by server GTM.\n\u003cbr/\u003e\u003cbr/\u003e\nThe Click IDs are, in this order, sourced from:\n\n\u003cul\u003e\n\u003cli\u003ealeid:\n\u003cul\u003e\n\u003cli\u003e\u003ci\u003ealeid\u003c/i\u003e URL parameter\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eaxeid\u003c/i\u003e cookie from server GTM\u003c/li\u003e\n\u003cli\u003e\u003ci\u003e_axeid\u003c/i\u003e cookie from from JS script\u003c/li\u003e\n\u003cli\u003e\u003ci\u003ealeid (Click ID)\u003c/i\u003e from the User Data Parameters section\u003c/li\u003e\n\u003c/ul\u003e\n\u003c/li\u003e\n\u003cli\u003ealart:\n\u003cul\u003e\n\u003cli\u003e\u003ci\u003ealart\u003c/i\u003e URL parameter\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eaxart\u003c/i\u003e cookie from server GTM\u003c/li\u003e\n\u003cli\u003e\u003ci\u003e_axart\u003c/i\u003e cookie from from JS script\u003c/li\u003e\n\u003cli\u003e\u003ci\u003ealart (Click ID)\u003c/i\u003e from the User Data Parameters section\u003c/li\u003e\n\u003c/ul\u003e\n\u003c/li\u003e\n\u003c/ul\u003e",
        "defaultValue": true,
        "subParams": [
          {
            "type": "GROUP",
            "name": "clickIdCookieSettingsGroup",
            "displayName": "Click ID Cookie Settings",
            "groupStyle": "ZIPPY_CLOSED",
            "subParams": [
              {
                "type": "TEXT",
                "name": "clickIdCookieDomain",
                "displayName": "Cookie Domain",
                "simpleValueType": true,
                "defaultValue": "auto",
                "valueHint": "example.com",
                "help": "Use this option to override the cookie domain.\n\u003cbr\u003e\nEnter your website\u0027s top-level domain as a fixed value (e.g., example.com).\n\u003cbr\u003e\nIf left as \u003ci\u003eauto\u003c/i\u003e, the domain will be automatically determined using the following priority:\n\u003cul\u003e\n\u003cli\u003eDomain of the \u003ci\u003eForwarded\u003c/i\u003e header (if present).\u003c/li\u003e\n\u003cli\u003eDomain of the \u003ci\u003eX-Forwarded-Host\u003c/i\u003e header (if present).\u003c/li\u003e\n\u003cli\u003eDomain of the \u003ci\u003eHost\u003c/i\u003e header.\u003c/li\u003e\n\u003c/ul\u003e",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              },
              {
                "type": "SELECT",
                "name": "clickIdCookieSameSite",
                "displayName": "Cookie SameSite",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": "none",
                    "displayValue": "None"
                  },
                  {
                    "value": "lax",
                    "displayValue": "Lax"
                  },
                  {
                    "value": "strict",
                    "displayValue": "Strict"
                  }
                ],
                "simpleValueType": true,
                "defaultValue": "none",
                "help": "\u003ca href\u003d\"https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value\"\u003eLearn more\u003c/a\u003e."
              },
              {
                "type": "TEXT",
                "name": "clickIdCookieExpiration",
                "displayName": "Cookie Expiration",
                "simpleValueType": true,
                "defaultValue": 365,
                "valueUnit": "days",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              },
              {
                "type": "SELECT",
                "name": "clickIdCookieHttpOnly",
                "displayName": "Cookie HTTP Only Flag",
                "macrosInSelect": false,
                "selectItems": [
                  {
                    "value": false,
                    "displayValue": "false"
                  },
                  {
                    "value": true,
                    "displayValue": "true"
                  }
                ],
                "simpleValueType": true,
                "defaultValue": false
              }
            ],
            "enablingConditions": [
              {
                "paramName": "setClickIdCookie",
                "paramValue": false,
                "type": "NOT_EQUALS"
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "serverEventDataGroup",
    "displayName": "Server Event Data",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "SELECT",
        "name": "autoMapServerEventDataParameters",
        "displayName": "Auto-map Server Event Data Parameters",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": true,
            "displayValue": "true"
          },
          {
            "value": false,
            "displayValue": "false"
          }
        ],
        "simpleValueType": true,
        "help": "If enabled, the tag will attempt to automatically map parameters from the Event Data.\n\u003cbr/\u003e\u003cbr/\u003e\nAny value you manually enter in a field below will always override the auto-mapped value.\n\u003cbr/\u003e\u003cbr/\u003e\nDefault mappings:\n\u003cul\u003e \n\u003cli\u003eEvent ID: \u003cul\u003e\u003cli\u003eeventData.event_id\u003c/li\u003e\u003cli\u003eeventData.eventId\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eEvent Source URL: \u003cul\u003e\u003cli\u003eeventData.page_location\u003c/li\n\u003cli\u003eeventData.screen_class + eventData.screen_name\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eEvent Timestamp: \u003cul\u003e\u003cli\u003eUnix epoch time in milliseconds of when the server tag fired\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003c/ul\u003e",
        "defaultValue": true,
        "alwaysInSummary": true
      },
      {
        "type": "TEXT",
        "name": "eventSourceUrl",
        "displayName": "Event Source URL",
        "simpleValueType": true,
        "help": "\u003cb\u003eRequired.\u003c/b\u003e\u003c/br\u003eThe complete URL where the event occurred."
      },
      {
        "type": "TEXT",
        "name": "eventTimestamp",
        "displayName": "Event Timestamp",
        "simpleValueType": true,
        "help": "\u003cb\u003eRequired.\u003c/b\u003e\u003c/br\u003eThe event timestamp (Unix epoch time in milliseconds).",
        "valueUnit": "ms"
      },
      {
        "type": "TEXT",
        "name": "dedupeId",
        "displayName": "Dedupe ID",
        "simpleValueType": true,
        "help": "A unique identifier for this event. This will be used for de-duplication of the event from a redundant setup (Client Side Pixel + Server Side API). \n\u003cbr/\u003e\n\u003ca href\u003d\"https://support.axon.ai/en/growth/promoting-your-websites/axon-pixel-integration/global-best-practices/\"\u003eLearn more\u003c/a\u003e."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "eventDataGroup",
    "displayName": "Event Data",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "LABEL",
        "name": "eventDataGroupLabel",
        "displayName": "Check this help page \u003ca href\u003d\"https://support.axon.ai/en/growth/promoting-your-websites/axon-pixel-integration/events-and-objects\"\u003e[1]\u003c/a\u003e for a description of each \u003ci\u003eEvent Data Parameters\u003c/i\u003e and its expected type and value.\n\u003cbr/\u003e\nNote that certain events contain required parameters."
      },
      {
        "type": "SELECT",
        "name": "autoMapEventDataParameters",
        "displayName": "Auto-map Event Data Parameters",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": true,
            "displayValue": "true"
          },
          {
            "value": false,
            "displayValue": "false"
          }
        ],
        "simpleValueType": true,
        "help": "If enabled, the tag will attempt to automatically map parameters from your event data.\n\u003cbr/\u003e\u003cbr/\u003e\nAny value you manually enter in a field below will always override the auto-mapped value.\n\u003cbr/\u003e\u003cbr/\u003e\nDefault mappings:\n\u003cul\u003e \u003cli\u003eValue: \u003cul\u003e\u003cli\u003eeventData.value\u003c/li\u003e\u003cli\u003eSum of eventData.items Price * Quantity\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \u003cli\u003eShipping: \u003cul\u003e\u003cli\u003eeventData.shipping\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \u003cli\u003eTax: \u003cul\u003e\u003cli\u003eeventData.tax\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \u003cli\u003eCurrency: \u003cul\u003e\u003cli\u003eeventData.currency\u003c/li\u003e\u003cli\u003eCurrency from eventData.items\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \u003cli\u003eTransaction ID: \u003cul\u003e\u003cli\u003eeventData.transaction_id\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \u003cli\u003eItems: \u003cul\u003e\u003cli\u003eeventData.items\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \u003cli\u003eResults: \u003cul\u003e\u003cli\u003eeventData.items, if the event is \"search\"\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\u003cli\u003eSearch Term: \u003cul\u003e\u003cli\u003eeventData.search_term\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \u003cli\u003eMethod: \u003cul\u003e\u003cli\u003eeventData.method\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \u003c/ul\u003e",
        "defaultValue": true,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "itemIdKey",
            "displayName": "Custom Item ID Key",
            "simpleValueType": true,
            "help": "Optional.\n\u003cbr/\u003e\u003cbr/\u003e\nYou can specify a custom key, which will be used to set the content Item ID, by default \u003ci\u003eitem_id\u003c/i\u003e will be used. This may be useful if you are using WooCommerce extensions.",
            "canBeEmptyString": true,
            "enablingConditions": [
              {
                "paramName": "autoMapEventDataParameters",
                "paramValue": false,
                "type": "NOT_EQUALS"
              }
            ]
          }
        ]
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "eventDataParametersList",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Parameter Name",
            "name": "name",
            "type": "SELECT",
            "selectItems": [
              {
                "value": "value",
                "displayValue": "Value"
              },
              {
                "value": "tax",
                "displayValue": "Tax"
              },
              {
                "value": "shipping",
                "displayValue": "Shipping"
              },
              {
                "value": "currency",
                "displayValue": "Currency"
              },
              {
                "value": "transaction_id",
                "displayValue": "Transaction ID"
              },
              {
                "value": "items",
                "displayValue": "Items"
              },
              {
                "value": "results",
                "displayValue": "Results (for \u0027search\u0027 event)"
              },
              {
                "value": "search_term",
                "displayValue": "Search Term"
              },
              {
                "value": "method",
                "displayValue": "Sign Up Method"
              },
              {
                "value": "payment_type",
                "displayValue": "Payment Type"
              }
            ],
            "isUnique": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Parameter Value",
            "name": "value",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "newRowButtonText": "Add Parameter"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "userDataGroup",
    "displayName": "User Data",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "LABEL",
        "name": "userDataGroupLabel",
        "displayName": "If sending User Data, at least \u003cb\u003eone\u003c/b\u003e of the identifiers (\u003ci\u003ealeid\u003c/i\u003e, \u003ci\u003ealart\u003c/i\u003e, \u003ci\u003eClient ID\u003c/i\u003e, \u003ci\u003eawxrt\u003c/i\u003e, \u003ci\u003eUser ID\u003c/i\u003e, \u003ci\u003eEmail Address\u003c/i\u003e or \u003ci\u003ePhone Number\u003c/i\u003e) is required."
      },
      {
        "type": "SELECT",
        "name": "autoMapUserDataParameters",
        "displayName": "Auto-map User Data Parameters",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": true,
            "displayValue": "true"
          },
          {
            "value": false,
            "displayValue": "false"
          }
        ],
        "simpleValueType": true,
        "help": "If enabled, the tag will attempt to automatically map parameters from your event data. \n\u003cbr/\u003e\u003cbr/\u003e\nAny value you manually enter in a field below will always override the auto-mapped value.\n\u003cbr/\u003e\u003cbr/\u003e\nDefault mappings:\n\u003cul\u003e \n\u003cli\u003ealeid (Click ID): \u003cul\u003e\u003cli\u003e\u0027aleid\u0027 URL parameter\u003c/li\u003e\u003cli\u003e\u0027axeid\u0027 Server cookie\u003c/li\u003e\u003cli\u003e\u0027_axeid\u0027 JS cookie\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \u003cli\u003ealart (Click ID): \u003cul\u003e\u003cli\u003e\u0027alart\u0027 URL parameter\u003c/li\u003e\u003cli\u003e\u0027axart\u0027 Server cookie\u003c/li\u003e\u003cli\u003e\u0027_axart\u0027 JS cookie\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \u003cli\u003eClient ID: \u003cul\u003e\u003cli\u003e\u0027axcid\u0027 Server cookie\u003c/li\u003e\u003cli\u003e\u0027axwrt\u0027 Server cookie\u003c/li\u003e\u003cli\u003e\u0027_axwrt\u0027 JS cookie\u003c/li\u003e\u003cli\u003eeventData.client_id\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eaxwrt: \u003cul\u003e\u003cli\u003e\u0027axwrt\u0027 Server cookie\u003c/li\u003e\u003cli\u003e\u0027_axwrt\u0027 JS cookie\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eSession ID: \u003cul\u003e\u003cli\u003eClient ID + eventData. ga_session_id\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eUser ID: \u003cul\u003e\u003cli\u003eeventData.user_id\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eIP Address: \u003cul\u003e\u003cli\u003eeventData.ip_override\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eUser Agent: \u003cul\u003e\u003cli\u003eeventData.user_agent\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eApp Identifier for Advertisers (iOS IDFA or Android AAID/GAID): \u003cul\u003e\u003cli\u003eeventData[\u0027x-ga-resettable_device_id\u0027]\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \n\u003cli\u003eApp Identifier for Vendors (iOS IDFV): \u003cul\u003e\u003cli\u003eeventData[\u0027x-ga-vendor_device_id\u0027]\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003ePlatform: \u003cul\u003e\u003cli\u003eeventData[\u0027x-ga-platform\u0027] (iOS and Android only)\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eEmail: \u003cul\u003e\u003cli\u003eeventData.email\u003c/li\u003e\u003cli\u003eeventData.email_address\u003c/li\u003e\u003cli\u003eeventData.userData.email\u003c/li\u003e\u003cli\u003eeventData.userData.email_address\u003c/li\u003e\u003cli\u003eeventData.userData.sha256_email\u003c/li\u003e\u003cli\u003eeventData.userData.sha256_email_address\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003ePhone: \u003cul\u003e\u003cli\u003eeventData.phone\u003c/li\u003e\u003cli\u003eeventData.phone_number\u003c/li\u003e\u003cli\u003eeventData.userData.phone\u003c/li\u003e\u003cli\u003eeventData.userData.phone_number\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eZIP: \u003cul\u003e\u003cli\u003eeventData.address.postalCode\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eCountry Code: \u003cul\u003e\u003cli\u003eeventData.address.country\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \n\u003c/ul\u003e",
        "defaultValue": true,
        "alwaysInSummary": true
      },
      {
        "type": "SELECT",
        "name": "operatingSystem",
        "displayName": "Operating System Type",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": "ios",
            "displayValue": "ios"
          },
          {
            "value": "android",
            "displayValue": "android"
          },
          {
            "value": "desktop_os",
            "displayValue": "desktop_os"
          }
        ],
        "simpleValueType": true,
        "notSetText": "(not set)",
        "help": "Only three possible values are supported:\u003cul\u003e\u003cli\u003eios\u003c/li\u003e\u003cli\u003eandroid\u003c/li\u003e\u003cli\u003edesktop_os\u003c/li\u003e\u003c/ul\u003e"
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "userDataParametersList",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Parameter Name",
            "name": "name",
            "type": "SELECT",
            "selectItems": [
              {
                "value": "client_id",
                "displayValue": "Client ID"
              },
              {
                "value": "aleid",
                "displayValue": "aleid (Click ID)"
              },
              {
                "value": "alart",
                "displayValue": "alart (Click ID)"
              },
              {
                "value": "axwrt",
                "displayValue": "axwrt (JS Pixel First Party Identifier)"
              },
              {
                "value": "user_id",
                "displayValue": "User ID"
              },
              {
                "value": "email",
                "displayValue": "Email Address (if not SHA256 hashed, it will be automatically hashed)"
              },
              {
                "value": "phone",
                "displayValue": "Phone Number (if not SHA256 hashed, it will be automatically hashed)"
              },
              {
                "value": "client_ip_address",
                "displayValue": "IP Address"
              },
              {
                "value": "client_user_agent",
                "displayValue": "User Agent"
              },
              {
                "value": "ifa",
                "displayValue": "App Identifier for Advertisers (iOS IDFA or Android AAID/GAID)"
              },
              {
                "value": "idfv",
                "displayValue": "App Identifier for Vendors (iOS IDFV)"
              },
              {
                "value": "sid",
                "displayValue": "Session ID"
              },
              {
                "value": "zip",
                "displayValue": "ZIP Code"
              },
              {
                "value": "country_code",
                "displayValue": "Country Code"
              }
            ],
            "isUnique": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Parameter Value",
            "name": "value",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "newRowButtonText": "Add Parameter"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "measurementDataGroup",
    "displayName": "Measurement Data",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "addMeasurementData",
        "checkboxText": "Add Measurement Data",
        "simpleValueType": true,
        "help": "Add Measurement Data to inform how much credit is given to AppLovin for the event."
      },
      {
        "type": "GROUP",
        "name": "measurementDataParametersGroup",
        "subParams": [
          {
            "type": "SELECT",
            "name": "autoMapMeasurementDataParameters",
            "displayName": "Auto-map Measurement Data Parameters",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": true,
                "displayValue": "true"
              },
              {
                "value": false,
                "displayValue": "false"
              }
            ],
            "simpleValueType": true,
            "help": "If enabled, the tag will attempt to automatically map parameters from the Event Data.\n\u003cbr/\u003e\u003cbr/\u003e\nAny value you manually enter in a field below will always override the auto-mapped value.\n\u003cbr/\u003e\u003cbr/\u003e\nDefault mappings:\n\u003cul\u003e \n\u003cli\u003eIs New Customer: \u003cul\u003e\u003cli\u003eeventData.customer_type (\"new\" \u003d true, \"returning\" \u003d false)\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003cli\u003eFirst Visit Timestamp: \u003cul\u003e\u003cli\u003eeventData[\u0027x-ga-mp2-user_properties\u0027].first_open_time from GA4 app stream\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e \n\u003cli\u003eLast Visit Timestamp: \u003cul\u003e\u003cli\u003eUnix epoch time in milliseconds of when the server tag fired\u003c/li\u003e\u003c/ul\u003e\u003c/li\u003e\n\u003c/ul\u003e",
            "defaultValue": false,
            "alwaysInSummary": true
          },
          {
            "type": "SELECT",
            "name": "isClaimable",
            "displayName": "Is Claimable",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": true,
                "displayValue": "true"
              },
              {
                "value": false,
                "displayValue": "false"
              }
            ],
            "simpleValueType": true,
            "help": "Flag to indicate if AppLovin drove the event.",
            "notSetText": "(not set)",
            "defaultValue": false,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "type": "SELECT",
            "name": "attributionModel",
            "displayName": "Attribution Model",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": "LAST_CLICK",
                "displayValue": "LAST_CLICK"
              },
              {
                "value": "FIRST_CLICK",
                "displayValue": "FIRST_CLICK"
              },
              {
                "value": "LINEAR",
                "displayValue": "LINEAR"
              },
              {
                "value": "TIME_DECAY",
                "displayValue": "TIME_DECAY"
              },
              {
                "value": "CUSTOM_MULTI_TOUCH",
                "displayValue": "CUSTOM_MULTI_TOUCH"
              },
              {
                "value": "LAST_NON_DIRECT_TOUCH",
                "displayValue": "LAST_NON_DIRECT_TOUCH"
              },
              {
                "value": "CLICKS_AND_VIEWS_ENHANCED",
                "displayValue": "CLICKS_AND_VIEWS_ENHANCED"
              },
              {
                "value": "ANY_CLICK",
                "displayValue": "ANY_CLICK"
              }
            ],
            "simpleValueType": true,
            "help": "The attribution model for this conversion. If left empty, it defaults to LAST_CLICK.",
            "defaultValue": "LAST_CLICK",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "type": "TEXT",
            "name": "attributionLookbackWindow",
            "displayName": "Attribution Lookback Window",
            "simpleValueType": true,
            "help": "Duration of the lookback window in hours. Leave empty for infinite lookback."
          },
          {
            "type": "SELECT",
            "name": "accountingMode",
            "displayName": "Accounting Mode",
            "selectItems": [
              {
                "value": "CASH",
                "displayValue": "CASH"
              },
              {
                "value": "ACCRUAL",
                "displayValue": "ACCRUAL"
              }
            ],
            "simpleValueType": true,
            "defaultValue": "CASH",
            "macrosInSelect": true,
            "help": "Must be \u003cb\u003eCASH\u003c/b\u003e or \u003cb\u003eACCRUAL\u003c/b\u003e. If left empty it will default to \u003cb\u003eCASH\u003c/b\u003e.",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "type": "TEXT",
            "name": "attributionShare",
            "displayName": "Attribution Share",
            "simpleValueType": true,
            "defaultValue": 1,
            "help": "Number between 0 and 1 representing the credit AppLovin gets for the event. If left blank it will default to 1.",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "DECIMAL"
              }
            ],
            "valueHint": "0.5"
          },
          {
            "type": "TEXT",
            "name": "campaignId",
            "displayName": "Campaign ID",
            "simpleValueType": true,
            "help": "AppLovin Campaign ID."
          },
          {
            "type": "TEXT",
            "name": "creativeSetId",
            "displayName": "Creative Set ID",
            "simpleValueType": true,
            "help": "AppLovin Creative Set ID."
          },
          {
            "type": "SELECT",
            "name": "isNewCustomer",
            "displayName": "Is New Customer",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": true,
                "displayValue": "true"
              },
              {
                "value": false,
                "displayValue": "false"
              }
            ],
            "simpleValueType": true,
            "help": "Flag to indicate whether the customer had already made a purchase with the advertiser before.",
            "notSetText": "(not set)"
          },
          {
            "type": "TEXT",
            "name": "firstPurchaseTimestamp",
            "displayName": "First Purchase Timestamp",
            "simpleValueType": true,
            "help": "Unix epoch time in milliseconds of when the customer first made a purchase with the advertiser.",
            "valueUnit": "ms"
          },
          {
            "type": "TEXT",
            "name": "lastPurchaseTimestamp",
            "displayName": "First Purchase Timestamp",
            "simpleValueType": true,
            "help": "Unix epoch time in milliseconds of when the customer last made a purchase with the advertiser.",
            "valueUnit": "ms"
          },
          {
            "type": "SELECT",
            "name": "isNewVisitor",
            "displayName": "Is New Visitor",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": true,
                "displayValue": "true"
              },
              {
                "value": false,
                "displayValue": "false"
              }
            ],
            "simpleValueType": true,
            "help": "Flag to indicate if the event was driven by a new visitor at the advertiser.",
            "notSetText": "(not set)"
          },
          {
            "type": "TEXT",
            "name": "firstVisitTimestamp",
            "displayName": "First Visit Timestamp",
            "simpleValueType": true,
            "help": "Unix epoch time in milliseconds of when the customer first visited the advertiser.",
            "valueUnit": "ms"
          },
          {
            "type": "TEXT",
            "name": "lastVisitTimestamp",
            "displayName": "Last Visit Timestamp",
            "simpleValueType": true,
            "help": "Unix epoch time in milliseconds of when the customer last visited the advertiser.",
            "valueUnit": "ms"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "addMeasurementData",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "tagExecutionConsentSettingsGroup",
    "displayName": "Tag Execution Consent Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "RADIO",
        "name": "adStorageConsent",
        "radioItems": [
          {
            "value": "optional",
            "displayValue": "Send data always"
          },
          {
            "value": "required",
            "displayValue": "Send data in case marketing consent given",
            "help": "Aborts the tag execution if marketing consent (\u003ci\u003ead_storage\u003c/i\u003e Google Consent Mode or Stape\u0027s Data Tag parameter) is not given."
          }
        ],
        "simpleValueType": true,
        "defaultValue": "optional"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "logsGroup",
    "displayName": "Logs Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "RADIO",
        "name": "logType",
        "radioItems": [
          {
            "value": "no",
            "displayValue": "Do not log"
          },
          {
            "value": "debug",
            "displayValue": "Log to console during debug and preview"
          },
          {
            "value": "always",
            "displayValue": "Always log to console"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "debug"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "event",
        "paramValue": "page_view",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "displayName": "BigQuery Logs Settings",
    "name": "bigQueryLogsGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "type": "RADIO",
        "name": "bigQueryLogType",
        "radioItems": [
          {
            "value": "no",
            "displayValue": "Do not log to BigQuery"
          },
          {
            "value": "always",
            "displayValue": "Log to BigQuery"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "no"
      },
      {
        "type": "GROUP",
        "name": "logsBigQueryConfigGroup",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "TEXT",
            "name": "logBigQueryProjectId",
            "displayName": "BigQuery Project ID",
            "simpleValueType": true,
            "help": "Optional.  \u003cbr/\u003e\u003cbr/\u003e  If omitted, it will be retrieved from the environment variable \u003cI\u003eGOOGLE_CLOUD_PROJECT\u003c/i\u003e where the server container is running. If the server container is running on Google Cloud, \u003cI\u003eGOOGLE_CLOUD_PROJECT\u003c/i\u003e will already be set to the Google Cloud project\u0027s ID."
          },
          {
            "type": "TEXT",
            "name": "logBigQueryDatasetId",
            "displayName": "BigQuery Dataset ID",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "type": "TEXT",
            "name": "logBigQueryTableId",
            "displayName": "BigQuery Table ID",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "enablingConditions": [
          {
            "paramName": "bigQueryLogType",
            "paramValue": "always",
            "type": "EQUALS"
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "event",
        "paramValue": "page_view",
        "type": "NOT_EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

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


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://b.applovin.com/v1/event?*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_bigquery",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedTables",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "projectId"
                  },
                  {
                    "type": 1,
                    "string": "datasetId"
                  },
                  {
                    "type": 1,
                    "string": "tableId"
                  },
                  {
                    "type": 1,
                    "string": "operation"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_container_data",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "headerWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "referer"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "trace-id"
                  }
                ]
              }
            ]
          }
        },
        {
          "key": "headersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "_axeid"
              },
              {
                "type": 1,
                "string": "_axart"
              },
              {
                "type": 1,
                "string": "_axwrt"
              },
              {
                "type": 1,
                "string": "axeid"
              },
              {
                "type": 1,
                "string": "axart"
              },
              {
                "type": 1,
                "string": "axwrt"
              },
              {
                "type": 1,
                "string": "axcid"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "set_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedCookies",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "axeid"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "axart"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "axwrt"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "axcid"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 02/01/2026, 08:15:52

