module ExifUtility
  class Interpreter

    # data_format =>
    @data_format_and_size = {
      "0001" => 1, # unsigned byte
      "0002" => 1, # ascii character
      "0003" => 2, # unsigned short
      "0004" => 4, # unsigned long
      "0005" => 8, # unsigned rational: a fractional value containing 2 signed/unsigned long integer values: the first is the numerator, the second is the denominator
      "0006" => 1, # signed byte
      "0007" => 1, # undefined
      "0008" => 2, # signed short
      "0009" => 4, # signed long
      "000A" => 8, # signed rational
      "000B" => 4, # single float
      "000C" => 8 # double float
    }

    def self.size_from_data_format(data_format)
      @data_format_and_size[data_format]
    end

    tags_and_interpretation = {
      '010E' => :string # ImageDescription
    }

    def self.interpret(tag, data)
      case tag
      when "0132"
        # string for the time
        data = data.scan(/../).map(&:hex).map(&:chr).join[0..-2]
        DateTime.strptime(data, '%Y:%m:%d %H:%M:%S')
      when "8769"
        # U Long
        data.to_i(16)
      end
    end

    # Notes: strings end with a NULL char (all observed so far have).

  end
end