defmodule NewPlayground.Repo.Migrations.CreateAuthorStats do
  use Ecto.Migration

  def change do
    create table(:author_stats) do
      add :posts, :integer
      add :interactions, :integer
      add :author_id, references(:authors, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:author_stats, [:author_id])
  end
end
