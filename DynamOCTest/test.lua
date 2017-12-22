runtime.debug = false
runtime.relaxedSyntax = false
runtime.ffi.cdef[[
unsigned int sleep(unsigned int);
]]

local bit = require("bit")
runtime.createClass(runtime.UITableViewCell, "ImageCell", nil, {webImageView = {typeEncoding = "@", ownerShip = "strong"}})
runtime.addMethod(runtime.ImageCell, runtime.SEL("initWithStyle:reuseIdentifier:"), function(self, cmd, style, reuseIdentifier) 
    self = runtime.callSuper(self, cmd, style, reuseIdentifier)
    if self then
        self:setWebImageView_(runtime.UIImageView:alloc():initWithFrame_(cocoa.CGRect({{0, 0}, {320, 100}})))
    end
    self:contentView():addSubview_(self:webImageView())
    return self
end)

local option = bit.lshift(1, 4)
runtime.addMethod(runtime.ImageCell, runtime.SEL("refreshImage"), function(self, cmd)
    self:webImageView():sd__setImageWithURL_placeholderImage_options_(runtime.NSURL:URLWithString_(runtime.Obj("https://lorempixel.com/320/100/")), nil, option)
end, "v@:")

runtime.addMethod(runtime.ImageCell, runtime.SEL("layoutSubviews"), function(self, cmd)
    --print(1111)
    --print(cocoa.CGRectGetMidX(self:bounds()), cocoa.CGRectGetMidY(self:bounds))
    self:webImageView():setCenter_(cocoa.CGPoint({cocoa.CGRectGetMidX(self:bounds()), cocoa.CGRectGetMidY(self:bounds())}))
end, "v@:")
-- local array = runtime.Obj({"hello", "world"})
-- array:enumerateObjectsUsingBlock_(runtime.createBlock(function(str, index, stop)
--     cocoa.NSLog(runtime.Obj("%@"), str)
-- end, runtime.encode.void..runtime.encode.id..runtime.encode.id..runtime.encode.NSUInteger.."^B"))

runtime.addMethod(runtime.ViewController, runtime.SEL("tableView:numberOfRowsInSection:"), function(self, cmd, tableView, section)
    return 100
end)


-- dispatch.async(dispatch.get_global_queue(0, 0), function()
--     while true do
--         print(100)
--         --runtime.NSThread:sleepForTimeInterval(0.1)
--     end
-- end)

-- dispatch.async(dispatch.get_global_queue(0, 0), function()
--         -- while true do
--         --     print(2)
--         --     --runtime.NSThread:sleepForTimeInterval(0.1)
--         -- end
--     end)

runtime.addMethod(runtime.ViewController, runtime.SEL("tableView:cellForRowAtIndexPath:"), function(self, cmd, tableView, indexPath)
    local cell = tableView:dequeueReusableCellWithIdentifier_(runtime.Obj("ImageCell"))
    cell:refreshImage()
    return cell
 end)

runtime.addMethod(runtime.TestClass, runtime.SEL("echo"), 
                                                        function(self, cmd) 
                                                            --print(self:stringTest():length())
                                                        end, "v@:")

--print(22222)
-- local class = runtime.createClass(runtime.NSObject, "HelloClass", nil, {str = {typeEncoding = "@", ownerShip = "copy"}, point = {typeEncoding = runtime.encode.CGPoint}})
-- runtime.addMethod(runtime.HelloClass, runtime.SEL("init"), function(self, cmd)
--     self = runtime.callSuper(self, cmd)
--     if self then
--         self:setStr_(runtime.Obj("Hello world"))
--         self:setPoint_(cocoa.CGPoint({0, 1}))
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
local block = runtime.createBlock(function(s) print(s) return cocoa.CGSize({100, 100}) end, runtime.encode.CGSize.."@@")
runtime.TestClass:blockTest_(block)


