# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)
  User2 = Struct.new(:name, :job, :gender, keyword_init: true)
  def setup
    @user = User.new name: 'rob'
    @user2 = User2.new name: 'rob', job: 'hexlet', gender: 'm'
    @user3 = User.new job: 'hexlet'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_build_method
    expected = '<input type="submit" value="Save">'
    actual = HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal actual, expected
  end

  def test_form_user_case
    expected_output_file = File.expand_path('./fixtures/form_user_case.html', __dir__)
    expected_output = File.read(expected_output_file)
    actual = HexletCode.form_for @user do |f| # rubocop:disable Lint/EmptyBlock
    end
    assert_equal actual, expected_output
  end

  def test_form_user_with_link_case
    expected_output_file = File.expand_path('./fixtures/form_user_with_link_case.html', __dir__)
    expected_output = File.read(expected_output_file)
    actual = HexletCode.form_for @user, url: '/users' do |f| # rubocop:disable Lint/EmptyBlock
    end
    assert_equal actual, expected_output
  end

  def test_default_values_case
    expected_output_file = File.expand_path('./fixtures/default_values_case.html', __dir__)
    expected_output = File.read(expected_output_file)
    actual = HexletCode.form_for @user2 do |f|
      f.input :job, as: :text
    end
    assert_equal actual, expected_output
  end

  def test_default_values_override_case
    expected_output_file = File.expand_path('./fixtures/default_values_override_case.html', __dir__)
    expected_output = File.read(expected_output_file)
    actual = HexletCode.form_for @user2, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal actual, expected_output
  end

  def test_hash_case
    expected_output_file = File.expand_path('./fixtures/hash_case.html', __dir__)
    expected_output = File.read(expected_output_file)
    actual = HexletCode.form_for @user2, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert_equal actual, expected_output
  end

  def test_base_case
    expected_output_file = File.expand_path('./fixtures/base_case.html', __dir__)
    expected_output = File.read(expected_output_file)
    actual = HexletCode.form_for @user2 do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal actual, expected_output
  end

  def test_save_button_override_name
    expected_output_file = File.expand_path('./fixtures/override_save_button_name_case.html', __dir__)
    expected_output = File.read(expected_output_file)
    actual = HexletCode.form_for @user3, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal actual, expected_output
  end
end
