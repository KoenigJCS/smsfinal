defmodule Smsfinal.CompanyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Smsfinal.Company` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        location: "some location",
        store_id: 42
      })
      |> Smsfinal.Company.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        inv_count: 42,
        name: "some name",
        retail_price: 120.5,
        vendor: "some vendor",
        whole_price: 120.5
      })
      |> Smsfinal.Company.create_product()

    product
  end
end
