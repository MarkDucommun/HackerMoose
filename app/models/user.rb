class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  has_many :comments

  before_save :aggregate_karma

  eval(UserHelper.add_methods_to_model)

  def aggregate_karma
    new_karma = 0
    [self.comments, self.posts].each do |vote_containing_array|
      vote_containing_array.each do |vote_containing_thingy|
        new_karma += vote_containing_thingy.votes
      end
    end
    self.karma = new_karma
  end
end
