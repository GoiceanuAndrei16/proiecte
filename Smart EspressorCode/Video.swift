//
//  StartupAnimation.swift
//  SmartEspressorControl
//
//  Created by Goiceanu Andrei on 12/24/22.
//

import SwiftUI
import AVKit
import AVFoundation
var GlobalName = "ok"
var GlobalEx = "ok"

struct PlayerView: UIViewRepresentable {
    @State var name : String
    @State var ex : String
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        GlobalName = name
        GlobalEx = ex
        return videoUIView(frame: .zero)
    }



class videoUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    @Published var name1 = GlobalName
    @Published var ex1 = GlobalEx
   
    override init(frame: CGRect) {
        super.init(frame: frame )
      //load video
        let fileUrl = Bundle.main.url(forResource: name1, withExtension: ex1)!
        let item = AVPlayerItem(url: fileUrl)
      //setup player
        let player = AVPlayer(playerItem: item)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
    // Start the movie
        player.play()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
}

struct Video: View {
    @State var name : String
    @State var ex : String

    var body: some View {
        PlayerView(name : name, ex : ex)
             .frame( height: 670)
            
    }
}

struct StartupAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Video( name : "ok",ex : "mov")
            
    }
}
