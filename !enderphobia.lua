local name = "enderphobia"
local error = error
local setmetatable = setmetatable
local ipairs = ipairs
local pairs = pairs
local next = next
local printf = printf
local rawequal = rawequal
local rawset = rawset
local rawlen = rawlen
local readfile = readfile
local writefile = writefile
local require = require
local tonumber = tonumber
local toticks = toticks
local type = type
local unpack = unpack
local pcall = pcall

local function table_comp(a)
	local b = {}

	for c, d in next, a do
		b[c] = d
	end

	return b
end

local table = table_comp(table)
local math = table_comp(math)
local string = table_comp(string)
local ui = table_comp(ui)
local client = table_comp(client)
local database = table_comp(database)
local entity = table_comp(entity)
local ffi = table_comp(require("ffi"))
local globals = table_comp(globals)
local panorama = table_comp(panorama)
local renderer = table_comp(renderer)
local bit = table_comp(bit)

local vector = require("vector")
local pui = require("gamesense/pui")
local clipboard = require("gamesense/clipboard")
local ent = require("gamesense/entity")
local js = panorama.open()
--local base64 = require("gamesense/base64")

local x, y = client.screen_size()
local version = function(string) return string and "beta" or "1.1" end
local U = string.upper

client.link = js.SteamOverlayAPI.OpenExternalBrowserURL
client.ping = math.floor(client.latency() * 1000)

local databas = {
	cfgs = name .. "::db:",
	load = name .. "::loads",
	kill = name .. "::kills",
}

local function initdb()
	if database.read(databas.cfgs) == nil then 
		database.write(databas.cfgs, {})
	end

	local loads = database.read(databas.load)
	local kills = database.read(databas.kill)

	if loads == nil then
		loads = 0
	end

	loads = loads + 1
	database.write(databas.load, loads)

	if kills == nil then
		kills = 0
	end

	database.write(databas.kill, kills)
end; initdb()

local render = {
	anim = {},

	logo = function(self, da)
		local big = renderer.load_png("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A\x00\x00\x00\x0D\x49\x48\x44\x52\x00\x00\x00\x1D\x00\x00\x00\x1D\x08\x06\x00\x00\x00\x56\x93\x67\x0F\x00\x00\x00\x01\x73\x52\x47\x42\x00\xAE\xCE\x1C\xE9\x00\x00\x00\x04\x67\x41\x4D\x41\x00\x00\xB1\x8F\x0B\xFC\x61\x05\x00\x00\x00\x09\x70\x48\x59\x73\x00\x00\x0E\xC3\x00\x00\x0E\xC3\x01\xC7\x6F\xA8\x64\x00\x00\x05\xA0\x49\x44\x41\x54\x48\x4B\x95\x56\x59\x4C\x54\x57\x18\xFE\x87\x61\x06\x64\x91\x01\x91\x4D\x36\x65\x51\x76\x08\x24\x48\x8C\xA6\x46\x03\x04\x29\x90\x50\x5A\x4A\x62\x5B\xD3\x07\x62\xDA\x58\x52\x83\x31\xA4\xF4\xA1\x24\x7D\x28\x4D\xED\x43\x1F\x4D\x6C\x09\x0D\x46\x40\xC2\xD8\xA4\x81\x18\x10\x59\x65\xDF\x06\x2C\x01\x81\xB2\xCA\x22\xC3\xBE\x3B\xFD\xFE\xEB\x29\x2D\x61\xEE\x28\x5F\x72\x73\x07\xCE\xB9\xFF\x77\xFE\xED\x3B\xBF\x82\x0E\x89\x88\x88\x08\x0D\x5E\x8E\xD6\xD6\xD6\x3B\x0E\x0E\x0E\xE3\x5A\xAD\x76\xE7\xCD\xCA\xBB\xE3\x9D\x48\x13\x13\x13\x35\x36\x36\x36\x5F\xA9\xD5\xEA\x0F\x9D\x9D\x9D\x7D\xF1\x56\xAF\xAD\xAD\xD1\xC2\xC2\x02\xE9\xF5\xFA\xA7\x23\x23\x23\x8F\x3A\x3B\x3B\x7F\x14\xDB\xDF\x8A\xB7\x92\x5E\xBF\x7E\x3D\x54\xA9\x54\x96\xFB\xF9\xF9\x79\x3B\x3A\x3A\xD2\xF0\xF0\x30\x8D\x8E\x8E\xD2\xFC\xFC\x3C\x6D\x6D\x6D\x51\x40\x40\x00\x99\x9B\x9B\x53\x4B\x4B\xCB\xC0\xE2\xE2\x62\x2C\xDE\xA3\xE2\x53\x59\x98\x24\xCD\xC9\xC9\xD1\xC0\x78\xF5\x85\x0B\x17\xC2\xCD\xCC\xCC\xA8\xB1\xB1\x91\x26\x27\x27\xC9\xCA\xCA\x8A\x5E\xBF\x7E\x4D\x53\x53\x53\xB4\xBC\xBC\x4C\x38\x10\x21\xDC\x64\x67\x67\xA7\x5B\x5F\x5F\xAF\x50\xA9\x54\x53\x77\xEE\xDC\x91\xF5\xDC\x4C\xBC\x8D\x62\x75\x75\xF5\x86\xBF\xBF\x7F\xF8\xD1\xA3\x47\xA9\xBB\xBB\x9B\x10\xC6\x45\x90\xDF\x84\xE7\x21\x85\x85\x85\x0A\x84\x38\x1C\xDE\x0F\xB3\xD7\x2F\x5F\xBE\xA4\x33\x67\xCE\x04\xED\xEC\xEC\x7C\x5D\x5D\x5D\xFD\x5D\x6A\x6A\xAA\x4A\x98\x39\x00\x93\xA4\xB6\xB6\xB6\x1F\x79\x7A\x7A\xD2\xF6\xF6\x36\xF5\xF5\xF5\x71\x18\xBF\x7C\xF0\xE0\xC1\x4F\xF7\xEE\xDD\xEB\xE5\x75\x78\xDE\x85\xD7\x1F\x47\x8E\x1C\x21\xA4\x99\x74\x3A\x9D\x94\x67\x7B\x7B\xFB\xDE\xD2\xD2\xD2\x6D\xDE\x63\x0C\x26\x49\x0D\x06\x83\x1F\x42\x45\xC8\x15\x59\x5A\x5A\xEA\xE1\xC5\xEF\x62\x69\x0F\x2B\x2B\x2B\x33\x3D\x3D\x3D\x84\x35\xAA\xA8\xA8\xE0\x6F\x38\xD7\x7F\x8A\x65\xA3\x90\x25\x4D\x4E\x4E\xB6\x06\xD9\x0E\x17\xC9\xC6\xC6\x06\xA1\x7A\xEB\xD1\x1E\x06\xB1\xBC\x07\x78\xF9\x0B\x1F\x8C\x73\xCC\xF9\xED\xE8\xE8\x78\x8E\x6F\x7E\x10\xCB\x46\x21\x4B\x5A\x5E\x5E\xBE\xBA\xB4\xB4\xB4\xC2\xC6\x10\x2E\x36\xE8\x24\x96\xF6\x01\xDE\xE9\xC3\xC2\xC2\x7E\xE5\x83\x71\x2A\x70\xB8\x47\x35\x35\x35\xAB\x62\xD9\x28\x4C\x86\x17\x95\xD8\x39\x3D\x3D\xCD\xB9\x65\xE2\xC8\xF3\xE7\xCF\x7B\x88\xA5\x7D\x78\xF5\xEA\xD5\xED\x53\xA7\x4E\x3D\x73\x71\x71\xE1\x4A\xD6\x8A\x7F\xCB\x42\x29\xDE\x46\x01\x43\x4A\x0B\x0B\x8B\x94\xD0\xD0\x50\x6E\x13\xC5\xCC\xCC\x8C\xA7\xAF\xAF\x6F\x65\x70\x70\xB0\x1B\xD4\xC8\xDF\xCB\xCB\xCB\xEE\xF8\xF1\xE3\xCB\x75\x75\x75\x8B\xAD\xAD\xAD\x77\xBD\xBD\xBD\x47\xE1\x75\x08\x3C\xAD\x15\x26\x8C\xC2\xA4\xA7\x30\x52\xDA\xDF\xDF\xFF\x37\xB7\x03\x08\x08\x84\xA9\x73\x73\x73\x13\x10\x87\x21\x14\x4C\x13\x8A\x4B\x77\xFA\xF4\xE9\xF5\x8C\x8C\x8C\xEA\x2B\x57\xAE\x7C\x16\x1D\x1D\x3D\x88\x76\x7A\x5F\x7C\x2E\x0B\x93\x9E\x36\x37\x37\x6F\xF9\xF8\xF8\x2C\x4F\x4C\x4C\x24\xE1\x4D\x81\x81\x81\xDC\x36\x2A\x6E\x0D\x90\x73\xE5\x4A\xF9\x8E\x8B\x8B\xF3\x46\x54\x52\x2A\x2B\x2B\xD5\x38\xCC\x8D\x84\x84\x84\xCD\xDA\xDA\x5A\xD9\x96\x31\x49\x0A\x63\x4A\xA8\xCC\xED\xD9\xD9\xD9\x40\x3C\x12\x41\x48\x48\x08\xB9\xBB\xBB\x13\x3C\x92\x9E\xDD\xDD\x5D\x56\x22\x0A\x0A\x0A\x62\x79\x0C\x6D\x6A\x6A\xFA\xB9\xAC\xAC\x6C\x56\x98\x30\x0A\x93\xA4\x49\x49\x49\x19\x28\xA2\x6F\x58\xFA\x38\xC4\xDC\x8B\xFC\x70\x8B\x20\xF4\x84\x70\x92\x87\x87\x07\x71\x01\x71\xAF\x42\x77\xB9\xBD\xB4\x88\xC2\xB0\x30\x61\x14\x26\xB5\x37\x2F\x2F\xAF\x07\x24\xC1\x6C\x90\x3D\x55\x28\x14\x3D\x28\xA2\x10\x56\x1D\x48\xA4\xE4\xE9\xE6\xE6\xA6\x24\xFC\x5C\xE5\x90\x44\x3D\x42\xEE\x8B\xA2\x9A\x17\x26\x8C\x42\xD6\xD3\xDC\xDC\xDC\x30\x18\xF9\x96\x15\x86\x09\x61\xAC\x73\x68\x68\xE8\xBD\xC8\xC8\xC8\x22\x14\x95\x19\xC2\x1A\xE5\xEA\xEA\x2A\x79\xCD\x9E\xC2\xE3\x66\x1C\xEA\xE6\xE3\xC7\x8F\x3B\x84\x09\x59\xC8\x7A\x9A\x9D\x9D\xFD\x39\xBC\xBA\xCB\xA1\xE5\xEB\x6C\x60\x60\x20\xF9\xC9\x93\x27\xFB\x7A\xF0\xD6\xAD\x5B\x5E\x83\x83\x83\x7E\xB8\x61\x66\x11\x11\x5D\x51\x51\xD1\xA1\x2F\xF4\x7D\xB8\x76\xED\xDA\x17\xF7\xEF\xDF\x37\x14\x14\x14\x18\x32\x33\x33\x0D\x67\xCF\x9E\xF5\x11\x4B\x12\xF2\xF3\xF3\x4F\x8A\x9F\x87\x86\x6C\x9F\xFE\xAB\xBB\x10\x01\x9E\x0E\xB8\x62\xF7\xED\xC5\x75\x96\x8A\x68\x7C\x2A\xFE\x3C\x14\x64\x73\x0A\x15\x72\x80\x1A\x5D\x75\x73\x73\x23\x84\x90\x05\xBD\xA5\xB7\xB7\xB7\x5B\x2C\x73\x15\xDB\x22\xE7\x25\x17\x2F\x5E\x0C\x42\x0F\x9F\xC4\xEC\xD4\x81\x91\x45\xB6\x37\xFF\x0F\xD9\x9C\xA6\xA7\xA7\x6B\x40\x3A\x97\x96\x96\xA6\xE4\x4B\x1A\x61\x6E\x01\x51\x0A\x54\x89\x40\xA2\xC7\x54\xB1\x86\x3D\x1F\xE0\xAE\x2D\xE6\x49\x02\x97\xC3\x34\x7E\x7F\x82\xFC\x2E\x15\x17\x17\x3F\x13\x66\x8C\xC2\x64\xCB\x5C\xBA\x74\xA9\x28\x3E\x3E\x3E\x9D\x1B\x9F\xBD\x6D\x68\x68\x20\x9E\x22\x20\x7F\xAC\x4C\x2B\xA8\xEC\x41\xE8\xB1\xAB\x93\x93\x93\x33\x47\x84\x6F\x19\xBE\xCC\xC7\xC7\xC7\xA9\xAA\xAA\x2A\x1B\x22\x61\x74\x64\x91\x0D\x6F\x56\x56\x56\x30\xAE\xB3\xEF\xA1\x32\x96\x27\x4E\x9C\x90\x0C\x6A\x34\x1A\x69\x4E\xEA\xEA\xEA\xE2\x3C\xAB\xB1\xCD\x05\xBD\x6A\xC3\x7D\x8B\xD0\x12\xC2\x2F\xED\xE1\xFD\x98\x9F\x62\x11\x99\xDF\x20\x2A\xFA\x37\x16\xFF\x83\x2C\x29\x3E\x4C\x89\x8A\x8A\x4A\xE3\xE1\x6B\x6C\x6C\x8C\x8E\x1D\x3B\x26\xC9\x20\xFA\x54\xBA\xEA\x98\xE8\xC5\x8B\x17\x92\x28\xF0\xD0\xC6\x53\x21\x5F\x0A\x3C\x31\xF2\xFE\xB6\xB6\x36\x16\x93\x1A\x78\xFD\x5C\x98\xDC\x83\x6C\x78\x2F\x5F\xBE\x7C\x15\x6A\x53\xC0\xBA\xCA\x12\xC8\x9E\x9E\x3B\x77\x8E\x30\xF7\x12\x72\x2D\x69\x2E\x0B\x3E\x3F\x3C\x09\xF2\xC3\xA3\x29\xF7\x34\x2B\x18\x54\x6A\x09\xFB\xC2\xEB\xEB\xEB\x0F\x48\xA2\x2C\x69\x4C\x4C\x8C\x2D\x3E\xAA\xC1\x69\x23\x78\x46\x62\xA9\x63\x4F\x59\x85\x98\x80\x27\x0A\x84\x4F\xCA\x21\x0F\xDE\x7C\x08\x14\x93\x74\x08\xE4\x5B\x8F\xFF\x65\xF3\x1D\x2B\xCC\xED\x83\xC9\x42\x62\xC0\xBB\x58\xDC\x99\x1E\x08\xA7\x27\xD4\x49\x81\xEA\x9D\xC5\xC5\xFD\x31\x2A\x35\x86\x43\xCC\xA4\x7C\x20\x90\xE8\x41\x5C\x87\x03\x3E\xC5\x81\xB4\xB8\xD8\xFF\x12\x26\x0E\xE0\xAD\xA4\x72\xC0\x88\xA9\x7A\xF8\xF0\xA1\x37\xFA\xD3\xD0\xDE\xDE\xBE\x01\xE2\xC5\x92\x92\x92\x65\xB1\x6C\x02\x44\xFF\x00\xE0\xB2\xC6\x04\x40\x01\x5B\x13\x00\x00\x00\x00\x49\x45\x4E\x44\xAE\x42\x60\x82", 29, 29)
		local small = renderer.load_png("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A\x00\x00\x00\x0D\x49\x48\x44\x52\x00\x00\x00\x13\x00\x00\x00\x13\x08\x06\x00\x00\x00\x72\x50\x36\xCC\x00\x00\x00\x01\x73\x52\x47\x42\x00\xAE\xCE\x1C\xE9\x00\x00\x00\x04\x67\x41\x4D\x41\x00\x00\xB1\x8F\x0B\xFC\x61\x05\x00\x00\x00\x09\x70\x48\x59\x73\x00\x00\x0E\xC3\x00\x00\x0E\xC3\x01\xC7\x6F\xA8\x64\x00\x00\x03\x22\x49\x44\x41\x54\x38\x4F\x75\x54\xDD\x4B\xD3\x51\x18\x7E\xDB\xCC\x6D\xBA\xA9\x9B\x88\x5F\x17\x4B\x9D\x73\x3A\x26\x6A\x26\x36\x37\x91\x42\x0C\x43\x10\x43\xB4\x40\x33\xBC\xF0\x22\xBB\x08\x14\xFB\x03\x82\xEA\xA2\x2E\xEA\x26\x22\x41\x2F\x22\xBD\x58\x64\x97\x41\x28\xE4\x50\x66\xE9\x54\x4C\xFC\x9A\x13\xCD\xAF\x34\xB7\xE9\xFC\x64\xDA\x73\xC6\x61\x34\x8E\x3E\x30\x7E\xFB\xBD\xBF\x73\x9E\xF3\xBC\xEF\xFB\xBC\xE7\x12\x5D\x80\xCA\xCA\xCA\x88\xB3\xB3\x33\x8B\x4A\xA5\xCA\x89\x8C\x8C\xA4\xD9\xD9\xD9\x5F\x0E\x87\x63\x80\x7F\x3E\x17\xE7\x92\xB5\xB6\xB6\x5E\x49\x48\x48\xF8\xA0\x54\x2A\xCD\x1E\x8F\x87\x5C\x2E\x17\x45\x47\x47\xD3\xE1\xE1\x61\x60\x61\x61\xE1\x8E\xDD\x6E\xEF\xE3\x4B\xC3\x20\xE5\xCF\x10\x3A\x3A\x3A\x94\x32\x99\xCC\x66\x32\x99\x4A\x46\x46\x46\x68\x6D\x6D\xED\xC7\xE9\xE9\xE9\x57\x90\xC4\x1D\x1D\x1D\x69\x0A\x0A\x0A\xEA\xB3\xB2\xB2\xAC\x49\x49\x49\x3B\xF3\xF3\xF3\xB3\x7C\x5B\x10\x12\xFE\x0C\x01\x0A\x4A\x0D\x06\x83\x85\xA9\xD9\xD8\xD8\x78\xD5\xD3\xD3\x73\xAD\xB7\xB7\xF7\x81\x42\xA1\x68\x61\xE9\xEE\xED\xED\xD1\xFE\xFE\xFE\x4D\x28\x16\x84\x08\x64\x50\xA2\x8F\x8A\x8A\x22\xBF\xDF\x4F\x50\xF2\x86\x87\xC9\xEB\xF5\x3A\xA0\x90\x86\x87\x87\x69\x75\x75\x75\x51\xAB\xD5\x0A\xF5\x13\xC8\x70\xB2\x1B\x27\x93\x54\x2A\xA5\xDD\xDD\xDD\x3F\x3C\x4C\x48\xD9\x03\x75\xDD\x2C\x8E\xA6\x74\x43\xAD\x87\x7F\x0A\x41\x20\x03\xD1\xC0\xD2\xD2\x12\x65\x64\x64\x50\x62\x62\x62\x2D\x0F\x07\x01\xA2\xC7\xB9\xB9\xB9\x6F\xF1\x6D\x8A\x87\xC2\x20\x90\xD9\x6C\x36\x0F\xEA\xF5\x2D\x35\x35\x95\xF2\xF3\xF3\xDF\xE7\xE5\xE5\x8D\x99\xCD\xE6\x9D\x9A\x9A\x9A\xC5\xF8\xF8\xF8\x67\x48\xF7\x9D\x46\xA3\x31\xF1\xE5\x61\x10\x8A\xC8\x90\x9E\x9E\xAE\x71\xBB\xDD\xB7\xCA\xCB\xCB\x25\xD8\x98\x34\x35\x35\x25\x3F\x38\x38\x88\xB3\x5A\xAD\x85\x31\x31\x31\x75\xE3\xE3\xE3\x8F\x66\x66\x66\xFE\xF2\xE5\x21\x08\x64\xED\xED\xED\x6A\xF8\xEB\xD3\xC4\xC4\x84\x62\x7B\x7B\x9B\x92\x93\x93\xA9\xB8\xB8\x98\x98\x52\x06\xA7\xD3\x29\xDF\xDC\xDC\xEC\x5B\x5E\x5E\x5E\x0C\x06\xFE\x43\x04\x7F\x86\x00\x6B\x34\xC2\xB0\xEA\xC9\xC9\x49\xC2\xE9\x2F\x4E\x4E\x4E\xB4\xE8\x6C\xBD\xCF\xE7\x23\xB9\x5C\x4E\xB0\x84\x1D\xFE\xFA\xC9\x97\x87\x41\xA8\x19\xEA\x52\xC2\xFC\x94\x99\x99\xF9\xA5\xBF\xBF\xFF\x49\x67\x67\xE7\x5D\xA4\xAA\x86\xB2\x6A\x1C\x94\x0F\xC3\xDE\x86\x32\xA1\x93\x0C\x82\x32\x28\x90\x61\x03\x21\x4D\x2F\x0F\x51\x51\x51\x51\x59\x53\x53\xD3\x67\xFE\x7A\x21\x04\x65\x48\xC1\x05\x1F\x31\xD3\x5A\x78\x88\xBA\xBA\xBA\xFC\x0D\x0D\x0D\x63\xCD\xCD\xCD\xCF\xAB\xAA\xAA\x54\x3C\x2C\x40\x68\x40\x6C\x6C\x6C\x04\x7E\xF7\xB2\xB3\xB3\xD5\x98\x04\x23\x3A\x58\xAB\xD3\xE9\xE4\xC7\xC7\xC7\x6A\xD4\xEF\xBE\x5E\xAF\xAF\x6D\x69\x69\xB9\x91\x96\x96\xA6\x18\x1A\x1A\x72\xF2\x6D\x41\x08\x64\x15\x15\x15\x8D\xB0\x42\x29\xFC\xC5\x4C\x6B\x1C\x1D\x1D\x35\xCE\xCD\xCD\x95\xC1\xCC\xBA\x40\x20\x40\xEB\xEB\xEB\x9A\x94\x94\x14\x03\xC8\xAB\x11\xEB\xC6\x68\x85\xEA\x27\x90\xE1\x36\x78\x88\xAE\xE5\x4C\x4F\x4F\xB3\xFF\x64\xB1\x58\x58\x33\x48\x22\x91\x30\x72\x32\x1A\x8D\xB4\xB5\xB5\x45\x83\x83\x83\x04\xEF\x7D\x04\xF9\x6F\xBE\x55\xBC\xCF\x90\xD6\x75\x74\xF3\x35\xE6\xF2\x2A\xBA\x17\xC0\x40\x47\xB0\x01\x47\x8A\x6C\x56\x83\x6B\x30\x05\x1E\xBC\x3F\xC5\xD0\xBF\x0C\x06\x38\x2E\xBC\x69\x19\x0A\x0B\x0B\x2F\xB7\xB5\xB5\x49\xA0\xB2\x0E\x44\xEA\x95\x95\x95\x53\xDC\x2A\xDF\xD1\x1C\x17\xD2\xF7\xF1\x65\x1C\x44\xFF\x00\x73\x4D\x5B\x4F\x5A\x1C\x00\xE6\x00\x00\x00\x00\x49\x45\x4E\x44\xAE\x42\x60\x82", 19, 19)
		local icon = da and big or small
		local pixel = da and {29,29} or {19,19}

		return icon, unpack(pixel)
	end,

	clamp = function(self, value, minimum, maximum)
        if minimum > maximum then 
			minimum, maximum = maximum, minimum 
		end

        return math.max(minimum, math.min(maximum, value))
	end,

	alphen = function(self, value)
        return math.max(0, math.min(255, value))
	end,

	lerp = function(self, a, b, speed)
		return (b - a) * speed + a
	end,

	math_anim2 = function(self, start, end_pos, speed)
		speed = self:clamp(globals.frametime() * ((speed / 100) or 0.08) * 175.0, 0.01, 1.0)

		local a = self:lerp(start, end_pos, speed)

		return tonumber(string.format("%.3f", a))
	end,

	new_anim = function(self, name, value, speed)

		if self.anim[name] == nil then
			self.anim[name] = value
		end
		
		local animation = self:math_anim2(self.anim[name], value, speed)

		self.anim[name] = animation

		return self.anim[name]
	end,

	rect = function(self, x, y, w, h, clr, rounding)
		local r, g, b, a = unpack(clr)

		renderer.circle(x + rounding, y + rounding, r, g, b, a, rounding, 180, 0.25)
		renderer.rectangle(x + rounding, y, w - rounding - rounding, rounding, r, g, b, a)
		renderer.circle(x + w - rounding, y + rounding, r, g, b, a, rounding, 90, 0.25)
		renderer.rectangle(x, y + rounding, w, h - rounding*2, r, g, b, a)
		renderer.circle(x + rounding, y + h - rounding, r, g, b, a, rounding, 270, 0.25)
		renderer.rectangle(x + rounding, y + h - rounding, w - rounding - rounding, rounding, r, g, b, a)
		renderer.circle(x + w - rounding, y + h - rounding, r, g, b, a, rounding, 0, 0.25)
	end,

	rectv = function(self, x, y, w, h, clr, rounding, clr2, he, notblur)
		local r, g, b, a = unpack(clr)
		local r1, g1, b1, a1

		renderer.circle(x + rounding, y + rounding, r, g, b, a, rounding, 180, 0.25)
		renderer.rectangle(x + rounding, y, w - rounding - rounding, rounding, r, g, b, a)
		renderer.circle(x + w - rounding, y + rounding, r, g, b, a, rounding, 90, 0.25)
		renderer.rectangle(x, y + rounding, w, h - rounding*2 + 1, r, g, b, a)
		
		renderer.circle(x + rounding, y + h - rounding + 1, r, g, b, a, rounding, 270, 0.25)
		renderer.rectangle(x + rounding, y + h - rounding + 1, w - rounding - rounding, rounding, r, g, b, a)
		renderer.circle(x + w - rounding, y + h - rounding + 1, r, g, b, a, rounding, 0, 0.25)

		if a > 30 and not notblur then 
			renderer.blur(x, y, w, h)
		end

		if clr2 then 
			r1, g1, b1, a1 = unpack(clr2)
			local hs = he or 2

			renderer.rectangle(x + rounding, y, w - rounding * 2, hs, r1, g1, b1, a1)

			renderer.gradient(x - 1, y + rounding, hs, h - rounding * 2.7, r1, g1, b1, a1, r1, g1, b1, 0, false) -- left
			renderer.gradient(x + w - 1, y + rounding, hs, h - rounding * 2.7, r1, g1, b1, a1, r1, g1, b1, 0, false) -- right

			renderer.circle_outline(x + w - rounding, y + rounding, r1, g1, b1, a1, rounding, 270, 0.25, hs) -- right
			renderer.circle_outline(x + rounding, y + rounding, r1, g1, b1, a1, rounding, 180, .25, hs) -- left
		end
	end
}

