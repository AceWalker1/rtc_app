defmodule RtcAppWeb.RtcLive.HomeLive do
  use RtcAppWeb, :live_view

  alias RtcApp.Repo
  alias RtcApp.Messages
  alias RtcApp.Users
  alias RtcAppWeb.RtcLive.Session

  def render(assigns) do
    ~H"""
      <h1>Hello chat!</h1>
      <div><%= @message %></div><hr>
      <%= for user <- @users do%>
        <.link href = {~p"/user/#{user.id}"}><%= user.username %></.link><br>
      <% end %><hr>
      <.link href = {~p"/signup"}>Sign Up!</.link>
      <.link href = {~p"/login"}>Login!</.link>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, message: "Welcome", users: Repo.all(Users))}
  end

  def get_logged_in_user() do
    username = Session.get_user()
  end
end
