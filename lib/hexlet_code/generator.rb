# frozen_string_literal: false

module HexletCode
  module Inputs
    autoload(:BaseInput, 'hexlet_code/inputs/base_input.rb')
    autoload(:StringInput, 'hexlet_code/inputs/string_input.rb')
    autoload(:TextInput, 'hexlet_code/inputs/text_input.rb')
  end

  class Generator
    def initialize(form_builder)
      @form_builder = form_builder
      @form_builder.add_default_submit
    end

    def generate
      form_attributes = {
        action: @form_builder.url,
        method: @form_builder.method
      }.merge(@form_builder.attributes)

      Tag.build('form', form_attributes, form_content)
    end

    private

    def form_content
      content = @form_builder.form_elements.map do |element|
        case element[:type]
        when :input
          # "#{build_label(element[:attribute])}
          "\n#{build_input(element)}"
        when :submit
          build_submit(element[:value])
        end
      end # .join("\n")
      # "\n#{indent(content)}\n"
    end

    # def build_label(attribute)
    #   indent(Tag.build('label', { for: attribute }, attribute.capitalize))
    # end

    def build_input(element)
      input_class = select_input_class(element[:input_type])
      input_instance = input_class.new(element[:attribute], element[:value], element[:options])
      # indent(input_instance.build)
    end

    def select_input_class(input_type)
      HexletCode::Inputs.const_get("#{input_type.to_s.capitalize}Input")
    end

    def build_submit(value)
      indent(Tag.build('input', { type: 'submit', value: }))
    end

    def indent(content)
      content.lines.map { |line| "  #{line}" }.join
    end
  end
end
