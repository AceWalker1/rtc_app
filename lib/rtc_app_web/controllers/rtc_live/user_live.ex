defmodule RtcAppWeb.RtcLive.UserLive do
  use RtcAppWeb, :live_view

  alias RtcApp.Repo
  alias RtcApp.Messages
  alias RtcApp.Users

  def render(assigns) do
    ~H"""
      <h1>DM</h1>

    """
  end

  def mount(_session, _params, socket) do
    {:ok, assign(socket, messages: Repo.all(Messages))}
  end
end
