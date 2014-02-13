module ExifUtility
  # Contains the values for each tag, populated by the parser
  class Data

    # TODO: Save data read in for each tag


    # These are the tags, in order. Blank lines means tags were skipped.
    attr_accessor :make # 0x010f
    attr_accessor :model # 0x0110

    attr_accessor :software # 0x0131
    attr_accessor :modify_date # 0x0132

    attr_accessor :exif_offset # 0x876

    attr_accessor :date_time_original # 0x9003
    attr_accessor :create_date # 0x9004


    def initialize
      # nothing needed to be done currently
    end

  end
end