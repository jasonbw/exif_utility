
module ExifUtility
  # The main ExifUtility driver
  class ExifUtility


    # test function
    def initialize(filename)
      @reader = Reader.new(filename)
    end

    def date_time
      return @reader.date_time
    end
  end
end

require 'exif_utility/reader'