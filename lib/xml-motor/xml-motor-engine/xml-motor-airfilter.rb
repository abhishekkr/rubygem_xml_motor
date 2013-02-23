# XMLMotorEngine::AirFilter

module XMLMotorEngine
  module AirFilter

    def self._get_attrib_key_val_(attrib)
      attrib_key = attrib.split(/=/)[0].strip
      attrib_val = attrib.split(/=/)[1..-1].join.strip
      [attrib_key, XMLUtils.dbqot_string(attrib_val)]
    end

    def self.expand_attrib_to_find(attrib_to_find)
      attrib = {}
      return attrib if attrib_to_find.nil? or attrib_to_find.empty?
      attrib['keyval']  = [attrib_to_find].flatten.collect{|keyval|
                  _get_attrib_key_val_ keyval
                }
      attrib['justkey'] = attrib['keyval'].select{|attr| attr[1].empty?}
      attrib['justval'] = attrib['keyval'].select{|attr| attr[0].empty?}
      attrib['keyval']  -= (attrib['justkey'] + attrib['justval'])
      attrib
    end

    def self.filter?(attrib, xmlnode)
      return false if attrib.empty?
      return true if  xmlnode.nil? or
                      has_key_val?(xmlnode, attrib['keyval']) or
                      has_key?(xmlnode, attrib['justkey']) or
                      has_val?(xmlnode, attrib['justval'])
      false
    end

    def self.has_key_val?(data, keyval_collection)
      keyval_collection.collect{|keyval|
        data[keyval.first] == keyval.last
      }.include? false
    end

    def self.has_key?(data, key_collection)
      key_collection.collect{|key|
        data[key.first].nil?
      }.include? true
    end

    def self.has_val?(data, val_collection)
      val_collection.collect{|val|
        data.each_value.include? val[1]
      }.include? false
    end
  end
end
