class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def genre_id
    self.genre_id ? self.genre_id.name : nil
  end
end
