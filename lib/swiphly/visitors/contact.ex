defmodule Swiphly.Visitors.Contact do
  use Swiphly.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name, :company, :title, :event]}
  schema "contacts" do
    field :company, :string
    field :event, :string
    field :name, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :title, :company, :event])
    |> validate_required([:name, :title, :company, :event])
  end
end
