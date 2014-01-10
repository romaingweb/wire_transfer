# Version
require "wire_transfer/version"

# Resources
require "wire_transfer/structured_communication"

# Helpers
require "wire_transfer/helper"

# Errors
require "wire_transfer/invalid_number_error"

module WireTransfer
  def generate_structured_communication(reference)
    StructuredCommunication.compute(reference)
  end
end

ActiveSupport.on_load(:action_view) do
  include WireTransfer::Helper
end
