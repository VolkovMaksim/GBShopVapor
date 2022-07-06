import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    let controllerAuth = AuthController()
    // при запросе на url "register" будет использован класс AuthController - метод register
    app.post("register", use: controllerAuth.register)

    try app.register(collection: TodoController())
}
