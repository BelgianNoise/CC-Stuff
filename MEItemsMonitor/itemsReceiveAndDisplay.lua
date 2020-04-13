rednet.open("back")

numberOfMessagesReceived = 0
mon = peripheral.find("monitor")
mon.setTextScale(2)
mon.clear()
mon.write("Waiting for first message...")

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function displayAmount(d)
    if (d < 1000) then
        return math.floor(d)
    elseif (d < 1000000) then
        return math.floor(d / 1000) .. " K"
    elseif (d < 1000000000) then
        return math.floor(d / 1000000) .. " M"
    else
        return "Te veel gewoon makker wtf"
    end
end

while (true)
do
    print("Listening for new message...")
    sender, mes, prot = rednet.receive("items")
    print("Received message from sender: " .. sender)

    print("Updating monitor...")
    mon.clear()
    --writeItems
    for i=1,15 do
        --temp = split(mes[i]["name"], ":")
        --displayItemName = temp[#temp]
        mon.setCursorPos(1, i)
        mon.write(mes[i]["name"])

        amount = displayAmount(math.floor(mes[i]["count"]))
        ypos = 40 + (5 - string.len(amount))
        mon.setCursorPos(ypos, i)
        mon.write(  )
    end
    print("Monitor updated!")

    numberOfMessagesReceived = numberOfMessagesReceived + 1
    print(numberOfMessagesReceived .. " messages received since startup!")
end