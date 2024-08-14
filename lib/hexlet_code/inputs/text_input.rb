# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      ROWS = 40
      COLS = 20

      def build
        rows = options.fetch(:rows, ROWS)
        cols = options.fetch(:cols, COLS)
        options_str = format_options(options.except(:rows, :cols))
        "<textarea name=\"#{name}\" cols=\"#{cols}\" rows=\"#{rows}\"#{options_str}>#{value}</textarea>"
      end
    end
  end
end