local drag = {
	new = function(name, base_x, base_y)
    	return (function()
        local a = {}
        local magnit = {}
        
        local drag_type__ = {
            b = 0,
            d = 0, e = 0,
            f = 0, g = 0,
            h = false,
            i = nil,
            j = 0, k = 0,
            l = {},
            m = nil,
            n = false,
            o = nil,
            uii = false
        }

        local p = {
            __index = {
                drag = function(self, ...)
                    local q, r = self:get()
                    local s, t = a.drag(self, q, r, ...)
                    if q ~= s or r ~= t then
                        self:set(s, t)
                    end
                    return s, t
                end,
                set = function(self, q, r)
                    local j, k = client.screen_size()
                    ui.set(self.x_reference, q / j * self.res)
                    ui.set(self.y_reference, r / k * self.res)
                end,
                get = function(self, x333, y333)
                    local j, k = client.screen_size()
                    return ui.get(self.x_reference) / self.res * j + (x333 or 0), 
                           ui.get(self.y_reference) / self.res * k + (y333 or 0)
                end
            }
        }

        function a.new(u, v, w, x)
            x = x or 10000
            local j, k = client.screen_size()
            local y = ui.new_slider("misc", "settings", "ender::x:" .. u, 0, x, v / j * x)
            local z = ui.new_slider("misc", "settings", "ender::y:" .. u, 0, x, w / k * x)
            ui.set_visible(y, false)
            ui.set_visible(z, false)
            return setmetatable({
                name = u, 
                x_reference = y, 
                y_reference = z, 
                res = x
            }, p)
        end

        function a.drag(self, x_widget, y_widget, w_w, h_w, alp)
            if globals.framecount() ~= drag_type__.b then
                drag_type__.uii = ui.is_menu_open()
                drag_type__.f, drag_type__.g = drag_type__.d, drag_type__.e
                drag_type__.d, drag_type__.e = ui.mouse_position()
                drag_type__.i = drag_type__.h
                drag_type__.h = client.key_state(0x01) == true
                drag_type__.m = drag_type__.l
                drag_type__.l = {}
                drag_type__.o = drag_type__.n
                magnit[self.name] = { x = false, y = false }
                drag_type__.j, drag_type__.k = client.screen_size()
            end

            local held = drag_type__.h 
                and drag_type__.f > x_widget 
                and drag_type__.g > y_widget 
                and drag_type__.f < x_widget + w_w 
                and drag_type__.g < y_widget + h_w

            local held_a = render:new_anim("drag.alpha.held." .. self.name, held and 1 or 0, 8)

            if drag_type__.uii and drag_type__.i ~= nil then
                render:rect(x_widget, y_widget, w_w, h_w, {255, 255, 255, alp}, 6)
                
                if held then 
                    drag_type__.n = true
                    x_widget = x_widget + drag_type__.d - drag_type__.f
                    y_widget = y_widget + drag_type__.e - drag_type__.g

                    local distance_to_center_x = math.abs(x_widget - (drag_type__.j/2 - (w_w/2)))
                    local distance_to_center_y = math.abs(y_widget - (drag_type__.k - 40 - (h_w/2)))

                    if distance_to_center_y <= 3 then
                        magnit[self.name].y = true
                        y_widget = drag_type__.k - 40 - (h_w/2)
                    end

                    if distance_to_center_x <= 3 then
                        magnit[self.name].x = true
                        x_widget = drag_type__.j/2 - (w_w/2)
                    end

                    x_widget = render:clamp(drag_type__.j - w_w, 0, x_widget)
                    y_widget = render:clamp(drag_type__.k - h_w, 0, y_widget)
                end

                if held_a > 0.1 then 
                    local ax = render:new_anim("drag.alpha.x." .. self.name, held_a * (80 + (magnit[self.name].x and 90 or 0)), 8)
                    local ay = render:new_anim("drag.alpha.y." .. self.name, held_a * (80 + (magnit[self.name].y and 90 or 0)), 8)

                    renderer.rectangle(0, 0, drag_type__.j, drag_type__.k, 0, 0, 0, render:alphen(held_a * 120)) -- back1
					renderer.blur(0, 0, drag_type__.j, drag_type__.k, held_a) -- back2

                    renderer.rectangle(drag_type__.j/2, 0, 1, drag_type__.k, 255, 255, 255, ax)
                    renderer.rectangle(0, drag_type__.k - 40, drag_type__.j, 1, 255, 255, 255, ay)
                end
            end
            
            table.insert(drag_type__.l, {x_widget, y_widget, w_w, h_w})
            return x_widget, y_widget, w_w, h_w
        end

        return a
    end)().new(name, base_x, base_y)
end
}

local menu = {}
local user_lua = js.MyPersonaAPI.GetName()

