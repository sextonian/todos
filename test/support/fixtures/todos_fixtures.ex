defmodule LiveViewTodos.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveViewTodos.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        done: true,
        title: "some title",
        tasks: []
      })
      |> LiveViewTodos.Todos.create_todo()

    todo
  end

  def build_task(attrs \\ %{}) do
    attrs
    |> Enum.into(%{
      name: "something",
      percent: 0
    })

    # |> LiveViewTodos.Todos.Task.changeset()
  end
end
