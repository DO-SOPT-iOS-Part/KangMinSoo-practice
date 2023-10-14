//
//  CheckPatternVC.swift
//  codeBaseLayout
//
//  Created by 강민수 on 10/14/23.
//

import UIKit

class CheckPatternVC: UIViewController {
    
    private let width = UIScreen.main.bounds.width / 2 //or view.bounds.width도 가능하다.
    private let height = UIScreen.main.bounds.height / 4 //or view.bounds.height도 가능하다.

    private var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    

    func setLayout() {
        [yellowView, greenView, blackView, blueView].forEach { [weak self] view in
            guard let self else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([yellowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                                     yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                                     yellowView.widthAnchor.constraint(equalToConstant: width),
                                     yellowView.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 0),
                                     greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 0),
                                     greenView.widthAnchor.constraint(equalToConstant: width),
                                     greenView.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([blackView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 0),
                                     blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                                     blackView.widthAnchor.constraint(equalToConstant: width),
                                     blackView.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor, constant: 0),
                                     blueView.leadingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: 0),
                                     blueView.widthAnchor.constraint(equalToConstant: width),
                                     blueView.heightAnchor.constraint(equalToConstant: height)])
    }
}
