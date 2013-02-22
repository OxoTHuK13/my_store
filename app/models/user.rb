class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :email, :birthday, :post

  email_regex = /\A[\w\.]+[a-z]+@[a-z]+\.[a-z]{2,4}\z/i

  validates :firstname, :lastname, :length => { :minimum => 2 }
  validates :email, :presence => true,
  									:format		=>{ :with => email_regex}

  has_many :posts, dependent: :destroy
end
