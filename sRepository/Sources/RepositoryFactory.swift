//
//  RepositoryFactory.swift
//  sRepository
//
//  Created by Thiago Valente on 18/09/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

extension Repository {

    func all(completion: (Result<[Model], RepositoryError>) -> Void) {
        storages.forEach { storage in
            guard let models = storage.read() as? [Self.Model] else {
                completion(.failure(.all))
                fatalError("Fail to cast the model in repository")
            }
            completion(.success(models))
        }
    }

    func save(_ model: Person, completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            storage.create(model)
            completion(.success(()) )
        }
    }

    func find(by id: Any, completion: (Result<Model?, RepositoryError>) -> Void) {
        storages.forEach { storage in
            if let result = storage.find(by: id) {
                guard let model = result as? Self.Model else {
                    completion(.failure(.all))
                    fatalError("Fail to cast the model in repository")
                }
                completion(.success((model)))
            }
            completion(.failure(.all))
        }
    }

    // TODO: Create this logic
    func find(by criteria: [String: Any], completion: (Result<[Model], RepositoryError>) -> Void) {
        completion(.failure(.all))
    }

    func update(_ model: Model, completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            storage.update(model)
        }
    }

    func update(_ models: [Model], completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            models.forEach { model in
                storage.update(model)
            }
        }
    }

    func delete(_ model: Model, completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            storage.delete(model)
        }
    }

    func delete(_ models: [Person], completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            models.forEach { model in
                storage.delete(model)
            }
        }
    }

}
