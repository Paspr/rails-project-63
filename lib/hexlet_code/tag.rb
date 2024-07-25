# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(tag, options = {})
      attributes = options.map do |key, value|
        " #{key}=\"#{value}\""
      end
      "<#{tag}#{attributes.join}>"
    end
  end
end
