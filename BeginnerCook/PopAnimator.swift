import Foundation
import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
	let duration = 0.7
	var presenting = true
	var originFrame = CGRect.zero
	
	var dismissCompletion: (() -> Void)?
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return duration
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		let herbController = transitionContext.viewController(forKey: presenting ? .to : .from) as! HerbDetailsViewController
		
		if presenting {
			herbController.containerView.alpha = 0.0
		}

		
		let containerView = transitionContext.containerView
		let herbView = presenting ? transitionContext.view(forKey: .to)! : transitionContext.view(forKey: .from)!
			
		let initialFrame = presenting ? originFrame : herbView.frame
		let finalFrame = presenting ? herbView.frame : originFrame
		
		let xScaleFactor = presenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
		let yScaleFactor = presenting ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
		
		let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
		
		if presenting {
			herbView.transform = scaleTransform
			herbView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
			herbView.clipsToBounds = true
		}
		
		if let toView = transitionContext.view(forKey: .to) {
			containerView.addSubview(toView)
		}
		containerView.bringSubviewToFront(herbView)
		
		UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, animations: {
			herbView.transform = self.presenting ? CGAffineTransform.identity : scaleTransform
			herbView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
			herbController.containerView.alpha = self.presenting ? 1.0 : 0.0
			herbView.layer.cornerRadius = self.presenting ? 0.0 : 20.0 / xScaleFactor
		}, completion: { _ in
			if !self.presenting {
				self.dismissCompletion?()
			}
			transitionContext.completeTransition(true)
		}
		)
	}
}

/*
class FadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
let duration = 0.4
var presenting = true
var originFrame = CGRect.zero

func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
return duration
}

func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
let containerView = transitionContext.containerView
let toView = transitionContext.view(forKey: .from)!

containerView.addSubview(toView)
toView.alpha = 1.0
UIView.animate(withDuration: duration) {
toView.alpha = 0.0
} completion: { _ in
transitionContext.completeTransition(true)
}
}
}*/
