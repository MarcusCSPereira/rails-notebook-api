# Rails Notebook API

A Ruby on Rails study project for managing contacts, their categories, phone numbers, and addresses through versioned JSON APIs.

## Stack

- Ruby 3.4.7 and Rails 8.1.1.
- Active Record and SQLite.
- Active Model Serializers.
- Devise and Devise Token Auth.
- Kaminari and RSpec.

## Structure

The application contains controllers and serializers for API versions `v1` and `v2`. The domain includes contacts, kinds, phones, addresses, and users.

Routes include:

| Path | Purpose |
| --- | --- |
| `/v1/contacts`, `/v2/contacts` | Contact management. |
| `/v1/contacts/:id/kind`, `/v2/contacts/:id/kind` | Contact category. |
| `/v1/contacts/:contact_id/phones`, `/v2/contacts/:contact_id/phones` | Contact phone numbers. |
| `/v1/contacts/:contact_id/address`, `/v2/contacts/:contact_id/address` | Contact address. |
| `/kinds` | Category management. |
| `/auth` | Routes provided by Devise Token Auth. |
| `/up` | Rails health check. |

See [config/routes.rb](config/routes.rb) for the complete route definitions and HTTP methods.

## Run locally

Install Ruby 3.4.7 and Bundler, then:

```bash
git clone https://github.com/MarcusCSPereira/rails-notebook-api.git
cd rails-notebook-api
bundle install
bin/rails db:prepare
bin/rails server
```

Development and test databases are configured in [config/database.yml](config/database.yml). The development database is stored in `storage/development.sqlite3`.

## Checks

```bash
bundle exec rspec
bin/rubocop
bin/brakeman
```

The repository includes a controller spec for `v1` contacts and a GitHub Actions workflow. These commands are the project's check entry points, not a statement that every check is currently passing.

## Learning context

This repository is for practicing Rails APIs, resource relationships, serialization, authentication, and API versioning. It is a study project rather than a production service.
