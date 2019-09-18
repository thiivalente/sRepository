//
//  RepositoryModel.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

/// Swift don't enable to create a associatedtype to model because
/// isn't possible to use associatedtype inside associatedtype
/// Note: This protocol is used in repository
public protocol RepositoryStorage {
    
    
    /// Initiatize the repository storage type
    ///
    /// - Parameter environment: Set if exists the environments difference sets
    init(environment: RepositoryEnvironment)
    
    func create(_ model: Any)
    func read() -> [Any]
    func find(by: Any) -> Any?
    func update(_ model: Any)
    func delete(_ model: Any)

}
