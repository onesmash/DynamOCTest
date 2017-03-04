runtime.debug = false

runtime.addMethod(runtime.C.objc_getClass("TestClass"), runtime.SEL("echo:"), 
                                                        function(self, cmd, x) 
                                                            print('fxxxk', self, cmd, x)
                                                            local point = cocoa.CGPoint({1, 1})
                                                            dispatch.sync(dispatch.get_global_queue(0, 0), function ()
                                                                print(point.x, point.y)
                                                                point.x = 2
                                                            end)
                                                            print(point.x, point.y)
                                                            return runtime.Obj("world") 
                                                        end, "@@:q")

local test = runtime.TestClass:alloc():init()
test:echo(1111)

--local test = runtime.ffi.new("struct Test", {0})
--local up = runtime.Obj("hello1")
--local block = runtime.createBlock(function(s) print(up) print(test) return s end, "@@@")
-- local x = 1
-- dispatch.async(dispatch.get_global_queue(0, 0), 
--     function() 
--         print(x)
--         dispatch.sync(dispatch.mainQueue, 
--             function() 
--                 print(up) print(test) 
--                 x= 2
--             end)
--         print(x) 
--     end)
--runtime.TestClass:blockTest(block)


