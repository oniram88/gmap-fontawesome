require 'logger'
require 'zip'
require "open-uri"
require 'rexml/document'
include REXML


namespace :gmap_awesome do


  desc 'compila la versione di font-awesome in array di path svg javascript'
  task :compile => :environment do

    Dir.mktmpdir do |dir|
      # use the directory...

      zip = File.join(dir, 'font-awesome.zip')

      puts 'Download'
      if File.exist? zip
        puts 'Skip'
      else
        data = URI.parse("https://github.com/FortAwesome/Font-Awesome/archive/master.zip").read
        open(zip, 'wb') { |file|
          file.write(data)
        }
      end

      path = File.join(dir, 'Font-Awesome-master')
      puts "Extract"
      if File.exist? path
        puts "skip"
      else
        unzip_file(zip)
      end

      vars = []

      File.open(File.join(path, 'scss', '_variables.scss')) do |f|
        f.each_line do |line|

          if line.match /\$fa-var/
            m = line.match /\$fa-var-(?<name>[a-z0-9-]+): "(?<code>\\f\h+)";/i
            # puts line
            # puts m.inspect
            vars << {
                :code => m[:code].gsub("\\", ''),
                :name => m[:name].gsub(/\-/,'_').upcase,
                :value => nil
            }
          end

        end
      end


      puts "Compilation"
      svg_content = File.read(File.join(path, "fonts", 'fontawesome-webfont.svg'))


      vars.each do |v|
        m = svg_content.match /glyph unicode="&#x#{v[:code]};".*d="(?<value>.*)" \/>/i
        if m
          v[:value]=m[:value]
        end
      end


      vendor=Rails.root.join('vendor', 'assets', 'javascripts')
      FileUtils.mkdir_p(vendor)


      File.open(File.join(vendor, 'gmap-fontawesome.js'), 'w') do |f|
        string = []
        vars.reject { |v| v[:value].empty? }.each do |v|
          string<< "#{v[:name]}:'#{v[:value]}'"
        end
        f.write("window.GMAP_FA = {\n#{string.join("\n,")}\n};")
      end

    end
  end


  def unzip_file(file)
    root_path = File.dirname(file)
    Zip::File.open(file) do |zip_file|
      # Handle entries one by one
      zip_file.each do |entry|
        # Extract to file/directory/symlink
        dest = File.join(root_path, entry.name)
        entry.extract(dest)
      end
    end


  end

end
