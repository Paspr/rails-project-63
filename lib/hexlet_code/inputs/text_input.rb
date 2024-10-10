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
    end
  end
end
