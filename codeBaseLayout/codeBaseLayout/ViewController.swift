//
//  ViewController.swift
//  codeBaseLayout
//
//  Created by 강민수 on 10/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    var point1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20, height: 20)))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var point2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20, height: 20)))
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var shield: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setLayout()
    }
    
    func setLayout() {
        [point1, point2, shield].forEach { [weak self] view in
            guard let self else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([point1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
                                     point1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     point1.widthAnchor.constraint(equalToConstant: 20),
                                     point1.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([point2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
                                     point2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60),
                                     point2.widthAnchor.constraint(equalToConstant: 20),
                                     point2.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([shield.topAnchor.constraint(equalTo: self.point2.topAnchor, constant: 40),
                                     shield.leadingAnchor.constraint(equalTo: self.point2.leadingAnchor, constant: 40),
                                     shield.widthAnchor.constraint(equalToConstant: 60),
                                     shield.heightAnchor.constraint(equalToConstant: 20)])
    }
}


