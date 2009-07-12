module Jekyll
  
  class PermalinkTag < Liquid::Tag
    def initialize(tag_name, name, tokens)
      super
      @name = name.strip
    end

    def render(context)
      context.registers[:site].permalinks[@name]
    end    
  end
  
end

Liquid::Template.register_tag('permalink', Jekyll::PermalinkTag)
