//
//  ContactsListViewController.swift
//  contactsApp
//
//  Created by Станислав Буйновский on 09.11.2021.
//

import UIKit

class ContactsListViewController: UITableViewController {

    private let dataManager = DataManager()
    private var persons: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        persons = dataManager.getPersons()
        pushDataToTabs(for: persons)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)

        let person = persons[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content

        return cell
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedVC = segue.destination as? ContactDetailedViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let person = persons[indexPath.row]
        
        detailedVC.person = person
    }
    
    private func pushDataToTabs(for data: [Person]) {
        guard let tabBarControllers = tabBarController?.viewControllers else { return }
        
        for controller in tabBarControllers {
            if let contactsSectionsVC = controller as? ContactsSectionsViewController {
                contactsSectionsVC.persons = persons
            }
        }
    }
}
