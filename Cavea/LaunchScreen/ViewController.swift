//
//  ViewController.swift
//  Cavea
//
//  Created by Teo Elisashvili on 10.06.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animate()
    }
    
    func animate() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 2
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(x: -(diffX/2),
                                          y: diffY/2,
                                          width: size,
                                          height: size)}

        UIView.animate(withDuration: 1.5) {
            self.imageView.alpha = 0
        } completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                    let sb = UIStoryboard(name: "HomeViewController", bundle: nil)
                    let vc = sb.instantiateViewController(identifier: "NavigationController")
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }}
        }
    }
}

