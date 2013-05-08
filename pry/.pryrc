Pry.config.editor = 'emacs-24.3.50'

def time(times = 1)
  require 'benchmark'
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end

if defined? Rails

  require 'logger'

  if defined?(ActiveRecord)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.clear_active_connections!
  end

  # Routes in console
  # Reference : https://coderwall.com/p/hajwva

  if Rails::VERSION::STRING >= "4"

    # returns an array of routes in Rails 4
    def formatted_routes
      r = Rails.application.routes.routes
      i = ActionDispatch::Routing::RoutesInspector.new(r)
      f = ActionDispatch::Routing::ConsoleFormatter.new
      i.format(f).split("\n")
    end

  else
    require 'rails/application/route_inspector'

    # returns an array of routes in Rails 3
    def formatted_routes
      inspector = Rails::Application::RouteInspector.new
      inspector.format(Rails.application.routes.routes)
    end

  end

  # filter and print out the routes
  def routes(filter = nil)
    Rails.application.reload_routes!
    formatted = formatted_routes
    if filter
      formatted.select!{ |r| r.match(filter) }
    end
    puts formatted
  end

end
