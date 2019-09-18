//
//  PersonRepository.swift
//  sRepository
//
//  Created by Thiago Valente on 18/09/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

class PersonRepository: Repository {
    
    typealias Model = Person
    
    var localStorage: RepositoryStorage?
    var remoteStorage: RepositoryStorage?
    
    required init(environment: RepositoryEnvironment) {
        self.localStorage = PersonDao(environment: environment)
        self.remoteStorage = nil
    }

}
