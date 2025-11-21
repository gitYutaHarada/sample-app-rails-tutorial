# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Tooling notes

### RuboCop language server on Windows

The repository ships with a workspace-local `bundle.cmd`/`bin/bundle` pair so that VS Code and other
tools can run `bundle exec rubocop --lsp` without relying on a globally installed `bundle` command in
your `PATH`. If you still see `spawn bundle ENOENT`, make sure you open the workspace folder itself in
VS Code so the editor picks up the bundled command shims.

### Resetting the PostgreSQL database

Running `rails db:migrate:reset` (or any task that drops databases) can fail on Windows if a lingering
session still holds a connection to the target database. A helper rake task (`db:terminate_connections`)
now runs automatically before each `db:drop*` invocation and forcefully terminates those sessions via
`pg_terminate_backend`. If you prefer to call it manually, run `rails db:terminate_connections` before
dropping databases.
