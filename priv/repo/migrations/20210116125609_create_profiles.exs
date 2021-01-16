defmodule CuleDating.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :user_id, :uuid
      add :name, :string
      add :picture_urls, {:array, :string}
      add :email, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:profiles, [:user_id])
  end
end
