```
chapter-2-ruby jgluth$ irb
irb(main):001:0> require './something'
=> true
irb(main):002:0> f = Something.new
=> #<Something:0x00007fa71a9049a8 @csv_contents=[#<ActsAsCsv::InstanceMethods::CsvRow:0x00007fa71a9044a8 @contents={"a"=>"1", "b"=>"2", "c"=>"3"}>, #<ActsAsCsv::InstanceMethods::CsvRow:0x00007fa71a904138 @contents={"a"=>"4", "b"=>"5", "c"=>"6"}>, #<ActsAsCsv::InstanceMethods::CsvRow:0x00007fa71a8ffd18 @contents={"a"=>"7", "b"=>"8", "c"=>"9"}>], @headers=["a", "b", "c"]>
irb(main):003:0> f.each {|x| print "#{x.a}\n"}
1
4
7
```
