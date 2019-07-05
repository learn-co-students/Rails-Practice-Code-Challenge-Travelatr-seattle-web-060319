class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  validates :title, presence: true
  validates :content, length: { minimum: 100 }

  def blogger_name
    self.blogger.name
  end

  def destination_name
    self.destination.name
  end 

end
