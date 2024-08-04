# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(tag, options = {}, content = nil)
      attributes = options.map { |key, value| " #{key}=\"#{value}\"" }.join
      if content
        "<#{tag}#{attributes}>#{content}</#{tag}>"
      else
        "<#{tag}#{attributes}>"
      end
    end
  end
end
