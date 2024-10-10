# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def build
        result_options = { name:, type: 'text', value: }.merge(options)
        Tag.build('input', result_options)
      end
    end
  end
end
