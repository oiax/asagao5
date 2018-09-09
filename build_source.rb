system "/bin/rm -rf tmp/source"
system "/bin/mkdir -p tmp/source"

chapters = %w(01)
chapters += (3..12).to_a.map { |n| "%02d" % n }
chapters += %w(13-aws 13-azure 13-gcp 14 15)

chapters.each do |ch|
  system "/usr/bin/git checkout v1/chapter#{ch}"
  system "/usr/bin/git archive --format=zip HEAD > tmp/source/chapter#{ch}.zip"
  system "/usr/bin/unzip tmp/source/chapter#{ch}.zip -d tmp/source/chapter#{ch}"
  system "/bin/rm tmp/source/chapter#{ch}.zip"
end

system "/usr/bin/git checkout master"
system "cd tmp; /usr/bin/zip -r source.zip source"
