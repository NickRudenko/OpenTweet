//
//  ViewController.swift
//  OpenTweet
//
//  Created by Olivier Larivain on 9/30/16.
//  Copyright © 2016 OpenTable, Inc. All rights reserved.
//

import UIKit
import ReactiveKit

class TimelineViewController: UIViewController {
    private enum Constants {
        enum Identifiers {
            static let tweetCellIdentifier = "tweet_cell_identifier"
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TweetCell.self, forCellReuseIdentifier: Constants.Identifiers.tweetCellIdentifier)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = .clear
        return tableView
    }()
    
    let viewModel: TimelineViewModel = TimelineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupViews()
        setupConstraints()
        setupBinding()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        tableView.dataSource = self
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupBinding() {
        viewModel.tweets.bind(to: self) { this, _ in
            this.tableView.reloadData()
        }
    }
    
}

extension TimelineViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tweets.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.tweetCellIdentifier, for: indexPath) as! TweetCell
        cell.viewModel.model = viewModel.tweets.value[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
