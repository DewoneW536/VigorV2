//
//  VideoTableViewCell.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/6/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var video:Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(_ v:Video){
        self.video = v;
        
        //Check to make sure that there is a video available.
        guard self.video != nil else{return;}
        //set title/date labels
        self.titleLabel.text = video?.title;
        
        let dateF = DateFormatter();
        dateF.dateFormat = "EEEE, MMM d, yyyy";
        self.dateLabel.text = dateF.string(from: video!.published);
        
        //Set thumbnail
        guard self.video!.thumbnail != "" else {return;}
        //Check the cache before downloading data
        //let cachedData = CacheManager.getVideoCache(self.video!.thumbnail)
        //if(cachedData != nil) {
            //self.thumbnailImageView.image = UIImage(data: cachedData);
        //}
        
        let url = URL(string: self.video!.thumbnail);
        let session = URLSession.shared;
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if(error == nil && data != nil){
                //Save Data in cache
                //CacheManager.setVideoCache(url!.absoluteString, data);
                
                //Check that downloaded url matches video thumbnail url that cell is currently set to display.
                if(url?.absoluteString != self.video?.thumbnail){
                    
                    //Video cell has been recycled for another video && no longer matches the thumbnail that was downloaded
                    return;
                }
                //Create the image obj && Set imageView:
                let image = UIImage(data: data!);
                //Set ImageView:
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image;
                }
            }
        }
        //Start dataTask
        dataTask.resume();
    }
}
