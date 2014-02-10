module ExifUtility
  class ExifUtility

    # Exif data is stored in the Data class
    attr_accessor :data

    def initialize(filename)
      @data = Data.new
      Parser.new(filename, data)
    end

  end

end

require 'date'

require 'exif_utility/data'
require 'exif_utility/parser'
require 'exif_utility/interpreter'