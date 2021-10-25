//
//  NoteTableViewCell.swift
//  Dependency Injection
//
//  Created by Bart Jacobs on 29/01/2018.
//  Copyright © 2018 Bart Jacobs. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    // MARK: - Type Properties
    
    static var reuseIdentifier: String { return String(describing: self) }

    // MARK: - Properties
    
    @IBOutlet var titleLabel: UILabel!
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
