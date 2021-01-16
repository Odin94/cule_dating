# CuleDating

A dating web app for ethically non-monogamous people. Written with Phoenix LiveView

## Requirements
* Elixir 1.11 or newer
* Docker

## How to run
* Start dev database with `docker run --name cule_dating_db -e POSTGRES_PASSWORD=postgres -d -p 5432:5432 postgres`
* To start your Phoenix server (may need admin privileges on windows):
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).


## TODO
* Add email notifier to user_notifier.ex