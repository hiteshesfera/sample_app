namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		def make relationships
users = User.all
user = users.first
followed_users = users[2..50]
followers = users[3..40]
followed_users.each { |followed| user.follow!(followed) }
followers.each { |follower| follower.follow!(user) }
end
end
end