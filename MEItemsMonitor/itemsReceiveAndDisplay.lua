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

function displayAmount(a)
    if (d < 1000) then
        return math.floor(d)
    else if (d < 1000000) then
        return math.floor(d / 1000) .. " K"
    else if (d < 1000000000) then
        return math.floor(d / 1000000) .. " M"
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
    for i=1,10 do
        displayItemName = split(mes[i]["name"], ":")[-1]
        mon.setCursorPos(1, i)
        mon.write(displayItemName)
        mon.setCursorPos(20, i)
        mon.write( displayAmount(math.floor(mes[i]["count"])) )
    end
    print("Monitor updated!")

    numberOfMessagesReceived = numberOfMessagesReceived + 1
    print(numberOfMessagesReceived .. " messages received since startup!")
end