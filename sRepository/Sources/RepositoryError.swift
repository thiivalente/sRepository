//
//  RepositoryError.swift
//  sRepository
//
//  Created by Thiago Valente on 23/09/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

public enum RepositoryError: Error {
    case all
    case save
    case find
    case update
    case delete
    
    var message: String {
        switch self {
        case .all:
            return "Fail to get all in repository"
        case .save:
            return "Fail to save in repository"
        case .find:
            return "Fail to find the model in repository"
        case .update:
            return "Fail to update the model in repository"
        case .delete:
            return "Fail to delete the model in repository"
        }
    }
}
