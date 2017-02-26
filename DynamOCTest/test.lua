runtime.addMethod(runtime.C.objc_getClass("TestClass"), runtime.SEL("echo:"), function(self, cmd, x) print('fxxxk', self, cmd, x) return runtime.Obj("world") end, "@@:q")

runtime.TestClass:blockTest_(runtime.createBlock(function(s) return s end, "@@@"))
