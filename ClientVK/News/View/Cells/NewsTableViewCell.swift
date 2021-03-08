//
//  NewsTableViewCell.swift
//  ClientVK
//
//  Created by DES on 08.03.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //loadViewFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        //loadViewFromNib()
    }
    
    private func nibSetup() {
        //UINib(nibName: "", bundle: nil)
    }
    
    func setNews(_ news: News) {
        titleLabel.text = news.text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2.0
    }
    
}
