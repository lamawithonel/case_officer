require 'case_officer'

require 'cri'
require 'sysexits'

include Sysexits

module CaseOfficer
  # Implementation for the `case_officer` CLI tool
  class CLI
    def self.run(args)
      @cmd.run(args)
    end

    @cmd ||= Cri::Command.define do
      name        'case_officer'
      description 'Handles assets'
      summary     'Handles assets'
      usage       "#{@command.name} <subcommand [options] | options>"

      opt :V, :version, 'Display version information and exit' do |_value, _cmd|
        $stdout.puts CaseOfficer::VERSION
        exit :ok
      end

      flag :h, :help, 'Display this help text and exit' do |_, cmd|
        $stdout.puts cmd.help
        exit :ok
      end

      @command.add_command Cri::Command.new_basic_help

      run do |_opts, _args, cmd|
        $stdout.puts cmd.help
        exit :usage
      end
    end
  end
end
