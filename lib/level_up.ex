defmodule LevelUp do
  @moduledoc """
  Documentation for `LevelUp`.
  """
  use LevelUp.InfoModule
  require LevelUp.Macros

  @doc """
  Hello world.

  ## Examples

      iex> LevelUp.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  List of system env variables.
  """
  def env_info do
    System.get_env()
  end

  @doc """
  Contact email.
  """
  def contact_email do
    Application.fetch_env!(:level_up, :contact_email) |> LevelUp.Macros.inspect_caller()
  end
end
