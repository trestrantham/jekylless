module Jekyll

  module Filters
    def textilize(input)
      RedCloth.new(input).to_html
    end

    def date_to_string(date)
      date.strftime("%d %b %Y")
    end

    def date_to_long_string(date)
      ordinal =  date.strftime("%d").to_i.ordinalize
      date.strftime("#{ordinal} %B, %Y")
      #date.strftime("%B #{ordinal}, %Y at %H:%M %Z")
      #date.strftime("%d %B %Y")
    end
    
    def date_to_year(date)
      date.strftime("%Y")
    end
    
    def date_to_month(date)
      date.strftime("%B")
    end
    
    def date_to_day(date)
      date.strftime("%d")
    end

    def date_to_xmlschema(date)
      date.xmlschema
    end

    def xml_escape(input)
      CGI.escapeHTML(input)
    end

    def cgi_escape(input)
      CGI::escape(input)
    end

    def number_of_words(input)
      input.split.length
    end

    def array_to_sentence_string(array)
      connector = "and"
      case array.length
      when 0
        ""
      when 1
        array[0].to_s
      when 2
        "#{array[0]} #{connector} #{array[1]}"
      else
        "#{array[0...-1].join(', ')}, #{connector} #{array[-1]}"
      end
    end

  end
end
