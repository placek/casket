require 'rubygems'
require 'barby'
require 'barby/outputter/rmagick_outputter'

class Barcode
  def self.create_barcode string
    barcode = Barby::Code128.new string, "A"
    File.open(ENV['HOME'] + File::SEPARATOR + 'out.png','w') do |f|
      f.write barcode.to_png
    end
  end
end
