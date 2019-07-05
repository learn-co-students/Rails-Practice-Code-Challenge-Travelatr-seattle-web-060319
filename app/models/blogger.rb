class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :bio, length: { minimum: 30 }
  validate :valid_age

  def valid_age
    if !(age.class == Integer && age > 0)
      errors.add(:age, "Invalid Age. Try again.")
    end
  end

  def total_likes
    count = 0
    self.posts.each do |post|
      count += post.likes
    end
    return count
  end

  def featured_post
    fp = self.posts.sort_by { |post| post.likes }
    return fp.last
  end

  def top_five
    fp = self.posts.sort_by { |post| post.likes }
    tf = fp.reverse[0..4]
    top_destinations = tf.map do |post|
      post.destination.name
    end
    return top_destinations
  end

end
