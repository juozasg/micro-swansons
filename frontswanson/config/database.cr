require "granite/adapter/sqlite"

Granite::Connections << Granite::Adapter::Sqlite.new(name: "sqlstore", url: Amber.settings.database_url)
