//
//  RepositoryFactory.swift
//  sRepository
//
//  Created by Thiago Valente on 18/09/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

extension Repository {

    func all() -> [Model] {
        if let localStorage = self.localStorage {
            guard let models = localStorage.read() as? [Self.Model] else {
                fatalError("Fail to cast the model in repository")
            }
            return models
        }
        return []
    }

    func save(_ model: Model) {
        if let localStorage = self.localStorage {
            localStorage.create(model)
        }
    }

    func find(by id: Any) -> Model? {
        if let localStorage = self.localStorage {
            if let result = localStorage.find(by: id) {
                guard let model = result as? Self.Model else {
                    fatalError("Fail to cast the model in repository")
                }
                return model
            }
            return nil
        }
        return nil
    }

    // TODO: Create this logic
    func find(by criteria: [String: Any]) -> [Model] {
        return []
    }

    func update(_ model: Model) {
        if let localStorage = self.localStorage {
            localStorage.update(model)
        }
    }

    func update(_ models: [Model]) {
        models.forEach { model in
            self.update(model)
        }
    }

    func delete(_ model: Model) {
        if let localStorage = self.localStorage {
            localStorage.delete(model)
        }
    }

    func delete(_ models: [Model]) {
        if let localStorage = self.localStorage {
            models.forEach { model in
                localStorage.delete(model)
            }
        }
    }

}
