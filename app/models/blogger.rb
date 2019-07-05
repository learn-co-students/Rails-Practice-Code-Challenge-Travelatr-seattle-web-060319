class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, {presence: true, uniqueness: true}
    validates :age, {presence: true, numericality: {minimum: 0}}
    validates :bio, length: {minimum: 30}

    def total_likes
        sum = 0
        self.posts.map {|p| sum = sum + p.likes}
        sum
    end

    def featured_post
        self.posts.sort_by{|p| -p.likes}[0]
    end

    def five_destinations
        h = self.posts.group(:destination_id).count
        sorted_array = h.sort_by{|destination_id, count| -count}
        destinations = sorted_array.map {|i| Destination.all.find(i[0])}
    end

end
