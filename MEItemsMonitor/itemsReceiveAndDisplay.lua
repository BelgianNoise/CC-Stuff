numberOfMessagesReceived = 0
mon = peripheral.find("monitor")
mon.setTextScale(2)
mon.clear()
mon.write("Waiting for first message...")

while (true)
do
    print("Listening for new message...")
    sender, mes, prot = rednet.receive("items")
    print("Received message from sender: " .. sender)

    print("Updating monitor...")
    --cleanup
    mon.clear()
    mon.setCursorPos(1,1)
    --writeItems
    for i=1,10 do
        displayItemName = split(mes[i]["name"], ":")[-1]
        mon.setCursorPos(1, i)
        mon.write(displayItemName)
        mon.setCursorPos(20, 1)
        mon.write( mes[i]["count"] )
    end
    print("Monitor updated!")

    numberOfMessagesReceived = numberOfMessagesReceived + 1
    print(numberOfMessagesReceived .. " messages received since startup!")
end