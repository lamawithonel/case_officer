require 'spec_helper'

describe 'case_officer', type: :aruba do
  before(:each) { run("case_officer #{args}") }

  context 'without any arguments' do
    let(:args) {}

    it 'exits with Sysexits::EX_USAGE' do
      expect(last_command_started).to have_exit_status(Sysexits::EX_USAGE)
    end
  end

  describe 'version flags' do
    ['-V', '--version'].each do |arg|
      describe arg do
        let(:args) { arg }

        it 'displays version information and exits' do
          expect(last_command_started).to have_output(CaseOfficer::VERSION)
        end

        it 'exits with Sysexits::EX_OK' do
          expect(last_command_started).to have_exit_status(Sysexits::EX_OK)
        end
      end
    end
  end

  describe 'help flags' do
    ['-h', '--help'].each do |arg|
      describe arg do
        let(:args) { arg }

        it 'exits with Sysexits::EX_OK' do
          expect(last_command_started).to have_exit_status(Sysexits::EX_OK)
        end
      end
    end
  end
end
