//
//  Repository.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

// TODO: Add logic to remote -> implements results assync with results
public protocol Repository {
    
    /// Implements the storages in init
    var localStorage: RepositoryStorage? { get set }
    var remoteStorage: RepositoryStorage? { get set }

    associatedtype Model: Any

    init(environment: RepositoryEnvironment)

    /// Save this model
    ///
    /// - Parameter model: send the model which will be saved
    func save(_ model: Model)

    /// Get all values storage of this model
    ///
    /// - Returns: array from model
    func all() -> [Model]

    /// Find the first model from this ID
    /// Usually this id value need to be UNIQUE
    ///
    /// - Parameter id: id from this object
    /// - Returns: the first model found from this id
    func find(by id: Any) -> Model?

    /// Find all objects where this dictionary response
    ///
    /// - Parameter criteria: dictionary of properties from object
    /// - Returns: array from model
    func find(by criteria: [String: Any]) -> [Model]

    /// Update this model
    ///
    /// - Parameter model: send the model which will be updated
    /// - Returns: the model updated
    func update(_ model: Model)

    /// Update the list of models
    ///
    /// - Parameter models: the list of models which will be updated
    /// - Returns: the array from model updated
    func update(_ models: [Model])

    /// Delete this model
    ///
    /// - Parameter model: model which will be deleted
    func delete(_ model: Model)

    /// Delete the list of model
    ///
    /// - Parameter models: models which will be deleted
    func delete(_ models: [Model])

}
