defmodule Forum.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, Forum.Accounts.User
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :title, :user_id])
    |> validate_required([:body, :title, :user_id])
  end
end
