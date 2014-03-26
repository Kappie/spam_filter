def setup_memory_db
  DataMapper.setup(:default, 'sqlite::memory:')
  DataMapper.finalize
  DataMapper.auto_migrate!
end