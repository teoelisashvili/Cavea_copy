//
//  HomeViewController.swift
//  Cavea
//
//  Created by Teo Elisashvili on 10.06.21.
//

import UIKit

class HomeViewController: UIViewController {
    
    static let identifier = "HomeViewController"
    
    static let sectionHeaderView = "Header "
    
    let menuArray = ["ფილმები", "ბილეთები", "ბარი", "შესვლა"]
    
    let moviesLabelArray = ["უარყოფითი რიცხვები","მკვლელის ცოლის მცველი","ფორსაჟი 9","წყევლა 3","ცრუდსები 2","კრუელა","ჩუმი ადგილი","არასწორი პოლიციელი","მორტალ კომბატი","რიცხვა","Black Widow","Petter Rabbit 2", "In the Heights","Space Jam"]
    let moviesLabelArray2 = ["Black Widow","Petter Rabbit 2", "In the Heights","Space Jam"]
    
    let moviesImageArray = [UIImage(named: "uaryofiti"),UIImage(named: "hitmans"),UIImage(named: "fast"),UIImage(named: "conj"),UIImage(named: "cruds"),UIImage(named: "cruella"),UIImage(named: "silent"),UIImage(named: "araswori"),UIImage(named: "mortal"),UIImage(named: "risxva"),UIImage(named: "black"),UIImage(named: "peter"),UIImage(named: "intheheights"),UIImage(named: "space")]
    let moviesImageArray2 = [UIImage(named: "black"),UIImage(named: "peter"),UIImage(named: "intheheights"),UIImage(named: "space")]
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var layerView: UIView!
    @IBOutlet weak var cinemasBtn: UIButton!
    @IBOutlet weak var genresBtn: UIButton!
    @IBOutlet var languageBtn: [UIButton]!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var layerViewLeading: NSLayoutConstraint!
    @IBOutlet weak var layerViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var collectionViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var collectionViewLeading: NSLayoutConstraint!
    
    private var isFilterViewDown = true
    private var isMenuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorColor = .clear
        
        filterView.layer.cornerRadius = 20
        
        layerView.isUserInteractionEnabled = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: MovieCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: MenuCell.identifier, bundle: nil), forCellReuseIdentifier: MenuCell.identifier)

        navigationItem.titleView = UIImageView(image: UIImage(named: "logo_nb"))
        
        setupFilterView()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(moveView))
        filterView.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapView))
        layerView.addGestureRecognizer(tapGesture)
    }
    
    func setupFilterView() {
        cinemasBtn.layer.borderColor = UIColor.black.cgColor
        cinemasBtn.layer.borderWidth = 1
        genresBtn.layer.borderColor = UIColor.black.cgColor
        genresBtn.layer.borderWidth = 1
        languageBtn.forEach {$0.layer.borderColor = UIColor.purple.cgColor}
        languageBtn.forEach {$0.layer.borderWidth = 1}
        filterBtn.layer.cornerRadius = 15
    }
    
    func fadeLayerView() {
        layerView.backgroundColor = .black
        layerView.alpha = 0.2
    }
    
    func unfadeLayerView() {
        layerView.backgroundColor = .clear
    }
    
    @objc func moveView(sender: UIPanGestureRecognizer) {
        let translate = sender.translation(in: self.view)
        
        switch sender.state {
        case .changed:
            layerView.isUserInteractionEnabled = true
            guard translate.y >= 0 else { return }
            
            filterView.transform = CGAffineTransform(translationX: 0, y: translate.y)
        case .ended:
            if translate.y > 320 {
                UIView.animate(withDuration: 0.3) {
                    self.heightConstraint.constant = 0
                    self.view.layoutIfNeeded()
                    self.layerView.backgroundColor = .clear
                    self.layerView.isUserInteractionEnabled = false
                }
            } else {
                filterView.transform = .identity
            }
        default:
            break
        }
    }
    
    @objc func tapView() {
        print("tapped")
        heightConstraint.constant = 0
        
        layerViewLeading.constant = 0
        layerViewTrailing.constant = 0
        collectionViewTrailing.constant = 0
        collectionViewLeading.constant = 0
        
        isMenuOut = false
        isFilterViewDown = true
        layerView.isUserInteractionEnabled = false
        layerView.backgroundColor = .clear
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func menuClicked(_ sender: UIBarButtonItem) {
        if isMenuOut == false {
            UIView.animate(withDuration: 0.3) {
                self.layerViewLeading.constant = 300
                self.layerViewTrailing.constant = -300
                self.collectionViewLeading.constant = 300
                self.collectionViewTrailing.constant = -300
                self.view.layoutIfNeeded()
                self.fadeLayerView()}
                completion: { status in
                    self.layerView.isUserInteractionEnabled = true
                    self.isMenuOut = true}
        } else {
            UIView.animate(withDuration: 0.3) {
                self.layerViewLeading.constant = 0
                self.layerViewTrailing.constant = 0
                self.collectionViewLeading.constant = 0
                self.collectionViewTrailing.constant = 0
                self.view.layoutIfNeeded()
                self.unfadeLayerView()}
                completion: { status in
                    self.layerView.isUserInteractionEnabled = false
                    self.isMenuOut = false}
        }
    }
    
    @IBAction func filterClicked(_ sender: UIBarButtonItem) {
        if isFilterViewDown {
            UIView.animate(withDuration: 0.3) {
                self.heightConstraint.constant = 450
                self.view.layoutIfNeeded()
                self.fadeLayerView()
            } completion: { status in
                self.isFilterViewDown = false
                self.layerView.isUserInteractionEnabled = true
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.heightConstraint.constant = 0
                self.view.layoutIfNeeded()
                self.unfadeLayerView()
            } completion: { status in
                self.isFilterViewDown = true
                self.layerView.isUserInteractionEnabled = false
            }
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? 10 : 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        cell.cellImage.image = moviesImageArray[indexPath.row]
        cell.cellMovieTitle.text = moviesLabelArray[indexPath.row]
        
        if indexPath == [1,0] || indexPath == [1,1] || indexPath == [1,2] || indexPath == [1,3] {
            cell.cellImage.image = moviesImageArray2[indexPath.row]
            cell.cellMovieTitle.text = moviesLabelArray2[indexPath.row]
        }
        return cell
    }
    
}
extension HomeViewController: UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! Header
        header.backgroundColor = .clear
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "MovieViewController", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "MovieViewController") as! MovieViewController
        vc.movieNameText = moviesLabelArray[indexPath.row]
        vc.movieImageText = moviesImageArray[indexPath.row]!
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width/3 - 30, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
        cell.menuLbl.text = menuArray[indexPath.row]
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
