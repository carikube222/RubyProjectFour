class Condition < ApplicationRecord
  belongs_to :user
  has_many :yes, dependent: :destroy
  has_many :nopes, dependent: :destroy
  has_many :maybes, dependent: :destroy
  # has_many :yes, dependent: :destroy
  # has_many :nope, dependent: :destroy
  # has_many :maybe, dependent: :destroy
end
