//
//  ViewController.swift
//  RealmDemo
//
//  Created by outofcoding on 2021/04/03.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        write()
        read()
    }
    
    private func write() {
        guard let realm = try? Realm() else { return }
        
        let person = Person()
        person.name = "outofcoding"
        person.address = "Korea"
        
        try? realm.write {
            realm.add(person)
        }
    }
    
    private func read() {
        guard let realm = try? Realm() else { return }
        
        let models = realm.objects(Person.self)
        for model in models {
            print(model.name, model.address)
        }
    }
}

@objcMembers
class Person: Object {
    dynamic var name = ""
    dynamic var address = ""
}
