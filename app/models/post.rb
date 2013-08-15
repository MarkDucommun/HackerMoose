class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments

  validates :url, url: true
  validates_presence_of :title
  validates_presence_of :user

  def toggle_vote(num)
    self.votes = 0 unless votes
    self.votes += num
    self.save
  end
end
