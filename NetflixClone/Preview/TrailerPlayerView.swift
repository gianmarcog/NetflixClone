//
//  TrailerPlayerView.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 21.11.20.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    var videoURL: URL?
    
    @Binding var playVideo: Bool
    
    var body: some View {
        if videoURL != nil {
            VideoPlayer(url: videoURL!, play: $playVideo)
        } else {
            Text("Could not load the video")
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoURL: nil, playVideo: .constant(true))
    }
}
