source ENV['GEM_SOURCE'] || 'https://rubygems.org'

gemspec

# If you need to add a debugger or some other tool of personal preference, you
# can add it in Gemfile.local, which is ignored in `.gitignore`.
# # rubocop:disable Security/Eval
File.exist?("#{__FILE__}.local") && eval(File.read("#{__FILE__}.local"), binding)
