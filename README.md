# Customer Relationship Manager - Web (CRM-Web) Assignment

The assignment is to implement a web version of the CRM application which you already built.

Please use the below as a guide and not as an exact "how-to" to implement your solution. Use common sense and judgement where appropriate.

Be sure to read over the entire assignment first to get a general feeling and overview of what you have to do, before digging into each part.

## Introduction

We're working our way towards using Rails, which is a pretty hefty framework with lots of concepts to learn all at once. Our first simple project will allow us to explore all the different aspects of making web applications, but by working at a smaller scale, it allows us to hone in on specific concepts. Instead of using all of the framework at once, we will building our way towards it, piece by piece, using Sinatra.

Before we get started, there are a few concepts to introduce to you, and a few chores to do.

## 1. Requests and Responses

When clients make HTTP requests, they pass along a URL, a method (or verb), a series of headers and sometimes a body containing data. When servers return HTTP responses, they pass along a response code (status code), headers and the response body containing the requested data. We care especially about two properties in general: **request methods** and **response codes**: they are able to help describe the nature of a request or response.

![Image of Request & Response](https://github.com/Lundalogik/HTTP-explained/blob/master/presentation/img/http1-req-res-details.png)

### Request Methods

#### What is CRUD?

A request method is important because it tells us what we should be doing with the request data. A server can not only retrieve data, but is also in charge of managing any changes to it as well. A request method is always combined with a URL.

Here a the most common request methods, you should be comfortable with these:

**GET**: _fetch_ or _read_ a resource. The URL contains all the necessary information the server needs to locate and return the resource.

**POST**: _create_ a new resource. POST requests usually carry a request body that specifies the data for the new resource.

**PUT**: _change_ or _update_ a resource. PUTS request should also carry a request body with the updated data

**DELETE**: _delete_ a resource.

These also correspond to what we refer to as the **CRUD** actions. **C**reate, **R**ead, **U**pdate, and **D**elete.

#### Submitting Data over the Web

Making a **GET** request is pretty straightforward. Every time you enter a URL in your browser or click on a link, you're making a GET request. They don't require anything more than a URL.

In order to make other types of requests with a browser, you will need to provide an HTML form that your user can submit. Inside the form element, you can specify which "method" to use.

Here's an example using POST

```html
<form action="/" method="post">
    <input type="text" name="first_name">
    <input type="text" name= "last_name">
    <input type="submit" value="Submit">
</form>
```

### Response Codes

Response codes are important because they let the browser know exactly what happened with the request. Was it successful? Was the resource found? Did it move from where it used to be? Did the server crash? All of these events can be described to the browser with a response code.

Response codes are grouped by number, some of them you may have heard of before, like *200 OK* and *404 Not Found*.

**1xx: Informational**
These types of response codes aren't really used. They were added in HTTP 1.1

**2xx: Success**
This tells the client that the request was successfully processed. The most common code is *200 OK*. For a GET request, the server sends the resource in the message body.

**3xx: Redirection**
This requires the client to take additional action. The most common use-case is to jump to a different URL in order to fetch the resource.

**4xx: Client Error**
These codes are used when the server thinks that the client is at fault, either by requesting an invalid resource or making a bad request. The most popular code in this class is 404 Not Found, which I think every one of us has seen. 404 indicates that the resource is invalid and does not exist on the server.

**5xx: Server Error**
This class of codes are used to indicate a server failure while processing the request. The most commonly used error code is 500 Internal Server Error.

*A full list of all response codes is available inside the [HTTP official spec](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html#sec10.1.1).*

## 2. Sinatra

Now that you're familiar with the nitty-gritty details of how a simple web server works, we're going to add a bit of complexity. Given the fact that every single web application requires running atop a web server, we programmers don't tend to "reinvent the wheel" each time, we use well-written, well-supported libraries that'll do this for us!

There also comes a time where it makes sense to start separating the application code with the server code. It makes things a lot easier to read if both concerns are well-separated. By using an existing library for your server, you don't really ever need to look at this code, you can focus on making things instead!

For this assignment, you'll be working with the Sinatra web framework. It's a pretty "lightweight" framework that doesn't offer too many bells and whistles, but it provides enough functionality to help you build great web applications.

### Install Sinatra

Unlike sockets, which we used in the 'Build Your Own Web Server' assignment, Sinatra isn't part of the the Ruby standard library. It's available as a *Ruby Gem* (a prepackaged piece of ) that you will need to download and install with the following command.

```bash
$ gem install sinatra
```
Once it's installed, you'll be able to `require` it inside your project, just like sockets.

A sample `hello_world.rb` using Sinatra:

```ruby
require 'sinatra'

get '/' do
  'Hello World'
end

```

As you can see, it really doesn't take much to get started with Sinatra! The blocks (aka routes) you provide in your application are what define the responses the corresponding request method and matching url.

## 3. Code Reuse

#### Re-use the `Contact` Class

We are now almost ready to start this assignment!

But first, please copy & paste the `Contact` class from your crm assignment into the provided `contact.rb` file that has been provided to you. We are going to reuse that class in this assignment.

After you've copied & pasted the `Contact` class into `contact.rb`, run the following at the command line:

```bash
ruby test/contact_test.rb
```

If your `Contact` class has been implemented "correctly", you should see something like the following:

```
$ ruby test/contact_test.rb
Run options: --seed 13446

# Running:

.......

Finished in 0.001099s, 6369.0612 runs/s, 6369.0612 assertions/s.

7 runs, 7 assertions, 0 failures, 0 errors, 0 skips
```

Isn't that awesome? This is part of the power of testing, in that you can be sure a certain piece of code still works even if you use it in another project. We'll be learning more about testing in the coming weeks.

If your `Contact` class didn't quite pass muster and some of the tests are failing, don't sweat it. We don't want you to get hung up here. Ask an Instructor nicely and they'll provide you with a `Contact` class that'll work for the purposes of this assignment.

Go ahead and commit your changes now that you've updated the `Contact` class.

#### What about the `CRM` Class?

What about the `CRM` class from the non-web CRM assignment? I'm glad you asked! The previous `CRM` class was built as a command-line interface. But now we are going to build a web interface, so the old `CRM` class is obsolete and we won't be using it here!

That's the great thing about classes in that you can build them in such a way that you can re-use them across projects! As we upgrade parts of the application, we can get rid of obsolete parts and keep the parts that don't have anything to do with what we're upgrading.

## 4. Assignment Parts

This is a fairly large assignment that is spread out over four days/parts. On each day, follow the instructions on the following pages:

* Part 1: [Requests & Responses](https://github.com/bitmakerlabs/crm-web-assignment/wiki/Part-1:-Requests-&-Responses)
* Part 2: [Layouts, HTML, & CSS](https://github.com/bitmakerlabs/crm-web-assignment/wiki/Part-2:-Layouts,-HTML,-&-CSS)
* Part 3: [Working with Forms](https://github.com/bitmakerlabs/crm-web-assignment/wiki/Part-3:-Working-with-Forms)
* Part 4: [Saving your Data](https://github.com/bitmakerlabs/crm-web-assignment/wiki/Part-4:-Saving-your-Data)

As you are working on this assignment, you should be getting in the habit of commit each significant piece of work throughout the day. At the end of each day don't forget to push your code to Github!

## Additional Resources

* [HTTP: The Protocol Every Web Developer Must Know - Part 1](http://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177)
* [The HTTP Spec](http://www.w3.org/Protocols/rfc2616/rfc2616.html)
* [The Sinatra Web Framework](http://www.sinatrarb.com/)
