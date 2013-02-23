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
      unless attrib.empty?
        return true if xmlnode[0][1].nil?
        check_keyval  = attrib['keyval'].collect{|keyval|
                          xmlnode[0][1][keyval.first] == keyval.last
                        }.include? false
        check_key     = attrib['justkey'].collect{|key|
                          xmlnode[0][1][key.first].nil?
                        }.include? true
        check_val     = attrib['justval'].collect{|val|
                          xmlnode[0][1].each_value.include? val[1]
                        }.include? false
        return true if check_keyval or check_key or check_val
      end
      false
    end
  end
end
