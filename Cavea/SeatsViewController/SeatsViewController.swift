//
//  SeatsViewController.swift
//  Cavea
//
//  Created by Teo Elisashvili on 12.06.21.
//

import UIKit

class SeatsViewController: UIViewController {
    
    static let identifier = "SeatsViewController"
    
    @IBOutlet weak var cinemaName: UILabel!
    @IBOutlet weak var weekDay: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var language: UIButton!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var lari: UILabel!
    @IBOutlet weak var bookView: UIView!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var buyView: UIView!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var freeBtn: UIView!
    @IBOutlet weak var reservedBtn: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    
    let totalPayment = 10
    
    let seatsArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","1","2","3","4","5","6","7","8","9","10","11","12","13","1","2","3","4","5","6","7","8","9","10","11","12","13","1","2","3","4","5","6","7","8","9","10","11","12","13","1","2","3","4","5","6","7","8","9","10","11","12","13","1","2","3","4","5","6","7","8","9","10","11","12","13","1","2","3","4","5","6","7","8","9","10","11","12","13","1","2","3","4","5","6","7","8","9","10","11","12","13","1","2","3","4","5","6","7","8","9","10","11","12","13","1","2","3","4","5","6","7","8","9","10","11","12","13"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: SeatCell.identifier, bundle: nil), forCellWithReuseIdentifier: SeatCell.identifier)
        
        
        totalLbl.isHidden = true
        total.isHidden = true
        lari.isHidden = true
        
        setupLayout()
        
        total.text = "0"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //    func randomSeats() {
    //        for _ in 1...60 {
    //            let testIndexpath: IndexPath = IndexPath (row: (0...150).randomElement() ?? 0, section: 0)
    //            collectionView.selectItem (at: testIndexpath, animated: true, scrollPosition: UICollectionView.ScrollPosition.bottom)
    //            print(testIndexpath)
    //        }
    //    }
    
    func setupLayout() {
        time.layer.borderColor = UIColor.gray.cgColor
        time.layer.borderWidth = 1
        time.layer.cornerRadius = 5
        language.layer.cornerRadius = 5
        bookView.layer.borderColor = UIColor.gray.cgColor
        bookView.layer.borderWidth = 1
        bookView.layer.cornerRadius = bookView.frame.width/2
        buyView.layer.borderColor = UIColor.purple.cgColor
        buyView.layer.borderWidth = 1
        buyView.layer.cornerRadius = buyView.frame.width/2
        buyBtn.backgroundColor = UIColor.purple
        buyBtn.layer.cornerRadius = buyBtn.frame.width/2
        bookBtn.layer.cornerRadius = bookBtn.frame.width/2
        freeBtn.layer.borderColor = UIColor.purple.cgColor
        freeBtn.layer.borderWidth = 1
        freeBtn.layer.cornerRadius = 5
        reservedBtn.layer.cornerRadius = 5
        continueBtn.layer.cornerRadius = 5
        continueBtn.alpha = 0.5
        continueBtn.isEnabled = false
    }
    
    @IBAction func bookClicked(_ sender: Any) {
        buyBtn.backgroundColor = .clear
        buyView.layer.borderColor = UIColor.gray.cgColor
        bookBtn.backgroundColor = UIColor.purple
        bookView.layer.borderColor = UIColor.purple.cgColor
    }
    
    @IBAction func buyClicked(_ sender: Any) {
        buyBtn.backgroundColor = UIColor.purple
        buyView.layer.borderColor = UIColor.purple.cgColor
        bookBtn.backgroundColor = .clear
        bookView.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func continueClicked(_ sender: Any) {
        let vc = UIStoryboard(name: TicketViewController.identifier, bundle: nil).instantiateViewController(identifier: TicketViewController.identifier)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SeatsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        150
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeatCell.identifier, for: indexPath) as! SeatCell
        cell.seatNumber.text = seatsArray[indexPath.row]
        let selection = [true, false].randomElement()
        if selection == true {
            cell.viewCell.backgroundColor = UIColor.purple
        }
        return cell
    }
}

extension SeatsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SeatCell {
            if cell.viewCell.backgroundColor == .white {
                cell.viewCell.backgroundColor = .orange
                totalLbl.isHidden = false
                total.isHidden = false
                total.text = String(Int(total.text!)! + Int(totalPayment))
                lari.isHidden = false
                continueBtn.alpha = 1
                continueBtn.isEnabled = true
            } else if cell.viewCell.backgroundColor == .orange {
                cell.viewCell.backgroundColor = .white
                total.text = String(Int(total.text!)! - Int(totalPayment))
            } else {
                let alert = UIAlertController(title: "This seat is already taken.", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in }))
                self.present(alert, animated: true)
            }
        }
    }
}


extension SeatsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20.5, height: 20.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets.zero
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(5)
    }
}
