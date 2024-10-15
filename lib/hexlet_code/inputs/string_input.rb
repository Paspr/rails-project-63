# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def build
        result_options = { name:, type: 'text', value: }.merge(options)
        Tag.build('input', result_options)
      end
      label_with_indent = build_label
      input_with_indent = indent(input_tag)

      "\n#{label_with_indent}\n#{input_with_indent}"
    end
  end
end
