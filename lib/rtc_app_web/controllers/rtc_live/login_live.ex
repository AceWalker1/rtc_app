defmodule RtcAppWeb.RtcLive.LoginLive do
  alias RtcAppWeb.RtcLive
  use RtcAppWeb, :live_view

  alias RtcApp.Repo
  alias RtcApp.Users

  def render(assigns) do
    ~H"""
      <h1>Login!</h1>
      <.form phx-submit ="login" action = {~p"/"}>
        <label>Username</label><br>
        <input type = "text" name = "username"><br>
        <label>Password</label><br>
        <input type = "text" name = "password"><br>

        <button type = "submit">Login</button>

      </.form><br>

      <div><%= @message %></div>
      <.link href = {~p"/signup"}>Don't have an account? Sign Up!</.link>
    """
  end

  def mount(_session, _params, socket) do
    {:ok, assign(socket, message: "", username: "")}
  end

  def handle_event("login", %{"username" => username, "password" => password}, socket) do
    # use_session(username)
    case user = Repo.get_by(Users, username: username) do
      nil ->
        {:noreply, assign(socket, message: "No credentials provided")}

      %Users{password: password} ->
        username = user.username
        IO.inspect(username)
        if password == password do
          {:noreply, socket
            |>assign(message: "Successful login")
            |>redirect(to: ~p"/")
        }
        else
          IO.puts "Invalid password"
          {:noreply, assign(socket, message: "Unsuccessful login: Invalid password")}
        end
    end
  end
end
