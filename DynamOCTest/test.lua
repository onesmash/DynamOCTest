runtime.ffi.cdef[[
void NSLog(id format, ...);
]]
runtime.debug = false
runtime.addMethod(runtime.C.objc_getClass("TestClass"), runtime.SEL("echo:"), function(self, cmd, x) print('fxxxk', self, cmd, x) return runtime.Obj("world") end, "@@:q")

local block = runtime.createBlock(function(s) return s end, "@@@")
runtime.TestClass:blockTest_(block)
