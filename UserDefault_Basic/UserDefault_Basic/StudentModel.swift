//
//  StudentModel.swift
//  UserDefault_Basic
//
//  Created by Admin on 17/03/23.
//

import Foundation

struct Student:Codable{  // same as --> struct Student:Encodable,Decodable
    let name:String
    let marks:Int
    let age:Int
}
