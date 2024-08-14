### Hexlet tests and linter status:
[![Actions Status](https://github.com/Paspr/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Paspr/rails-project-63/actions)
[![CI](https://github.com/Paspr/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/Paspr/rails-project-63/actions/workflows/main.yml)

# HexletCode

HexletCode is a simple form builder that allows you to create HTML forms dynamically. It provides a DSL for easily generating forms with inputs, labels, and submit buttons. The form builder supports custom attributes, labels, and different input types.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Basic Example](#basic-example)
  - [Customizing Input Fields](#customizing-input-fields)
  - [Customizing the Submit Button](#customizing-the-submit-button)


## Features

- **Dynamic Form Creation**: Generate HTML forms dynamically using Ruby objects.
- **Customizable Inputs**: Support for text inputs, text areas, and other HTML form elements.
- **Labels**: Automatically generate labels for each form field.
- **Submit Button**: Easily add a submit button with customizable text.
- **Attribute Support**: Add custom HTML attributes to form elements.

## Installation

To use HexletCode in your project, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Paspr/rails-project-63.git
    cd hexlet_code
    ```

2. **Install dependencies** (if applicable):
    ```bash
    make install
    ```

3. **Run the project**:
   This project doesn't require running any background server. You can simply include the files in your Ruby project.

   **Add it to your Gemfile:**
    ```ruby
    gem 'HexletCode'
    ```

## Usage

### Basic Example

Here’s how you can use HexletCode to generate a simple form:

```ruby
require 'hexlet_code'

User = Struct.new(:name, :job, keyword_init: true)
user = User.new(name: 'Rob', job: 'Developer')

form_html = HexletCode.form_for(user) do |f|
  f.input :name
  f.input :job
  f.submit
end

puts form_html

<form action="#" method="post">
    <label for="name">Name</label>
    <input name="name" type="text" value="Rob">
    <label for="job">Job</label>
    <input name="job" type="text" value="Developer">
    <input type="submit" value="Save">
</form>
```

### Customizing Input Fields
You can customize the input fields by passing additional options:

```ruby
form_html = HexletCode.form_for(user, url: '/users', method: :get) do |f|
  f.input :name, class: 'form-input'
  f.input :job, as: :text, rows: 5, cols: 50
end

puts form_html

<form action="/users" method="get">
    <label for="name">Name</label>
    <input name="name" type="text" value="Rob" class="form-input">
    <label for="job">Job</label>
    <textarea name="job" cols="50" rows="5">Developer</textarea>
    <input type="submit" value="Save">
</form>
```
### Customizing the Submit Button
You can customize the text on the submit button:

```ruby
form_html = HexletCode.form_for(user) do |f|
  f.submit 'Register'
end

puts form_html

<form action="#" method="post">
    <input type="submit" value="Register">
</form>
```