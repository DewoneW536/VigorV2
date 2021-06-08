//
//  YouTubeConstants.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/5/21.
//

import Foundation

struct YouTubeConstants{
    static var API_KEY = "AIzaSyDn13DYzEO25ZJ7JEjkHSBo0pRbxNynQzs";
    //I think this playlist Id has the remaining videos I am missing:
    //PLRS2DE4P39EdA_gtx32NL2WeIu_94rzqt
    //Still only giving me 7 out of 11 of the playlist
    //fulll YT link: https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLRS2DE4P39EdCAYKkWqPfd9b6ZeNodzz2&key=AIzaSyDn13DYzEO25ZJ7JEjkHSBo0pRbxNynQzs&maxResults=15
    //IT WORKS!!! Just needed to add "maxResults=15" to change the # of results displayed.
    static var PLAYLIST_ID = "PLRS2DE4P39EdA_gtx32NL2WeIu_94rzqt";
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(YouTubeConstants.PLAYLIST_ID)&key=\(YouTubeConstants.API_KEY)&maxResults=15";
    //will reference prototype cell identifier I named within tableView.
    static var youTubeVideoCellId = "YouTubeVideoCell";
    static var YT_EMBED_URL = "https://www.youtube.com/embed/";
}
