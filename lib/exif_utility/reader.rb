module ExifUtility
  class Reader

    attr_reader :date_time

    # filename is the name of the file
    def initialize(filename)
      @offset = 0
      @increase_offset = false
      @alignment = :motorola

      @image = File.open(filename, 'rb')
      @date_time = read

    end

    def read
      # Check to make sure it's an image.
      # Every JPEG starts with 0xFFD8 the marker for a JPEG SOI (Start of image)
      unless read_bytes(2) == "FFD8"
        raise 'This file is not a JPEG'
      end

      # Exif data starts with the AAP1 Marker: 0xFFE1
      unless read_bytes(2) == "FFE1"
        raise 'This file does not have Exif data'
      end

      # The size of the APP1 data area (Exif data area)
      exif_data_area = read_bytes(2).to_i(16) - 2 # note that this size includes the size of descriptor (2 bytes)

      # Read in the Exif Header
      # The Exif Header always starts with 0x457869660000
      unless read_bytes(6) == "457869660000"
        raise 'This file does not have an Exif header'
      end


      # Beginning of the TIFF Header, start offset counting
      @increase_offset = true

      # Read in the TIFF Header (8 bytes)
      # The first 2 bytes define the byte align of the TIFF data
      # 0x4949 == "II". This is the Intel alignment (little-endian).
      # 0x4d4d == "MM". This is the Motorola alignment (big-endian).
      # Note that this alignment is only for the Exif data, not the JPEG data
      # How the alignments differ:
      # 0x12345678 is stored as 0x12 0x34 0x56 0x78 using Motorola align
      # 0x12345678 is stored as 0x78 0x56 0x34 0x12 using Intel align
      # But you can't just
      case read_bytes(2)
      when "4949"
        @alignment = :intel
      when "4D4D"
        @alignment = :motorola
      else
        raise 'The TIFF Header does not have a byte alignment'
      end

      # The next 2 bytes are always 0x002A
      unless read_bytes(2) == "002A"
        raise 'Parsing error: not 0x002A'
      end

      # The last 4 bytes of the TIFF header are an offset to the first IFD (Image File Directory).
      # Offset is counted from the beginning of the TIFF header and is usually 0x00000008.
      # The Tiff header, including these 4 bytes, is 8 bytes total, so 0x00000008 is immediately after to the TIFF header
      # Get us to the beginning of IFD0
      read_bytes(read_bytes(4).to_i(16) - 8)


      # The first IFD, IFD0, is the IFD of the main image
      # IFD1 is the IFD of the thumbnail image
      # IFDs contain image information data but IFD0 and IFD1 don't contain any digicam info such as shutter speed, focal length, etc
      # IFD0 always contains a special Tag Exif Offset (0x8769) which shows an offset to Exif SufIFD which is IFD formatted data that contains digicam info


      # The first 2 bytes are the number of directory entries contained in this IFD
      @entries = read_bytes(2).to_i(16)

      # Next are the directory entires, 12 bytes per entry, from entry (0) to (@entries - 1)
      @entries.times do |i|
        # The individual entries are broken up into parts:
        # first 2 bytes are the Tag number, this shows a kind of data
        tag = read_bytes(2)
        puts "tag #{tag}"

        # for now we're only looking for the DateTime
        if tag == "0132" # or tag == "9003" or tag == "9004" # all tags for DateTime
          read_bytes(2) # gobble
          length = read_bytes(4).to_i(16) # number of bytes to get at the offset
          offset = read_bytes(4).to_i(16)

          # next 2 bytes is data format
          # next 4 bytes is number of components
          # next 4 bytes contains a data value or offset to data value


          # now read until the offset
          read_bytes(offset - @offset) # gobble

          # now read the bytes that correspond to DateTime
          date_time = read_bytes(length - 1).scan(/../).map{|i| i.to_i(16).chr}.join # last byte is 0x00 (NULL)
          return date_time
        end

        read_bytes(10) # gobble


      end

      raise 'No DateTime info'



      # After the last entry there are 4 bytes of data which is the offset to the next IFD
      # note that this is the offset from the BEGINNING of the TIFF HEADER
      # if these 4 bytes are 0x00000000 then this is the last IFD and there are no more




    end

    # Returns the hex values of the bytes
    def read_bytes(num_bytes)
      if @increase_offset
        @offset += num_bytes
      end

      # Check the alignment and convert if it's Intel align
      if @alignment == :intel
        # Convert little to big endian with an atomic element size of 1 byte
        return @image.read(num_bytes).unpack('H*')[0].upcase.scan(/(..)/).reverse.join
      else
        # Assume by default that it's Motorola type align
        return @image.read(num_bytes).unpack('H*')[0].upcase
      end
    end


  end
end