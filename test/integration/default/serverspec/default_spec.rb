#
# Cookbook Name:: heroku
# Spec:: default
#
# Copyright 2013 - 2017, Chris Horton
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'spec_helper'

describe 'heroku::default' do
  describe file('/etc/apt/sources.list.d/heroku.list') do
    it { should be_file }
    its(:content) { should match %r{deb      "https://cli-assets.heroku.com/branches/stable/apt" } }
  end

  %w{ heroku }.each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end

  describe file('/etc/profile.d/heroku.sh') do
    it { should be_file }
    its(:content) { should match %r{/usr/bin/heroku} }
  end

  describe file('/usr/lib/heroku/bin/heroku') do
    it { should be_file }
    it { should be_mode '755' }
  end

  describe file('/usr/bin/heroku') do
    it { should be_symlink }
    it { should be_linked_to '../lib/heroku/bin/heroku' }
  end

  describe command('/usr/bin/heroku help') do
    its(:stdout) { should match /Usage: heroku COMMAND/ }
  end
end
