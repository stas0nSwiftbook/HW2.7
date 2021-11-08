//
//  ContactsSectionsViewController.swift
//  contactsApp
//
//  Created by Станислав Буйновский on 09.11.2021.
//

import UIKit

class ContactsSectionsViewController: UITableViewController {

    var persons: [Person]!

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        let person = persons[indexPath.section]
        
        switch indexPath.row{
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "phoneCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = person.phone
            content.image = UIImage(systemName: "phone")
            cell.contentConfiguration = content
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = person.email
            content.image = UIImage(systemName: "mail")
            cell.contentConfiguration = content
        }
        
        return cell
    }

}