local refs = {
	aa = {
		enabled = pui.reference("aa", "anti-aimbot angles", "enabled"),
		pitch = {pui.reference("aa", "anti-aimbot angles", "pitch")},
		yaw_base = {pui.reference("aa", "anti-aimbot angles", "Yaw base")},
		yaw = {pui.reference("aa", "anti-aimbot angles", "Yaw")},
		yaw_jitter = {pui.reference("aa", "anti-aimbot angles", "Yaw Jitter")},
		body_yaw = {pui.reference("aa", "anti-aimbot angles", "Body yaw")},
		body_free = {pui.reference("aa", "anti-aimbot angles", "Freestanding body yaw")},
		freestand = {pui.reference("aa", "anti-aimbot angles", "Freestanding")},
		roll = {pui.reference("aa", "anti-aimbot angles", "Roll")},
		edge_yaw = {pui.reference("aa", "anti-aimbot angles", "Edge yaw")},
		fake_peek = {pui.reference("aa", "other", "Fake peek")},
	},

	bindfs = {ui.reference("aa", "anti-aimbot angles", "Freestanding")},
	slow_motion = {ui.reference("aa", "other", "Slow motion")},
	accent = ui.reference("misc", "settings", "menu color"),
	clantag = pui.reference("misc", "miscellaneous", "clan tag spammer"),
	ping = {ui.reference("misc", "miscellaneous", "ping spike")},

	hits = {
		miss = pui.reference("rage", "other", "log misses due to spread"),
		hit = pui.reference("misc", "miscellaneous", "log damage dealt"),
	},

	fakelag = {
		enable = {pui.reference("aa", "fake lag", "enabled")},
		amount = {pui.reference("aa", "fake lag", "amount")},
		variance = {pui.reference("aa", "fake lag", "variance")},
		limit = {pui.reference("aa", "fake lag", "limit")},
		lg = {pui.reference("aa", "other", "Leg movement")},
	},

	aa_other = {
		sw = {pui.reference("aa", "other", "Slow motion")}, 
		hide_shots = {pui.reference("aa", "other", "On shot anti-aim")},
	},

	rage = {
		enable = ui.reference('rage', 'aimbot', 'Enabled'),
		dt = {ui.reference("rage", "aimbot", "Double tap")},
		always = {ui.reference("rage", "other", "Automatic fire")},
		fd = {ui.reference("rage", "other", "Duck peek assist")},
		qp = {ui.reference("rage", "other", "Quick peek assist")},
		os = {ui.reference("aa", "other", "On shot anti-aim")},
		mindmg = {pui.reference('rage', 'aimbot', 'minimum damage')},
		baim = {ui.reference('rage', 'aimbot', 'force body aim')},
		safe = {ui.reference('rage', 'aimbot', 'force safe point')},
		ovr = {ui.reference('rage', 'aimbot', 'minimum damage override')},
	},
}

local phobia = {
	ui = {
		servers = {
			gen = {
				["[pub] hvhserver.xyz-roll fix"] = "62.122.214.55:27015",
				["[pub] HackHaven HvH"] = "46.174.55.54:27015",
				["[pub] eXpidors.Ru"] = "46.174.51.137:7777",
				["[pub] eXpidors.Ru - Scout"] = "62.122.215.105:6666",
				["[pub] sippin' on wok mm hvh"] = "46.174.55.52:1488",
				["[pub] War3ft Project"] = "194.93.2.30:1337",
				["[pub] SEREGA HVH"] = "46.174.49.147:1488",
				["[pub] SharkProject | MM"] = "37.230.228.148:27015",
				["[pub] WhiteProject"] = "46.174.49.161:1337",
				["[pub] LivixProject HVH"] = "185.9.145.159:28423",
				["[pub] GENESIS PROJECT"] = "45.136.204.249:27015",
				["[kv] NewVision #11"] = "193.111.250.18:27030",
				["[kv] NewVision #9"] = "193.111.250.18:27024",
			},

			selected = ""
		},

		show = function(self, visible)
			local m3nu = {refs.aa, refs.fakelag, refs.aa_other}

			for _, groups in ipairs(m3nu) do
			  	for _, v in pairs(groups) do
					for _, item in ipairs(v) do
						item:set_visible(visible)
					end
			  	end
			end
			refs.aa.enabled:set_visible(visible)
		end,

		depends = function(element_group, element_config_function)
			element_group = element_group.__type == "pui::element" and {
				element_group
			} or element_group
		
			local created_elements, dependency_value = element_config_function(element_group[1])
		
			for _, element in ipairs(created_elements) do
				element:depend({
					element_group[1],
					dependency_value
				})
			end
		
			created_elements[element_group.key or "turn"] = element_group[1]
		
			return created_elements
		end,

		header = function(self, group)
			local accent = "\a333333FF"
			local head = "‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"

			return group:label(accent .. head)
		end,

		execute = function(self)
			local conditions = {"Global", "Stand", "Walking", "Run", "Crouch", "Sneak", "Air", "Air-Crouch", "Fakelag", "Hideshots"}
			local servs = {}
			local teams = {"ct", "t"}

			local group = {
				a = pui.group("AA", "anti-aimbot angles"),
				f = pui.group("AA", "Fake lag"),
				o = pui.group("AA", "Other"),
			}

			for k, v in pairs(self.servers.gen) do
				table.insert(servs, k)
			end

			pui.macros.d = "\a808080FF•\r  "
			pui.macros.gray = "\a505050FF"
			pui.macros.a = "\a77789FFF"
			pui.macros.ab = "\aACADE2FF"

			menu = {
				title = group.o:label("\f<gray>----------- \f<a>ender\rphobia\f<gray> -----------"),
				headerr = group.o:label("pulsive text"),
				tab = group.o:combobox("\n tabs", {" Home", " Anti-Aim", " Settings", " Servers"}), 

				["home"] = {
					["links"] = {
						discord = group.o:button("\f<gray> Discord", function()
							client.link("https://discord.gg/zUKBpRrSss")		
						end),
					},

					["configs"] = {
						space1 = group.f:label("\f<d>New \f<a>config"),
						name = group.f:textbox("\n ~ namememe"),

						list = group.a:listbox("\nconfigs", {}),

						save = group.f:button("\f<a>\r Save"),
						import = group.f:button("\f<a>\r Import"),
						
						load = group.a:button("\f<a>\r Load"),
						export = group.a:button("\f<a>\r Export"), -- cfgsgsgs

						delete = group.a:button("\aD95148FF Delete")
					}
				},

				["servers"] = {
					list = group.a:listbox("\nactive-servers", servs),
					connect = group.a:button("\f<a>\r Connect"),
					copy = group.a:button("\f<a>\r Copy ip-address"),

					space = self:header(group.a),
					retry = group.a:button("\f<a>\r Rejoin \f<a>(Retry)"),
				},

				["stats"] = {
					title = group.f:label("\f<d>Statistics"),
					space = self:header(group.f),
					loads = group.f:label("\f<a>\r Total loads:\f<a> "..database.read(databas.load)),
					kills = group.f:label("\f<a>\r Total killed:\f<a> "..database.read(databas.kill))
				},


				["antiaim"] = {
					tab = group.a:combobox("\f<a>Anti-Aimbot \f<ab>(beta)", {" Builder", " AntiBrute", " Features"}),

					["general"] = {
						space1 = group.a:label("\n"),

						safe_head = group.a:checkbox("Safe Head"),
						backstab = self.depends(group.a:checkbox("Avoid Backstab"), function()
							return {
								group.a:slider("\n distance backstab", 100, 200, 170, true, "см", 1),
							}, true
						end),

						space2 = group.a:label("\n"),

						manual = self.depends(group.a:checkbox("Manuals"), function() -- get_manual
							return {
								group.a:hotkey("\f<d>Left \f<gray>- лево руля"),
								group.a:hotkey("\f<d>Right \f<gray>- право руля"),
								group.a:hotkey("\f<d>Forward"),
								self:header(group.a)
							}, true
						end),

						fs = self.depends(group.a:checkbox("Freestand", 0), function() -- menu.antiaim.general.fs
							return {
								group.a:checkbox("\f<d>Static"),
								self:header(group.a)
							}, true
						end),

						edge_yaw = group.a:checkbox("Edge yaw", 0),
						warmup_aa = group.a:checkbox("Warmup aa"),
						warmup_aa_add = group.a:multiselect("\n warmap aa", {"On warmup", "Enemies no alive"})
					},

					["builder"] = {
						state_curr = group.a:combobox("\n current cond", conditions),
						team_cur = group.a:combobox("\f<d>Team", teams),

						states = {},
					},

					["antibf"] = {
						header = self:header(group.f),

						enable = group.a:checkbox("Enable \f<a>Bruteforce"),

						_tab = group.f:combobox("Anti-Bruteforce \f<a>Tab", {"Builder", "Trigger"}),
						tab = group.f:combobox("Builder bruteforce", {"Presets", "Custom"}),
						info = group.f:label("\f<d>Settings \f<a>applied\r on all \f<a>state!"),

						["presets"] = {
							list = group.a:listbox("\n bruforce presets", {"jitter", "jitter random"}),

							stage = group.a:slider("Bruforce stages \f<a>...", 1, 3, 2, true)
						},

						["custom"] = {
							space = group.a:label("\n otstup c"),
								
							["jitter"] = {
								type = group.a:combobox("\n bf yaw type", {"Off", "Center", "Offset", "Random", "Skitter"}),
								yaw = group.a:slider("\n bf yaw grodus", -90, 90, 0, true, "°", 1),

								lef = group.a:slider("Add yaw ~ \f<a>l/r\nbf", -70, 70, 0, true, "°", 1),
								rig = group.a:slider("\n bf yaw r", -70, 70, 0, true, "°", 1), -- jitter.yaw

								body = self.depends(group.a:combobox("Body yaw \nbf3", {"Off", "Opposite", "Static", "Jitter"}), function()
									return {
										group.a:combobox("\n body type static3", {"Left", "Right"})
									}, "Static"
								end),

								delay = group.a:slider("\f<d>Delay yaw \nbf", 1, 12, 1, true, "t", 1, {[1] = "Off"}),
							},
						},
						["trigger"] = {
							space = group.a:label("\n otstup t"),

							timer = self.depends(group.a:checkbox("\f<a>\r Timer"), function()
								return {
									group.a:slider("\f<a>\r Bruteforce \f<a>reset/on\r ever per", 1, 60, 60, true, "s", 1, {[60] = "1 min"}), -- export
									self:header(group.a)
								}, true
							end),

							round = group.a:checkbox("\f<a>\r On start \f<a>round"),
							notify = group.a:checkbox("\f<a>\r Notifys"),
						}
					},
				},

				["options"] = {
					tab = group.a:combobox("\ntabopt", {" Visuals", " Miscellaneous"}),
					space = group.a:label("\n"),

					["vis"] = {
						accent = group.a:color_picker("\naccent", 119, 120, 159),
						watermark = self.depends(group.a:checkbox("Watermark"), function()
							return {
								group.a:label("\f<d>Custom name"),
								group.a:textbox("\nwater-name"),
								self:header(group.a)
							}, true
						end),

						debug = group.a:checkbox("Debug panel"),

						crosshair = self.depends(group.a:checkbox("Crosshair indicator"), function()
							return {
								group.a:combobox("\ncross-style", {"Text", name}),
								group.a:textbox("\ncross-name"),
								group.a:slider("\ncross-offset", 5, 100, 50, true, "px", 1),
								self:header(group.a)
							}, true
						end),

						viewmodel = group.a:checkbox("Viewmodel modifier"),
						viewmodel_fov = group.a:slider("\f<d>Fov", -120, 120, 60, true, "", 1),
						viewmodel_x = group.a:slider("\n viewmodel x", -90, 90, 1, true, "x", 1),
						viewmodel_y = group.a:slider("\n viewmodel y", -90, 90, 1, true, "y", 1),
						viewmodel_z = group.a:slider("\n viewmodel z", -90, 90, 1, true, "z", 1),
						space_view = self:header(group.a),

						damage = self.depends(group.a:checkbox("Damage indicator"), function()
							return {
								group.a:checkbox("\f<d>Allow on general")
							}, true
						end),

						trace_player = group.a:checkbox("Target tracer", {255,255,255,255}),

						gamesense = group.a:checkbox("Left indicators"),

						nka = group.a:label("\n drr"),
						style_water = group.a:combobox("\f<d>Watermark style", {"Default", "Custom", "LuaSense"}),
						texti_water = group.a:textbox("\nwatertexti"),
						razdl_water = group.a:slider("\nwaterrazdl", 0, 100, 50, false),

						space = self:header(group.a),
						notify = group.a:multiselect("\f<d>Notify options", {"Hit", "Miss"}),
						notify_style = group.a:combobox("\n style notiyf", {"Default", "Enderphobia"})
					},

					["helpers"] = {
						trashtalk = group.a:checkbox("Trashtalk"),
						clantag = group.a:checkbox("Clantag"),
						ladder = group.a:checkbox("Safe ladder"),

						breaker = group.a:checkbox("Animation breaker"),
						breaker_type = group.a:combobox("\nanimbreak type", {"Spam", "Jitter", "Earthquake"}),
						breaker_spam = group.a:slider("\n({1337}:reloadh)", 1, 9, 1, true, "x", 1),
						breaker_add = group.a:multiselect("\nanimbreak adds", {"Legs backing", "Static air"})
					}
				},
			}

			local b1 = menu.options.helpers

			b1.breaker_type:depend({b1.breaker, true})
			b1.breaker_spam:depend({b1.breaker, true}, {b1.breaker_type, "Spam"})
			b1.breaker_add:depend({b1.breaker, true})

			local traverses = {
				[menu.options.vis.viewmodel_fov] = {{menu.options.vis.viewmodel, true}},
				[menu.options.vis.viewmodel_x] = {{menu.options.vis.viewmodel, true}},
				[menu.options.vis.viewmodel_y] = {{menu.options.vis.viewmodel, true}},
				[menu.options.vis.viewmodel_z] = {{menu.options.vis.viewmodel, true}},
				[menu.options.vis.space_view] = {{menu.options.vis.viewmodel, true}},
				[menu.options.vis.texti_water] = {{menu.options.vis.style_water, "Custom", "LuaSense"}},
				[menu.options.vis.razdl_water] = {{menu.options.vis.style_water, "Custom", "LuaSense"}},

				[menu.antiaim.antibf.tab] = {{menu.antiaim.antibf._tab, "Builder"}},
				[menu.antiaim.antibf.custom] = {{menu.antiaim.antibf._tab, "Builder"}, {menu.antiaim.antibf.tab, "Custom"}, {menu.antiaim.antibf.enable, true}},
				[menu.antiaim.antibf.presets] = {{menu.antiaim.antibf._tab, "Builder"}, {menu.antiaim.antibf.tab, "Presets"}, {menu.antiaim.antibf.enable, true}},
				[menu.antiaim.antibf.trigger] = {{menu.antiaim.antibf._tab, "Trigger"}, {menu.antiaim.antibf.enable, true}},
			
				[menu.stats] = {{menu.tab, " Home", true}},
				[menu.home] = {{menu.tab, " Home"}},
				[menu.antiaim] = {{menu.tab, " Anti-Aim"}},
				[menu.options] = {{menu.tab, " Settings"}},
				[menu.servers] = {{menu.tab, " Servers"}},
			
				[menu.options.vis] = {{menu.options.tab, " Visuals"}},
				[menu.options.helpers] = {{menu.options.tab, " Miscellaneous"}},
				[menu.antiaim.general] = {{menu.antiaim.tab, " Features"}},
				[menu.antiaim.builder] = {{menu.antiaim.tab, " Builder"}},
				[menu.antiaim.antibf] = {{menu.antiaim.tab, " AntiBrute"}}
			}

			local exodus = {
				pitch = {[-89] = "Up", [0] = "Zero", [89] = "Down"},
				yaw = {[-180] = "Left", [0] = "Zero", [180] = "Right"}
			}

			for _, team in ipairs(teams) do
				menu.antiaim.builder.states[team] = {}
				for _, state in ipairs(conditions) do

					menu.antiaim.builder.states[team][state] = {}
					local aa = menu.antiaim.builder.states[team][state]

					local c = "\r : \a444444FF" .. state:lower() .. ":" .. team

					if state ~= "Global" then
						aa.active = group.a:checkbox("Active \f<a>".. team:lower() .. "\a444444FF :" .. state:lower())
					end

					aa.space = self:header(group.a)

					aa.yaw_type = group.a:combobox("\n yaw type" .. c, {"Off", "Center", "Offset", "Random", "Skitter"})
					aa.yaw_value = group.a:slider("\n yaw value" .. c, -90, 90, 0, true, "°", 1):depend({aa.yaw_type, "Off", true})

					aa.yaw_l = group.a:slider("\f<d>Yaw add \f<a>(l-r)" .. c, -90, 90, 0, true, "°", 1)
					aa.yaw_r = group.a:slider("\nYaw right" .. c, -90, 90, 0, true, "°", 1)

					aa.space_2 = group.a:label("\n space2")

					aa.body_type = group.a:combobox("Body \f<a>yaw type" .. c, {"Off", "Opposite", "Static", "Jitter"})
					aa.body_type_static = group.a:combobox("\n Body static type" .. c, {"Left", "Right"}):depend({aa.body_type, "Static"})
					aa.yaw_delay = group.a:slider("\f<d>Delay" .. c, 1, 12, 1, true, "t", 1, {[1] = "Off"})

					aa.space_3 = self:header(group.a)

					aa.defensive_yaw = group.a:combobox("\f<d>Defensive\f<a> yaw" .. c, {"Off", "Static", "Random", "Spin", "Jitter", "Random static"})

					-- static & random
					aa.defyawstat = group.a:slider("\n Custom yaw static & random" .. c, -180, 180, 0, true, "°", 1):depend({aa.defensive_yaw, "Static", "Random", "Random static"})

					-- spin
					aa.defyawspinleft = group.a:slider("Spin limit\f<a> left \\ right" .. c, -180, 180, 0, true, "°", 1, exodus.yaw):depend({aa.defensive_yaw, "Spin"})
					aa.defyawspinrgt = group.a:slider("\nSpin limit left" .. c, -180, 180, 0, true, "°", 1, exodus.yaw):depend({aa.defensive_yaw, "Spin"})
					aa.defyawspinspd = group.a:slider("\n Spin speed" .. c, 1, 16, 6, true, "t", 1):depend({aa.defensive_yaw, "Spin"})
					aa.defyawspin = group.a:slider("\f<d> Spin updated" .. c, 1, 30, 12, true, "°", 1):depend({aa.defensive_yaw, "Spin"})

					-- jitter
					aa.defyawjittr = group.a:slider("\n Jitter yaw" .. c, 0, 180, 90, true, "°", 1):depend({aa.defensive_yaw, "Jitter"})
					aa.defyawjittrtick = group.a:slider("\n Jitter yaw delay" .. c, 1, 16, 1, true, "t", 1):depend({aa.defensive_yaw, "Jitter"})
					aa.defyawjittrand = group.a:slider("\f<d>Randomize" .. c, 0, 90, 0, true, "°", 1):depend({aa.defensive_yaw, "Jitter"})

					aa.defyawrandomt = group.a:slider("\f<d> Tick\nrandom sta yaw" .. c, 1, 12, 1, true, "t", 1):depend({aa.defensive_yaw, "Random static"})

					aa.defss = self:header(group.a):depend({aa.defensive_yaw, "Off", true})

					--.>,<.- PiTcH dEf -.>,<.-------------------===============-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
					aa.defpitch = group.a:combobox("\f<d>Defensive\f<a> pitch" .. c, {"Static", "Random", "Spin", "Jitter", "Random static"}):depend({aa.defensive_yaw, "Off", true})
					aa.defpitchstat = group.a:slider("\n Pitch static" .. c, -89, 89, 0, true, "°", 1, exodus.pitch):depend({aa.defensive_yaw, "Off", true})

					-- random
					aa.defpitchrand = group.a:slider("\n Pitch random" .. c, -89, 89, 0, true, "°", 1, exodus.pitch):depend({aa.defensive_yaw, "Off", true}, {aa.defpitch, "Random", "Spin"})

					-- spin
					aa.defpitchspint = group.a:slider("\n Pitch spin speed" .. c, 1, 18, 6, true, "t", 1):depend({aa.defensive_yaw, "Off", true}, {aa.defpitch, "Spin"})
					aa.defpitchspinupd = group.a:slider("\f<d> Spin updated \n pitch" .. c, 1, 30, 12, true, "°", 1):depend({aa.defensive_yaw, "Off", true}, {aa.defpitch, "Spin"})
					
					-- jitter
					aa.defpitchjittr = group.a:slider("\n Pitch jitter" .. c, -89, 89, 0, true, "°", 1, exodus.pitch):depend({aa.defensive_yaw, "Off", true}, {aa.defpitch, "Jitter"})
					aa.defpitchjittrtick = group.a:slider("\n Pitch jitter delay" .. c, 1, 16, 1, true, "t", 1, exodus.pitch):depend({aa.defensive_yaw, "Off", true}, {aa.defpitch, "Jitter"})
					aa.defpitchjittrrand = group.a:slider("\f<d>Randomize \n Pitch" .. c, 0, 90, 0, true, "°", 1):depend({aa.defensive_yaw, "Off", true}, {aa.defpitch, "Jitter"})
					
					-- static rand
					aa.defpitchrand_tick = group.a:slider("\f<d> Tick\nrandom sta" .. c, 1, 12, 1, true, "t", 1):depend({aa.defensive_yaw, "Off", true}, {aa.defpitch, "Random static"})

					aa.defss2 = group.o:label("\n tr"):depend({aa.defensive_yaw, "Off", true})
					aa.defpitchtriggers = group.o:multiselect("\f<d>Defensive \f<a>triggers" .. c, {"Always", "Tick", "Weapon switch"}):depend({aa.defensive_yaw, "Off", true})
					aa.defpitchtrigger_t = group.o:slider("\n trigger tick" .. c, 1, 13, 1, true, "t", 1):depend({aa.defensive_yaw, "Off", true}, {aa.defpitchtriggers, "Tick"})

					for _, v in pairs(aa) do
						local arr = {{menu.antiaim.builder.state_curr, state}, {menu.antiaim.builder.team_cur, team}}

						if _ ~= "active" and state ~= "Global" then
							arr = {{menu.antiaim.builder.state_curr, state}, {menu.antiaim.builder.team_cur, team}, {aa.active, true}}
						end

						v:depend(table.unpack(arr))
					end
				end
			end

			menu.antiaim.builder.export = group.o:button("\f<a>\r Export state")
			menu.antiaim.builder.import = group.o:button("\f<a>\r Import state")
			menu.antiaim.builder.bb = self:header(group.a)
			menu.antiaim.builder.sendteam = group.a:button("\f<a>\r Send to opposite team")
			
			for element, deps in pairs(traverses) do
				pui.traverse(element, function(ac)
					ac:depend(unpack(deps))
				end)
			end
		end,
	},
}

