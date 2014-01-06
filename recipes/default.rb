#
# Cookbook Name:: heroku
# Recipe:: default
#
# Copyright 2013 - 2014, Chris Horton
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

# use the apt cookbook to setup repo
apt_repository "heroku" do
  uri          node[:heroku][:apt_repo]
  key          node[:heroku][:apt_key]
  components   node[:heroku][:components]
  distribution node[:heroku][:distribution]
end

package "heroku-toolbelt"

file "/etc/profile.d/heroku.sh" do
  content "PATH=$PATH:#{node[:heroku][:bin_dir]}"
end
