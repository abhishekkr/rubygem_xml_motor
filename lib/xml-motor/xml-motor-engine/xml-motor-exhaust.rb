# XMLMotorEngine::Exhaust

module XMLMotorEngine
  module Exhaust

    def self.inXML(xmlnode, xml)
      attrib = xmlnode[0][1].nil? ? '' : XMLJoiner.dejavu_attributes(xmlnode[0][1]).to_s
      xml = "<" + xmlnode[0][0] + attrib + ">"
      xml += xmlnode[1] unless xmlnode[1].nil?
      xml
    end
  end
end
