//
//  DetailViewController.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/5/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = "";
        dateLabel.text = "";
        textView.text = "";
        //Check to make sure there's a video to play:
        guard video != nil else {
            return;
        }
        
        //Create the embeded URL:
        let embedUrlString = YouTubeConstants.YT_EMBED_URL + video!.videoId;
        //Load it into WebView:
        let url = URL(string: embedUrlString);
        let request = URLRequest(url: url!);
        webView.load(request)
        //Set vid title:
        titleLabel.text = video!.title;
        //Set the date:
        let dateF = DateFormatter();
        dateF.dateFormat = "EEEE, MMM d, yyyy";
        dateLabel.text = dateF.string(from: video!.published);
        //Set Description:
        textView.text = video!.description;
    }
}
