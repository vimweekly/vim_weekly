namespace :db do
  desc "Fill the database"
  task populate: :environment do
    create_post
  end
end


def create_post
  puts "hello"
end
