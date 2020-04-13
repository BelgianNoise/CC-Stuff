numberOfMessagesReceived = 0
mon = peripheral.find("monitor")

while (true)
do
    print("Listening for new message...")
    sender, mes, prot = rednet.receive("items")
    print("Received message from sender: " .. sender)

    print("Updating monitor...")
    mon.clear()
    mon.write(mes[1]["name"] ..  ": " .. mes[1]["count"])
    print("Monitor updated!")
    numberOfMessagesReceived = numberOfMessagesReceived + 1
    print(numberOfMessagesReceived .. " messages received since startup!")
end