# frozen_string_literal: false

module HexletCode
  class Generator
    def initialize(form_builder)
      @form_builder = form_builder
      @form_builder.add_default_submit
    end

    def generate
      form_attributes = {
        action: @form_builder.instance_variable_get(:@url),
        method: @form_builder.instance_variable_get(:@method)
      }.merge(@form_builder.instance_variable_get(:@attributes))

      Tag.build('form', form_attributes, form_content)
    end

    private

    def form_content
      content = @form_builder.form_elements.map do |element|
        case element[:type]
        when :input
          "#{build_label(element[:attribute])}\n#{build_input(element)}"
        when :submit
          build_submit(element[:value])
        end
      end.join("\n")
      "\n#{indent(content)}\n"
    end

    def build_label(attribute)
      indent(Tag.build('label', { for: attribute }, attribute.capitalize))
    end

    def build_input(element)
      name = element[:attribute]
      value = element[:value]
      options = element[:options]
      type = element[:input_type]
      input_html = type == :text ? build_textarea(name, value, options) : build_standard_input(name, value, options)
      indent(input_html)
    end

    def build_textarea(name, value, options)
      rows = options.fetch(:rows, 40)
      cols = options.fetch(:cols, 20)
      Tag.build('textarea', { name:, cols:, rows: }, value)
    end

    def build_standard_input(name, value, options)
      filtered_options = options.except(:as)
      Tag.build('input', { name:, type: 'text', value: }.merge(filtered_options))
    end

    def build_submit(value)
      indent(Tag.build('input', { type: 'submit', value: }))
    end

    def indent(content)
      content.lines.map { |line| "  #{line}" }.join
    end
  end
end
