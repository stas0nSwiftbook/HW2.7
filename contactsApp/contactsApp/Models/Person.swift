//
//  Person.swift
//  contactsApp
//
//  Created by Станислав Буйновский on 08.11.2021.
//

import Foundation

struct Person {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    
    var fullName: String {
        firstName + " " + lastName
    }
}
