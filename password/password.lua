maxAttempts = 5
secret = "t"
side = "bottom"
 
function clearScreen()
    term.clear()
    term.setCursorPos(1,1)
    term.setCursorBlink(true)
end
 
while true do
    clearScreen()
    for i = 1, maxAttempts do
        print("Enter passcode:")
        input = read()
        if input == secret then
            print("Welcome!")
            redstone.setOutput(side,  true)
            sleep(2)
            redstone.setOutput(side, false)
            break
        else
            print("Wrong code")
            sleep(1)
            clearScreen()
            if i == maxAttempts then
                print("Login failed. Locking...")
                sleep(30)
            end
        end
    end
end