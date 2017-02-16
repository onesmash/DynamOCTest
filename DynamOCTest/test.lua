print(runtime)
runtime.addMethod(runtime.C.objc_getClass("TestClass"), runtime.SEL("echo"), function() print('fxxxk') end, "v@:")
