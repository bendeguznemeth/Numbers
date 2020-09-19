//
//  NumberTableViewCell.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import UIKit

class NumberTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let view = UIView()
        view.backgroundColor = .red
        selectedBackgroundView = view
        textLabel?.highlightedTextColor = .white
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        selectedBackgroundView?.backgroundColor = highlighted ? .blue : .red
    }
}
