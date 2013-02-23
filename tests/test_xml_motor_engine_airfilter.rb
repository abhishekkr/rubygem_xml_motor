#!/usr/bin/env ruby

require 'test/unit'
require_relative '../lib/xml-motor.rb'

class TestXMLMotorEngine < Test::Unit::TestCase
  def setup
    @content = <<-xmldata
	<dummy>
	 <mmy> <y id=\"3\"\nclass="yada"> <z>300</z> </y> <y class="yada">5</y> </mmy>
	</dummy>
  <solo/>
       xmldata
  end
  def teardown
    XMLMotorEngine.instance_variable_set "@xmlnodes", nil
    XMLMotorEngine.instance_variable_set "@xmltags", nil
  end

  def test__get_attrib_key_val_
    XMLMotorEngine._splitter_ @content
    XMLMotorEngine._indexify_ XMLMotorEngine.xmlnodes

    assert_equal XMLMotorEngine::AirFilter._get_attrib_key_val_("id = 007"), ["id", "007"]
    assert_equal XMLMotorEngine::AirFilter._get_attrib_key_val_("james='bond'"), ["james", "\"bond\""]
    assert_equal XMLMotorEngine::AirFilter._get_attrib_key_val_("james=\"bond\""), ["james", "\"bond\""]
  end
end
