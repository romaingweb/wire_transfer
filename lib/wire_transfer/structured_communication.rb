module WireTransfer
  class StructuredCommunication
    def initialize number
      @number = number.to_s
      raise InvalidNumberError unless @number.match(/\A\d{12}\z/)
    end

    # Take a reference number and pad it with a certain amount of zeros
    # to make a total of 10 characters. Then it computes and appends 2 control characters.
    def self.compute(reference)
      padded_reference = pad_reference_with_zeros(reference)
      new(append_control_characters(padded_reference))
    end

    # Take a communication number and format it as it appears on a wire transfer.
    def to_s
      communication_number = @number.insert 3, "/"
      communication_number = communication_number.insert 8, "/"
      "+++#{communication_number}+++"
    end

    protected

    def self.pad_reference_with_zeros(reference)
      reference.to_s.ljust(10, "0")
    end

    def self.append_control_characters(padded_reference)
      padded_reference + compute_control_characters(padded_reference)
    end

    # Take the remainder of the euclidian division from the padded
    # reference by 97 (modulo 97) and pad it with zeros if necessary
    # unless this remainder is equal to 0, in that case,
    # the control characters are replaced by 97.
    def self.compute_control_characters(padded_reference)
      remainder = padded_reference.to_i % 97

      if remainder > 0
        remainder.to_s.rjust(2, "0")
      else
        "97"
      end
    end
  end
end
