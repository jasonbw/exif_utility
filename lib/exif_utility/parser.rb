module ExifUtility
  class Parser

    def initialize(filename, data)
      @data = data
      @interpreter = Interpreter.new(@data)

      file = File.open(filename, 'rb')

      # Check to make sure it's an image.
      # Every JPEG starts with 0xFFD8 the marker for a JPEG SOI (Start of image)
      unless file.read(2).unpack('H*')[0].upcase == "FFD8"
        raise 'This file is not a JPEG'
      end

      # Exif data starts with the AAP1 Marker: 0xFFE1
      unless file.read(2).unpack('H*')[0].upcase == "FFE1"
        raise 'This file does not have Exif data'
      end

      # The size of the APP1 data area (Exif data area)
      exif_data_size = file.read(2).unpack('H*')[0].upcase.to_i(16) - 2 # note that this size includes the size of descriptor (2 bytes)

      # Read in the Exif Header
      # The Exif Header always starts with 0x457869660000
      unless file.read(6).unpack('H*')[0].upcase == "457869660000"
        raise 'This file does not have an Exif header'
      end

      exif_data_size -= 6 # subtract the size of the Exif Header (6 bytes)

      # Read in all of APP1 Data
      # @exif_data now starts at offset 0x0000
      @exif_data = file.read(exif_data_size).unpack('H*')[0].upcase
      @offset = 0
      @alignment = :motorola


      # Read in the TIFF Header (8 bytes)
      # The first 2 bytes define the byte align of the TIFF data
      # 0x4949 == "II". This is the Intel alignment (little-endian).
      # 0x4d4d == "MM". This is the Motorola alignment (big-endian).
      # Note that this alignment is only for the Exif data, not the JPEG data
      # How the alignments differ:
      # 0x12345678 is stored as 0x12 0x34 0x56 0x78 using Motorola align
      # 0x12345678 is stored as 0x78 0x56 0x34 0x12 using Intel align
      # But you can't just
      case read(2)
      when "4949"
        @alignment = :intel
      when "4D4D"
        @alignment = :motorola
      else
        raise 'The TIFF Header does not have a byte alignment'
      end

      # The next 2 bytes are always 0x002A
      unless read(2) == "002A"
        raise 'Parsing error: not 0x002A'
      end

      # The last 4 bytes of the TIFF header are an offset to the first IFD (Image File Directory).
      # Offset is counted from the beginning of the TIFF header and is usually 0x00000008.
      # The Tiff header, including these 4 bytes, is 8 bytes total, so 0x00000008 is immediately after to the TIFF header
      # Get us to the beginning of IFD0
      @offset = read(4).to_i(16)

      # The first IFD, IFD0, is the IFD of the main image.
      # IFD1 is the IFD of the thumbnail image.
      # IFDs contain image information data but IFD0 and IFD1 don't contain any digicam info such as shutter speed, focal length, etc.
      # IFD0 always contains a special Tag Exif Offset (0x8769) which shows an offset to Exif SufIFD which is IFD formatted data that contains digicam info.

      # Parse the first IFD
      parse_IFD

      # After an IFD there are 4 bytes representing the offset to the next IFD.
      # Note that the next IFD is different from Exif SubIFD
      # If they are 0x00000000 then there are no more IFDs
      offset_to_next_IFD = read(4).to_i(16)

      # Then jump to the offset for Exif SubIFD
      set_offset(@data.exif_offset)
      # Then parse the Exif SubIFD which contains digicam information
      parse_IFD


      ## TODO: Parse the IFD linked to by IFD0

    end



    def parse_IFD
      # The first 2 bytes are the number of directory entries contained in this IFD
      @entries = read(2).to_i(16)

      # Next are the directory entires, 12 bytes per entry, from entry (0) to (@entries - 1)
      @entries.times do
        parse_entry
      end


    end

    def parse_entry
      tag = read(2)
      data_format = read(2)
      number_of_components = read(4).to_i(16)
      data_value = read(4)

      bytes_of_data = @interpreter.size_from_data_format(data_format) * number_of_components
      if bytes_of_data > 4
        # interpret the datavalue as an offset
        result = @interpreter.interpret(tag, read_at_offset(bytes_of_data, data_value.to_i(16))) # in this scenario data_value is the offset to the data
      else
        # interpret the datavalue as the data
        result = @interpreter.interpret(tag, data_value)
      end

      # Data is saved in the interpreter
      # @data.add_data(tag, result)

    end




    # Section for methods that work with reading in bytes
    # Reads in data from @exif_data

    def set_offset(new_offset)
      @offset = new_offset
    end

    # have to chck if the data should be read as little or big endian
    def read(num_bytes)
      # convert to offsets in the array
      start_offset = (@offset * 2)
      end_offset = start_offset + (num_bytes * 2) - 1

      # Check the alignment and convert if it's Intel align
      if @alignment == :intel
        # Convert little to big endian with an atomic element size of 1 byte
        bytes = @exif_data[start_offset..end_offset].scan(/(..)/).reverse.join
      else
        # Assume by default that it's Motorola type align
        bytes = @exif_data[start_offset..end_offset]
      end

      @offset += num_bytes
      bytes
    end

    # always read big endian
    def read_at_offset(num_bytes, offset)
      # convert to offsets in the array
      start_offset = (offset * 2)
      end_offset = start_offset + (num_bytes * 2) - 1

      @exif_data[start_offset..end_offset]
    end

  end

end