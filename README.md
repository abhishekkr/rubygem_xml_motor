# XML-Motor

[![Code Climate](https://codeclimate.com/github/abhishekkr/rubygem_xml_motor.png)](https://codeclimate.com/github/abhishekkr/rubygem_xml_motor)

### Easy-to-use XML Parser without any Native Dependencies. Its under continuous improvement as being used/tested under my other xml-parsing required projects.

[initial days quick intro to xml-motor world](http://justfewtuts.blogspot.in/2012/03/xml-motor-what-it-is-how-why-should-you.html)

[rubygems.org/xml-motor](http://rubygems.org/gems/xml-motor/)

---

* [speakerdeck](http://speakerdeck.com/u/abhishekkr/p/xml-motor-whatwhyhow-this-xml-parsing-rubygem#)

Late 2011, I started with a new rubygem project for parsing xml, html content.

* @Rubygems: http://rubygems.org/gems/xml-motor
* @GitHub     : https://github.com/abhishekkr/rubygem_xml_motor

Just created it to test out my work at compact, quick & easy xml-parsing algorithm... can see that
* @Slideshare: http://www.slideshare.net/AbhishekKr/xmlmotor

So, currently this is a non-native, completely independent less-than-250 ruby-LOC available as a simple rubygem to be require-d and use in an easy freehand notation and match with any node attributes.

### Current Features:

Has a single method access to parse require xml nodes from content or file. Use it only if you are gonna parse that xml-content once. For using same xml-content more than once, follow the 3-way step mentioned in examples.

It doesn't depend on presence of any other system library, purely non-native.

It parses broken or corrupted xml/html content correctly, just for the content it have.

Can parse results on looking for node-names, attributes of node or both.

Uses free-freehand notation to retrieve desired xml nodes if your xml looks like,

```
'<library>...
  <book> <title>ABC</title> <author>CBA</author> </book>...
  <book>
    <title>XYZ</title>
     <authors> <author>XY</author><author>YZ</author> </authors></book>...
</library>'
```

and you look for 'book.author',

then, you'll get back ['CBA', 'XY', 'YZ'];

what that means is the child-node could be at any depth in the parent-node.

Default return mode is without the tags, there is a switch to get the nodes.

as you'd have seen in above example:

'CBA' gets sent by default, not 'CBA'

To filter your nodes on the basis of attributes, single or multiple attributes can be provided.

These attribute searches can be combined up with freehand node name searches.

Readme (a bit weird): https://raw.github.com/abhishekkr/rubygem_xml_motor/master/README


Features To Come:

Work on making it more performance efficient.

Limit over result-nodes retrieved from start/end of matching nodes.

Multi-node attribute-based filter for a hierarchical node search.

Add dev-knows CSS Selector, it's already present using attribute based search... just need to add a mapping method.


### EXAMPLES of usage:

example code to try: https://github.com/abhishekkr/axml-motor/tree/master/ruby/examples

say, you have an xml file 'dummy.xml', with data as

```
<dummy>
  <ummy>    <mmy class="sys">non-native</mmy>  </ummy>
  <ummy>
    <mmy class="sys">      <my class="sys" id="mem">compact</my>    </mmy>
  </ummy>
  <mmy type="user">    <my class="usage">easy</my>  </mmy></dummy>
```

* its available at rubygems.org, install it as `$ gem install xml-motor`

```
  #!/usr/bin/env ruby

  # include it in your ruby code,
  require 'xml-motor'

  # get the XML Filename and/or XML data available
  fyl = File.join(File.expand_path(File.dirname __FILE__),'dummy.xml')
  xml = File.open(fyl,'r'){|fr| fr.read }

  # One-time XML-Parsing directly from file
  XMLMotor.get_node_from_file(fyl, 'ummy.mmy', 'class="sys"')
  #  Result: ["non-native", "\n      compact\n    "]

  # One-time XML-Parsing directly from content
  XMLMotor.get_node_from_content xml, 'dummy.my', 'class="usage"'
  #   Result: ["easy"]
```
  
* Way to go for XML-Parsing for xml node searches

```
  xsplit = XMLMotor.splitter xml
  xtags  = XMLMotor.indexify xsplit

  # just normal node name based freehand notation to search:
  XMLMotor.xmldata xsplit, xtags, 'dummy.my'
  #  Result: ["compact", "easy"]

  # searching for values of required nodes filtered by attribute:
  XMLMotor.xmldata xsplit, xtags, nil, 'class="usage"'
  #  Result: ["easy"]

  # searching for values of required nodes filtered by freehand tag-name notation & attribute:
  XMLMotor.xmldata xsplit, xtags, 'dummy.my', 'class="usage"'
  #  Result: ["easy"]

  # searching for values of required nodes filtered by freehand tag-name notation & multiple attributes:
  XMLMotor.xmldata xsplit, xtags, 'dummy.my', ['class="sys"', 'id="mem"']
  #  Result: ["compact"]
```

---
