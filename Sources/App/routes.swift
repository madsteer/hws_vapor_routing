import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    router.group("hello") { group in
        group.get("world") { req in
            return "Hello, world!"
        }

        group.get("kitty") { req in
            return "Hello kitty"
        }
    }

    // try router.grouped("admin").register(collection: AdminCollection())
    router.group("article", Int.parameter) { group in
        group.get("read") { req -> String in
            let num = try req.parameters.next(Int.self)
            return "Reading Article \(num)"
        }

        group.get("edit") { req -> String in
            let num = try req.parameters.next(Int.self)
            return "Editing Article \(num)"
        }
    }

    router.get("articles", Article.parameter) { req -> Article in
        return try req.parameters.next(Article.self)
//        let article = try req.parameters.next(Article.self)
//
//        return article.flatmap(to: Article.self) { article in
//            guard let article = article else {
//                throw Abort(.badRequest)
//            }
//
//            return article
//        }
    }
}
