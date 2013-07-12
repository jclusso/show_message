# ShowMessage

[![Build Status](https://travis-ci.org/jclusso/show_message.png?branch=master)](https://travis-ci.org/jclusso/show_message)
[![Code Climate](https://codeclimate.com/repos/51df6c497e00a4660f0070ea/badges/8965c37137b1ddcf785f/gpa.png)](https://codeclimate.com/repos/51df6c497e00a4660f0070ea/feed)

## Installation

Add this line to your application's Gemfile:

    gem 'show_message'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install show_message

## Usage

Add this code where you want your error messages to be shown.

```erb
<%= show_message %>
```

Set a message in your controller.

```ruby
class MyController
  
  def test_function
    flash[:error] = "Some Error Message"
  end

end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
