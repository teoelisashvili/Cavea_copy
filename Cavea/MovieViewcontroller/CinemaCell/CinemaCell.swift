//
//  CinemaCell.swift
//  Cavea
//
//  Created by Teo Elisashvili on 12.06.21.
//

import UIKit

class CinemaCell: UICollectionViewCell {
    
    static let identifier = "CinemaCell"
    
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var cinemaNameLbl: UILabel!
    @IBOutlet weak var cinemaAddressLbl: UILabel!
    @IBOutlet var timeLbl: [UILabel]!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundViewCell.layer.cornerRadius = 10
        backgroundViewCell.layer.shadowColor = UIColor.black.cgColor
        backgroundViewCell.layer.shadowOpacity = 0.2
        backgroundViewCell.layer.shadowOffset = .zero
        backgroundViewCell.layer.shadowRadius = 2
        
        timeLbl.forEach { $0.layer.borderWidth = 1}
        timeLbl.forEach { $0.layer.borderColor = UIColor.gray.cgColor}
        timeLbl.forEach { $0.layer.cornerRadius = 6 }
    }    
}
