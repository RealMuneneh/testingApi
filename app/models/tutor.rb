class Tutor < ApplicationRecord
   has_many :package
   has_many :lesson, through: :package
end
