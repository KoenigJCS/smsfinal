defmodule Smsfinal.Company.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Smsfinal.Company.Store

  schema "products" do
    field :inv_count, :integer
    field :name, :string
    field :retail_price, :float
    field :vendor, :string
    field :whole_price, :float
    belongs_to :store, Store

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :vendor, :whole_price, :retail_price, :inv_count, :store_id])
    |> validate_required([:name, :vendor, :whole_price, :retail_price, :inv_count, :store_id])
  end
end
