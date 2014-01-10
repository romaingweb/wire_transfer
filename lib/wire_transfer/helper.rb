module WireTransfer
  module Helper
    def structured_communication(number)
      StructuredCommunication.new(number).to_s
    end
  end
end
