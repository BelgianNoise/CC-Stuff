local params = {...}
filename = params[1]

posOfMonitor = "right"

file = fs.open("items/" .. filename, "r")
itemname = "placeholder"
steel = "0"
blocks = {}

if file then
    count = 0
    temp = true
    while (temp) do
        t = file.readLine()
        if (t) then
            if count == 0 then
                itemname = t
                print("Itemname:  " .. t)
            elseif count == 1 then
                steel = t
                print("Amount Of Steel:  " .. t)
            else
                if t ~= "" then
                    blocks[count - 1] = t
                    print("Added Block:  " .. t)
                end
            end
            count = count + 1
        else
            temp = false
        end
    end    
  	file.close()
else
  	print("File doesn't exist.")
	return false
end

mon = peripheral.wrap(posOfMonitor)
mon.clear()
mon.setTextScale(2)
line = 1

mon.setCursorPos(1,line)

mon.write("======= " .. itemname .. " ============================")

for i, block in ipairs(blocks) do
    mon.setCursorPos(1,line + 1)
    mon.write("   - " .. block)
    line = line + 1
end

line = line + 2
mon.setCursorPos(1, line)
mon.write("Total amount of Steel need:   " .. steel)