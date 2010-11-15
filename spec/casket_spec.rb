require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Casket do

  before(:each) do
    @casket = Casket.new
  end
  
  it "should generate package from directory" do
    directory = Dir.new "."
    casket.pack directory.path
    directory.to_a.any? { |file| file =~ /.casket/ }.should == true
  end

  it "should unpack package to temporary directory" do
    tmpdir = Dir.new(Dir.tmpdir)
    name = Dir.pwd.split(File::SEPARATOR).last
    casket.pack "."
    casket.unpack "#{name}.casket"
    tmpdir.to_a.include?("#{name}.casket").should == true
    casket.close
  end

  # it "should format actor in nested hash" do
  # 
  # end
  
end
