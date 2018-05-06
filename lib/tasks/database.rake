namespace :db do
  desc "Rebuild the development database from scratch"
  task :rebuild => :environment do
    sh "rm -f db/development.sqlite3"
    # sh "rm -f db/schema.rb"
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end
