# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br img input hr link meta source].freeze
    def self.build(tag, options = {}, content = nil)
      attributes = options.map { |key, value| " #{key}=\"#{value}\"" }.join
      return "<#{tag}#{attributes}>" if SINGLE_TAGS.include?(tag)

      "<#{tag}#{attributes}>#{content}</#{tag}>"
    end
  end
end
