runtime.debug = false
runtime.relaxedSyntax = false
runtime.ffi.cdef[[
unsigned int sleep(unsigned int);
]]
local array = runtime.Obj({"hello", "world"})
array:enumerateObjectsUsingBlock_(runtime.createBlock(function(str, index, stop)
    cocoa.NSLog(runtime.Obj("%@"), str)
end, runtime.encode.void..runtime.encode.id..runtime.encode.id..runtime.encode.NSUInteger.."^B"))

runtime.addMethod(runtime.ViewController, runtime.SEL("tableView:numberOfRowsInSection:"), function(self, cmd, tableView, section)
    return 100
end, runtime.encode.NSInteger..runtime.encode.id..runtime.encode.SEL..runtime.encode.id..runtime.encode.NSInteger)


-- dispatch.async(dispatch.get_global_queue(0, 0), function()
--     while true do
--         print("hello")
--         runtime.NSThread:sleepForTimeInterval(0.1)
--     end
-- end)

-- dispatch.async(dispatch.get_global_queue(0, 0), function()
--         while true do
--             print("world")
--             runtime.NSThread:sleepForTimeInterval(0.1)
--         end
--     end)

runtime.addMethod(runtime.ViewController, runtime.SEL("tableView:cellForRowAtIndexPath:"), function(self, cmd, tableView, indexPath)
    local cell = tableView:dequeueReusableCellWithIdentifier_(runtime.Obj("test"))
    if cell == nil then
        cell = runtime.UITableViewCell:alloc():initWithStyle_reuseIdentifier_(cocoa.UITableViewCellStyleDefault, runtime.Obj("test"))
    end
    cell:textLabel():setText_(indexPath:description())
    return cell
end, runtime.encode.id..runtime.encode.id..runtime.encode.SEL..runtime.encode.id..runtime.encode.id)

runtime.addMethod(runtime.TestClass, runtime.SEL("echo"), 
                                                        function(self, cmd) 
                                                             
                                                        end, "v@:")

--print(22222)
-- local class = runtime.createClass(runtime.NSObject, "HelloClass", nil, {str = {typeEncoding = "@", ownerShip = "copy"}, point = {typeEncoding = runtime.encode.CGPoint}})
-- runtime.addMethod(runtime.HelloClass, runtime.SEL("init"), function(self, cmd)
--     self = runtime.callSuper(self, cmd)
--     if self then
--         self:setStr(runtime.Obj("Hello world"))
--         self:setPoint(cocoa.CGPoint({0, 1}))
--     end
--     return self
-- end, "@@:")

-- local test = runtime.HelloClass:alloc():init()
-- local point = test:point();
-- print(point.x, point.y)

-- local typeArr = runtime.parseTypeEncoding("{CGPoint=dd}")
-- print(runtime.typeToCType(typeArr[1]))

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


