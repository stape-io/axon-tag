# Axon (AppLovin) Server API Tag for GTM Server-Side

This server-side tag allows you to send events to AppLovin via the Axon Server-to-Server API directly from your Google Tag Manager Server container.

## Features

- **Event Tracking**: Supports standard events (Purchase, Page View, Add to Cart, etc.) and custom app events.
- **Cookie Management**: Automatically extracts and stores AppLovin identifiers (`axeid`, `alart`, `axwrt`, `axcid`) to first-party cookies.
- **PII Hashing**: Automatically hashes Email and Phone numbers using SHA-256 if provided in plain text.
- **Optimistic Scenario**: Option to trigger `gtmOnSuccess()` immediately to prevent tag latency from affecting the container.

## Installation

1.  **Download the Template**:
    - Download the `template.tpl` file from this repository.
2.  **Import to GTM Server Container**:
    - In your GTM Server Container, navigate to the **Templates** section.
    - Click **New** under the **Tag Templates** section.
    - Click the **three-dot menu** in the top right and select **Import**.
    - Select the downloaded `template.tpl` file and click **Save**.
3.  **Create a New Tag**:
    - Go to **Tags** and click **New**.
    - Select the newly imported **Axon (AppLovin) Server API Tag** tag.

## Configuration

### 1. General Settings

- **Event Name Setup Method**:
    - **Standard**: Select from a predefined list of events (e.g., `page_view`, `purchase`, `sign_up`).
    - **Inherit from client**: Automatically maps GA4 event names to Axon event names (e.g., `purchase` -> `purchase` `view_search_results` -> `search`).
- **API Access Token**: Enter the token provided by AppLovin.
- **Pixel ID**: Enter your AppLovin Pixel ID.
- **Event Source**: Select **web** or **app**.

### 2. Client ID and Click ID Settings

#### Client ID (Web only)
- **Set Client ID cookie**:
    - **True**: Stores the Client ID in `axcid` (Server) and `axwrt` (Server and rewrite JS cookie) cookies. Auto-generates if missing.
    - **False**: Uses existing IDs if found but does not store them.

#### Click ID (Web only)
- **Set Click ID cookie**:
    - **True**: Stores Click IDs in `axart` and `axeid` cookies.
    - **False**: Uses existing IDs if found but does not store them.
- **Sources**:
    - `aleid`: URL parameter -> `axeid` cookie -> `_axeid` JS cookie.
    - `alart`: URL parameter -> `axart` cookie -> `_axart` JS cookie.

### 3. Server Event Data
- **Auto-mapping**: Automatically resolves `event_id`, `page_location`, and timestamps.
- **Manual Overrides**: Option to provide a custom `Event Source URL`, `Event Timestamp`, or `Dedupe ID`.

### 4. Event Data
- **Auto-mapping**: Maps standard fields including `value`, `currency`, `items`, and `transaction_id`.
- **Overrides**: Manually add parameters or define a custom `Item ID` key.

### 5. User Data
- **Requirements**: Requires at least one identifier (e.g., `email`, `phone`, `client_id`, `aleid`).
- **Auto-mapping**: Maps contact info (with auto-hashing), device IDs, and location data.
- **Manual Overrides**: Set `Operating System Type` or specific user fields manually.

### 6. Measurement Data

- **Add Measurement Data**: Enable to send attribution data.
- **Auto-map Measurement Data Parameters**: Maps `is_new_customer`, `first_visit_ts`, `last_visit_ts`.
- **Is Claimable**: Flag to indicate if AppLovin drove the event.
- **Attribution Model**: defaults to `LAST_CLICK`.
- **Attribution Lookback Window**: Duration in hours.
- **Accounting Mode**: `CASH` or `ACCRUAL`.
- **Attribution Share**: Credit value (0-1).
- **Other Fields**: `Campaign ID`, `Creative Set ID`, `Is New Customer`, `First/Last Purchase Timestamp`, `Is New Visitor`, `First/Last Visit Timestamp`.

### 7. Tag Execution Consent Settings

- **Ad Storage Consent**: Choose "Send data in case marketing consent given" to abort execution if `ad_storage` is not granted.

## Useful Resources

- [AppLovin Axon Documentation](https://support.axon.ai/en/growth/promoting-your-websites/axon-pixel-integration/events-and-objects)

## Open Source

The **Axon (AppLovin) Server API Tag for GTM Server Side** is developed and maintained by the [Stape Team](https://stape.io/) under the Apache 2.0 license.
