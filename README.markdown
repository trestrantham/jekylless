Jekylless
=========

Jekylless is a fork of [jekyll][jekyll], a blog aware, static site generator. We are planning to stay as close as possible to the original jekyll project, but we have a added a few improvements with which we cannot live without:

* Integration of LESS
* Growl Notifications
* Liquid permalink tag
* Time tag in blog posts

### Integration of LESS

[LESS][lesscss] is an extension to CSS which adds variables, nesting and mixins. Unlike Sass, LESS strives for familiarity and backwards compatibility with CSS.

You only have to change your css files extension to .less and add two lines of tripple dashes (`---`) on the top of the file, to tell jekyll, that this file is not a static file anymore and that it has to be compiled from now on.

### Growl 

![Growl integration](http://tatey.com/images/posts/2009-12-05-forking-jekyll-now-with-less-and-growl-notifications/growl.jpg)

Stop killing your browser’s reload button and let Jekyll notify you when the build is complete. To get it to work, you will need to have OS X and to install [growlnotify][growlnotify] (a command line tool available in Growl Extras) and the [Growl gem][growlgem] which provides Ruby bindings to growlnotify.

### Liquid permalink tag

Link to a published post by its name and the permalink tag will be compiled into an anchor. The permalink tag will respect your post's permalink structure.

<pre>
<code>{&#37; permalink 'Earlier post', '2009-09-09-foo' &#37;}</code>
</pre>

...is compiled to

    <a href="/2009/09/09/foo/">Earlier post</a>


### Time tag in blog posts

In the original jekyll, the time of the blog posts is set to 00:00:00 of the beginning day. Of course this is not always the time, when you are publishing blog posts. Even if you are not planning to show the concrete date on your website, your feed readers will thank you, for being a little more precise. Therefore we have added a time tag. If you want to specify a time in your blog post, add a tag like this to your blog post:
 
    time: '21:34'

### License

(The MIT License)

Copyright (c) 2008 Tate Johnson, Wolfgang König

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[jekyll]: http://github.com/mojombo/jekyll
[lesscss]: http://lesscss.org/
[growlnotify]: http://growl.info/documentation/growlnotify.php
[growlgem]: http://gemcutter.org/gems/growl