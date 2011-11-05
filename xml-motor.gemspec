# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xml-motor/version"

Gem::Specification.new do |s|
  s.name        = "xml-motor"
  s.version     = Xml::Motor::VERSION
  s.authors     = ["abhishekkr"]
  s.email       = ["abhishk@thoughtworks.com"]
  s.homepage    = "http://github.com/abhishekkr/rubygem_xml_motor"
  s.summary     = %q{An easy-to-use XML Parser without any Native Dependencies}
  s.description = %q{A new short XML Parsing Algorithm implemented directly in >500 lines. An easy-to-use XML Parser without any Native Dependencies.
      [How To Use]:

        Loading:
         + $ gem install xml-motor
         + 'require' the 'xml-motor'

        Usage:
         + To find values of an xml node from an xml file
           XMLMotor.get_node_from_file <file_with_path>, <node>
         + To find values of an xml node from an xml string
           XMLMotor.get_node_from_content <xml_string>, <node>

        Example Calls As Code:
         + XMLMotor.get_node_from_content "<A>a</A><B><A>ba</A></B>", "A"
             RETURNS: ["a", "ba"]
         + XMLMotor.get_node_from_content "<A>a</A><B><A>ba</A></B>", "B.A"
             RETURNS: ["ba"]
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
