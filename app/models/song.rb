class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre_id = Genre.find_or_create_by(name: name).id
  end

  def genre_name
    self.genre_id ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist_id = Artist.find_or_create_by(name: name).id
  end

  def artist_name
    self.artist_id ? self.artist.name : nil
  end

  def note_contents=(content)
    content = content.select { |one_note_content| one_note_content != ""}
    content.each { |note_info| self.notes << Note.find_or_create_by(content: note_info) }
    self.save
  end

  def note_contents
    self.notes ? self.notes.map{ |note| note.content } : nil
  end

end
