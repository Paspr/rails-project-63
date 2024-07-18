### Hexlet tests and linter status:
[![Actions Status](https://github.com/Paspr/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Paspr/rails-project-63/actions)
[![CI](https://github.com/Paspr/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/Paspr/rails-project-63/actions/workflows/main.yml)

## Usage example
First, create a new user with Struct.
```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User2.new name: "rob", job: "hexlet", gender: "m"
```

Now the forms can be generated the following way:

```ruby
HexletCode.form_for user2, url: "#" do |f|
      f.input :job, as: :text, rows: 50, cols: 50
end
```
It will give the following form:
 <form action="#" method="post">
   <input name="name" type="text" value="rob">
   <textarea cols="20" rows="40" name="job">hexlet</textarea>
 </form>
