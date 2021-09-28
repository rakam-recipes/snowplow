local common_measures = import 'common_measures.jsonnet';
local common_dimensions = import 'dimensions/common_dimensions.jsonnet';
local structured_event = import 'dimensions/structured_event.jsonnet';

local all_event_props = if std.extVar('custom_event_schema') != null then std.extVar('custom_event_schema') else [];

std.map(function(current_event_props)
  local event_db_name = current_event_props.se_action;

  {
    name: 'snowplow_event_' + event_db_name,
    target: std.extVar('events'),
    alwaysFilters: [
      { dimension: 'se_action', operator: 'equals', value: event_db_name },
    ],
    label: event_db_name,
    mappings: {
      eventTimestamp: 'dvce_sent_tstamp',
      userId: 'user_id',
    },
    category: 'Snowplow Events',
    measures: common_measures,
    dimensions: common_dimensions + structured_event,
  }, all_event_props)
