# XMLMotorEngine::Exhaust

module XMLMotorEngine
  module Exhaust

    def self.content_at_node_count(node_start_index, node_stop_index,
                                  with_tag, node_at_count)
      xmlnodes = XMLMotorEngine.xmlnodes
      node = node_at_count || ""
      node += xmlnodes[node_start_index][1] unless xmlnodes[node_start_index][1].nil?
      (node_start_index + 1).upto (node_stop_index - 1) do |node_idx|
        node += inXML(xmlnodes[node_idx], node)
      end
      return tagify(xmlnodes[node_start_index][0], node) if with_tag
      node
    end

    def self.tagify(xmlnode_part, node)
      tagifyd = XMLJoiner.dejavu_node xmlnode_part
      "#{ tagifyd.first }#{ node }#{ tagifyd.last }"
    end

    def self.inXML(xmlnode, xml)
      attrib = xmlnode[0][1].nil? ? '' : XMLJoiner.dejavu_attributes(xmlnode[0][1]).to_s
      xml = "<" + xmlnode[0][0] + attrib + ">"
      xml += xmlnode[1] unless xmlnode[1].nil?
      xml
    end

    def self.tag_hash(tag_name, idx, depth, xmltag= {})
      if tag_name.match(/^\/.*/) then
        depth -= 1
        xmltag[tag_name[1..-1]][depth] ||= []
        xmltag[tag_name[1..-1]][depth].push idx
      elsif tag_name.chomp.match(/^\/$/) then
        xmltag[tag_name] ||= {}
        xmltag[tag_name][depth] ||= []
        xmltag[tag_name][depth].push idx
        xmltag[tag_name][depth].push idx
      else
        xmltag[tag_name] ||= {}
        xmltag[tag_name][depth] ||= []
        xmltag[tag_name][depth].push idx
        depth += 1
      end
      return xmltag, depth
    end
  end
end
