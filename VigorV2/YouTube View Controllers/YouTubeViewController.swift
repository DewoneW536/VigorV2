//
//  YouTubeViewController.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/5/21.
//

import UIKit

class YouTubeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var model = Model();
    var videos = [Video]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Set itself as the datasource/delegate
        tableView.dataSource = self;
        tableView.delegate = self;
        
        //Set itself as the delegate of the model:
        model.delegate = self;
        
        model.getVideos();
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Confirm user has selected a video:
        guard tableView.indexPathForSelectedRow != nil else{
            return;
        }
        //Get a reference to the video user tapped on:
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row];
        //Get reference to detail VC:
        let detailVC = segue.destination as! DetailViewController;
        //Set the video property of the detail VC:
        detailVC.video = selectedVideo;
    }
    
    //Model Delegate methods:
    func videosReturned(_ videos: [Video]) {
        //Set returned videos to the video property
        self.videos = videos;
        //Refresh tableView
        tableView.reloadData();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: YouTubeConstants.youTubeVideoCellId, for: indexPath) as! VideoTableViewCell;
        let video = self.videos[indexPath.row];
        cell.setCell(video);
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
