defmodule CuleDating.Repo.Migrations.DropTableProfiles do
  use Ecto.Migration

  def change do
    drop table ("profiles")
  end
end
