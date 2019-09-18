//
//  RepositoryModel.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

public protocol RepositoryStorage {
    
    associatedtype Model: Any
    init(environment: RepositoryEnvironment, model: Model)
    
    func create(_ model: Model)
    func read() -> [Model]
    func update(_ model: Model)
    func delete(_ model: Model)

}
