defmodule RtcAppWeb.UserController do
  use RtcAppWeb, :controller

  def login(conn, %{"user.id" => user_id, "user.username" => username}) do
    conn
    |>put_session(conn, user_id: user_id)
    |>IO.puts(user_id)
  end
end
