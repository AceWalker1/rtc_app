defmodule RtcAppWeb.RtcLive.SignUpLive do
  use RtcAppWeb, :live_view

  alias RtcApp.Repo
  alias RtcApp.Users

  def render(assigns) do
    ~H"""
      <h1>Signup now!</h1>
      <form phx-submit = "signup">
        <label>Username</label><br>
        <input type = "text" name = "username" id = "username"><br>
        <label>Password</label><br>
        <input type = "text" name = "password" id = "password"><br>
        <button type = "submit">Sign Up!</button>
      </form>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, users: Repo.all(Users))}
  end

  def handle_event("signup", %{"username" => username, "password" => password}, socket) do
    changeset = %Users{username: username, password: password}
    case Repo.insert(changeset) do
      {:ok, _user} ->
        IO.puts "User created successfully"
        {:noreply, redirect(socket, to: "/login")}

      {:error, _changeset} ->
        IO.puts "Failed to signup!"
    end
  end
end
