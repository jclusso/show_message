# ShowMessage

[![Build Status](https://travis-ci.org/jclusso/show_message.svg?branch=master)](https://travis-ci.org/jclusso/show_message)
[![Maintainability](https://api.codeclimate.com/v1/badges/c6a49b6f39ffcad776cb/maintainability)](https://codeclimate.com/github/jclusso/show_message/maintainability)

## Installation

Add this line to your application's Gemfile:

    gem 'show_message'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install show_message

## Usage

Add this code where you want your messages to be shown. You will need to create some styles for the message box.
See further down for the HTML this outputs so you know how to style it.

```erb
<%= show_message %>
```

Now, set a message in your controller. You can use :success, :error, :warning,
:info, :notice or :alert.

Also, you can set a single message as a String or multiple as an Array

```ruby
class MyController

  def test_function
    # short versions
    show_success('Some Success Message')
    show_error('Some Error Message')

    show_message :success, 'Some Success Message'
  end

end
```

Now, when using remote forms I came across the issue where I would have multiple show_message helpers on the same page.
This led to some issues so I added the ability to set an id on show_message

```erb
<%= show_message(:create) %>
```

There is a slight twist to setting the flash now. I use an "_" to find what I call "scoped" messages.

```ruby
class MyController

  def test_function
    # short version
    show_success_for(:create, 'Some Success Message')
    show_error_for(:create, 'Some Error Message')

    show_message :success, 'Some Success Message', id: :create
  end

end
```

## Additional Options

Currently supported options only include `class` which allows you to specify
additional classes to be appended to the outermost div's classlist.

```erb
<%= show_message(class: 'my-special-class my-second-special-class') %>
<%= show_message(:create, class: 'my-special-class my-second-special-class') %>
```

## show_message - HTML Output

Below is HTML that show_message will output. You will need to create a few
styles to make yours look nice. The type of message (success, error, etc) will
be appended to the outermost div's classlist.

```html
<div class="alert-box [success, info, error...]">
    <div class="message">
      Message gets outputed here.
    </div>
</div>
```

## Contributing

If anyone has any suggestions on a better way to do the "scoped" messages or anything for that matter,
feel free to submit a pull request.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
