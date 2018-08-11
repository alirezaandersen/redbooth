# Lets say we are adding chat functionality to an app we have already
# written. We already have a users table, which looks like this:

# create_table "users", force: true do |t|
#     t.string   "username",
#     t.references :organizations
# end
#
# class User < ActiveRecord::Base
#     validate :username, presence: true, uniqueness: true, length: { maximum: 64 }
#     belongs_to :organization
#     has_many :tasks
# end

# We want our chat feature to have channels, where a channel has a name,
# and some members. We need to be able to look up what members a channel
# has.

# We also want to be able to record the messages sent by users, and we
# want to know which users sent them.

# Chat channels should have names that are less than 32 characters, and
# all messages should be limited to 1000 characters. Chat channel names
# should be unique.


# Lets say we are adding chat functionality to an app we have already
# written. We already have a users table, which looks like this:

create_table "users", force: true do |t|
    t.string   "username",
    t.references :organizations
end

class User < ActiveRecord::Base
    validate :username, presence: true, uniqueness: true, length: { maximum: 64 }
    belongs_to :organization
    has_many :tasks
  	has_many :channels
end

class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
end

class Channels < ActiveRecord::Base
  validate :name, presence: true, uniqueness: true, length: {maximum: 32}
  has_many :user, through membership
  has_many memberships

  def add_member(user)
     Message.welcome(user.id, channel_id) unless Membership.create!(user, channel.id)
  end
end


class Messages < ActiveRecord::Base
	validate :conversation, presence: true, uniqueness: true, length: {maximum: 1000}
  belongs_to :user
  belongs_to :channel

  def welcome(user_id, channel)
      update.conversation: 'welcome #{user.name} to #{channel.name}')
	end
end


# We want our chat feature to have channels, where a channel has a name,
# and some members. We need to be able to look up what members a channel
# has.

# We also want to be able to record the messages sent by users, and we
# want to know which users sent them.

# Chat channels should have names that are less than 32 characters, and
# all messages should be limited to 1000 characters. Chat channel names
# should be unique.
