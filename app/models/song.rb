class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    Artist.find_or_create_by(id: self.artist_id).name
    # Artist.find(self.artist_id).name

  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end


  def note_contents

    note_contents = self.notes.map do |note_obj|
      note_obj.content
    end
    note_contents
  end

  def note_contents=(str_arr)
    #create a note for each index
    #but only if it is filled out.
    new_notes = str_arr.map do |note_str|
      if note_str.length > 0
        self.notes << Note.create(content: note_str)
      end
    end
  end

  def genre_name
    self.genre.name
  end

  def genre_name=(str)
    genre = Genre.find_or_create_by(name: str)
    self.genre = genre
  end

end

