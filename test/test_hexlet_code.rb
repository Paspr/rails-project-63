# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)
  def setup
    @user = User.new name: "rob"
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_build_method
    expected = "<input type=\"submit\" value=\"Save\">"
    actual = HexletCode::Tag.build("input", type: "submit", value: "Save")
    assert_equal actual, expected
  end

  def test_form_user
    expected = " <form action=\"#\" method=\"post\"></form>"
    actual = HexletCode.form_for @user
    assert_equal actual, expected
  end

  def test_form_user_with_link
    expected = " <form action=\"/users\" method=\"post\"></form>"
    actual = HexletCode.form_for @user, url: "/users"
    assert_equal actual, expected
  end
end
