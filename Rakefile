require "bundler/gem_tasks"

namespace :test do

  task :all do
    test_files = File.join File.dirname(__FILE__), 'tests', 'test_*.rb'
    Dir.glob(test_files).each do |test|
      puts '*'*10, test, '-'*10
      puts %x{ruby #{test} | grep tests}
    end
  end
end
