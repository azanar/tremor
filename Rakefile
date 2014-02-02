require 'rake/testtask'
task :poll do
  $:.push("tremor", "config")

  require 'ingestion'

  Tremor::Ingestion.run
end

Rake::TestTask.new do |t|
  t.libs << "tremor"
  t.libs << "config"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end