phobia.ui:execute()

local helpers = {
		get_team = function(self)
			local me = entity.get_local_player()
			local index = entity.get_prop(me, "m_iTeamNum")

			return index == 2 and "t" or "ct"
		end,

		to_hex = function(self, r, g, b, a)
			return bit.tohex(
			(math.floor((r or 0) + 0.5) * 16777216) + 
			(math.floor((g or 0) + 0.5) * 65536) + 
			(math.floor((b or 0) + 0.5) * 256) + 
			(math.floor((a or 0) + 0.5))
			)
		end,

		pulse = function(self, color, speed)
			local r, g, b, a = unpack(color)
			
			local c1 = r * math.abs(math.cos(globals.curtime()*speed)) 
			local c2 = g * math.abs(math.cos(globals.curtime()*speed))
			local c3 = b * math.abs(math.cos(globals.curtime()*speed))
			local c4 = a * math.abs(math.cos(globals.curtime()*speed))

			return c1, c2, c3, c4
		end,

		animate_text = function(self, speed, string, r, g, b, a)
			local t_out, t_out_iter = { }, 1
			local time = globals.curtime()

			local l = string:len( ) - 1
	
			local r_add = (255 - r)
			local g_add = (255 - g)
			local b_add = (255 - b)
			local a_add = (155 - a)
	
			for i = 1, #string do
				local iter = (i - 1)/(#string - 1) + time * speed
				t_out[t_out_iter] = "\a" .. self:to_hex( r + r_add * math.abs(math.cos( iter )), g + g_add * math.abs(math.cos( iter )), b + b_add * math.abs(math.cos( iter )), a + a_add * math.abs(math.cos( iter )) )
	
				t_out[t_out_iter + 1] = string:sub( i, i )
	
				t_out_iter = t_out_iter + 2
			end
	
			return t_out
		end,

		in_air = function(self, ent)
			local flags = entity.get_prop(ent, "m_fFlags")
			return bit.band(flags, 1) == 0
		end,

		in_duck = function(self, ent)
			local flags = entity.get_prop(ent, "m_fFlags")
			return bit.band(flags, 4) == 4
		end,

		get_velocity = function(self, ent)
			local wam = entity.get_prop(ent, "m_vecVelocity")

			return vector(wam):length2d()
		end,

		normalize_pitch = function(self, angle)
			return render:clamp(angle, -89, 89)
		end,

		normalize_yaw = function(self, angle)
			angle =  angle % 360 
			angle = (angle + 360) % 360
			if (angle > 180)  then
				angle = angle - 360
			end
			return angle
		end,

		get_state = function(self, team)
			local me = entity.get_local_player()
			local team = self:get_team()
			
			local velocity = self:get_velocity(me)
			local duck = self:in_duck(me) or ui.get(refs.rage.fd[1])
			local menu = menu.antiaim.builder.states[team]
			local manual = 0
		
			local dt = (ui.get(refs.rage.dt[1]) and ui.get(refs.rage.dt[2]))
			local os = (ui.get(refs.rage.os[1]) and ui.get(refs.rage.os[2]))
			local fd = ui.get(refs.rage.fd[1])

			local state = "Global"

			if velocity > 1.5 then
				if menu["Run"].active() then
					state = "Run"
				end
			elseif menu["Stand"].active() then
				state = "Stand"
			end
		
			if self:in_air(me) then
				if duck then
					if menu["Air-Crouch"].active() then
						state = "Air-Crouch"
					end
				else
					if menu["Air"].active() then
						state = "Air"
					end
				end
			elseif duck and velocity > 1.5 and menu["Sneak"].active() then
				state = "Sneak"
			elseif velocity > 1 and ui.get(refs.slow_motion[1]) and ui.get(refs.slow_motion[2]) and menu["Walking"].active() then
				state = "Walking"
			elseif manual == -90 and menu["Manual left"].active() then
				state = "Manual left"
			elseif manual == 90 and menu["Manual right"].active() then
				state = "Manual right"
			elseif duck and menu["Crouch"].active() then
				state = "Crouch"
			end
		
			if velocity then
				if menu["Fakelag"].active() and ((not dt and not os) or fd) then
					state = "Fakelag"
				end

				if menu["Hideshots"].active() and os and not dt and not fd then
					state = "Hideshots"
				end
			end

			return state
		end,

		contains = function(self, tbl, val)
			for k, v in pairs(tbl) do
				if v == val then
					return true
				end
			end
			return false
		end,

		charge = function(self)
			if not entity.is_alive(entity.get_local_player()) then 
				return 
			end

			local a = entity.get_local_player()

			local weapon = entity.get_prop(a, "m_hActiveWeapon")

			if weapon == nil then 
				return false 
			end

			local next_attack = entity.get_prop(a, "m_flNextAttack") + 0.01
			local checkcheck = entity.get_prop(weapon, "m_flNextPrimaryAttack")

			if checkcheck == nil then 
				return 
			end

			local next_primary_attack = checkcheck + 0.01

			if next_attack == nil or next_primary_attack == nil then 
				return false 
			end

			return next_attack - globals.curtime() < 0 and next_primary_attack - globals.curtime() < 0
		end
}

function accent()
	local clr, clr1, clr2, clr3 = menu.options.vis.accent:get()

	return clr, clr1, clr2, clr3
end

local notify = (function()
    local lerp = function(start_value, end_value, amount)
		local f=globals.frametime()
        return (end_value - start_value) * (f*amount) + start_value
    end

    local measure_text = function(font, ...)
        local text_parts = {...}
        local combined_text = table.concat(text_parts, "")
        return vector(renderer.measure_text(font, combined_text))
    end

    local notification_settings = {
        notifications = {
            bottom = {}
        },
        max = {
            bottom = 6
        }
    }

    notification_settings.__index = notification_settings

    notification_settings.create_new = function(...)
        table.insert(notification_settings.notifications.bottom, {
            started = false,
            instance = setmetatable({
                active = false,
                timeout = 4,
                color = {
                    r = 0,
                    g = 0,
                    b = 0,
                    a = 0
                },
                x = x / 2,
                y = y,
                text = ...
            }, notification_settings)
        })
    end

    function notification_settings:handler()
        local notification_index = 0
        local active_count = 0

        for i, notification_data in pairs(notification_settings.notifications.bottom) do
            if not notification_data.instance.active and notification_data.started then
                table.remove(notification_settings.notifications.bottom, i)
            end
        end

        for i = 1, #notification_settings.notifications.bottom do
            if notification_settings.notifications.bottom[i].instance.active then
                active_count = active_count + 1
            end
        end

        for i, notification_data in pairs(notification_settings.notifications.bottom) do
            if i > notification_settings.max.bottom then
                return
            end

            if notification_data.instance.active then
                notification_data.instance:render_bottom(notification_index, active_count)
                notification_index = notification_index + 1
            end

            if not notification_data.started then
                notification_data.instance:start()
                notification_data.started = true
            end
        end
    end

    function notification_settings:start()
        self.active = true
        self.delay = globals.realtime() + self.timeout
    end

    function notification_settings:get_text()
        local combined_text = ""
        for _, text_data in pairs(self.text) do
            local text_size = measure_text("", text_data[1])
            local red, green, blue = 255, 255, 255 
            if text_data[2] then
                red, green, blue, _ = accent()
            end
            combined_text = combined_text .. ("\a%02x%02x%02x%02x%s"):format(red, green, blue, self.color.a, text_data[1])
        end
        return combined_text
    end

    function notification_settings:render_bottom(index, active_count)
        local padding = 16
		local default = menu.options.vis.notify_style:get() == "Default"
        local text_margin = "     " .. self:get_text()
        local text_size = measure_text("", text_margin)
        local gray = 15
        local corner_thickness = 2
        local widht = padding + text_size.x
        widht = widht + corner_thickness * 2
        local h = 23
        local p_x = self.x - widht / 2
        local p_y = math.ceil(self.y - 40 + 0.4) 

        if globals.realtime() < self.delay then
            self.y = lerp(self.y, y - 140 - (index - 1) * h * 1.5, 7)
            self.color.a = lerp(self.color.a, 255, 2)
        else
            self.y = lerp(self.y, self.y + 5, 15)
            self.color.a = lerp(self.color.a, 0, 20)
            if self.color.a <= 1 then
                self.active = false
            end
        end

        local r, g, b = accent() 
		local alpha = self.color.a

        local balpha = render:alphen(alpha - 180)
		local log0, lx, ly = render:logo(true)
		local log_x, log_y = p_x - 7, p_y - 2

        local offset = corner_thickness + 2
        offset = offset + padding
		
		if not default then
			render:rectv(p_x + 5, p_y, widht - 12, h + 1, {gray, gray, gray, balpha}, 6, {r, g, b, alpha}, 2, true)
		else
      		render:rect(p_x + 5, p_y, widht - 12, h + 1, {gray, gray, gray, balpha}, 6)
		end

		renderer.text(p_x + offset - 18, p_y + h / 2 - text_size.y / 2 + (default and 0 or 1), r, g, b, alpha, "", nil, text_margin)
		renderer.texture(log0, log_x, log_y, lx, ly, r, g, b, alpha)
	end

    client.set_event_callback("paint_ui", function()
        notification_settings:handler()
    end)

    return notification_settings
end)()

local cfgs = {
	upd_name = function(self)
		local index = menu.home.configs.list()
		local i = 0

		local configs = database.read(databas.cfgs) or {}

		for k, v in pairs(configs) do
			if index == i then
				return menu.home.configs.name(k)
			end

			i = i + 1
		end

		return nil
	end,

	upd_cfgs = function(self)
		local names = {}
		local configs = database.read(databas.cfgs) or {}

		for k, v in pairs(configs) do
			table.insert(names, k)
		end

		if #names > 0 then
			menu.home.configs.list:update(names)
		end

		self:upd_name()
	end,

	export = function(self, notify33)
		local cfg = pui.setup({menu.home, menu.antiaim, menu.options})

		local data = cfg:save()
		local encrypted = json.stringify(data)

		if notify33 then
			notify.create_new({{"Config "}, {"exported", true}})
		end

		return encrypted
	end,

	import = function(self, encrypted, norit)
		local success, data = pcall(json.parse, encrypted)

		if not success then
			notify.create_new({{"Cfg data invalid, "}, {"try other", true}})
			return
		end

		local cfg = pui.setup({menu.home, menu.antiaim, menu.options})

		cfg:load(data)

		if norit then 
			notify.create_new({{"Config "}, {"imported", true}})
		end
	end,

	send_another = function(self)
		local state = menu.antiaim.builder.state_curr:get()
		local team = menu.antiaim.builder.team_cur:get()
		local team_a = team == "ct" and "t" or "ct"
	
		local cfg_source = pui.setup({menu.antiaim.builder.states[team][state]})
		local data = cfg_source:save()
	
		local cfg_target = pui.setup({menu.antiaim.builder.states[team_a][state]})
		cfg_target:load(data)
	
		notify.create_new({{"Send "}, {state:lower(), true}, {" from "}, {team:upper(), true}, {" to "}, {team_a:upper(), true}})
	end,

	export_state = function(self)
		local state = menu.antiaim.builder.state_curr:get()
		local team = menu.antiaim.builder.team_cur:get()

		local cfg = pui.setup({menu.antiaim.builder.states[team][state]})

		local data = cfg:save()
		local encrypted = json.stringify(data)

		notify.create_new({{"State "}, {state:lower(), true}, {" exported in "}, {team, true}})
		clipboard.set(encrypted)
	end,

	import_state = function(self, encrypted)
		local success, data = pcall(json.parse, encrypted)

		if not success then
			notify.create_new({{"This not "}, {"config state, ", true}, {"import other"}})
			return
		end

		local state = menu.antiaim.builder.state_curr:get()
		local team = menu.antiaim.builder.team_cur:get()

		local config = pui.setup({menu.antiaim.builder.states[team][state]})
		config:load(data)

		notify.create_new({{"State "}, {state:lower(), true}, {" imported to "}, {team, true}})
	end,

	save = function(self)
		local name = menu.home.configs.name()

		if name:match("%w") == nil then
			notify.create_new({{"Pls type other "}, {"name", true}})
			return print("Inval. name")
		end

		local data = self:export(false)

		notify.create_new({{"Config "}, {name, true}, {" saved"}})

        local configs = database.read(databas.cfgs) or {}
		
        configs[name] = data

        database.write(databas.cfgs, configs)
		self:upd_cfgs()
	end,

	trash = function(self)
		local name = menu.home.configs.name()

		if name:match("%w") == nil then
			notify.create_new({{"Pls select "}, {"config", true}})
			return
		end
	
		local configs = database.read(databas.cfgs) or {}
	
		if configs[name] then
			configs[name] = nil

			database.write(databas.cfgs, configs)
			notify.create_new({{"Config "}, {name, true}, {" deleted"}})
		else
			notify.create_new({{"Config "}, {name, true}, {" not found"}})
		end
	
		self:upd_cfgs()
	end,
	
	load = function(self)
		local name = menu.home.configs.name()

		if name:match("%w") == nil then
			notify.create_new({{"Pls select "}, {"config", true}})
			return
		end

		local configs = database.read(databas.cfgs) or {}
		self:import(configs[name])

		notify.create_new({{"Loaded config "}, {name, true}})
	end,
}

cfgs:upd_cfgs()

menu.home.configs.list:set_callback(function()
	cfgs:upd_name()
end)

-- aaaa cfgsgsgs
menu.home.configs.export:set_callback(function()
	local data = cfgs:export(true)

	clipboard.set(data)
end)

menu.home.configs.import:set_callback(function()
	cfgs:import(clipboard.get(), true)
end)

menu.home.configs.save:set_callback(function()
	cfgs:save()
end)

menu.home.configs.load:set_callback(function()
	cfgs:load()
end)

menu.home.configs.delete:set_callback(function()
	cfgs:trash()
end)
-- aa  
menu.antiaim.builder.sendteam:set_callback(function()
	cfgs:send_another()
end)

menu.antiaim.builder.export:set_callback(function() 
	cfgs:export_state()
end)

menu.antiaim.builder.import:set_callback(function() 
	cfgs:import_state(clipboard.get())
end)

local defensive = {
	check = 0,
	defensive = 0,
	sim_time = globals.tickcount(),
	active_until = 0,
	ticks = 0,
	active = false,

	activatee = function(self)
    	local me = entity.get_local_player()

		if me == nil and not entity.is_alive(me) then 
			return 
		end

    	local tickcount = globals.tickcount()
    	local sim_time = entity.get_prop(me, "m_flSimulationTime")
    	local sim_diff = toticks(sim_time - self.sim_time)

    	if sim_diff < 0 then
    	 	self.active_until = tickcount + math.abs(sim_diff)
    	end

		self.ticks = render:clamp(self.active_until - tickcount, 0, 16)
    	self.active = self.active_until > tickcount

		self.sim_time = sim_time
	end,

	normalize = function(self)
		local me = entity.get_local_player()
		local tickbase = entity.get_prop(me, "m_nTickBase")

		self.defensive = math.abs(tickbase - self.check)
		self.check = math.max(tickbase, self.check or 0)
	end,

	reset = function(self)
		self.check = 0
		self.defensive = 0
	end
}

local antiaim = {
	manual_side = 0,

	get_manual = function(self)
		local me = entity.get_local_player()

		if me == nil or not menu.antiaim.general.manual.turn:get() then
			return
		end

		local left = menu.antiaim.general.manual[1]:get()
		local right = menu.antiaim.general.manual[2]:get()
		local forward = menu.antiaim.general.manual[3]:get()

		if self.last_forward == nil then
			self.last_forward, self.last_right, self.last_left = forward, right, left
		end

		if left ~= self.last_left then
			if self.manual_side == 1 then
				self.manual_side = nil
			else
				self.manual_side = 1
			end
		end

		if right ~= self.last_right then
			if self.manual_side == 2 then
				self.manual_side = nil
			else
				self.manual_side = 2
			end
		end

		if forward ~= self.last_forward then
			if self.manual_side == 3 then
				self.manual_side = nil
			else
				self.manual_side = 3
			end
		end

		self.last_forward, self.last_right, self.last_left = forward, right, left

		if not self.manual_side then
			return
		end

		return ({-90, 90, 180})[self.manual_side]
	end,

	get_safehead = function(self)
		local target = client.current_threat()
		local me = entity.get_local_player()

		if target then
			local weapon = entity.get_player_weapon(me)
			if helpers:in_air(me) and weapon and (entity.get_classname(weapon):find('Knife') or entity.get_classname(weapon):find('Taser')) then
				return true
			end
		end
		
		return false
	end,

	get_backstab = function (self)

		if not menu.antiaim.general.backstab.turn:get() then 
			return 
		end

		local me = entity.get_local_player()
		local target = client.current_threat()

		if me == nil or not entity.is_alive(me) then 
			return false 
		end

		if not target then
			return false
		end

		local weapon_ent = entity.get_player_weapon(target)

		if not weapon_ent then
			return false
		end

		local weapon_name = entity.get_classname(weapon_ent)

		if not weapon_name:find('Knife') then
			return false
		end

		local lpos = vector(entity.get_origin(me))
		local epos = vector(entity.get_origin(target))
		local dist = menu.antiaim.general.backstab[1]:get()

		return epos:dist2d(lpos) < dist
	end,

	get_defensive = function(self, data)
		local trigs = data.defpitchtriggers

		local target = client.current_threat()
		local me = entity.get_local_player()

		if helpers:contains(trigs, "Always") then 
			return true 
		end

		if helpers:contains(trigs, "Tick") then
			local tick = data.defpitchtrigger_t*2

			if globals.tickcount() % 32 >= tick then 
				return true
			end
		end

		if helpers:contains(trigs, "Weapon switch") then 
			local nextattack = math.max(entity.get_prop(me, 'm_flNextAttack') - globals.curtime(), 0)

			if nextattack / globals.tickinterval() > defensive.defensive + 2 then
				return true
			end
		end

		if helpers:contains(trigs, "On hittable") then 
			return true 
		end
	end,

	side = 0,
	cycle = 0,
	yaw_random = 0,

	skitter = {
		counter = 0,
		last = 0,
	},

	def = {
		yaw = {
			spin = 0,
			jitter_side = 0,
			random = 0
		},
		pitch = {
			spin = 0,
			jitter_side = 0,
			random = 0
		},
	},

	brute = {
		on = false,
		time = 0, -- globals.curtime()
		time_sw = false,
	},

	set = function(self, cmd, data)
	
		local ref = {
			pitch_mode = refs.aa.pitch[1],
			pitch = refs.aa.pitch[2],
			yaw_mode = refs.aa.yaw[1],
			yaw = refs.aa.yaw[2],
			yaw_base = refs.aa.yaw_base[1],
			jitter_type = refs.aa.yaw_jitter[1],
			jitter_yaw = refs.aa.yaw_jitter[2],
			body_mode = refs.aa.body_yaw[1],
			body = refs.aa.body_yaw[2],
			body_f = refs.aa.body_free[1],
		}

		if menu.antiaim.antibf.enable:get() then
		
			local timer_enabled = menu.antiaim.antibf.trigger.timer.turn:get()
			local interval = menu.antiaim.antibf.trigger.timer[1]:get()
			local notifys = menu.antiaim.antibf.trigger.notify:get()
		
			if timer_enabled then
				if self.brute.time == 0 then
					self.brute.time = globals.curtime()
				end
		
				if globals.curtime() - self.brute.time >= interval then
					self.brute.time = globals.curtime()

					if notifys then 
						notify.create_new({{"Bruteforce "}, {"switch to ", true}, {"[jitter]:"}, {interval, true}})
					end

					self.brute.on = not self.brute.on
				end
			else
				-- block empty
			end
		else
			self.brute.on = false
		end

		local is_delayed = true
		local current_side = self.side
		local manual = self:get_manual()

		local antibf = menu.antiaim.antibf.custom
		local yaw_delay = math.max(1, self.brute.on and antibf.jitter.delay:get() or data.yaw_delay)
		
		if globals.chokedcommands() == 0 and self.cycle == yaw_delay then
			current_side = current_side == 1 and 0 or 1
			is_delayed = false
		end
	
		local target = client.current_threat()
		local me = entity.get_local_player()

		local pitch = 90
		local yaw_offset = 0
		local general_yaw = self.brute.on and antibf.jitter.yaw:get() or data.yaw_value
		local body_yaw = self.brute.on and antibf.jitter.body.turn:get() or data.body_type
		local jitter_yaw = self.brute.on and antibf.jitter.type:get() or data.yaw_type
		local bodyy
	
		if body_yaw == "Off" then
			bodyy = "Off"
		elseif body_yaw == "Opposite" then
			bodyy = "Opposite"
		elseif body_yaw == "Static" then
			bodyy = "Static"
		else
			bodyy = "Static"
		end
	
		if jitter_yaw == 'Offset' then
			if current_side == 1 then
				yaw_offset = general_yaw
			end
		elseif jitter_yaw == 'Center' then
			yaw_offset = (current_side == 1 and -general_yaw or general_yaw)
		elseif jitter_yaw == 'Random' then
			local rand = (math.random(0, general_yaw) - general_yaw/2)
			if not is_delayed then
				yaw_offset = yaw_offset + rand

				self.yaw_random = rand
			else
				yaw_offset = yaw_offset + self.yaw_random
			end
		elseif jitter_yaw == 'Skitter' then
			local sequence = {0, 2, 1, 0, 2, 1, 0, 1, 2, 0, 1, 2, 0, 1, 2}

			local next_side

			if self.skitter.counter == #sequence then
				self.skitter.counter = 1
			elseif not is_delayed then
				self.skitter.counter = self.skitter.counter + 1
			end

			next_side = sequence[self.skitter.counter]

			self.skitter.last = next_side

			if body_yaw == "Jitter" then
				current_side = next_side
			end

			if next_side == 0 then
				yaw_offset = yaw_offset - math.abs(general_yaw)
			elseif next_side == 1 then
				yaw_offset = yaw_offset + math.abs(general_yaw)
			end
		end
	
		local add_left = (self.brute.on and antibf.jitter.lef:get() or data.yaw_l)
		local add_right = (self.brute.on and antibf.jitter.rig:get() or data.yaw_r)

		yaw_offset = yaw_offset + (current_side == 0 and add_right or (current_side == 1 and add_left or 0))
	
		local body_yaw_angle = 0
		local body_static = self.brute.on and antibf.jitter.body[1]:get() or data.body_type_static -- 1234123241234123
		local safe_head = false

		if body_yaw == "Static" then
			if body_static == "Left" then
				body_yaw_angle = -90
			elseif body_static == "Right" then
				body_yaw_angle = 90
			end
		else
			body_yaw_angle = (current_side == 2) and 0 or (current_side == 1 and 90 or -90)
		end

		local defensive_value = 0
		local backstb = self:get_backstab()
		local edge_y = menu.antiaim.general.edge_yaw:get() and menu.antiaim.general.edge_yaw:get_hotkey()

		if self:get_defensive(data) then 
			cmd.force_defensive = true
			if defensive.ticks * defensive.defensive > 0 then
				defensive_value = math.max(defensive.defensive, defensive.ticks)
			end
		end

		refs.aa.edge_yaw[1]:override(edge_y)
		refs.aa.freestand[1]:override(false)
		ui.set(refs.bindfs[2], "Always on")

		if menu.antiaim.general.backstab.turn:get() and backstb then 
			yaw_offset = yaw_offset + 180
		end

		if menu.antiaim.general.safe_head:get() then -- self:get_safehead()
			if target and self:get_safehead() then
				yaw_offset = 0
				current_side = 2
				safe_head = true
			end
		end

		if manual then 
			yaw_offset = manual
		elseif menu.antiaim.general.fs.turn:get() and menu.antiaim.general.fs.turn:get_hotkey() then 
			refs.aa.freestand[1]:override(true)
			if menu.antiaim.general.fs[1]:get() then 
				yaw_offset = 0
				current_side = 0
			end
		end

		if data.defensive_yaw ~= "Off" and defensive_value > 0 and not self.brute.on and not safe_head then 
			local yaw_static = data.defyawstat
			local pitch_static = data.defpitchstat

			if data.defensive_yaw == "Static" then 
				yaw_offset = yaw_static
			elseif data.defensive_yaw == "Random" then 
				local random = math.random(-yaw_static, yaw_static)

				yaw_offset = random
			elseif data.defensive_yaw == "Spin" then 
				local l = data.defyawspinleft
				local r = data.defyawspinrgt
				local upd = data.defyawspin
				local sped = data.defyawspinspd

				self.def.yaw.spin = self.def.yaw.spin + upd * (sped / 5)

				if self.def.yaw.spin >= r then 
					self.def.yaw.spin = l
				end

				yaw_offset = self.def.yaw.spin
			elseif data.defensive_yaw == "Jitter" then 
				local delay = data.defyawjittrtick*3
				local degre = data.defyawjittr
				local randm = data.defyawjittrand
				local random = math.random(-randm, randm)

				if delay == 1 then 
					self.def.yaw.jitter_side = self.def.yaw.jitter_side == -1 and 1 or -1
				else 
					self.def.yaw.jitter_side = (globals.tickcount() % delay*2)+1 <= delay and -1 or 1
				end

				yaw_offset = self.def.yaw.jitter_side * degre + random
			elseif data.defensive_yaw == "Random static" then 
				local delay = data.defyawrandomt
				local tick = (globals.tickcount() % 32)

				if tick >= 28 + math.random(0,delay) then 
					self.def.yaw.random = math.random(-yaw_static, yaw_static)
				end

				yaw_offset = self.def.yaw.random
			end

			-- </> Pitch

			if data.defpitch == "Static" then 
				pitch = pitch_static
			elseif data.defpitch == "Random" then 
				local random = math.random(pitch_static, data.defpitchrand)
				
				pitch = random 
			elseif data.defpitch == "Spin" then 
				local lock = data.defpitchrand
				local sped = data.defpitchspint
				local upd = data.defpitchspinupd

				self.def.pitch.spin = self.def.pitch.spin + upd * (sped / 15)

				if self.def.pitch.spin > lock then 
					self.def.pitch.spin = pitch_static
				end
				
				pitch = self.def.pitch.spin
			elseif data.defpitch == "Jitter" then 
				local delay = data.defpitchjittrtick*3
				local degre = data.defpitchjittr
				local randm = data.defpitchjittrrand
				local random = math.random(-randm, randm)

				if delay == 1 then 
					self.def.pitch.jitter_side = self.def.pitch.jitter_side == -1 and 1 or -1
				else 
					self.def.pitch.jitter_side = (globals.tickcount() % delay*2)+1 <= delay and -1 or 1
				end

				pitch = (self.def.pitch.jitter_side == -1 and pitch_static or degre) + random
			elseif data.defpitch == "Random static" then 
				local delay = data.defpitchrand_tick
				local tick = (globals.tickcount() % 32)

				if tick >= 28 + math.random(0,delay) then 
					self.def.pitch.random = math.random(-pitch_static, pitch_static)
				end

				pitch = self.def.pitch.random
			end
		end

		local warp = menu.antiaim.general.warmup_aa:get()

		if warp then 
			local ad = menu.antiaim.general.warmup_aa_add
			local rules = entity.get_game_rules()
			local is_warmup = entity.get_prop(rules, 'm_bWarmupPeriod') == 1
			local active = false

			if ad:get("On warmup") and is_warmup then 
				active = true
			end

			if not active and ad:get("Enemies no alive") then
				local player_resource = entity.get_player_resource()
				local enemies_alive = false

				if player_resource then
					for i = 1, 64 do
						if entity.get_prop(player_resource, 'm_bConnected', i) == 1 then
							if entity.is_enemy(i) and entity.is_alive(i) then
								enemies_alive = true
								break
							end
						end
					end
				end

				active = not enemies_alive and (is_warmup or globals.curtime() < (entity.get_prop(rules, 'm_flRestartRoundTime') or 0))
			end

			if active then 
				yaw_offset = (globals.curtime() * 1700) % 360
				pitch = 0
			end
		end

		refs.aa.enabled:override(true)

		ref.pitch_mode:override(pitch == "default" and pitch or "custom")
		ref.pitch:override(helpers:normalize_pitch(type(pitch) == "number" and pitch or 0))
		ref.yaw_base:override("At targets")
		ref.yaw_mode:override(180)
		ref.yaw:override(helpers:normalize_yaw(yaw_offset))
		ref.jitter_type:override("Off")
		ref.jitter_yaw:override(0)
		ref.body_mode:override(bodyy)
		ref.body:override(body_yaw ~= "Off" and body_yaw_angle or 0)
		ref.body_f:override(false)

		if globals.chokedcommands() == 0 then
			if self.cycle >= yaw_delay then
				self.cycle = 1
			else
				self.cycle = self.cycle + 1
			end
		end
	
		self.side = current_side
	end,

	run = function(self, cmd)
		local me = entity.get_local_player()

		if not entity.is_alive(me) then
			return
		end

		local team = helpers:get_team()
		local state = helpers:get_state()

		local data = {}

		for k, v in pairs(menu.antiaim.builder.states[team][state]) do
			data[k] = v()
		end

		self:set(cmd, data)
	end
}

menu.servers.copy:set_callback(function()
	clipboard.set(phobia.ui.servers.selected)
	
	notify.create_new({{phobia.ui.servers.selected, true}})
end)

menu.servers.connect:set_callback(function()
	client.exec("connect " .. phobia.ui.servers.selected)
	notify.create_new({{"Connecting in "}, {phobia.ui.servers.selected, true}})
end)

menu.servers.retry:set_callback(function()
	client.exec("disconnect; retry")
end)

local hud_water = drag.new(name .. ":water:", 30, 30)
local hud_debug = drag.new(name .. ":debug.panel:", 30, 70)

local logo = renderer.load_png("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A\x00\x00\x00\x0D\x49\x48\x44\x52\x00\x00\x00\x48\x00\x00\x00\x0D\x08\x06\x00\x00\x00\x0A\x78\x28\x98\x00\x00\x00\x01\x73\x52\x47\x42\x00\xAE\xCE\x1C\xE9\x00\x00\x00\x04\x67\x41\x4D\x41\x00\x00\xB1\x8F\x0B\xFC\x61\x05\x00\x00\x00\x09\x70\x48\x59\x73\x00\x00\x0E\xC3\x00\x00\x0E\xC3\x01\xC7\x6F\xA8\x64\x00\x00\x07\xFD\x49\x44\x41\x54\x48\x4B\xCD\x96\x4B\x6C\x5C\x57\x19\x80\xEF\x73\x66\x3C\xF1\x24\x33\xB6\x13\xB7\xB2\x93\xDA\xA4\xB6\x1B\x63\x37\xB6\x9B\x49\x42\x4C\x1C\x24\x68\x91\xD8\xF0\x90\xA8\xA8\xAA\xAA\xE9\x02\x21\x36\x2C\x2A\x75\x03\xAC\x10\xDD\xB0\x20\x12\x42\x48\xB0\x28\x12\xAD\x8A\x58\xB5\x91\xE8\xA2\x05\xF5\x11\x37\x75\xFC\x18\x9B\x26\x75\x12\xA7\x69\x92\x3A\x76\x1C\x87\xD8\x33\xE3\xB1\x67\xEE\xBD\xE7\xDC\x7B\xF9\xFE\xE9\x60\x82\x84\xAA\x4A\x45\x88\x23\xFD\x3A\xE7\x7F\x3F\xCE\x7F\x1E\xC6\x7F\x6B\x84\x51\xD4\x19\x86\xE1\xCB\x51\x14\x5D\x01\x7E\x0A\xA4\x1B\xAC\xCF\x35\xC2\x28\x34\xB1\xFB\x55\xAD\xF5\x34\xF3\xE5\x28\x0A\xC7\xE2\x38\xB4\x1A\xEC\x4F\x1D\xC8\xB7\xA3\x77\x0A\xB8\xCD\xFA\x37\xC4\xD8\xD6\x60\x19\x4A\xA9\x04\xF4\xEF\x6B\x1D\xCE\xC3\xFB\x21\x90\x6A\xB0\xFE\x6D\x7C\x26\x47\x9F\x65\x68\xA5\x4A\x38\xF5\x54\x10\x78\x5A\x69\x71\xAA\x1A\xAC\xCF\x35\x6C\xCB\x8E\x49\xE4\x16\xB6\x25\xA9\x15\xA5\xC2\x25\xD3\xB4\xA3\x06\xFB\x53\x07\xF2\x15\xAD\xD5\x06\x73\x5A\x69\x75\x35\xD4\xBA\xDA\x60\x19\x31\x55\x66\xDC\x0A\xB5\xBA\x0C\xBD\x1C\x45\xF1\x7F\xAC\x85\xD9\x98\xEB\xA3\x58\x2C\x26\xD9\xF9\xA4\x69\x9A\xA1\x65\x59\x35\x66\x5B\x70\xD9\x45\xC6\x96\x69\x58\x2E\x86\x1D\xCB\x32\x6B\xB9\x5C\xAE\x1E\x64\xB9\x5C\x76\xA4\xFA\xB6\xE3\xB4\xE2\xF5\x57\xC8\x25\xD1\x7D\xD6\x75\xDD\x4B\xBE\xEF\x4B\x07\xA4\xE0\xBB\xA6\x61\x2A\xCB\xB4\xBC\x5C\x4B\x2E\x2E\x15\x4B\x29\xE8\x11\xB2\xF5\xA0\x6C\xDB\x56\xE2\x07\xB0\x91\xD1\x51\x1C\x39\xF0\x34\x76\x7C\x78\xB8\x8C\x8F\x02\xBF\x05\xFF\x4B\x6C\x18\xCF\x2B\x76\x01\x7B\x7E\x4B\x4B\xCB\xF6\x26\x10\x87\x74\x84\x74\x41\x84\x4E\x2D\x9B\xCD\x86\xD0\x5A\xD1\xFB\x09\xB6\xBE\x05\x3C\x47\x21\xDE\x32\x4C\xB3\xD4\xB0\x29\xB9\xA4\x25\x5E\xF0\x8A\xEB\x26\x6A\xB5\x5A\xD5\xA0\x43\x9B\xE2\xD8\x40\x00\x43\x51\x68\xD7\x0B\xB4\xBA\xBA\xDA\x8C\x60\x0F\x82\xF7\xA1\x34\x02\x10\x9C\xF9\x1A\x55\xDD\x0F\x7B\x14\x90\xCA\x9F\x86\x3E\xC6\x9C\x23\xAF\xDF\xA3\xBC\xC8\xBA\x0D\xBD\xA3\x14\x67\x37\xC5\xC9\x91\xF4\x33\xB6\x65\xBD\xEE\x38\xEE\xCF\x3D\xCF\x93\x02\x7C\x01\x9B\x5D\x24\x3E\x88\xAE\x0F\xFE\x2A\xEB\x0E\xE6\xE3\x24\x7B\x9E\xC2\xED\x67\x5D\x02\x16\xE0\x7F\x0D\x7B\x19\xD6\x37\x58\xEF\x05\xD6\x59\xBF\x88\xFE\x0A\x3A\x3F\x80\xF7\x9C\x65\xD9\xA7\x74\xA8\xD6\x58\x8F\x50\xC8\x3F\x9B\x96\x39\x11\xEA\x90\x54\x8C\x2E\xCB\xB6\x0F\x5A\xA6\xD9\x0C\xDE\x09\xE1\x6D\x74\x27\xE8\x93\x3E\x78\xBF\x60\xDD\xC3\x7C\x96\x3D\x51\xE8\xFC\x01\xFC\x02\xF6\x1F\x05\xF2\x14\x6C\x95\x98\x5F\xC4\x47\x19\xFC\xA0\x65\x5B\xFD\xF0\x93\x61\x18\xED\x27\xA7\x5D\xF6\xF2\xF2\x72\x0A\xE6\x11\x23\x36\xBE\x8B\x61\xD9\xED\x1E\x70\x76\xCC\xB8\xC4\xDC\x03\xFE\x34\xC6\x9B\x50\xAA\xE2\xFC\x71\x9C\x7C\x29\x36\xA2\x02\xF4\x65\xF8\xE2\xE4\x09\xAA\xBC\x04\xDE\xC7\x0E\x0E\x52\xD4\x57\x69\xE9\xF3\x3A\x0C\x8F\xC3\xFB\x06\xBA\xD2\x61\x07\x58\x1F\x61\x8D\xCD\xF0\x2B\xE0\x4F\x8A\x4D\x66\xD1\x6F\xA2\x1B\x56\xD1\x7D\x12\x7B\x07\xA1\x97\xA1\x8F\xB2\x3E\x0C\x6F\x1E\x58\xC4\xEF\x49\xFC\x3E\x44\xBF\x4D\x30\x9F\x80\xFF\x1D\xE8\x1B\x71\x14\xCF\xA2\xD7\xC5\xFA\x29\x62\xEF\x46\x77\x9E\xA3\xF4\x4D\x74\x07\x28\xCE\x39\xE6\x07\xB9\x63\x9E\x88\xE3\xA8\x02\xBF\x48\x4C\x8F\xB1\x96\xAE\x9A\x85\x77\x1C\x3B\xF0\xE2\x2D\xF4\xC6\xB1\xB3\x0F\xDA\x49\xF0\x66\x70\x8E\xA6\x7E\x9A\x75\xCE\xE2\xBE\xE8\x09\x82\xE0\xD9\x40\x05\xED\x81\xEF\x55\x38\x16\x3B\x60\xBE\x0B\x5C\xA7\x0B\x1C\x78\xB6\xE2\xEC\x82\x6F\xFA\x81\x6F\x20\x27\x85\xDA\x54\x81\x7A\x38\x08\xFC\x93\xB4\x3B\x0D\xEF\x17\xE8\xCF\x24\x85\xB9\x83\xDC\x02\x7A\x7D\xE8\x3D\x03\xDE\xE5\x7B\xFE\x26\x36\x53\xF8\x79\x87\x80\x3E\xF2\xFD\x20\x80\xEE\x20\x17\x10\x10\x9D\x18\xBD\xE2\x21\x84\x6D\x1B\xFA\xFB\xD0\x5F\x42\xFE\x1C\x90\xC4\x46\x16\xDA\x6E\x78\x87\x48\xBC\xCA\xAE\xAE\x41\x97\x18\x63\x78\x65\x78\x19\xE6\xA7\x80\x47\x09\x62\x0A\xBF\x8B\xF0\xD2\xE0\xDD\xF0\xDA\x59\x0F\x12\x5B\x42\x29\xFD\x0A\xFC\xDF\xF9\x9E\x77\x13\x47\xFB\xE0\x35\xC1\x4B\x20\xC7\x15\xA5\x2E\x42\x4F\x80\x7F\x1B\x7C\x08\xDE\x6C\xAD\x5A\x2D\x13\x52\x12\xE6\x19\xCB\x57\xC1\x63\x10\xFB\x09\xDE\xA3\xC2\x19\x2A\x3C\x41\x20\x7F\x42\x81\x82\x04\x7D\x64\xC3\x3D\xA6\xCE\x53\x80\x2D\x68\x2D\xC8\x5E\x22\xD8\xBF\x53\x96\x31\x52\xED\x21\xF1\xF7\x09\x8C\xA0\xFC\x6E\xE4\x6E\x90\xE0\x3A\x32\x27\x08\xE8\x8B\x52\x04\x8E\x5D\x9A\x22\x8C\x63\xF7\x25\x6C\x48\x72\x5D\xF0\x69\xA4\x70\x82\xAE\x7C\x81\xF5\xB8\xEF\x7B\x9D\xD4\x59\xEE\x90\xBF\x05\x7E\xB0\x41\xA0\x09\x7C\x48\x27\x89\xBC\x14\xFB\x7E\xE4\xAE\x05\xBE\xCF\xA6\xF9\x7B\x90\xDD\xE2\x3E\xB9\x82\xDF\x0E\xE8\xC7\x80\x35\x64\x2F\x23\xDB\x41\xBC\xBB\xB1\xC3\x65\xAE\xA5\x08\x07\xE0\xDD\xD5\xA1\x9E\x61\x6D\x61\xC7\x85\xB7\x0C\xCD\x05\x1F\x64\xAE\xA1\x77\x49\xEC\xC0\x3B\x02\x8E\x9E\xBA\x43\x11\xFB\x88\x3F\xD2\x2A\x2C\x88\xD2\x21\x84\x65\xF7\xE7\x68\xCB\x37\x49\xE6\x74\x18\xEA\x6B\xD0\x73\x08\x75\x03\x4B\x18\x1D\xC7\x88\xE0\xAD\xAC\xAF\x11\x20\x2A\xC1\x41\x74\x76\xD0\x5D\x4B\x14\x2A\x0F\x3C\x40\x81\xAF\x52\x28\x03\x5D\xBA\x2B\x70\xE0\x9F\xA7\x5D\xDF\xA4\x55\x4F\x13\xF8\x22\xC9\xEF\x40\x4E\x82\x5E\x02\x9F\xC1\xD6\x16\x76\xA5\x4B\x1F\x84\xC6\x76\xEA\x0F\xE9\x26\xD9\x84\x4E\xD6\x1F\x34\x3A\x8E\x2E\xA0\x60\x4A\xBD\x45\x81\x51\x43\x56\xAB\xBB\xE2\x97\x20\xB2\x14\x4D\x8A\x74\x1D\xFC\x2E\xB2\xBD\xC4\xD8\x8C\xEE\x24\x71\x98\xD0\x7B\x80\x9B\x6C\x86\xD8\x79\x08\x7A\x96\x23\x37\x0E\x4D\xBA\xB3\x97\x79\x1D\x9A\xBC\x90\x62\x43\x36\x6E\x15\xBD\x9D\xF0\x8E\xE2\x68\x93\xC2\x2E\x59\x18\xB4\x50\x6E\xDE\xDA\xDA\x1A\x28\x96\x4A\xFD\x04\x71\x02\xC1\x1E\x02\x1F\x80\xDE\xCE\xBA\x00\xDC\x40\xA9\x9F\x8E\x72\x28\xA0\x05\xB4\x61\x28\x4D\x80\x29\x60\x18\x27\x5F\xA6\x68\x3B\x90\xCB\x70\x07\xB5\x63\xD3\x94\xE0\xB1\xD9\xCF\xCB\x38\x50\xAD\x56\xE5\xDE\x78\x80\xC4\x0E\xD0\x2D\x12\xCC\x3B\xD8\xFB\x18\x3D\x03\x3F\x9D\xF8\x19\x80\x76\x07\xA0\x7B\x7C\xE9\x88\x52\xA4\xA3\x3F\x22\xA3\x3D\xAF\x96\x07\x5F\x64\xD3\xCE\xD4\x3C\xAF\x1B\xD9\x5D\xE8\x55\x88\xA1\x85\x39\x26\x11\x1A\x57\x6D\x12\xF7\x5E\x8A\xF7\x30\x7E\x64\x93\x5F\xC7\xFF\x1E\xF4\xE5\x1F\xF4\x01\xBC\x1C\x76\x8F\x7C\xC2\x0B\xDF\x00\xEF\x05\xCF\xC1\xDB\x60\xF3\x3A\xD1\xDF\x89\xBC\x74\x5C\x37\x1B\xF8\x75\xF4\x0E\xC0\xE3\xDB\x14\xF5\xCA\x33\x7B\x1A\xA5\x39\x84\x7A\xA8\xB4\x5C\xA0\xF2\xEF\x28\xE2\xD6\x85\x76\x93\xE3\x36\xCF\x5C\x82\x76\x1B\xB8\x02\xFF\x3A\xCF\xF0\x0A\x86\x27\xC1\x2F\x02\xB2\xF3\x57\xA8\xF6\x3C\xF3\xC7\xF0\x17\xA3\x38\xFE\x2B\xB3\xE8\x75\x31\x1F\x03\x2C\x60\x0D\xC7\x29\x64\xAE\xE1\x78\x0A\xDC\xAB\x54\x2A\x96\xC8\x40\xEF\xE0\x5E\xE3\xD4\x68\x1E\x88\xFA\x25\xF9\x1A\xAF\xDC\xBB\x14\x03\xB6\x36\xB8\x0B\xA6\x63\xC3\xBC\xC9\x5C\x41\xEA\x43\x74\x17\x88\x75\x99\x57\xEB\x22\x71\xBC\x81\x9E\x19\x47\x91\xBC\xBE\x0B\x1C\xDB\x5F\x03\x57\xC1\xAB\xF8\x59\x80\xC7\x2D\xA0\xE4\x9B\x70\x1D\x78\x81\x57\x71\x11\x5D\x3A\x27\x94\x7F\xD1\x2A\xB6\x56\xA1\x4B\x5E\xD3\x88\xD6\xD0\x29\xB1\x96\xBC\x3E\x02\x96\xCC\x0B\x17\x2E\x48\x17\xC8\xAE\x36\x25\x5C\xB7\xC6\x7F\xE0\xB6\xED\x58\x5E\xB5\x5A\x93\x56\x6F\x4D\x37\xA5\xD7\xDC\x84\xB3\x4E\xD5\x5B\x28\x56\x5B\x3A\x9D\x5E\x21\xB0\x32\xA1\x67\xD8\xB1\xFB\x1C\xDB\x29\xF1\x42\x48\x51\x77\xF1\xF7\x29\x3B\x8E\x73\x17\x87\x29\x92\xBE\x9F\xB6\x4F\x27\x13\x89\x4D\x68\x77\x08\x8C\xBB\xAF\x9A\xC3\x66\x7B\x26\xD3\xBC\x9C\x4A\x25\x37\xD7\xD7\x4B\x5C\x84\xFA\xC7\x04\xF4\x78\x22\x91\x38\x95\x4C\x26\xDF\xE6\xF9\xDE\xB4\x1D\x7B\x6D\x70\x70\xB0\x36\x53\x28\x34\x71\x84\xF6\x51\xAC\x5A\x6B\x5B\xDB\xAD\x8D\x0D\xFE\x3A\x4A\xEF\x85\x4F\x9C\xEE\x0A\xBE\x35\x7E\x5A\x69\xA1\xAC\xE3\x3A\x7C\xD6\xAC\xF5\x4C\x26\xB3\x81\x1F\xF9\x45\xCB\xEB\xBC\x07\xFB\x2E\xFA\xF2\xD7\x2A\xA1\x53\x1C\x18\x18\x08\x0B\x33\x85\x0C\xF4\x0E\xEC\x78\xF8\x5C\xA6\x58\x36\x1B\xBC\x9B\x57\x31\x41\xBC\x45\x8E\x79\x96\xA7\xDF\x70\x13\xEE\xD2\xF6\x47\x71\x62\x62\xC2\x44\xC1\x38\x9C\x3F\x4C\xBE\x9F\x8C\xC9\xC9\x49\x53\x8C\xE7\xF3\xF9\x3A\x6D\x7A\x7A\xCA\xCC\xDF\xC3\xBF\x77\x4C\x4D\x4E\x99\x24\x69\x0C\x0D\x0F\x6D\xF3\xCF\x9D\x9B\x84\xE6\x1A\x23\x23\x23\xDB\xB4\xB3\x67\xCF\x9A\xA3\xA3\xA3\x71\xA1\x50\x30\xB7\xAA\xD5\x5E\x8E\xD8\x2F\x29\xF8\x5E\x0A\xF6\xA3\x4C\x66\xE7\x19\x8A\x1B\x0F\x0D\xFD\xCB\xC6\x7B\xC8\xD3\x5C\xC6\xD8\xD8\x58\x9D\x36\x37\x3B\xCB\xAF\xC0\x34\x86\x87\x87\xB7\x65\x0A\x85\x99\x7A\x1E\x8F\x3C\x72\x68\x9B\xF6\xCF\x31\x37\x37\x27\xC7\xDD\x48\xA5\x52\xC6\xBD\x76\xA7\xA6\xA6\x68\x34\x73\x3B\x37\x19\xD3\xD3\xD3\xE4\x97\x8F\xEB\x79\xF3\xA7\xC8\x1F\xCE\xC7\xDB\x05\xFA\x5F\x0F\x02\xCC\x72\x3F\xFD\x8C\xD7\xF0\x7B\xF2\x7B\x26\x81\xE7\x53\xA9\xA6\x97\x47\x47\x8F\x15\x1B\x22\xFF\x07\xC3\x30\xFE\x01\x33\xE1\xDC\x07\x2A\xB2\xDB\xF9\x00\x00\x00\x00\x49\x45\x4E\x44\xAE\x42\x60\x82",
72, 13)

local cals = {
	menu_setup = function(self)
		if not pui.menu_open then 
			return 
		end

		local pr, pg, pb, pa = helpers:pulse({119, 120, 159, 190}, 2)
		local f1 = helpers:to_hex(pr, pg, pb, pa)

		menu.headerr:set("\a"..f1.."‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾")

		phobia.ui:show(false)

		local index = menu.servers.list:get()
		local i = 0

		for k, v in pairs(phobia.ui.servers.gen) do
			if index == i then
				phobia.ui.servers.selected = v
			end
			i = i + 1
		end
	end,

	crosshair = {
		on = menu.options.vis.crosshair,

		active = function(self, is_tab)
			if not is_tab then 
				return self.on.turn:get()
			else
				return client.key_state(0x09) -- tab
			end
		end,

		run = function(self)
			local me = entity.get_local_player()
			local alpha = render:new_anim("crosshair.on", self:active() and 255 or 0, 8)

			if alpha < 0.1 then 
				return 
			end

			local style = self.on[1]:get()
			local name = self.on[2]:get() ~= "" and self.on[2]:get() or "enderphobia"
			local r, g, b = accent()
			local offset = render:new_anim("crosshair.offset", self.on[3]:get(), 6)
			local is_alive = entity.is_alive(me)
			local is_scoped = is_alive and entity.get_prop(me, "m_bIsScoped") == 1

			local scp = render:new_anim("crosshair.scoped", is_scoped and 1 or 0, 8)
			local target_y_pos = is_alive and y/2 + offset or y - 15
			local move = render:new_anim("crosshair.move", target_y_pos, 6)

			local function render_text_element(text, x_pos, y_pos, font, color, alpha_val)
				local text_width = -renderer.measure_text(font, text) * 0.5
				renderer.text(x_pos + (9 - text_width) * scp, y_pos, color[1], color[2], color[3], alpha_val, font, nil, text)
			end

			if alpha > 110 then
				if style == "Text" then
					local name_width = renderer.measure_text("cb", name)
					local anim_text = helpers:animate_text(2, name, r, g, b, alpha)
					renderer.text(x/2 + (10 + name_width/2)*scp, move, 255, 255, 255, alpha, "cb", nil, unpack(anim_text))
				elseif style == "enderphobia" then
					renderer.texture(logo, x/2 - 35 + 45*scp, move - 4, 72, 13, r, g, b, alpha)
				end
			end

			if is_alive then
				local state = helpers:get_state():upper()
				local state_alpha = render:alphen(alpha - 130)
				render_text_element(state, x/2, move + 13, "c-", {255, 255, 255}, state_alpha)

				local binds = {
					{
						name = "DT",
						color = {r, (helpers:charge() and g or 0), (helpers:charge() and b or 0)},
						active = ui.get(refs.rage.dt[1]) and ui.get(refs.rage.dt[2]) and not ui.get(refs.rage.fd[1])
					},
					{
						name = "FD",
						color = {222, 222, 222},
						active = ui.get(refs.rage.fd[1])
					},
					{
						name = "QP",
						color = {255, 255, 255},
						active = ui.get(refs.rage.qp[1]) and ui.get(refs.rage.qp[2])
					}
				}

				local vertical_offset = 15
				for _, bind in ipairs(binds) do
					local bind_alpha = render:new_anim("crosshair.alpha:"..bind.name, bind.active and alpha or 0, 8)
					local offset_anim = render:new_anim("crosshair.offset."..bind.name, bind.active and 10 or 0, 6)
					--12412
					if bind_alpha > 10 then
						vertical_offset = vertical_offset + offset_anim
						render_text_element(bind.name, x/2, move + vertical_offset, "c-", bind.color, bind_alpha)
					end
				end
			end
		end
	},

	watermark = {
		run = function(self)
			local water = menu.options.vis.watermark
			local early_move = render:new_anim("watermark.on", water.turn() and 255 or 0, 8)

			if early_move < 0.1 then 
				return 
			end
			
			local r, g, b, a = accent()

			local move = 75*(early_move/255)
			local uuser = water[2]:get()
			local lua = uuser:match("%w") == nil and user_lua or uuser

			local m = {
				name = math.floor(renderer.measure_text("a", name)),
				user = math.floor(render:new_anim("watermark.user", renderer.measure_text("a", lua), 8))
			}

			local x, y = hud_water:get(5, 80)
			hud_water:drag(111 + (m.user), 35, (early_move/255)*10)

			render:rectv(x, y - move, 22 + m.name, 25, {25, 25, 25, move}, 6, {r, g, b, early_move})
			render:rectv(x + (27 + m.name), y - move, 72 + (m.user - 60), 25, {25, 25, 25, move}, 6, {r, g, b, early_move})

			renderer.text(x + (32 + m.name), y - move + 6, 255, 255, 255, early_move, "a", nil, lua)
			renderer.texture(logo, x + 5, y - move + 7, 72, 13, r, g, b, early_move)
		end
	},

	traceplay = {
		run = function(self)
			if not menu.options.vis.trace_player:get() then 
				return 
			end

			local me = entity.get_local_player()

			if not entity.is_alive(me) then
				return
			end

			local target = client.current_threat()

			if not target then
				return
			end

			local r, g, b, a = menu.options.vis.trace_player:get_color()
			local origin_p = vector(entity.get_origin(target))
			local origin_v = vector(renderer.world_to_screen(origin_p.x, origin_p.y, origin_p.z))

			if  ((origin_v.x ~= nil) and (origin_v.y ~= nil)) and ((origin_v.x ~= 0) and (origin_v.y ~= 0)) then
				renderer.line(x/2, y, origin_v.x, origin_v.y, r, g, b, a)
			end
		end
	},

	debug = {
		run = function(self)
			local me = entity.get_local_player()
			local on = menu.options.vis.debug:get()
			local alpha = render:new_anim("debugpanel.on", entity.is_alive(me) and on and 255 or 0, 8)
			
			if alpha < 0.1 then 
				return 
			end

			local r, g, b, a = accent()
			local alpha2 = 75*(alpha/255)
			local size = 

			hud_debug:drag(110, 35, (alpha/255)*10)

			local x, y = hud_debug:get(5, 5)

			render:rectv(x, y, 99, 25, {25, 25, 25, alpha2}, 6, {r, g, b, alpha}, 2)
			renderer.text(x + 19, y + 6, 255, 255, 255, alpha, "a", nil, "Debug-panel")

			local offset = 0
			local i = {
				target = entity.get_player_name(client.current_threat()),
				vel = helpers:get_velocity(me),
				manual = antiaim:get_manual(),	
				sh = antiaim:get_safehead(),
			}

			local info = {
				{
					on = i.vel ~= 0,
					name = "Velocity:",
					active = ""..math.floor(i.vel)
				},
				{
					on = i.sh,
					name = "Safehead:",
					active = i.sh and "active" or "none"
				},
				{
					on = i.target ~= "unknown",
					name = "Target:",
					active = i.target
				},
				{
					on = true,
					name = "State:",
					active = helpers:get_state()
				},
				{
					on = i.manual ~= nil,
					name = "Manual:",
					active = i.manual ~= nil and (""..i.manual) or "none"
				},
			}

			for _, pans in ipairs(info) do 
				local bbb = entity.is_alive(me) and on and pans.on
				local offs = render:new_anim("debugpanel.offset" .. pans.name, bbb and 23 or 0, 8)
				local alpha = render:new_anim("debugpanel.alpha." .. pans.name, bbb and alpha and 255 or 0, 8)
				local alpha2 = 75*(alpha/255)

				offset = offset + offs

				local meas = renderer.measure_text("a", pans.name)
				
				render:rect(x, y + 8 + offset, 99, 20, {25, 25, 25, alpha2}, 6)
				renderer.text(x + 6, y + 11 + offset, 255, 255, 255, alpha, "a", nil, pans.name)
				renderer.text(x + 7 + meas, y + 11 + offset, 255, 255, 255, alpha, "a", nil, pans.active:lower())
			end
		end
	},

	viewmodel = {
		active = function(self)
			return menu.options.vis.viewmodel:get()
		end,

		run = function(self)
			if not self:active() then 
				return 
			end

			local x = render:new_anim("viewmodel.x", menu.options.vis.viewmodel_x:get(), 8)
			local fov = render:new_anim("viewmodel.fov", menu.options.vis.viewmodel_fov:get(), 8)
			local y = render:new_anim("viewmodel.y", menu.options.vis.viewmodel_y:get(), 8)
			local z = render:new_anim("viewmodel.z", menu.options.vis.viewmodel_z:get(), 8)

			client.set_cvar("viewmodel_offset_x", x)
			client.set_cvar("viewmodel_offset_y", y)
			client.set_cvar("viewmodel_offset_z", z)
			client.set_cvar("viewmodel_fov", fov)
		end
	},

	leftmarke = {
		run = function(self)

			local style = menu.options.vis.style_water:get()
			local r, g, b = accent()

			if style == "Default" then
				local logo, lx, ly = render:logo(true)
				local name = U(name) .. "."
				local user = user_lua

				local mes = {
					n = renderer.measure_text("-", U(name)) + 50,
					n2 = renderer.measure_text("-", U("user - "..user)) + 52
				}

				renderer.text(50, y/2 + 40, 255, 255, 255, 255, "-", nil, name)
				renderer.text(mes.n, y/2 + 40, r, g, b, 255, "-", nil, U("lua"))

				renderer.text(50, y/2 + 50, 255, 255, 255, 255, "-", nil, U("user - "..user))
				renderer.text(mes.n2, y/2 + 50, r, g, b, 255, "-", nil, U("["..version(true).."]"))

				renderer.texture(logo, 20, y / 2 + 35, lx, ly, r, g, b, 255)
			elseif style == "Custom" then
				local slider_value = menu.options.vis.razdl_water:get() -- 0-100
				local text = menu.options.vis.texti_water:get()
				local n4me = text:match("%w") == nil and name or text

				local word = n4me

				local split_pos = math.floor(#word * (slider_value / 100))

				split_pos = math.max(0, math.min(#word, split_pos))

				local part1 = word:sub(1, split_pos)
				local part2 = word:sub(split_pos + 1)

				local hex_col = "\a"..helpers:to_hex(r, g, b, 255)
				local result = part1 .. hex_col .. part2

				renderer.text(50, y/2 + 50, 255, 255, 255, 255, "", nil, result)
			end
		end
	},

	custom_gs = {
		table = { binds = {} },
		y = 0,

		add = function(self, icon, name, ref)
			self.table.binds[#self.table.binds + 1] = { 
				full_icon = icon, 
				name = string.sub(name, 1, 2), 
				full_name = name, 
				ref = ref,
				chars = 0, 
				alpha = 0
			}
		end,

		text = function(self, x, y, r, g, b, a, re, ge, be, ae, icon, text, i_alpha, alpha)
			if alpha == nil then
				alpha = 1
			end
	
			if alpha <= 0 then
				return
			end
	
			local icon_wh = vector(renderer.measure_text('+', icon))
			local text_wh = vector(renderer.measure_text('+', text))
			local x1, y1 = client.screen_size()
	
			local width_ind = math.floor(text_wh.x / 2)
			local y = y + y1/2 + 70
			renderer.gradient(x + 4, y + text_wh.y, width_ind + 24, text_wh.y + 4, 5, 5, 5, 0, 5, 5, 5, 55 * alpha, true)
			renderer.gradient(x + 28 + width_ind, y + text_wh.y, 29 + width_ind, text_wh.y + 4, 5, 5, 5, 55 * alpha, 5, 5, 5, 0, true)
	
			renderer.text(x * alpha, y + icon_wh.y, re, ge, be, ae * i_alpha, '+', nil, icon)
	
			renderer.text(x + icon_wh.x * i_alpha, y + icon_wh.y + 1, r, g, b, a, '+', nil, text)
	
			self.y = self.y + 40 * alpha
		end,


		general = function(self)
			local me = entity.get_local_player()
			if not me or not entity.is_alive(me) then 
				return 
			end

			local dt_active = helpers:charge()
			self.y = 15
			local ping = client.ping

			for index, bind in ipairs(self.table.binds) do
				local name = bind.full_name
				local ui_active = ui.get(bind.ref)
				local is_active = entity.is_alive(me) and ui_active

				bind.alpha = render:math_anim2(bind.alpha, is_active and 1 or 0, 8)
				bind.chars = render:math_anim2(bind.chars, is_active and 1 or 0, 8)
				
				local icon = bind.full_icon
				local clr = {225, 225, 225, 255}

				if name == 'DT' then
					icon = dt_active and ' ' or ' '
					clr = {
						dt_active and 225 or 255,
						225 * (dt_active and 1 or 0),
						225 * (dt_active and 1 or 0),
						225
					}
				elseif name == 'PING' then
					icon = ping < 85 and " " or " "
					if ping < 55 then
						clr[1] = render:alphen(255 - (70 - ping) * 2)
						clr[3] = render:alphen(255 - (70 - ping) * 2)
					elseif ping < 85 then
						clr[3] = render:alphen(255 - (ping - 70) * 17)
					else
						clr[2] = render:alphen(255 - (ping - 85) * 8)
						clr[3] = 0
					end
				elseif name == 'OS' then
					icon = dt_active and ' ' or ' '
					clr[2] = 225 * (dt_active and 1 or 0)
					clr[3] = 225 * (dt_active and 1 or 0)
				end

				self:text(40, self.y, 
					clr[1], clr[2], clr[3], clr[4] * bind.alpha, 
					clr[1], clr[2], clr[3], clr[4] * bind.alpha, 
					icon, name, bind.chars, bind.alpha
				)
			end
		end,

		create = function(self)
            self:add(' ', 'DT', refs.rage.dt[2])
            self:add(' ', 'OSAA', refs.rage.os[2])
            self:add(' ', 'MD', refs.rage.ovr[2])
            self:add(' ', 'FD', refs.rage.fd[1])
            self:add(' ', 'FS', refs.bindfs[1])
            self:add(' ', 'BA', refs.rage.baim[1])
            self:add(' ', 'SAFE', refs.rage.safe[1])
            self:add(' ', 'PING', refs.ping[1])
        end
    },

	dmgmarker = {
		active = function(self)
			return entity.is_alive(entity.get_local_player()) and menu.options.vis.damage.turn:get()
		end,

		work = function(self)
			if not self:active() then 
				return 
			end

			local dmg = refs.rage.mindmg[1]:get()
			
			if ui.get(refs.rage.ovr[1]) and ui.get(refs.rage.ovr[2]) then
				return ui.get(refs.rage.ovr[3])
			else
				return dmg
			end
		end,

		run = function(self)
			if not self:active() then 
				return 
			end

			local general = menu.options.vis.damage[1]:get()

			if not general then 
				if ui.get(refs.rage.ovr[2]) then 
					renderer.text(x/2 + 6, y/2 - 16, 255, 255, 255, 255, "a", nil, self:work())
				end
			else
				renderer.text(x/2 + 6, y/2 - 16, 255, 255, 255, 255, "a", nil, self:work())
			end
		end
	},

	logging = {
		hitboxes = { 
			[0] = 'body', 'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg', 'neck', '?', 'gear'
		},
		
		active = function(self, arg)
			return menu.options.vis.notify:get(arg)
		end,

		create = function(self, arg)
			client.color_log(139, 140, 179, "• ".. name .. " -\r " .. arg)
		end,

		hit = function(self, shot)
			if not self:active("Hit") then 
				return 
			end

			if refs.hits.hit:get() then 
				refs.hits.hit:override(false)
			end

			local target = entity.get_player_name(shot.target)
			local hitbox = self.hitboxes[shot.hitgroup] or "?"
			local hp = math.max(0, entity.get_prop(shot.target, 'm_iHealth'))
			local damage = shot.damage
			local bt = globals.tickcount() - shot.tick
			local hc = math.floor(shot.hit_chance)

			local reas = hp ~= 0 and "1" or "2"

			if reas == "1" then 
				notify.create_new({
					{"Hit "}, {target, true},
					{" in "}, {hitbox, true},
					{" for "}, {damage, true},
					{" (" .. hp .. " rhp)"}
				})

				self:create(string.format("Hit %s in %s for %s (rhp %s) (hc: %s) (bt: %s)", target, hitbox, damage, hp, hc, bt))
			else
				notify.create_new({
					{"Killed "}, {target, true},
					{" in "}, {hitbox, true}
				})

				self:create(string.format("Killed %s in %s (dmg: %s) (hc: %s) (bt: %s)", target, hitbox, damage, hc, bt))
			end
		end,

		miss = function(self, shot)
			if not self:active("Miss") then 
				return 
			end
			
			if refs.hits.miss:get() then 
				refs.hits.miss:override(false)
			end

			local target = entity.get_player_name(shot.target)
			local hitbox = self.hitboxes[shot.hitgroup] or "?"
				
			local bt = globals.tickcount() - shot.tick
			local hc = math.floor(shot.hit_chance)

			notify.create_new({
				{"Miss "}, {target, true},
				{" in "}, {shot.reason, true},
				{" (" .. hc .. "%)"}
			})

			self:create(string.format("Missed %s in %s due to %s (hc: %s, bt: %s)", target, hitbox, shot.reason, hc, bt))
		end
	},
	tt = {
		phrases = {
			'1 by enderphobia', 'enderphobia - крылья enderphobiа лучше нету?',
            '1 че по iq?', 'что ты делаешь мерзавка? опять умер хач жирный',
            'ну что у меня есть iq из за enderphobia', 'ну изи бомж за овнил by - enderphobia stack',
            'godmode with enderphobia', '1 by твой отчим', "уебище ушастое че ты делаешь хуйпачос блядский",
			"1", "Куда ты пикать пытаешься", "Не стоит стараться ты уничтожен",
			"Ууу этот бомж еще умеет нажимать кнопки((", "Я тебя уебал потому что тебя обоссали с лучшей луашкой enderphobia",
			"Куда ты миссаешь тварь?", "Братан(bomj) бля ты такую хуйню делаешь",
			"СПОТ ФАЙ СПОТ ФАЙ СПИНОЙ УБИЛ ТВАРИНУ ХПХАХ", "enderphobia унес тебя на небеса, enderphobia",
			"Ставай на колени и проси пощады", "за мной обьявили охоту с enderphobia",
			"давай молись чтобы не уничтожиои с первой пули, а уже уничтожили", 'знаешь цунами?когда твоя мать заходит в океан',
            'видешь крылья? это enderphobia уносят тебя', 'белые enderphobiки уносят тебя, by enderphobia',
            'enderphobia позвонил мне и сказал что бы я тебя унес на тот свет by enderphobia', 'юзаешь другие луашки и умер от глупости... юзни enderphobia',
            'как тебе сказать...1 тупость ушастая', 'ну показал мозг  и где ты теперь? правильно,на мусорке(ты там и так кушаешь)',
            'enderphobia не дает пощады',  'ну че могу сказать без enderphobia и жизнь сложна',
            'показал свой скилл 1',  'твои аа тебя не бустят', 'тебе с таким плейсталом ток в роблокс хвх',
            'я не потник но тебя убил', 'angel, wings соедени = u owned by enderphobia',
            'видешь enderphobiа со скитом он с enderphobia а ты хуесос с синей пастой', 'ты че с луасенсом?а то че я тя убил на изи',
            'антиаимы включи там..че ты без них?', '1 2 3 4 5 вышел enderphobia альфа погулять',
		},

		active = function(self)
			return menu.options.helpers.trashtalk:get()
		end,

		run = function(self, event)
			local me = entity.get_local_player()

			if not entity.is_alive(me) then
				return
			end
		
			local victim = client.userid_to_entindex(event.userid)
			local attacker = client.userid_to_entindex(event.attacker)
			local db_kill = database.read(databas.kill)

			if attacker == me and victim ~= me then 
				db_kill = db_kill + 1

				if self:active() then
					client.exec(string.format("say %s", self.phrases[math.random(1, #self.phrases)]))
				end
			end

			database.write(databas.kill, db_kill)
		end
	},

	breaker = {
		prop = function(self, ent, arg1, arg2)
			entity.set_prop(ent, "m_flPoseParameter", unpack(arg1), unpack(arg2))
		end,

		--[[
			breaker = group.a:checkbox("Animation breaker"),
			breaker_type = group.a:combobox("\nanimbreak type", {"Spam", "Jitter"}),
			breaker_spam = group.a:slider("\n({1337}:reloadh)", 1, 9, 1, true, "x", 1)
			breaker_add
		]]

		run = function(self)
			local me = entity.get_local_player()
			local menu = menu.options.helpers

			if not menu.breaker:get() or not entity.is_alive(me) then 
				return 
			end

			if menu.breaker_add:get("Legs backing") then 
				self:prop(me, {3}, {0})
				self:prop(me, {7}, {90})
				self:prop(me, {11}, {180})
			end

			if menu.breaker_add:get("Static air") then 
				self:prop(me, {1}, {6})
			end

			if menu.breaker_type:get() == "Jitter" then 
				self:prop(me, {1}, {globals.tickcount() % 4 > 1 and 5 or 0})
				refs.fakelag.lg[1]:override("Always slide")
			elseif menu.breaker_type:get() == "Spam" then 
				refs.fakelag.lg[1]:override(globals.tickcount() % menu.breaker_spam:get() == 0 and "Never slide" or "Always slide")
			elseif menu.breaker_type:get() == "Earthquake" then 
				local me = ent.get_local_player()
				local af4142 = me:get_anim_overlay(12)

				af4142.weight = client.random_float(0, 2.5)
			end
		end
	},

	clantag = {
		list = {
			"enderphobia"
		},

		run = function(self)
			menu.options.helpers.clantag:set_callback(function(arg)
				refs.clantag:set_enabled(not arg.value)

				if arg.value then 
					refs.clantag:override(false)

					client.set_clan_tag(unpack(self.list))
				else
					refs.clantag:override()

					client.set_clan_tag()
				end
			end, true)
			
			client.set_event_callback("shutdown", function()
				refs.clantag:set_enabled(true)
				refs.clantag:override()
	
				client.set_clan_tag()
			end)
		end
	},

	ladder = {
		fast = function(self)
			return 
		end,

		safe = function(self, cmd)
			if not menu.options.helpers.ladder:get() then 
				return 
			end
		
			local me = entity.get_local_player()

			if not me or not entity.is_alive(me) then 
				return 
			end
		
			local in_ladder = entity.get_prop(me, "m_MoveType") == 9

			if in_ladder then 
				cmd.pitch = 89
				cmd.yaw = 180

				local original_forward = cmd.in_forward
				local original_back = cmd.in_back
				local original_moveright = cmd.in_moveright
				local original_moveleft = cmd.in_moveleft
				
				cmd.in_forward = original_back 
				cmd.in_back = original_forward 
				
				cmd.in_moveright = original_moveright
				cmd.in_moveleft = original_moveleft
				
			end
		end
	}
}

notify.create_new({{"Welcome back, "}, {user_lua, true}})

for _, data in ipairs({
	{"player_death", function(event)
		cals.tt:run(event)
	end},

	{"aim_hit", function(event)
		cals.logging:hit(event)
	end},

	{"aim_miss", function(shot)
		cals.logging:miss(shot)
	end},

	{"pre_render", function()
		cals.breaker:run()
	end},

	{"setup_command", function(cmd) 
		antiaim:run(cmd)
		cals.ladder:safe(cmd)
	end},

	{"paint", function()
		cals.viewmodel:run()
		cals.crosshair:run()
		cals.dmgmarker:run()
		cals.watermark:run()
		cals.traceplay:run()
		cals.debug:run()
		cals.leftmarke:run()

		if menu.options.vis.gamesense:get() then 
			cals.custom_gs:general()
		end
	end},

	{"paint_ui", function()
		cals.menu_setup()
	end},

	{"shutdown", function(self)
		phobia.ui:show(true)
	end},

	{"indicator", function()
        return menu.options.vis.gamesense:get()
    end},

	{"predict_command", function()
		defensive:normalize()
	end},
	
	{"private", function()
		cals.clantag:run()
		cals.custom_gs:create()
	end},

	{"net_update_end", function()
		defensive:activatee()
	end},
}) do
	local name = data[1]
    local func = data[2]

	if name == "private" then 
		func()
	elseif name == "indicator" then
        menu.options.vis.gamesense:set_event(name, func, function(dadnoshitbot) 
            return dadnoshitbot:get()
        end)
	else
    	client.set_event_callback(name, func)
	end
end

cvar.con_filter_enable:set_int(1)
cvar.con_filter_text:set_string("IrWL5106TZZKNFPz4P4Gl3pSN?J370f5hi373ZjPg%VOVh6lN")
client.exec("con_filter_enable 1")