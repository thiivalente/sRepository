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
    
    func create(_ model: Any) {
        let model = model as! Person
        let person = personDao.new()
        switch person {
        case .success(let person):
            person.id = Int64(model.id)
            person.name = model.name
            person.age = Int32(model.age)
            _ = personDao.save()
        default:
            fatalError("Ocorreu um erro ao salvar")
        }
    }
    
    func read() -> [Any] {
        let people = personDao.fetchAll()
        switch people {
        case .success(let people):
            var convertedModel: [Person] = []
            people.forEach { (person) in
                convertedModel.append(
                    Person(id: Int(person.id), name: person.name!, age: Int(person.age))
                )
            }
            return convertedModel
        default:
            print("Fail to fetch people")
        }
        return []
    }
    
    func find(by: Any) -> Any? {
        return nil
    }
    
    func update(_ model: Any) {
        //
    }
    
    func delete(_ model: Any) {
        //
    }

}
