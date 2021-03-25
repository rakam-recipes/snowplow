{
  total_events: {
    aggregation: 'count',
  },
  unique_users: {
    aggregation: 'countUnique',
    dimension: 'user_id',
  },
}
