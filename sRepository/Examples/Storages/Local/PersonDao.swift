//
//  PersonDao.swift
//  sRepository
//
//  Created by Thiago Valente on 18/09/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

class PersonDao: RepositoryStorage {
    
    let personDao: CoreDao<PersonManage>!

    required init(environment: RepositoryEnvironment) {
        personDao = CoreDao<PersonManage>(with: "sRepository") { result in
            switch result{
            case .success(let dao):
                return dao
            case .failure(_):
                fatalError("Fail to get person dao")
            }
        }!
    }
    
    func create(_ model: Any, completion: (Result<Void, RepositoryError>) -> Void) {
        let model = model as! Person
        let person = personDao.new()
        switch person {
        case .success(let person):
            person.id = Int64(model.id)
            person.name = model.name
            person.age = Int32(model.age)
            _ = personDao.save()
            return completion(.success(()))
        default:
            return completion(.failure(RepositoryError(message: "Fail to save in core data")))
        }
    }
    
    func read(completion: (Result<[Any], RepositoryError>) -> Void) {
        let people = personDao.fetchAll()
        switch people {
        case .success(let people):
            var convertedModel: [Person] = []
            people.forEach { (person) in
                convertedModel.append(
                    Person(id: Int(person.id), name: person.name!, age: Int(person.age))
                )
            }
            return completion(.success(convertedModel))
        default:
            return completion(.failure(RepositoryError(message: "Fail to fetch people in core data")))
        }
    }
    
    func find(by: Any, completion: (Result<Any?, RepositoryError>) -> Void) {
        return completion(.failure(RepositoryError(message: "Method not implemented")))
    }
    
    func update(_ model: Any, completion: (Result<Void, RepositoryError>) -> Void) {
        return completion(.failure(RepositoryError(message: "Method not implemented")))
    }
    
    func delete(_ model: Any, completion: (Result<Void, RepositoryError>) -> Void) {
        return completion(.failure(RepositoryError(message: "Method not implemented")))
    }

}
