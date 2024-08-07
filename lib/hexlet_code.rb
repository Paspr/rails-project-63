# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Generator, 'hexlet_code/generator.rb')
  autoload(:Builder, 'hexlet_code/builder.rb')

  def self.form_for(user, url: '#', method: :post, **attributes, &block)
    form_builder = Builder.new(user, url:, method:, **attributes)
    block.call(form_builder) if block_given?
    Generator.new(form_builder).generate
  end
end
