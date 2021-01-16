defmodule CuleDating.CuleDating.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :description, :string
    field :email, :string
    field :name, :string
    field :picture_urls, {:array, :string}
    field :user_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:user_id, :name, :picture_urls, :email, :description])
    |> validate_required([:user_id, :name, :picture_urls, :email, :description])
    |> unique_constraint(:user_id)
  end
end
