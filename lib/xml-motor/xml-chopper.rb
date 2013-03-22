module XMLChopper
  def self.get_tag_attrib_value(tag_value)
    tag_value_split = tag_value.split(/>/)
    in_tag = tag_value_split.first
    out_tag = tag_value_split[1..-1].join
    in_tag_split = in_tag.split
    tag_name = in_tag_split.first
    attribzone = in_tag_split[1..-1].flatten.join(' ')
    attrs = get_attribute_hash attribzone
    [[tag_name.downcase, attrs],out_tag]
  end

  def self.get_attribute_hash(attribzone)
    attribzone = attribzone.strip unless attribzone.nil?
    return nil if attribzone.nil? || attribzone==""
    attrs = {}
  begin
    broken_attrib = attribzone.split(/=/)
    attrs = map_value_attrib(broken_attrib.first.strip,
                             broken_attrib[1..-2], broken_attrib.last.strip)
  rescue
    return attrs
  end
    attrs
  end

  def self.map_value_attrib(first_key, mid_attrib, last_val)
    attrib_map, attribs, values = {}, [first_key], []
    mid_attrib.each do |prev_value_n_next_key|
      prev_value_n_next_key = prev_value_n_next_key.split
      next unless prev_value_n_next_key.class == Array
      values  << XMLUtils.dbqot_string( prev_value_n_next_key[0..-2].join(' ') )
      attribs << prev_value_n_next_key[-1].strip
    end
    values << XMLUtils.dbqot_string( last_val )
    attribs.zip(values){|key, val| attrib_map[key] = val }
    attrib_map
  end
end
