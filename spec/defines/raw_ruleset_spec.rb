require 'spec_helper'

describe 'patterndb::raw::ruleset' do
  let :facts do {
    :osfamily => 'RedHat'
  } end
  let :title do
    'myrawruleset'
  end
  let :default_params do {
    :source => '/SOURCE'
  } end
  let :pre_condition do
    'class { "patterndb": base_dir => "BASEDIR", }'
  end
  context "Raw ruleset with no params" do
    let :params do
      {}
    end
    it { expect {should compile}.to raise_error(Puppet::Error, /Must pass source/e)}
  end
  context "Raw ruleset with only source" do
    let :params do
      {
        :source => 'BLAH'
      }
    end
    it {
     should contain_file('BASEDIR/etc/syslog-ng/patterndb.d/myrawruleset.pdb')
    }
  end
end