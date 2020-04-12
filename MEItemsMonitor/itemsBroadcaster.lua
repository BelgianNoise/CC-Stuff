local params = {...}
posOfModem = params[1]
posOfME = params[2]

--enable modem
rednet.open(posOfModem)

while (true)
do
    print("Broadcasting table of items...")
    items = peripheral.call(posOfME, "listAvailableItems")
    table.sort(items, function(x,y) return x.count < y.count end )

    rednet.broadcast(items, "items")
    print("Done broadcasting!")

    print("Going to sleep for 3sec...")
    sleep(3)
end