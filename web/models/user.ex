require IEx
defmodule Rumbl.User do
  use Rumbl.Web, :model
  # defstruct [:id, :name, :username, :password]
  
  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    
    timestamps()
  end
  
  def changeset(model, params \\ :empty) do
    # model
    # |> cast(params, ~w(name username), [])
    # |> validate_length(:username, min: 1, max: 20)
    cast_return = cast(model, params, ~w(name username), [])
    validate_return = validate_length(cast_return, :username, min: 1, max: 20)
    IEx.pry
    validate_return
  end
end