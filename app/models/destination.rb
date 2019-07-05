class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def featured_post
    fp = self.posts.sort_by { |post| post.likes }
    return fp.last
  end

  def ave_age
    total = 0
    self.bloggers.uniq.each do |blogger|
      total += blogger.age
    end
    return (total / self.bloggers.size)
  end

  def most_recent
    sorted = self.posts.sort_by { |post| post.created_at }
    return sorted.reverse[0..4]
  end

end
