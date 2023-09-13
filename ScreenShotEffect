// MARK: - Screenshot Effect

class ScreenShotEffectViewController {
    let screenshotFlashView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

// Adding screenShotFlashView to ParentView
    self.view.addSubview(screenshotFlashView)
    screenshotFlashView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    screenshotFlashView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    screenshotFlashView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    screenshotFlashView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

// Perform Animation
    UIView.animate(withDuration: 0.8, animations: {
        self.screenshotFlashView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        self.screenshotFlashView.alpha = 0.7
    }) { (_) in
        UIView.animate(withDuration: 0.8) {
        self.screenshotFlashView.transform = .identity
        self.screenshotFlashView.alpha = 0
        }
    }
}
