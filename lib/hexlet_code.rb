# frozen_string_literal: true

require_relative 'hexlet_code/version'
# require_relative 'hexlet_code/generator'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Generator, 'hexlet_code/generator.rb')

  def self.form_for(user, url: '#', method: :post, **attributes, &block)
    form_builder = Generator.new(user, url:, method:, **attributes)
    block.call(form_builder) if block_given?
    form_builder.build
  end

  class Error < StandardError; end
  # Your code goes here...
end
