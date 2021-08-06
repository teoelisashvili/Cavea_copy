//
//  DateCell.swift
//  Cavea
//
//  Created by Teo Elisashvili on 12.06.21.
//

import UIKit

class DateCell: UICollectionViewCell {
    
    static let identifier = "DateCell"
    
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var weekDayLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundViewCell.layer.cornerRadius = 15
    }
    
    override var isSelected: Bool{
    didSet{
      if self.isSelected
      {
        self.backgroundViewCell.layer.borderColor = UIColor.purple.cgColor
        self.backgroundViewCell.layer.borderWidth = 2
        self.backgroundViewCell.backgroundColor = .white
      }
      else
      {
        self.backgroundViewCell.layer.borderColor = .none
        self.backgroundViewCell.layer.borderWidth = 0
        self.backgroundViewCell.backgroundColor = UIColor.systemGray5
      }
    }
  }
}
