defmodule CuleDating.Repo.Migrations.UsersAddProfileData do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :description, :string
      add :name, :string
      add :picture_urls, {:array, :string}
    end
  end
end
