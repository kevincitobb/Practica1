
//  Dependencies
import UIKit
import Lottie

public class LoaderView: UIView {
    
    private var name: String?
    
    init(name: String, frame: CGRect) {
        self.name = name
        super.init(frame: frame)
        commonInit(name: self.name!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(name: self.name!)
    }
    
    // Generacion de la animacion elegida por el usuario
    func commonInit(name: String) {
        let animationView = LottieAnimationView(name: self.name!)
        animationView.frame = frame
        animationView.center = self.center
        animationView.animationSpeed = 0.5
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFill
        self.addSubview(animationView)
        animationView.tag = 1
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints=false
        animationView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        animationView.widthAnchor.constraint(equalToConstant:380).isActive=true
        animationView.heightAnchor.constraint(equalToConstant:380).isActive=true
    }
        
}
