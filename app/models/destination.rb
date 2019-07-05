class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_five
        self.posts.sort_by {|post| post.created_at}.reverse[0..4]
    end

    def most_liked
        self.posts.sort_by {|post| -post.likes}[0]
    end

    def avg_age
        if self.bloggers.length > 0
            ages_array = self.bloggers.map {|blogger| blogger.age}
            ages_array.sum/ages_array.length
        end
    end

end
