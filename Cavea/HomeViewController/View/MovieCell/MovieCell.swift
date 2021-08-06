//
//  MovieCell.swift
//  Cavea
//
//  Created by Teo Elisashvili on 10.06.21.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellMovieTitle: UILabel!
    @IBOutlet weak var cellMovieGenre: UILabel!
    
    static var identifier = "MovieCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.layer.cornerRadius = 15
    }

}
