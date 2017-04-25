require 'hyde_to_jekyll'

module HydeToJekyll
  class Outputter
    def initialize(dynamic_table, dynamic_records)
      @dynamic_table = dynamic_table
      @dynamic_records = dynamic_records
    end

    def output
      FileUtils.mkdir_p(output_dir)
      File.open(File.join(output_dir, file_name), "w") do |f|
        f.puts(output_str)
      end
      puts "Output: #{File.join(output_dir, file_name)}"
    end

    private
      def output_str
        case type
        when :data
          @dynamic_records.map(&:deep_stringify_keys).to_yaml
        when :post
        when :page
        end
      end

      def output_dir
        path_list = [Dir.pwd]

        case type
        when :data
          path_list << "_data"
        when :post
          path_list << "_post"
        when :page
          # none
        end

        File.join(*path_list)
      end

      def file_name
        "#{@dynamic_table[:uid].pluralize}.yml"
      end

      def type
        @dynamic_table[:type].to_sym
      end
  end
end
