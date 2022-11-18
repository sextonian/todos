defmodule LiveViewTodos.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :percent, :integer

      add :todo_id, references(:todos)

      timestamps()
    end
  end
end
