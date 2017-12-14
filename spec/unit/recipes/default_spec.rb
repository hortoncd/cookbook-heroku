#
# Cookbook Name:: xylophone
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
  versions = %w{14.04 16.04}
  versions.each do |v|
    context 'When all attributes are default, on a ubuntu platform' do
      let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: v).converge(described_recipe) }

      it 'converges successfully' do
        expect { chef_run }.to_not raise_error
      end

      it 'adds heroku apt repo' do
        expect(chef_run).to add_apt_repository('heroku')
      end

      %w{ heroku }.each do |p|
        it "installs #{p}" do
          expect(chef_run).to install_package(p)
        end
      end

      it 'creates heroku profile' do
        expect(chef_run).to create_file('/etc/profile.d/heroku.sh')
      end
    end
  end
end
