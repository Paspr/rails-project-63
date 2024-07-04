# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_build_method
    expected = "<input type=\"submit\" value=\"Save\">"
    actual = HexletCode::Tag.build("input", type: "submit", value: "Save")
    assert_equal actual, expected
  end
end
