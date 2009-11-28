require 'rubygems'

begin
  require 'growl'
rescue LoadError
  GROWL_LOADED = false
else
  GROWL_LOADED = true  
end

class Notifier
  def initialize(enable_growl, source, destination)
    if enable_growl
      if GROWL_LOADED and Growl.installed?
        @growl = enable_growl
      elsif GROWL_LOADED and not Growl.installed?
        abort "Growl or growlnotify was not found. See http://growl.info/"
      else
        abort "Growl not available. Install it with: gem install growl --version '>= 1.0.3'"
      end
    end
    @source = source
    @destination = destination
  end
    
  def notify(message)
    puts message
    Growl.notify message, :title => 'Jekyll' if @growl
  end
  
  def success
    notify "Successfully generated site: #{@source} -> #{@destination}"
  end
end
