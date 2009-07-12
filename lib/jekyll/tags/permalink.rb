module Jekyll

  # Linking to published posts by their name. Permalink returns the post's url, 
  # respecting your permalink style. You do not need to include the file 
  # extension or the path to the _posts directory when specifying 
  # the name of the post.
  #
  #   {% permalink 'Earlier post', '2009-09-09-foo' %}
  #
  #   <a href="/2009/09/09/foo.html">Earlier post</a>
  #
  class PermalinkTag < Liquid::Tag
    SYNTAX = /^['"](.+)['"],\s+['"](\d{4}-\d{2}-\d{2}[\w-]+)['"]$/
    
    def initialize(tag_name, markup, tokens)
      if markup.strip =~ SYNTAX
        @text = $1
        @name = $2
      else
        raise SyntaxError.new("Syntax Error in 'permalink' - Valid syntax: permalink [text], [YYYY-DD-MM-post-title]")
      end
    end
    
    def render(context)
      url = context.registers[:site].permalinks[@name]
      if url
        %{<a href="#{url}">#{@text}</a>}
      else
        %{Permalink for post '#{@name}' not found}
      end
    end
  end
  
end

Liquid::Template.register_tag('permalink', Jekyll::PermalinkTag)
