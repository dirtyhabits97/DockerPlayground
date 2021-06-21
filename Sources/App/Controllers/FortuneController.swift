//
//  File.swift
//  
//
//  Created by user on 20/06/21.
//

import Foundation
import Vapor

final class FortuneController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        routes.get("random", use: getFortune(_:))
    }

    private func getFortune(_ req: Request) -> EventLoopFuture<Fortune> {
        req.client.get("http://yerkee.com/api/fortune/wisdom")
            .flatMapThrowing({ res in
                try res.content.decode(Fortune.self)
            })
    }
}

struct Fortune: Content {
    let fortune: String
}
