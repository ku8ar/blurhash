import Foundation
import UIKit

final class BlurhashView: UIView {
    @objc var blurhash: NSString?
    @objc var decodeWidth: NSNumber = 32
    @objc var decodeHeight: NSNumber = 32
    @objc var decodePunch: NSNumber = 1

    private let imageContainer: UIImageView

    override init(frame: CGRect) {
        self.imageContainer = UIImageView()
        self.imageContainer.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.imageContainer.clipsToBounds = true
        self.imageContainer.contentMode = .scaleAspectFill
        super.init(frame: frame)
        self.addSubview(self.imageContainer)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc public func render(blurhash: NSString) {
        self.blurhash = blurhash
        DispatchQueue.global(qos: .userInteractive).async {
            self.renderBlurhash()
        }
    }

    private final func renderBlurhash() {
        do {
            let size = CGSize(width: decodeWidth.intValue, height: self.decodeHeight.intValue)
            let nullableImage = UIImage(blurHash: blurhash as! String, size: size, punch: self.decodePunch.floatValue)
            guard let image = nullableImage else { return; }
            self.setImageContainerImage(image: image)
            return
        } catch { }
        self.setImageContainerImage(image: nil)
    }

    private final func setImageContainerImage(image: UIImage?) {
        if Thread.isMainThread {
            self.imageContainer.image = image
        } else {
            DispatchQueue.main.async {
                self.imageContainer.image = image
            }
        }
    }
}
