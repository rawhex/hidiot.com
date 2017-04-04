task :default do
  sh "bundle exec jekyll build"
  options = {
    :allow_hash_href => true
  }
  HTMLProofer.check_directory("./_site", options).run
end
