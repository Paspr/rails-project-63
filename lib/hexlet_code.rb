# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  autoload(:Tag, "hexlet_code/tag.rb")

  def self.form_for(_, url = {})
    if url.empty?
      "<form action=\"#\" method=\"post\"></form>"
    else
      "<form action=\"#{url[:url]}\" method=\"post\"></form>"
    end
  end

  class Error < StandardError; end
  # Your code goes here...
end
