//
//  Article.swift
//  App
//
//  Created by Cory Steers on 12/30/18.
//

import Foundation
import Vapor

struct Article: Parameter, Content {

    var id: Int
    var title: String

    init(id: Int) {
        self.id = id
        self.title = "Custom parameters rock!"
    }

    static func resolveParameter(_ parameter: String, on container: Container) throws -> Article {
        if let id = Int(parameter) {
            return Article(id: id)
        } else {
            throw Abort(.badRequest)
        }
    }
}
