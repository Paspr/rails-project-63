# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def return_expected_output(filename)
  File.read(File.expand_path("./fixtures/#{filename}", __dir__))
end
