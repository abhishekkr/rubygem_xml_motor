# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xml-motor/version"

Gem::Specification.new do |s|
  s.name        = "xml-motor"
  s.version     = XmlMotor::VERSION
  s.authors     = ["abhishekkr"]
  s.email       = ["abhikumar163@gmail.com"]
  s.homepage    = "http://abhishekkr.github.com/rubygem_xml_motor/"
  s.summary     = %q{An easy-to-use XML Parser without any Native Dependencies}
  s.description = %q{A new short XML Parsing Algorithm implemented directly in less-than-500 lines. An easy-to-use XML Parser without any Native Dependencies. Its under continuous improvement as being used/tested under my other xml-parsing required projects. [What, Why, HowTo]: http://justfewtuts.blogspot.in/2012/03/xml-motor-what-it-is-how-why-should-you.html }

  s.rubyforge_project = "xml-motor"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
