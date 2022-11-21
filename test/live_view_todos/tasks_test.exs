defmodule LiveViewTodos.TasksTest do
  use LiveViewTodos.DataCase

  alias LiveViewTodos.Todos

  describe "tasks on todos" do
    alias LiveViewTodos.Todos.Todo
    alias LiveViewTodos.Todos.Task
    import LiveViewTodos.TodosFixtures

    test "change_todo/1 saves todo with empty task list" do
      todo = todo_fixture(tasks: [])
      assert %Ecto.Changeset{data: %Todo{tasks: []}} = Todos.change_todo(todo)
    end

    test "change_todo/1 saves todo with tasks" do
      todo = todo_fixture(tasks: [build_task(name: "pumpkin thing")])

      assert %{data: %Todo{tasks: [%Task{name: "pumpkin thing", percent: 0}]}} =
               Todos.change_todo(todo)
    end

    test "delete tasks" do
      todo = todo_fixture(tasks: [build_task(name: "pumpkin thing")])
      params = %{
        "tasks" => []
      }

      todo = Todos.update_todo(todo, params)
      assert {:ok, %Todo{tasks: []}} = todo
    end

    test "add tasks" do
      todo = todo_fixture(tasks: [build_task(name: "pumpkin thing")])
      params = %{
        "tasks" => [
          %{"name" => "pumpkin thing", "percent" => "50"},
          %{"name" => "squash thing", "percent" => "25"},
          %{"name" => "gourd thing", "percent" => "25"}
        ]
      }

      todo = Todos.update_todo(todo, params)
      {:ok, %Todo{tasks: tasks}} = todo
      assert 3 = length(tasks)
    end
  end
end
