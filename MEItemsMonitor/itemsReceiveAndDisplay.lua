local params = {...}
posOfMonitor = params[1]
numberOfMessagesReceived = 0

while (true)
do
    print("Listening for new message...")
    sender, mes, prot = rednet.receive("items")
    print("Received message from sender: " .. sender)

    print("Updating monitor...")

    print("Monitor updated!")
    numberOfMessagesReceived = numberOfMessagesReceived + 1
    print(numberOfMessagesReceived .. " messages received since startup!")
end