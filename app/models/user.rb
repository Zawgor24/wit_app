# top-level class documentation comment
class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :messages, dependent: :destroy

  accepts_nested_attributes_for :accounts

  mount_uploader :image, ImageUploader
end
