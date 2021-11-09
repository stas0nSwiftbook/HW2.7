//
//  DataManager.swift
//  contactsApp
//
//  Created by Станислав Буйновский on 08.11.2021.
//

import Foundation

protocol PersonProtocol {
    func getPersons() -> [Person]
}

class DataManager {
    private let firstNames = [
        "Liam", "Noah", "William", "James", "Logan", "Benjamin", "Mason",
        "Elijah", "Oliver", "Jacob", "Emma", "Olivia", "Ava", "Isabella",
        "Sophia", "Mia", "Charlotte", "Amelia", "Evelyn", "Abigail"
    ]
    
    private let lastNames = [
        "Aaboe", "Athrood", "Asafa", "Abawi", "Ashbaugh", "Adara", "Abbott",
        "Acampora", "Ackerman", "Ackroyd", "Ashby", "Axworthy", "Ainge", "Abernathy",
        "Atkinson", "Abner", "Avando", "Agholor", "Allred", "Asola", "Abrams"
    ]
    
    private let phones = [
        "7527394292", "4554288767", "6686313478", "2173472753", "4260661991", "9803734392",
        "7861662457","4106249458", "1640139914", "1605688653", "9354088724", "3698936664",
        "2054308708", "2787944732", "9409212051", "8404912336", "5734133274", "9593355954",
        "4183842925", "9254728460",
    ]
    
    private let emails = [
        "nsXxq@box.com", "clwqw@box.com", "qXRjX@box.com", "QWOaM@box.com", "BgeIH@box.com",
        "EYtSq@box.com", "ANmeN@box.com", "YPsIM@box.com", "AWiUA@box.com", "nNkJn@box.com",
        "udIIA@box.com", "YffTW@box.com", "IcGaz@box.com", "tfUlL@box.com", "nBZLt@box.com",
        "hLWFi@box.com", "UmifA@box.com", "vAOpq@box.com", "oQmEb@box.com", "rYCRM@box.com"
    ]
}

extension DataManager: PersonProtocol {
    func getPersons() -> [Person] {
        var resultData: [Person] = []
        var tempFirstNames = firstNames
        var tempLastNames = lastNames
        var tempPhones = phones
        var tempEmails = emails
        
        while !tempFirstNames.isEmpty {
            let firstName = randomValue(from: &tempFirstNames)
            let lastName = randomValue(from: &tempLastNames)
            let phone = randomValue(from: &tempPhones)
            let email = randomValue(from: &tempEmails)
            
            let person = Person(firstName: firstName, lastName: lastName, phone: phone, email: email)
            resultData.append(person)
        }
        
        return resultData
    }
    
    private func randomValue(from list: inout [String]) -> String {
        let randomIndex = Int.random(in: 0..<list.count)
        let value = list[randomIndex]
        list = list.filter { $0 != value }
        
        return value
    }
    
}
