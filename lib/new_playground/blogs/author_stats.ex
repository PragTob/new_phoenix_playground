defmodule NewPlayground.Blogs.AuthorStats do
  use Ecto.Schema
  import Ecto.Changeset

  schema "author_stats" do
    field :posts, :integer
    field :interactions, :integer
    field :author_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(author_stats, attrs) do
    author_stats
    |> cast(attrs, [:posts, :interactions])
    |> validate_required([:posts, :interactions])
  end
end
