defmodule LiveViewTodos.Todos.Task do
  use Ecto.Schema
  import Ecto.Changeset

  alias LiveViewTodos.Todos

  schema "tasks" do
    field :name, :string
    field :percent, :integer, default: 0
    belongs_to :todo, Todos.Todo

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:name, :percent])
    |> validate_required([:name, :percent])
  end
end
