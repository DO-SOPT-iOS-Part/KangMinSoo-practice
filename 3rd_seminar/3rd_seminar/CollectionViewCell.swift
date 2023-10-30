//
//  CollectionViewCell.swift
//  3rd_seminar
//
//  Created by 강민수 on 10/28/23.
//

import UIKit

import SnapKit
import Then

protocol ItemSelectedProtocol: NSObject {
    func getButtonState(state: Bool, row: Int)
}

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CollectionViewCell"
    
    weak var delegate: ItemSelectedProtocol?
    
    private let imageView = UIImageView()
    private lazy var likeButton = UIButton()
    var itemRow: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        hieararchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        likeButton.do {
            $0.addTarget(self,
                         action: #selector(likeButtonTap),
                         for: .touchUpInside)
            $0.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            $0.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .selected)
        }
    }
    
    func hieararchy() {
        [imageView, likeButton].forEach {
            self.contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        likeButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(16)
        }
    }
    
    @objc private func likeButtonTap() {
        self.likeButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.getButtonState(state: self.likeButton.isSelected,
                                          row: itemRow)
        }
    }
    
    func bindData(data: ImageCollectionData,
                  row: Int) {
        imageView.image = UIImage(named: data.image)
        likeButton.isSelected = data.isLiked
        itemRow = row
    }
}
