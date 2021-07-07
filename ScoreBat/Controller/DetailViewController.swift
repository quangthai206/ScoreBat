//
//  DetailViewController.swift
//  ScoreBat
//
//  Created by teneocto on 07/07/2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.text = ""
        }
    }
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Video Detail"
        
        guard let detail = video else {
            print("No data")
            return
        }
        
        self.titleLabel.text = detail.title
        webview.loadHTMLString(detail.embed, baseURL: nil)
    }
    
    var video: Video?

    func configure(with video: Video) {
        
        self.video = video
        
    }
    
}
