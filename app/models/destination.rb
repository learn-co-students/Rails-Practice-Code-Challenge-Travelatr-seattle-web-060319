class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_posts
    self.posts.sort_by{|post| post.created_at}[0..4]
  end

  def most_liked_post
    self.posts.sort_by{|post| post.likes}.last
  end

  def average_age
    self.bloggers.map{|blogger| blogger.age}.sum / self.bloggers.count
  end
end
