require "minitar.rb"
require "tmpdir"
include Archive::Tar

class Casket

  # Initializes enivironment configuration. Constructor of Cascet instance.
  def initialize
    @fs = File::SEPARATOR
    @ext = "casket"
  end

  # Method that checks directory and packs it into a package. It uses tar
  # algorithm. Parameter directory_path points on directory to pack.
  def pack directory_path
    Dir.chdir directory_path
    name = Dir.pwd.split(@fs).last
    files = Dir.glob "**#{@fs}*"
    File.open([name, @ext].join("."), "wb") do |tar|
      Minitar.pack(files, tar)
    end
  end

  # Method that unpacks Casket package to system temporary directory.
  # Parameter file_path points on Casket package.
  def unpack file_path
    name = file_path.split(@fs).last
    Dir.chdir Dir.tmpdir
    Dir.mkdir name
    Minitar.unpack(file_path, name)
    Dir.chdir name
    @temp_dir = Dir.pwd
  end

  # Method that removes temporary files from system temp.
  def close
    FileUtils.rm_rf @temp_dir
  end

  # Method running "bundle instal" on application.
  def bundle
    Dir.chdir @temp_dir
    system("bundle install")
  end

  # Method running "rake" on application.
  def rake
    Dir.chdir @temp_dir
    system("rake")
  end

end

