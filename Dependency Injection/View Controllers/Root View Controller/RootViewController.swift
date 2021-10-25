//
//  RootViewController.swift
//  Dependency Injection
//
//  Created by Bart Jacobs on 29/01/2018.
//  Copyright © 2018 Bart Jacobs. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: -
    
    var notes = [Note]()
    
    private enum Segue {
        static let NoteDetails = "NoteDetails"
    }

    // MARK: - View Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Deselect Row
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case Segue.NoteDetails:
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? DetailViewController
            else { fatalError()}
            let note = notes[indexPath.row]
            destination.note = note
        default:
            break
        }
    }
    
}

extension RootViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.reuseIdentifier, for: indexPath) as? NoteTableViewCell else {
            fatalError("Unable to Dequeue Note Table View Cell")
        }
        
        // Fetch Note
        let note = notes[indexPath.row]
        
        // Configure Cell
        cell.titleLabel.text = note.title
        
        return cell
    }
    
}

extension RootViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}
