class User < ApplicationRecord
	validates :first_name, presence: true
	validates :registered, numericality: true, allow_blank: true
	has_many :pictures
	has_many :locations
end
