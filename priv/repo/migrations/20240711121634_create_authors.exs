defmodule NewPlayground.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
