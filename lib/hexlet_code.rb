# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/generator"

module HexletCode
  autoload(:Tag, "hexlet_code/tag.rb")

  def self.form_for(user, url = {}, &block)
    action = url.empty? ? "#" : url[:url]
    form_builder = FormGenerator.new(user)
    block.call(form_builder)
    form_builder.build(action)
  end

  class Error < StandardError; end
  # Your code goes here...
end
