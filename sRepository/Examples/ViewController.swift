//
//  ViewController.swift
//  sRepository
//
//  Created by Thiago Valente on 18/09/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var repository = PersonRepository(environment: .test)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newPerson = Person(
            id: Int.random(in: 0...10000),
            name: "Example",
            age: Int.random(in: 10...60)
        )
        repository.save(newPerson) { result in
            if case .failure(let fail) = result {
                print(fail.message)
            }
        }

        repository.all() { result in
            switch result {
            case .success(let persons):
                print("Teste: \(persons)")
            case .failure(let error):
                print(error.message)
            }
        }
    }
}
