import Vapor

func routes(_ app: Application) throws {
    app.get("ip", ":ip") { req -> String in
        //Get the ip parameter from the request
        guard let ip = req.parameters.get("ip") else {
            throw Abort(.badRequest, reason: "The IP is missing.")
        }
        
    }
}
