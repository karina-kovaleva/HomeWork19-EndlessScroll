//
//  ViewController.swift
//  HomeWork19_ScrollImages
//
//  Created by Karina Kovaleva on 17.09.22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.center = self.view.center
        scrollView.delegate = self
        let imageNames = ["1","2","3"]
        for name in imageNames {
            let image = UIImage(named: name)
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            scrollView.showsHorizontalScrollIndicator = false
            imageViews.append(imageView)
            scrollView.addSubview(imageView)
        }
        scrollView.isPagingEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for (index, imageView) in imageViews.enumerated() {
            imageView.frame.size = scrollView.frame.size
            imageView.center = scrollView.center
            imageView.frame.origin.x = imageView.frame.width * CGFloat(index)
            imageView.frame.origin.y = 0
        }
        let contentWidth = self.scrollView.frame.width * CGFloat(imageViews.count)
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        print(self.scrollView.frame.width * CGFloat(imageViews.count - 1))
        if scrollView.contentOffset.x > self.scrollView.frame.width * CGFloat(imageViews.count - 1) + 30 {
            scrollView.contentOffset.x = 0
        } else if scrollView.contentOffset.x < -30 {
            scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(imageViews.count - 1)
        }
    }
}
