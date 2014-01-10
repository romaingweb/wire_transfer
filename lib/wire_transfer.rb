# Version
require "wire_transfer/version"

# Resources
require "wire_transfer/structured_communication"

# Helpers
require "wire_transfer/helper"

# Errors
require "wire_transfer/invalid_number_error"

module WireTransfer
  def self.generate_structured_communication(number)
    StructuredCommunication.new(number)
  end

  def self.parse_structured_communication(string)
    StructuredCommunication.from_string(string)
  end
end

ActiveSupport.on_load(:action_view) do
  include WireTransfer::Helper
end
