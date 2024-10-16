# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      attr_reader :name, :value, :options

      def initialize(name, value, options = {})
        @name = name
        @value = value
        @options = options.except(:as)
      end

      def format_options(options)
        options.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      end

      def build_label(name)
        indent(Tag.build('label', { for: name }, name.capitalize))
      end

      def indent(content)
        content.lines.map { |line| "  #{line}" }.join
      end
    end
  end
end
