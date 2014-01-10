module WireTransfer
  class StructuredCommunication
    ALLOWED_NUMBERS = 0..9999999999

    def initialize number
      @number = number
      raise InvalidNumberError unless ALLOWED_NUMBERS.include?(@number)
    end

    def self.from_string(string)
      string = string.gsub(/[^\d]/, '')
      raise InvalidNumberError unless string.size == 12
      number             = string[0..9]
      control_characters = string[10..11]

      structured_communication = new(number.to_i)
      raise InvalidNumberError unless structured_communication.control_characters == control_characters
      structured_communication
    end

    def padded_number
      @number.to_s.rjust(10, "0")
    end

    # Take the remainder of the euclidian division from the padded
    # reference by 97 (modulo 97) and pad it with zeros if necessary
    # unless this remainder is equal to 0, in that case,
    # the control characters are replaced by 97.
    def control_characters
      remainder = padded_number.to_i % 97

      if remainder > 0
        remainder.to_s.rjust(2, "0")
      else
        "97"
      end
    end

    def checksummed_padded_number
      padded_number + control_characters
    end

    # Take a communication number and format it as it appears on a wire transfer.
    def to_s
      communication_number = checksummed_padded_number.insert 3, "/"
      communication_number = communication_number.insert 8, "/"
      "+++#{communication_number}+++"
    end

    def to_i
      @number
    end
  end
end
