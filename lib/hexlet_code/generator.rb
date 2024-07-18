# frozen_string_literal: false

module HexletCode
  class FormGenerator
    def initialize(object)
      @object = object
      @inputs = []
      @submit_text = "Save"
    end

    def input(attribute, options = {})
      value = @object.public_send(attribute)
      type = options.fetch(:as, :input)
      @inputs << { attribute:, value:, type:, options: }
    end

    def submit(value = "Save")
      @submit_text = value
    end

    def build(action)
      form = "<form action=\"#{action}\" method=\"post\">\n"
      @inputs.each do |input|
        form << build_label(input[:attribute])
        form << build_field(input)
        #  if input[:type] == :text
        #           build_textarea(input[:attribute], input[:value], input[:options])
        #         else
        #           build_input(input[:attribute], input[:value], input[:options])
        #         end
      end
      form << build_submit
      form << "</form>"
      form
    end

    def build_field(input)
      if input[:type] == :text
        build_textarea(input[:attribute], input[:value], input[:options])
      else
        build_input(input[:attribute], input[:value], input[:options])
      end
    end

    def build_input(name, value, options)
      filtered_options = options.except(:as)
      attributes = filter_attributes(filtered_options)
      attributes = " #{attributes}" unless attributes.empty?
      "   <input name=\"#{name}\" type=\"text\" value=\"#{value}\"#{attributes}>\n"
    end

    def build_textarea(name, value, options)
      rows = options.fetch(:rows, 40)
      cols = options.fetch(:cols, 20)
      filtered_options = options.except(:as, :rows, :cols)
      attributes = filter_attributes(filtered_options)
      "   <textarea name=\"#{name}\" cols=\"#{cols}\" rows=\"#{rows}\"#{attributes}>#{value}</textarea>\n"
    end

    def filter_attributes(options)
      attribute_strings = options.map { |key, value| "#{key}=\"#{value}\"" }
      attribute_strings.join(" ")
    end

    def build_submit
      "   <input type=\"submit\" value=\"#{@submit_text}\">\n"
    end

    def build_label(name)
      "   <label for=\"#{name}\">#{name.capitalize}</label>\n"
    end
  end
end
