//
//  TweetCell.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import UIKit
import ReactiveKit
import Kingfisher

class TweetCell: UITableViewCell {
    
    private enum Constants {
        enum Sizes {
            static let contentInsetsSize = 10.0
            static let avatarSideSize = 50.0
        }
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        return view
    }()
    
    let authorLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textColor = .label
        return view
    }()
    
    let contentLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textColor = .secondaryLabel
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .label
        return view
    }()
    
    var viewModel = TweetCellViewModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    private func commonInit() {
        addSubviews()
        setupConstraints()
        setupBindings()
    }
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(avatarImageView)
        containerView.addSubview(authorLabel)
        containerView.addSubview(contentLabel)
        containerView.addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        let marginGuide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.Sizes.contentInsetsSize),
            avatarImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.Sizes.contentInsetsSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.Sizes.avatarSideSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.Sizes.avatarSideSize)
        ])
        
        
        NSLayoutConstraint.activate([
            authorLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.Sizes.contentInsetsSize),
            authorLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.Sizes.contentInsetsSize),
            authorLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.Sizes.contentInsetsSize)
        ])
        
        
        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.Sizes.contentInsetsSize),
            contentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.Sizes.contentInsetsSize),
            contentLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: Constants.Sizes.contentInsetsSize)
        ])
        
        
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.Sizes.contentInsetsSize),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.Sizes.contentInsetsSize),
            dateLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: Constants.Sizes.contentInsetsSize)
        ])
    }
    
    private func setupBindings() {
        viewModel.author.bind(to: self) {this, author in
            this.authorLabel.text = author
        }
        
        viewModel.content.bind(to: self) {this, content in
            this.contentLabel.text = content
        }
        
        viewModel.date.bind(to: self) {this, date in
            this.dateLabel.text = date
        }
        
        viewModel.avatarUrl.bind(to: self) { this, url in
            this.setAvatarImage(with: url)
        }
    }
    
    private func setAvatarImage(with url: URL?) {
        avatarImageView.kf.setImage(with: url, placeholder: UIImage(named: "avatarPlaceholder"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.kf.cancelDownloadTask()
        avatarImageView.kf.setImage(with: URL(string: ""), placeholder: UIImage(named: "avatarPlaceholder"))
    }
    
}
