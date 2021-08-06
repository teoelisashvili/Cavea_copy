//
//  Header.swift
//  Cavea
//
//  Created by Teo Elisashvili on 11.06.21.
//

import UIKit

class Header: UICollectionReusableView {
    static var identifier = "Header"
    
    @IBOutlet weak var headerLbl: UILabel!
    
    var header: String! {
        didSet {
            headerLbl.text = header
        }
    }
    
}
