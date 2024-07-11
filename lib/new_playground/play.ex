defmodule NewPlayground.Play do
  alias NewPlayground.Blogs.Post
  alias NewPlayground.Blogs.AuthorStats
  alias NewPlayground.Repo

  import Ecto.Query

  def insert_all_loading do
    now = DateTime.utc_now() |> DateTime.truncate(:second)

    query =
      from p in Post,
        join: c in assoc(p, :comments),
        select: %{
          author_id: p.author_id,
          posts: count(p.id, :distinct),
          interactions: sum(c.likes) + count(c.id),
          inserted_at: ^now,
          updated_at: ^now
        },
        group_by: p.author_id

    Repo.insert_all(AuthorStats, query)
  end
end
