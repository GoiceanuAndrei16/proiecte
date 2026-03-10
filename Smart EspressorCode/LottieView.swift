
import SwiftUI
import Lottie
import UIKit
 
struct LottieView: UIViewRepresentable {
    let lottieFile: String
    var loop: Bool?
 
    let animationView = LottieAnimationView()
 
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
 
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        if loop == true {
            
                animationView.loopMode = .loop
            
        }
        view.addSubview(animationView)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
 
        return view
    }
 
    func updateUIView(_ uiView: UIViewType, context: Context) {
 
    }
}



/*


struct LottieView: UIViewRepresentable {
    let lottieFile: String
 
   typealias UIViewType = UIView
 
    func makeUIView(context: UIViewControllerRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        view.addSubview(animationView)
  
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
     
        ])
      
        return view
    }
 
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
 
    }
}
*/
