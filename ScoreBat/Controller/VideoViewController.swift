//
//  ViewController.swift
//  ScoreBat
//
//  Created by teneocto on 06/07/2021.
//

import UIKit

class VideoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    static let showDetailSegueIdentifier = "ShowVideoDetailSegue"
    private var viewModel = VideoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All Videos"
        
        loadVideosData()
    }
    
    private func loadVideosData() {
        viewModel.fetchVideosData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.showDetailSegueIdentifier,
           let destination = segue.destination as? DetailViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let video = viewModel.cellForRowAt(indexPath: indexPath)
            destination.configure(with: video)
        }
    }
}

extension VideoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell

        let video = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(video)
        
        return cell
    }
    
}
