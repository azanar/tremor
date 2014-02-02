require 'rake/testtask'
task :poll do
  poller = Ingestion::Poller::URL.new("http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt")
  poller.run
end

Rake::TestTask.new do |t|
  t.libs << "tremor"
  t.libs << "config"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end
