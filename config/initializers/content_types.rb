# Add a hash of common HTTP Content Type shortnames and frozen String values,
#  e.g., `Mime::CONTENT_TYPES[:json]` returns a frozen `application/json`.
module Mime
  # Build hash of type name to value, e.g., { xml: "application/xml" }
  CONTENT_TYPES = {}.tap do |simple_content_types_hash|
    # Get each registered Mime Type
    self::EXTENSION_LOOKUP.each do |mime|
      simple_content_types_hash[mime.first.to_sym] = mime.last.instance_variable_get("@string").freeze
    end
  end.freeze
end
