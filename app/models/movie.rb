class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_overview,
    against: [ :title, :overview ],
    using: {
      # @@ partial words allowed
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
