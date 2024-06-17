protocol MessageProtocol{
    func startMessage()
    func recordMessage()
    func finishMessage()
}

class Message: MessageProtocol{
    func startMessage(){
        print("""
            ┌─┐┌─┐┌┬┐┌─┐  ┌─┐┌┬┐┌─┐┬─┐┌┬┐
            │ ┬├─┤│││├┤   └─┐ │ ├─┤├┬┘ │
            └─┘┴ ┴┴ ┴└─┘  └─┘ ┴ ┴ ┴┴└─ ┴
        """)
    }
    
    func recordMessage(){
        print("""
            ┌─┐┌─┐┌┬┐┌─┐  ┬─┐┌─┐┌─┐┌─┐┬─┐┌┬┐
            │ ┬├─┤│││├┤   ├┬┘├┤ │  │ │├┬┘ ││
            └─┘┴ ┴┴ ┴└─┘  ┴└─└─┘└─┘└─┘┴└──┴┘
        """)
    }
    
    func finishMessage(){
        print("""
            ┌─┐┌─┐┌┬┐┌─┐  ┌─┐┬  ┬┌─┐┬─┐
            │ ┬├─┤│││├┤   │ │└┐┌┘├┤ ├┬┘
            └─┘┴ ┴┴ ┴└─┘  └─┘ └┘ └─┘┴└─
        """)
    }
}
