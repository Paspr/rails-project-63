# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      ROWS = 40
      COLS = 20

      def build
        result_options = {
          name:,
          cols: options.fetch(:cols, COLS),
          rows: options.fetch(:rows, ROWS)
        }.merge(options.except(:rows, :cols))

        Tag.build('textarea', result_options, value)
      end
      label_with_indent = build_label
      input_with_indent = indent(input_tag)

      "\n#{label_with_indent}\n#{input_with_indent}"
    end
  end
end
