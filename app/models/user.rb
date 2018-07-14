class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes

  def slug
   self.username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    User.all.find { |name| name.slug == slug }
  end

end
