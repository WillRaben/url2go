ENC_SAFE_URL = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz$-_.+!*'(),;/?:@=&".freeze
ENC_KEYS_64 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_-".freeze
ENC_KEYS_HASH = (ENC_KEYS_64.each_char.with_index.inject({}) { |hash, (key, value)| hash[key] = value; hash }).freeze
ENC_BASE = ENC_KEYS_64.length.freeze
PROTOCOL_HASH =  {:http=>"http://", :https=>"https://"}.freeze