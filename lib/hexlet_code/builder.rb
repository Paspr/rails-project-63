# frozen_string_literal: false

module HexletCode
  class Builder
    attr_reader :form_elements

    def initialize(object, url:, method:, **attributes)
      @object = object
      @url = url
      @method = method
      @attributes = attributes
      @form_elements = []
      @submit_text = 'Save'
    end

    def input(attribute, options = {})
      value = @object.send(attribute)
      type = options.fetch(:as, :input)
      @form_elements << { type: :input, attribute:, value:, input_type: type, options: }
    end

    def submit(value = 'Save', options = {})
      @form_elements << { type: :submit, value:, options: }
    end

    def add_default_submit
      submit(@submit_text) if @form_elements.none? { |element| element[:type] == :submit }
    end
  end
end
