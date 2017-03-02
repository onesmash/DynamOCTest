runtime.ffi.cdef[[
void NSLog(id format, ...);
]]
runtime.debug = false
runtime.addMethod(runtime.C.objc_getClass("TestClass"), runtime.SEL("echo:"), function(self, cmd, x) print('fxxxk', self, cmd, x) return runtime.Obj("world") end, "@@:q")

local test = runtime.ffi.new("struct Test", {0})
local up = runtime.Obj("hello1")
local block = runtime.createBlock(function(s) print(up) print(test) return s end, "@@@")

runtime.TestClass:blockTest(block)


