local jwks = require "jwks"

local base64url_n = "ouUuwg-71ixz8oe2CLk5e47ZYb8IeDU_bc6M2vsgRsNFSa4OosrFgemJCmV6xNc9WDkaTuLdsN3-JGJPGrmWVb56UXHfCl9eKuKVkgvkmU7c6Ndmw-GyNOHml_JaxAP-BxawMuGyiG-gDeQ5bzWRNMhq9jb4eSeB7qQ72q1hRKyEp_1PAxiUuTQe-NkJlEEzwqStvz3bMvhUJ7RrCFmXC1pVGU4Z98srnhwmx7fjJ-ammz3MAaI5tVjliz1dX1FVQXKYQ9ho6OH6DpBbh4_F86W_5eThmXFKQzs5Do9PBuTwGrDyJxOPIoo3WQ0SmkHfPjwpEPT_LagiZTamVC11FQ"
local base64url_e = "AQAB"

local expected_pem = [[-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAouUuwg+71ixz8oe2CLk5
e47ZYb8IeDU/bc6M2vsgRsNFSa4OosrFgemJCmV6xNc9WDkaTuLdsN3+JGJPGrmW
Vb56UXHfCl9eKuKVkgvkmU7c6Ndmw+GyNOHml/JaxAP+BxawMuGyiG+gDeQ5bzWR
NMhq9jb4eSeB7qQ72q1hRKyEp/1PAxiUuTQe+NkJlEEzwqStvz3bMvhUJ7RrCFmX
C1pVGU4Z98srnhwmx7fjJ+ammz3MAaI5tVjliz1dX1FVQXKYQ9ho6OH6DpBbh4/F
86W/5eThmXFKQzs5Do9PBuTwGrDyJxOPIoo3WQ0SmkHfPjwpEPT/LagiZTamVC11
FQIDAQAB
-----END PUBLIC KEY-----
]]

describe('build_pkey', function()
  it('should build the key correctly from the modulus and exponent', function()
    local pkey = jwks.build_pkey(base64url_n, base64url_e)
    assert.equals(expected_pem, pkey:export())
  end)
end)
