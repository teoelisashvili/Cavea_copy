//
//  MovieViewController.swift
//  Cavea
//
//  Created by Teo Elisashvili on 12.06.21.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var collectionViewDate: UICollectionView!
    @IBOutlet weak var movieCoverImage: UIImageView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var inicatorView: UIView!
    @IBOutlet weak var indicatorLeading: NSLayoutConstraint!
    @IBOutlet weak var indicatorWidth: NSLayoutConstraint!
    @IBOutlet var timeBtn: [UIButton]!
    
    @IBOutlet var backgroundView: [UIView]!
    
    let days = ["15","16","17","18","19","20","21"]
    let weekDay = ["დღეს","ოთხ","ხუთ","პარ","შაბ","კვი","ორშ"]
    
    var movieNameText = ""
    var movieImageText: UIImage?
    
    
    let gradient = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieName.text = movieNameText
        movieImage.image = movieImageText
        movieCoverImage.image = movieImageText
        
        movieImage.layer.cornerRadius = 15
        
        collectionViewDate.dataSource = self
        collectionViewDate.delegate = self
        collectionViewDate.register(UINib(nibName: DateCell.identifier, bundle: nil), forCellWithReuseIdentifier: DateCell.identifier)
        
        setupCinemaLayout()
        setupGradient()
    }
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear (animated)
        let testIndexpath: IndexPath = IndexPath (row: 0, section: 0)
        collectionViewDate.selectItem (at: testIndexpath, animated: true, scrollPosition: UICollectionView.ScrollPosition.bottom)
        
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.isTranslucent = true
    }
    
    @IBAction func sessionsClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.indicatorLeading.constant = 20
            self.indicatorWidth.constant = 73
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func detailsClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.indicatorLeading.constant = 112
            self.indicatorWidth.constant = 100
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func timeBtnClicked(_ sender: Any) {
        let vc = UIStoryboard(name: SeatsViewController.identifier, bundle: nil).instantiateViewController(identifier: SeatsViewController.identifier) as! SeatsViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupGradient() {
        gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
        gradient.locations = [0, 0.3]
        gradient.frame = gradientView.bounds
        gradientView.layer.addSublayer(gradient)
    }
    
    
    func setupCinemaLayout() {
        backgroundView.forEach { $0.layer.cornerRadius = 10}
        backgroundView.forEach { $0.layer.shadowColor = UIColor.black.cgColor}
        backgroundView.forEach { $0.layer.shadowOpacity = 0.2}
        backgroundView.forEach { $0.layer.shadowOffset = .zero}
        backgroundView.forEach { $0.layer.shadowRadius = 2}
        
        timeBtn.forEach { $0.layer.borderWidth = 1}
        timeBtn.forEach { $0.layer.borderColor = UIColor.gray.cgColor}
        timeBtn.forEach { $0.layer.cornerRadius = 6 }
    }
}

extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewDate.dequeueReusableCell(withReuseIdentifier: DateCell.identifier, for: indexPath) as! DateCell
        cell.dayLbl.text = days[indexPath.row]
        cell.weekDayLbl.text = weekDay[indexPath.row]
        return cell
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: collectionViewDate.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(20)
    }
}
