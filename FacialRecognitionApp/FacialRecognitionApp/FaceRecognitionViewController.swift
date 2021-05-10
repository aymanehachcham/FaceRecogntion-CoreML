//
//  FaceRecognitionViewController.swift
//  FaceMask
//
//  Created by aymane hachcham on 5/10/21.
//

import Foundation
import UIKit

class FaceRecognitionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Face Recognition"
        view.backgroundColor = .white
        
        setUpTabBar()
    }
    
    fileprivate func setUpTabBar(){
        
        // The Setup Bar
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = .lightText
        self.navigationController?.setNeedsStatusBarAppearanceUpdate()
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.backgroundColor = .systemGray4
    }
}

