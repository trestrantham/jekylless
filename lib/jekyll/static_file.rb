module Jekyll

  class StaticFile
    # Initialize a new StaticFile.
    #   +site+ is the Site
    #   +base+ is the String path to the <source>
    #   +dir+ is the String path between <source> and the file
    #   +name+ is the String filename of the file
    #
    # Returns <StaticFile>
    def initialize(site, base, dir, name)
      @site = site
      @base = base
      @dir  = dir
      @name = name
    end

    # Write the static file to the destination directory.
    #   +dest+ is the String path to the destination dir
    #
    # Compiles .less files to css
    #
    # Returns nothing
    def write(dest)
      FileUtils.mkdir_p(File.join(dest, @dir))
      
      if File.extname(File.join(@base, @dir, @name)) == '.less'
        File.open(File.join(dest, @dir, @name.sub(/less$/, 'css')), 'w') do |f|
          f.write(Less::Engine.new(File.open(File.join(@base, @dir, @name)), 'r').to_css)
        end
      else
        FileUtils.cp(File.join(@base, @dir, @name), File.join(dest, @dir, @name))
      end
    end
  end

end
