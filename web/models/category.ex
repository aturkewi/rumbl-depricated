defmodule Rumbl.Category do
  use Rumbl.Web, :model

  schema "categories" do
    field :name, :string
    has_many :videos, Rumbl.Video
    
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
  
  def alphabetical(query) do
    from c in query, order_by: c.name
  end
  
  def names_and_ids(query) do
    from c in query, select: {c.name, c.id}
  end

  # def videos_for(category_id) do
  #   Rumbl.Vidoe
  #     |> where(category_id: category_id)
  # end
end
