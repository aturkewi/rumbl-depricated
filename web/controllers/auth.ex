defmodule Rumbl.Auth do
  import Plug.Conn
  def initi(opts) do
    Keyword.fetch!(opts, :repo)
  end
  
  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && repo.get(Rumbl.User, uesr_id)
    assign(conn, :current_user, user)
  end
end