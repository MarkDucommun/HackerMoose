class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :post
  belongs_to :user

  validates_presence_of :text

  def toggle_vote(num)
    self.votes = 0 unless votes
    self.votes += num
    self.save
  end
end
