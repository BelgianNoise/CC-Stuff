local params = {...}
posOfModem = params[1]
posOfMonitor = params[2]

--enable modem
rednet.open(posOfModem)

while (true)
do
    print("Listening for new message...")
    sender, mes, prot = rednet.receive("items")
    print("Received message from sender: " .. sender)

    print("Updating monitor...")

    print("Monitor updated!")
end