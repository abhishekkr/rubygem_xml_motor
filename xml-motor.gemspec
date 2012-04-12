# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xml-motor/version"

Gem::Specification.new do |s|
  s.name        = "xml-motor"
  s.version     = XmlMotor::VERSION
  s.authors     = ["abhishekkr"]
  s.email       = ["abhikumar163@gmail.com"]
  s.homepage    = "http://github.com/abhishekkr/rubygem_xml_motor"
  s.summary     = %q{An easy-to-use XML Parser without any Native Dependencies}
  s.description = %q{A new short XML Parsing Algorithm implemented directly in >500 lines. An easy-to-use XML Parser without any Native Dependencies.
      
       [How To Use]: https://github.com/abhishekkr/rubygem_xml_motor/raw/master/README  

        Loading:
         + $ gem install xml-motor
         + 'require' the 'xml-motor'

        Usage:
           [[ To Search Just One QUERY ]]
             nodes_array = XMLMotor.get_node_from_file "_XML_FILE_"
             nodes_array = XMLMotor.get_node_from_file "_XML_FILE_", "ATTRIB_KEY=ATTRIB_VALUE"
             nodes_array = XMLMotor.get_node_from_content "_XML_DATA_"
             nodes_array = XMLMotor.get_node_from_content "_XML_DATA_", "ATTRIB_KEY=ATTRIB_VALUE"
           [[ To Search More Than One QUERIES ]]
             str = {XML_DATA}
             nodes_ = XMLMotor.splitter str
             tags_ = XMLMotor.indexify nodes_
             nodes_array = XMLMotor.xmldata nodes_, tags_, "_TAG_"
             nodes_array = XMLMotor.xmldata nodes_, tags_, "_TAG_", "ATTRIB_KEY=ATTRIB_VALUE"

        Example Calls As Code:
         + XMLMotor.get_node_from_content "<A>a</A><B><A>ba</A></B>", "A"
             RETURNS: ["a", "ba"]
         + XMLMotor.get_node_from_content "<A>a</A><B><A>ba</A></B>", "B.A"
             RETURNS: ["ba"]
         + XMLMotor.get_node_from_content "<A i='1'>a</A><B><A i='2'>ba</A></B>", "A", "i='1'"
             RETURNS: ["a"]
  }

  s.rubyforge_project = "xml-motor"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
