{
  version: 1.0,
  label: 'Snowplow Analytics',
  description: 'It implements sessions and pageview models for Snowplow web page event',
  image: 'https://github.com/rakam-recipes/snowplow/raw/master/logo.png',
  variables: {
    events: {
      label: 'Snowplow Events Table',
      type: 'table',
      default: { schema: 'ATOMIC', table: 'events' },
    },
    dbt_snowplow_page_views: {
      label: 'DBT Pageview Table',
      required: false,
      type: 'table',
    },
    dbt_snowplow_sessions: {
      label: 'DBT Sessions Table',
      required: false,
      type: 'table',
    },
    custom_event_schema: {
      type: 'sql',
      parent: 'events',
      required: false,
      description: 'You can run the query above in order to add your custom events as models',
      options: {
        sql: |||
          SELECT distinct se_category as "category", se_action as "se_action", event_name as "event_name" from events
        |||,
      },
    },
  },
  tags: ['website'],
}
