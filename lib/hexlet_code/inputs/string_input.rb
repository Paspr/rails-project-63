# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def build
        filtered_options = options.except(:as)
        options_str = format_options(filtered_options)
        if options_str.empty?
          "<input name=\"#{name}\" type=\"text\" value=\"#{value}\">"
        else
          "<input name=\"#{name}\" type=\"text\" value=\"#{value}\" #{options_str}>"
        end
      end
    end
  end
end
