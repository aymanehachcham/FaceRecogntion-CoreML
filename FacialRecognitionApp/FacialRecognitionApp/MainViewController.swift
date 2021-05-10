//
//  MainViewController.swift
//  FaceMask
//
//  Created by aymane hachcham on 5/9/21.
//

import Foundation
import UIKit


class MainViewController: UIViewController {
    
    
    let screenSize = UIScreen.main.bounds
    
    lazy var appLabel: UILabel = {
      
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 50)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Face AI"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var appLogo: UIImageView = {
      
        var logo = UIImageView()
        logo.image = UIImage(named: "faceLogo")?.resized(newSize: CGSize(width: 50, height: 50))
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        return logo
    }()
    
    lazy var faceMaskButton: CustomButton = {
      
        var button = CustomButton()
        button.setTitle("Face Mask", for: .normal)
        button.backgroundColor = .systemGreen
        
        let buttonIcon = UIImage(named: "face-recognition")?.resized(newSize: CGSize(width: 30, height: 30))
        button.setImage(buttonIcon, for: .normal)
        
        button.addTarget(self, action: #selector(didTapFaceMaskButton(_ :)), for: .touchUpInside)
        return button
    }()
    
    lazy var faceRecognitionButton: CustomButton = {
      
        var button = CustomButton()
        button.setTitle("Face Recognition", for: .normal)
        button.backgroundColor = .systemGreen
        
        let buttonIcon = UIImage(named: "radar")?.resized(newSize: CGSize(width: 30, height: 30))
        button.setImage(buttonIcon, for: .normal)
        
        button.addTarget(self, action: #selector(didTapFaceRecognitionButton(_ :)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(appLabel)
        view.addSubview(appLogo)
        view.addSubview(faceMaskButton)
        view.addSubview(faceRecognitionButton)
        initConstraints()
    }
    
    fileprivate func initConstraints(){
        
        NSLayoutConstraint.activate([
            
            appLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            appLabel.heightAnchor.constraint(equalToConstant: 120),
            
            appLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appLogo.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 50),
            appLogo.heightAnchor.constraint(equalToConstant: 150),
            appLogo.widthAnchor.constraint(equalToConstant: 150),
            
            faceMaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            faceMaskButton.topAnchor.constraint(equalTo: appLogo.bottomAnchor, constant: 250),
            faceMaskButton.heightAnchor.constraint(equalToConstant: screenSize.height/16),
            faceMaskButton.widthAnchor.constraint(equalToConstant: screenSize.width*5/6),
            
            faceRecognitionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            faceRecognitionButton.heightAnchor.constraint(equalToConstant: screenSize.height/16),
            faceRecognitionButton.widthAnchor.constraint(equalToConstant: screenSize.width*5/6),
            faceRecognitionButton.topAnchor.constraint(equalTo: faceMaskButton.bottomAnchor, constant: 25),
        ])
    }
    
    @objc private func didTapFaceMaskButton(_ sender: CustomButton){
        
        let faceMaskVC = FaceMaskViewController()
        let navigationController = UINavigationController(rootViewController: faceMaskVC)
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc private func didTapFaceRecognitionButton(_ sender: CustomButton){
        
        let faceRecognitionVC = FaceRecognitionViewController()
        let navigationController = UINavigationController(rootViewController: faceRecognitionVC)
        present(navigationController, animated: true, completion: nil)
    }
    
    
}
