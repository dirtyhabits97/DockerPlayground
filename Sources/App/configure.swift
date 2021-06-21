import Vapor

// configures your application
public func configure(_ app: Application) throws {
    try app.register(collection: FortuneController())
}
