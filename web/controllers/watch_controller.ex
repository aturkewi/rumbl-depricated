defmodule Rumbl.WatchController do
  use Rumbl.Web, :controller
  alias Rumbl.Videos
  
  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", vidoe: video
  end
end