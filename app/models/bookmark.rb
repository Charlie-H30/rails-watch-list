class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, presence: true
  validates :list_id, presence: true
  validates_associated :list, :movie
  validates :movie_id, uniqueness: { scope: :list_id }
  validates :comment, format: { with: /\A.{6,}\z/ }
end
