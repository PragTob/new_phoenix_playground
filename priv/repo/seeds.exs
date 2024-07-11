# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     NewPlayground.Repo.insert!(%NewPlayground.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias NewPlayground.Repo

alias NewPlayground.Blogs.Author
alias NewPlayground.Blogs.Post
alias NewPlayground.Blogs.Comment

now = DateTime.utc_now() |> DateTime.truncate(:second)

with_time = fn list ->
  Enum.map(list, fn entry -> Keyword.merge([inserted_at: now, updated_at: now], entry) end)
end

authors = [[name: "Brandon"], [name: "Stephen"]]
{_, [brandon, stephen]} = Repo.insert_all(Author, with_time.(authors), returning: true)

posts = [
  [title: "A", author_id: brandon.id],
  [title: "B", author_id: brandon.id],
  [title: "C", author_id: stephen.id]
]

{_, [post1, post2, post3]} = Repo.insert_all(Post, with_time.(posts), returning: true)

comments = [
  [body: "Cool post!", likes: 3, post_id: post2.id]
]

Repo.insert_all(Comment, with_time.(comments))
