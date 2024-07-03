# frozen_string_literal: true

module HexletCode
    module Tag
      def self.build(tag, options={})
        result = ''
        attributes = []
        options.each do |key, value|
            attributes << "#{key}=\"#{value}\""
        end
        attributes.join(' ')
        if attributes.empty?
            result = "<#{tag}>"
        else
            result = "<#{tag} #{attributes.join(' ')}>"
        end
        result
      end
    end
  end
  