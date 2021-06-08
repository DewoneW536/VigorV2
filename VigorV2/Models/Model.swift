//
//  Model.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/5/21.
//

import Foundation

protocol ModelDelegate {
    func videosReturned(_ videos:[Video])
}

class Model {
    var delegate:ModelDelegate?
    
    func getVideos(){
        //create a URL object:
        let url = URL(string: YouTubeConstants.API_URL);
        guard url != nil else {return;}
        //get a URLSession Object:
        let session = URLSession.shared;
        //get data task from URLSession:
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            //check for errors:
            if(error != nil || data == nil){
                return;
            }
            do{
                //Parse data into vidObj
                let decoder = JSONDecoder();
                //Will decode & format the "publishedAt" string date that is weird/unformatted.
                decoder.dateDecodingStrategy = .iso8601;
                let response = try decoder.decode(Response.self, from: data!)
                //Call the videosReturned method of the delegate
                if(response.items != nil){
                    DispatchQueue.main.async {
                        self.delegate?.videosReturned(response.items!)
                    }
                    
                }
            }
            catch{
                //print("Error!")
            }
            
        }
        //Start task:
        dataTask.resume();
    }
}
