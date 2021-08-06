//
//  SeatCell.swift
//  Cavea
//
//  Created by Teo Elisashvili on 12.06.21.
//

import UIKit

class SeatCell: UICollectionViewCell {
    
    static let identifier = "SeatCell"

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var seatNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCell.layer.cornerRadius = 5
        viewCell.layer.borderColor = UIColor.gray.cgColor
        viewCell.layer.borderWidth = 1
        
//        imageCell.layer.cornerRadius = 5
//        imageCell.layer.borderColor = UIColor.gray.cgColor
//        imageCell.layer.borderWidth = 1
        
    }
    
//    override var isSelected: Bool{
//    didSet{
//      if self.isSelected
//      {
//        self.viewCell.backgroundColor = .purple
//      }
//      else
//      {
////        self.viewCell.layer.borderColor = .none
////        self.viewCell.layer.borderWidth = 1
//      }
//    }
  }


