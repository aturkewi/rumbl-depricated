defmodule Rumbl.TestHelpers do
  alias  Rumbl.Repo
  
  def insert_user(attrs \\ %{}) do
    changes = Dict.merge(%{
      name: "Some user",
      username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}",
      password: "password"
    }, attrs)
    %Rumbl.User{}
    |> Rumbl.User.registration_changeset(changes)
    |> Repo.insert!()
  end
  
  def insert_video(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:videos, attrs)
    |> Repo.insert!()
  end
end