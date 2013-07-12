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

Add this code where you want your messages to be shown. You will need to create some styles for the message box.

```erb
<%= show_message %>
```

Below is the message box HTML. You will need to create a few styles to make yours look pretty. 
I left it free of styles since I was using Foundation. Most people probably want to style their own anyway.

```html
<div class="alert-box [the flash symbol will be here to]">
    <div class="message">
      Message gets outputed here.
    </div>
</div>
```

Now, set a message in your controller. You can use :error, :success, :myCoolMessage or :whatever. You get the point. 
The only thing you should not use is and "_". Read on to see why.

Also, it you can set a single message as a String or multiple as an Array

```ruby
class MyController
  
  def test_function
    flash[:success] = "Some Success Message"
    flash[:error] = ["Error Message 1", "Error Message 2"]
  end

end
```

Now, when using remote forms I came across the issue where I would have multiple show_message helpers on the same page. 
This led to some issues so I added the ability to set an id on show_message

```erb
<%= show_message(id: :create_object) %>
```

There is a slight twist to setting the flash now. I use an "_" to find what I call "scoped" messages. 

```ruby
class MyController
  
  def test_function
    flash[:error_create_object] = "Some Error Message"
  end

end
```

Lastly, I found the need to insert a margin below the message sometimes.

```erb
<%= show_message(space: 10) %>
<!-- will insert a 10px margin below -->
```

## Contributing

If anyone has any suggestions on a better way to do the "scoped" messages or anything for that matter,
feel free to submit a pull request. 

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
