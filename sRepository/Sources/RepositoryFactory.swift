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
            storage.read() { result in
                switch result {
                case .success(let models):
                    guard let models = models as? [Self.Model] else {
                        return completion(.failure(RepositoryError(message: "Fail to cast the model in repository")))
                    }
                    return completion(.success(models))
                case .failure(let error):
                    return completion(.failure(error))
                }
            }
        }
    }

    func save(_ model: Model, completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            storage.create(model) { result in
                switch result {
                case .success(_):
                    return completion(.success(()))
                case .failure(let error):
                    return completion(.failure(error))
                }
            }
        }
    }

    func find(by id: Model, completion: (Result<Model?, RepositoryError>) -> Void) {
        storages.forEach { storage in
            storage.find(by: id) { result in
                switch result {
                case .success(let model):
                    guard let _ = model else {
                        return completion(.success(nil))
                    }
                    guard let model = model as? Self.Model else {
                        return completion(.failure(RepositoryError(message: "Fail to cast the model in repository")))
                    }
                    return completion(.success(model))
                case .failure(let error):
                    return completion(.failure(error))
                }
            }
        }
    }

    // TODO: Create this logic
    func find(by criteria: [String: Any], completion: (Result<[Model], RepositoryError>) -> Void) {
        return completion(.failure(RepositoryError(message: "Method not implemented")))
    }

    func update(_ model: Model, completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            storage.update(model) { result in
                switch result {
                case .success(_):
                    return completion(.success(()))
                case .failure(let error):
                    return completion(.failure(error))
                }
            }
        }
    }

    func update(_ models: [Model], completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            models.forEach { model in
                storage.update(model) { result in
                    switch result {
                    case .success(_):
                        return completion(.success(()))
                    case .failure(let error):
                        return completion(.failure(error))
                    }
                }
            }
        }
    }

    func delete(_ model: Model, completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            storage.delete(model) { result in
                switch result {
                case .success(_):
                    return completion(.success(()))
                case .failure(let error):
                    return completion(.failure(error))
                }
            }
        }
    }

    func delete(_ models: [Model], completion: (Result<Void, RepositoryError>) -> Void) {
        storages.forEach { storage in
            models.forEach { model in
                storage.delete(model) { result in
                    switch result {
                    case .success(_):
                        return completion(.success(()))
                    case .failure(let error):
                        return completion(.failure(error))
                    }
                }
            }
        }
    }

}
