class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :bio, length: {minimum: 30}
  validates :age, numericality: { other_than: 0 }

  def total_likes
    self.posts.map{|post| post.likes }.sum
  end

  # def most_likes_post
  #   id = 0
  #   most_likes = self.posts.first.likes
  #   self.posts.each do |post|
  #     if post.likes >= most_likes
  #       id = post.id
  #     end
  #   end
  #   post = Post.find(id)
  # end

  def top_5_most
    self.destinations.sort_by{|destination| destination.posts.count}.reverse[0..4]
  end
  


end
