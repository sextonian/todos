defmodule LiveViewTodos.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  alias LiveViewTodos.Todos

  schema "todos" do
    field :done, :boolean, default: false
    field :title, :string
    has_many :tasks, Todos.Task, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :done])
    |> cast_assoc(:tasks, with: &Todos.Task.changeset/2)
    |> validate_required([:title, :done])
  end
end
