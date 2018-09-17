# Xplore
At first I would like to thank the original author **_Igor Kasyanchuk (Original Author)_** for this beautiful gem. 

Quick way to inspect your Rails database **http://localhost:12345/rails/xplore**, see content of tables, export them to CSV, EXPLAIN SQL and run SQL queries.


## Requirements

There are automated tests running on Travis CI.
Supports: PostgresSQL, MySQL, SQLite. Not sure about other adapters. Since gem is using ActiveRecord it will work with others DBs.


## Main Features
* command line tools `railsdb` and `runsql` to run app and sql for your apps.
* view content and schema of DB tables (including indexes)
* create, edit content
* sort content of DB tables
* filtering data (multiple filters supported too)
* execute SQL queries
* autocomplete for SQL queries
* filter tables for easier navigation
* show/hide columns in tables
* use history of you SQL queries
* see EXPLAIN results for your queries
* export data to CSV and Excel
* import SQL files
* expand/collapse sidebar
* hide/show columns
* allow access for current user for example with appropriate role
* added HTTP_BASIC auth for xPlore
* ability to turn on/off using initializer
* white/black list of tables
* data-tables inside your app
* ajax-ify Rails DB
* delete records, truncate tables
* visualize SQL schema (future)
* CRUD for table records (future)

## Install

Add this to the development group in your `Gemfile`

For all environments (be careful with production environment):

```ruby
  gem 'xplore', '0.0.1'
```

Or only for development:

```ruby
  group :development do
    gem 'xplore', '0.0.0'
  end
```

Run `bundle install`

Visit **`http://localhost:3000/rails/xplore`** and you will see your database tables and SQL editors.
> Use port 12345 if running in 'standalone' mode

Optionally, add `gem 'axlsx_rails'` to your application's Gemfile to be able to export to excel `.xlsx` files.

## Customization

If you want to customize gem (create initializer) run in console:

    rails g xplore initializer

If will create file config/initializers/xplore.rb.

### Options
*   **enabled** - enable or disable gem (default: true).
*   **automatic_routes_mount** - automatically mount engine routes in your app (default: true).
*   **http_basic_authentication_enabled** - Enable HTTP_BASIC authentication (default: false).
*   **http_basic_authentication_user_name** - HTTP_BASIC authentication user name.
*   **http_basic_authentication_password** - HTTP_BASIC authentication password.
*   **black_list_tables** - black list for tables (hide tables from sidebar).
*   **white_list_tables** - black list for tables (show only these tables in sidebar).
*   **verify_access_proc** - allow access by specific conditions, for example by role for current_user, or you can use for example Pundit here (default: `proc { |controller| true }`)

If you want to add routes manually (or customize the mounted location) you need to first turn off automatic_routes_mount and then add to your `routes.rb`

```ruby
  mount Xplore::Engine => '/rails/xplore', :as => 'xplore'
```

If you wanted to only allow access to admins and, for example, you are using Devise you could do following (in `config/initializers/rails_db.rb`)

```ruby
  config.verify_access_proc = proc { |controller| controller.current_user.admin? }
```

## Data Tables

You can easily embed data-tables into your App with content from DB.

You can build data tables for the whole Table, Table with specific columns or based on SQL query.

Below you can see samples on how you can embed data-tables directly in your app.

```erb
<h3>Table</h3>

<%= rails_db_data_table 'accounts',
                        footer: true,
                        columns: ['id', 'name', 'users_count'],
                        header: true,
                        style: :bootstrap %>

<h3>SQL</h3>

<%= rails_db_data_table_sql 'select id, name, age from users order by age desc limit 10',
                            footer: false,
                            header: true %>
```

<sup>++</sup>There is a dependency on MySQL.  You may need to `gem install mysql2 -v '0.3.20'`
## Contributing

- Fork it
- Create your feature branch (git checkout -b my-new-feature)
- Commit your changes (git commit -am 'Added some feature')
- Push to the branch (git push origin my-new-feature)
- Create new Pull Request

## Local Development

- Checkout it
- cd test/dummy
- bundle
- rake db:migrate
- rails s -b 0.0.0.0
- open http://locahost:3000/

## Plans

* Add more tests
* Verify all environments
* Add DB schema visualization
* Create WIKI pages, improve documentation
* Add favicon for standalone and dummy apps
* Add ERD schema

## License

This project uses MIT-LICENSE.
