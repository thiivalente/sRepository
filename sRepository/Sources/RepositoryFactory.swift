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
                return completion(.failure(RepositoryError(message: "Fail to cast the model in repository")))
            }
            return completion(.success(models))
        }
    }

    func save(_ model: Person, completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            storage.create(model)
            return completion(.success(()))
        }
    }

    func find(by id: Any, completion: (Result<Model?, RepositoryError>) -> Void) {
        storages.forEach { storage in
            if let result = storage.find(by: id) {
                guard let model = result as? Self.Model else {
                    return completion(.failure(RepositoryError(message: "Fail to cast the model in repository")))
                }
                return completion(.success((model)))
            }
        }
    }

    // TODO: Create this logic
    func find(by criteria: [String: Any], completion: (Result<[Model], RepositoryError>) -> Void) {
        return completion(.failure(RepositoryError(message: "Method not implemented")))
    }

    func update(_ model: Model, completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            storage.update(model)
            return completion(.success(()))
        }
    }

    func update(_ models: [Model], completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            models.forEach { model in
                storage.update(model)
                return completion(.success(()))
            }
        }
    }

    func delete(_ model: Model, completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            storage.delete(model)
            return completion(.success(()))
        }
    }

    func delete(_ models: [Person], completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            models.forEach { model in
                storage.delete(model)
                return completion(.success(()))
            }
        }
    }

}
