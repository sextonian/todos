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

  def changeset(attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :percent])
    |> validate_required([:name, :percent])
  end
end
