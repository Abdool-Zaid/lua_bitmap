-- Define the width and height of the bitmap
local width = 200
local height = 200

-- Create a new bitmap with white background
local bitmap = {}
for y = 1, height do
    bitmap[y] = {}
    for x = 1, width do
        bitmap[y][x] = {255, 255, 255}  -- RGB color values (white)
    end
end

-- Draw a red rectangle on the bitmap
local rectX = 50
local rectY = 50
local rectWidth = 100
local rectHeight = 100
for y = rectY, rectY + rectHeight - 1 do
    for x = rectX, rectX + rectWidth - 1 do
        bitmap[y][x] = {123, 67, 123}  -- RGB color values (red)
    end
end

-- Save the bitmap as a PPM image (a simple text-based image format)
local file = io.open("bitmap.ppm", "w")
file:write("P3\n")
file:write(width, " ", height, "\n")
file:write("255\n")
for y = 1, height do
    for x = 1, width do
        local r, g, b = table.unpack(bitmap[y][x])
        file:write(r, " ", g, " ", b, " ")
    end
    file:write("\n")
end
file:close()

print("Bitmap saved as bitmap.ppm")
