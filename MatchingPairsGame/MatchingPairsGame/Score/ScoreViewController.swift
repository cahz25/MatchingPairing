//
//  ScoreViewController.swift
//  MatchingPairsGame
//
//  Created by Augusto Hurtado on 16/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation
import UIKit

class ScoreViewController: BaseViewController  {
    
    var presenter: ScorePresenterInterface?
    
    // Data model: These strings will be the data for the table view cells
    var scores = [(title: String, subtitle: String)]()
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide BackButton
        self.navigationItem.hidesBackButton = true
        
        self.title = "Score"
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter?.getScores()
    }
    
    @IBAction func retryGame(_ sender: UIButton) {
        coordinator?.start()
    }
}

extension ScoreViewController: ScoreViewInterface {
    
    func drawScores(scores: [(title: String, subtitle: String)]) {
        self.scores = scores
        tableView.reloadData()
    }
    
}

extension ScoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        cell.textLabel?.text = "\(self.scores[indexPath.row].title) | \(self.scores[indexPath.row].subtitle)"

        return cell
    }
    
    // method to run when table view cell is tapped
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped cell number \(indexPath.row).")
//    }
    
}
