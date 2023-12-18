import Vapor

func routes(_ app: Application) throws {
    app.get("ip", ":ip") { req -> String in
        //Get the ip parameter from the request
        guard let ip = req.parameters.get("ip") else {
            throw Abort(.badRequest, reason: "The IP is missing.")
        }
        
        //check if the IP is valid
        if isValidIp(ip: ip) {
            return "The IP is \(ip)"
        } else {
            throw Abort(.badRequest, reason: "The IP \(ip) is NOT valid.")
        }
    }
}


func isValidIp(ip: String) -> Bool {
    //Split the ip into 4 parts to check if the ip is the IPv4 format
    let parts = ip.split(separator: ".")
    if parts.count != 4 {
        return false
    }
    //Check if each part is a number valid, IPv4 parts must be between 0 and 255
    for part in parts {
        if let number = Int(part) {
            if number < 0 || number > 255 {
                return false
            }
        } else {
            return false
        }
    }
    return true
}
