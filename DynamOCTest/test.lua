runtime.ffi.cdef[[
void NSLog(id format, ...);
struct Test {int x;};
]]
runtime.debug = false
runtime.addMethod(runtime.C.objc_getClass("TestClass"), runtime.SEL("echo:"), function(self, cmd, x) print('fxxxk', self, cmd, x) return runtime.Obj("world") end, "@@:q")

local up = runtime.Obj("hello1")
local block = runtime.createBlock(function(s) print(up) return s end, "@@@")
print(block:retainCount())
local b = block:copy()
print(b:retainCount())
runtime.TestClass:blockTest(b)
print(block:retainCount())
print(b:retainCount())
collectgarbage()

