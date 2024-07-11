defmodule NewPlayground.Blogs.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias NewPlayground.Blogs.Comment

  schema "posts" do
    field :title, :string
    field :author_id, :id

    has_many :comments, Comment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
