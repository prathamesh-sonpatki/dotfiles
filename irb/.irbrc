require "rubygems"

def time(times = 1)
  require 'benchmark'
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end

# Check for presence of required gems. If not present, install the gems
["wirble", "awesome_print"].each do |gem|

  begin
    gem "#{gem}"
  rescue Gem::LoadError
    `gem install #{gem}`
    Gem.clear_paths            # clear the gem path; so installed gem will be added to path
  end

end

require "wirble"
require "awesome_print"
require "irb"

# install and use the wirble gem, it does a lot of neat stuff
Wirble.init
Wirble.colorize
# the default colors suck, mod to use your own
colors = Wirble::Colorize.colors.merge({
   # set the comma color to blue
   :comma => :green,
   :refers => :green,
})
Wirble::Colorize.colors = colors

# Custom alias
alias p ap
alias q exit
