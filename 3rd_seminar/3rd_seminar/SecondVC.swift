//
//  SecondVC.swift
//  3rd_seminar
//
//  Created by 강민수 on 10/28/23.
//

import UIKit

import SnapKit
import Then

class SecondVC: UIViewController {
    
    var imageCollectionList: [ImageCollectionData] = [.init(image: "image1", isLiked: true),
                                                      .init(image: "image2", isLiked: true),
                                                      .init(image: "image3", isLiked: false),
                                                      .init(image: "image4", isLiked: false),
                                                      .init(image: "image5", isLiked: true),
                                                      .init(image: "image6", isLiked: false),
                                                      .init(image: "image7", isLiked: true),
                                                      .init(image: "image8", isLiked: false),
                                                      .init(image: "image1", isLiked: false),
                                                      .init(image: "image2", isLiked: false),
                                                      .init(image: "image3", isLiked: true),
                                                      .init(image: "image4", isLiked: false),
                                                      .init(image: "image5", isLiked: true),
                                                      .init(image: "image6", isLiked: true),
                                                      .init(image: "image7", isLiked: false),
                                                      .init(image: "image8", isLiked: false),
                                                      .init(image: "image1", isLiked: false),
                                                      .init(image: "image2", isLiked: false),
                                                      .init(image: "image3", isLiked: false),
                                                      .init(image: "image4", isLiked: false),
                                                      .init(image: "image5", isLiked: false),
                                                      .init(image: "image6", isLiked: false),
                                                      .init(image: "image7", isLiked: false),
                                                      .init(image: "image8", isLiked: false),
                                                      .init(image: "image1", isLiked: true),
                                                      .init(image: "image2", isLiked: true),
                                                      .init(image: "image3", isLiked: false),
                                                      .init(image: "image4", isLiked: false),
                                                      .init(image: "image5", isLiked: false),
                                                      .init(image: "image6", isLiked: false),
                                                      .init(image: "image7", isLiked: false),
                                                      .init(image: "image8", isLiked: false),
                                                      .init(image: "image1", isLiked: true),
                                                      .init(image: "image2", isLiked: false),
                                                      .init(image: "image3", isLiked: false),
                                                      .init(image: "image4", isLiked: true),
                                                      .init(image: "image5", isLiked: false),
                                                      .init(image: "image6", isLiked: false),
                                                      .init(image: "image7", isLiked: true),
                                                      .init(image: "image8", isLiked: true)]
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        hieararchy()
        setLayout()
        setCollectionViewConfig()
    }
    
    private func setCollectionViewConfig() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureUI() {
        collectionView.do {
            $0.backgroundColor = .black
        }
    }
    
    func hieararchy() {
        self.view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension SecondVC: UICollectionViewDelegate {}
extension SecondVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier,
                                                            for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        item.delegate = self
        item.bindData(data: imageCollectionList[indexPath.row], row: indexPath.row)
        return item
    }
}

extension SecondVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
    }
}

extension SecondVC: ItemSelectedProtocol {
    func getButtonState(state: Bool, row: Int) {
        imageCollectionList[row].isLiked = state
    }
}
