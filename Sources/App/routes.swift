import Vapor

func routes(_ app: Application) throws {
    app.get("ip", ":ip") { req -> ports in
        //Get the ip parameter from the request
        guard let ip = req.parameters.get("ip") else {
            throw Abort(.badRequest, reason: "The IP is missing.")
        }
        
        //check if the IP is valid
        if isValidIp(ip: ip) {
            let portStrings = extractNumbersAsStringFromBrackets(input: rustScan(ip: ip))
            return ports(portNumbers: portStrings)
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

//executing a basic command of rustscan
func rustScan(ip: String) -> String {
    let process = Process()
    let pipe = Pipe()

    process.executableURL = URL(fileURLWithPath: "/opt/homebrew/bin/rustscan")
    process.arguments = ["-a", ip, "-g"]
    process.standardOutput = pipe

    do {
        try process.run()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            return output
        } else {
            return "Cannot read the output of the command"
        }
    } catch {
        return "Cannor run the command"
    }
}

//To return my json and the app will decode it later
struct ports: Content {
    var portNumbers: [String]
}

func extractNumbersAsStringFromBrackets(input: String) -> [String] {
    let regexPattern = "\\[(.*?)\\]"
    guard let regex = try? NSRegularExpression(pattern: regexPattern) else { return [] }

    let nsrange = NSRange(input.startIndex..<input.endIndex, in: input)
    guard let match = regex.firstMatch(in: input, options: [], range: nsrange),
          let range = Range(match.range(at: 1), in: input) else { return [] }

    let matchedString = String(input[range])
    let numberStrings = matchedString.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
    return numberStrings
}

