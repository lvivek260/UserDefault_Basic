//
//  ViewController.swift
//  UserDefault_Basic
//
//  Created by Admin on 17/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Basic Data Types
        saveBasicTypesData()
        fetchBasicTypesData()
        
        // Array And Dictionary
        saveArrayAndDictionary()
        fetchArrayAndDictionary()
        
        // save object Using PropertyListDecoder
        saveObjectUsingPropertyListEncoder()
        fetchObjectUsingPropertyListDecoder()
        
        // save Array Of object using PropertyListDecoder
        saveArrayOfObjectUsingPropertyListEncoder()
        fetchArrayOfObjectUsingPropertyListDecoder()
        
        // save Object Using JsonDecoder
        saveObjectUsingJsonEncoder()
        fetchObjectUsingJsonDecoder()
        
        // save Array Of object using JsonDecoder
        saveArrayOfObjectUsingJsonEncoder()
        fetchArrayOfObjectUsingJsonDecoder()
    }

    func saveBasicTypesData(){
        let name:String = "Lokhande Vivek"
        let number:Int = 8421304231
        let salary:Double = 20000.50
        let age:Float = 22.5
        let married:Bool = false
        let photoUrl = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJSVdXm2853nGnAl4EtU8O-avZbRWnvXeZbvfCvJX6Nw&s")
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(number, forKey: "number")
        UserDefaults.standard.set(salary, forKey: "salary")
        UserDefaults.standard.set(age, forKey: "age")
        UserDefaults.standard.set(married, forKey: "married")
        UserDefaults.standard.set(photoUrl, forKey: "photoUrl")
    }
    func fetchBasicTypesData(){
        let name = UserDefaults.standard.string(forKey: "name")
        let number = UserDefaults.standard.integer(forKey: "number")
        let salary = UserDefaults.standard.double(forKey: "salary")
        let age = UserDefaults.standard.float(forKey: "age")
        let married = UserDefaults.standard.bool(forKey: "married")
        let url = UserDefaults.standard.url(forKey: "photoUrl")
        
        print("name: ",name!)
        print("number: ",number)
        print("salary: ",salary)
        print("age: ",age)
        print("married: ",married)
        print("url: ",url!)
    }
    
    
    // Array and Dictionary
    
    func saveArrayAndDictionary(){
        let arrayData:[Int] = [84,21,30,42,31]
        let dictionaryData:[String:Int] = ["Vivek":84,"Pavan":21,"Rohan":30,"Shubham":42,"Rahul":31]
        
        UserDefaults.standard.set(arrayData, forKey: "arrayData")
        UserDefaults.standard.set(dictionaryData, forKey: "dictionaryData")
    }
    func fetchArrayAndDictionary(){
        let arrayData = UserDefaults.standard.array(forKey: "arrayData")
        let dictionaryData = UserDefaults.standard.dictionary(forKey: "dictionaryData")
        
        print("Array Data: ",arrayData!)
        print("Dictionary Data: ",dictionaryData!)
    }
    
    
    // PropertyListEncoder and PropertyListDecoder
    
    func saveObjectUsingPropertyListEncoder(){
        let object = Student(name: "Vivek", marks: 81, age: 22)
        let data = try! PropertyListEncoder().encode(object)
      
        UserDefaults.standard.set(data, forKey: "objectData")
    }
    func fetchObjectUsingPropertyListDecoder(){
        let data = UserDefaults.standard.value(forKey: "objectData") as! Data
        print("Object :",data)
        
        let object = try! PropertyListDecoder().decode(Student.self, from: data)
        print(object.name)
    }
    
    func saveArrayOfObjectUsingPropertyListEncoder(){
        let arrayObject = [
            Student(name: "Vivek", marks: 25, age: 23),
            Student(name: "Pavan", marks: 34, age: 44),
            Student(name: "Tuka", marks: 57, age: 97),
            Student(name: "Ravi", marks: 75, age: 34)
        ]
        let data = try? PropertyListEncoder().encode(arrayObject)
        UserDefaults.standard.set(data, forKey: "arrayObject")
    }
    func fetchArrayOfObjectUsingPropertyListDecoder(){
        let data = (UserDefaults.standard.value(forKey: "arrayObject") as? Data)!
        let arrayObject = (try? PropertyListDecoder().decode([Student].self, from: data))
        print(arrayObject! as [Student])
    }
    
    
    // JSONDecoder and JSONEncoder Using
    
    func saveObjectUsingJsonEncoder(){
        let object = Student(name: "Vivek", marks: 81, age: 84)
        let data = try! JSONEncoder().encode(object)
        UserDefaults.standard.set(data, forKey: "StudentObject")
    }
    func fetchObjectUsingJsonDecoder(){
        let data = UserDefaults.standard.data(forKey: "StudentObject")! as Data
        let object = try! JSONDecoder().decode(Student.self, from: data)
        print(object.name)
    }
    
    func saveArrayOfObjectUsingJsonEncoder(){
        let arrayObject = [
            Student(name: "Vivek", marks: 25, age: 23),
            Student(name: "Pavan", marks: 34, age: 44),
            Student(name: "Tuka", marks: 57, age: 97),
            Student(name: "Ravi", marks: 75, age: 34)
        ]
        let data = try! JSONEncoder().encode(arrayObject)
        UserDefaults.standard.set(data, forKey: "ArrayOfObject")
    }
    func fetchArrayOfObjectUsingJsonDecoder(){
        let data = (UserDefaults.standard.value(forKey: "ArrayOfObject") as? Data)!
        let arrayObject = try! JSONDecoder().decode([Student].self, from: data)
        print(arrayObject as [Student])
    }
}

