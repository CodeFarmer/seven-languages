#! /usr/bin/env ruby

  
module ActsAsCsv

  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods

    class CsvRow

      def method_missing(s, *args)
        @contents[s.to_s]
      end
      
      def initialize(headers, contents)
        pairs = headers.zip contents
        @contents = Hash[*pairs.flatten]
      end
      
    end

    attr :headers, :csv_contents

    def each(&block)
      csv_contents.each do |r|
        block.call r
      end
    end
    
    def read_csv
      
      @csv_contents = []
      filename = self.class.to_s.downcase + ".csv"
      file = File.new(filename)
      @headers = file.gets.chomp.split(/,\s*/)

      file.each do |row|
        #FIXME change to CsvRow
        @csv_contents << CsvRow.new(headers, row.chomp.split(/,\s*/))
      end
    end

    def initialize
      read_csv
    end

  end
  
end

class Something
  include ActsAsCsv
  acts_as_csv
end
