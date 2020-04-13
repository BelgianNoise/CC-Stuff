local params = {...}
posOfME = params[1]
numberOfMessagesSent = 0

while (true)
do
    print("Broadcasting table of items...")
    items = peripheral.call(posOfME, "listAvailableItems")
    table.sort(items, function(x,y) return x.count > y.count end )

    rednet.broadcast(items, "items")
    print("Done broadcasting!")

    numberOfMessagesSent = numberOfMessagesSent + 1
    print(numberOfMessagesSent .. " messages sent since startup!")
    print("Going to sleep for 3sec...")
    sleep(3)
end