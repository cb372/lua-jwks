local pkey = require "openssl".pkey
local base64 = require "openssl".base64
local bn = require "openssl".bn

local function to_base64(base64url)
  local base64 = base64url:gsub("-", "+"):gsub("_", "/")
  while base64:len() % 4 > 0 do
    base64 = base64 .. "="
  end
  return base64
end

local function to_bytes(base64url)
  return base64(to_base64(base64url), false)
end

local function to_hex(str)
  return (str:gsub('.', function (c)
    return string.format('%02X', string.byte(c))
  end))
end

local function to_bn(bytes)
  return bn.number("X" .. to_hex(bytes):lower())
end

return {

  build_pkey = function(n_base64url, e_base64url)
    local n_bytes = to_bytes(n_base64url)
    local e_bytes = to_bytes(e_base64url)

    local n_bn = to_bn(n_bytes)
    local e_bn = to_bn(e_bytes)
    --print(n_bn:tohex())
    --print(e_bn:tohex())

    return pkey.new({ alg = "rsa", n = n_bn, e = e_bn })
  end

}
