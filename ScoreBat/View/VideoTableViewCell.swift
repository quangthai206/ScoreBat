//
//  VideoTableViewCell.swift
//  ScoreBat
//
//  Created by teneocto on 06/07/2021.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var competitionLabel: UILabel!
    
    // Setup videos values
    func setCellWithValuesOf(_ video: Video) {
        updateUI(title: video.title, thumbnail: video.thumbnail, competition: video.competition )
    }
    
    // Update the UI Views
    private func updateUI(title: String, thumbnail: String, competition: Competition) {
        
        self.titleLabel.text = title
        self.competitionLabel.text = competition.name
        
        guard let imageURL = URL(string: thumbnail) else {
            return
        }
        
        self.thumbnailImage.image = nil
        
        getImageDataFrom(url: imageURL)
        
    }
    
    // MARK: - Get image data
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.thumbnailImage.image = image
                }
            }
        }.resume()
    }
}
