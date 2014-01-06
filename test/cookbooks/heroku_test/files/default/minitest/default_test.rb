MiniTest::Chef::Resources.register_resource(:gem_package)
describe "heroku" do
  describe_recipe "heroku_test::default" do
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources

    describe "should have an apt sources.list for heroku" do
      let(:sources_file) { file("/etc/apt/sources.list.d/heroku.list") }
      it { sources_file.must_exist }
      it { sources_file.must_include "deb     #{node[:heroku][:apt_repo]}  ./" }
    end

    it "should have the heroku-toolbelt package installed" do
      package("heroku-toolbelt").must_be_installed
    end

    describe "should have a profile script for heroku" do
      let(:profile) { file("/etc/profile.d/heroku.sh") }
      it { profile.must_exist }
      it { profile.must_include node[:heroku][:bin_dir] }
    end

    it "should have a heroku binary that is executable" do
      file('/usr/local/heroku/bin/heroku').must_have(:mode, '755')
    end
  end
end
