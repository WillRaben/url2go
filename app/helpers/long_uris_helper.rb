module LongUrisHelper
    def uri_encode(bigserial)    
        hash_str = ''
        while bigserial > 0
            hash_str = ENC_KEYS_64[bigserial % ENC_BASE] + hash_str
            bigserial = bigserial / ENC_BASE
        end
        hash_str
      end
  
    def uri_decode(str)
        num = 0
        i = 0
        len = str.length - 1
        # while loop is faster than each_char or other 'idiomatic' way
        while i < str.length
          pow = ENC_BASE**(len - i)
          num += ENC_KEYS_HASH[str[i]] * pow
          i += 1
        end
        num
    end

    def i_to_protocol(number)
        if number == 0
            PROTOCOL_HASH[:http]
        elsif number == 1
            PROTOCOL_HASH[:https]
        end
    end

    def protocol_to_i(str)
        if str == PROTOCOL_HASH[:http]
           return 0
        elsif str == PROTOCOL_HASH[:https]
           return 1
        end
    end 
end
