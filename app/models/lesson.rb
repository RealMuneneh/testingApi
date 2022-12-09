class Lesson < ApplicationRecord
    has_many :package
    has_many :tutor, through: :package
end
