class Micropost < ActiveRecord::Base
    belongs_to :user

	validates :user_id, presence: true, length: { maximum: 140 }
	validates :content, presence: true
	
	# default_scope {} order: 'microposts.created_at DESC'
	default_scope { order('created_at DESC') }

end
