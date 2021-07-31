# PresentationController

I'm doing a tutorial in RayWenderlich animation book and I'm stuck on the chapter that discusses `UIViewControllerAnimatedTransitioning` and `UIViewControllerTransitioningDelegate`.

This is currently the issue I am facing when trying to change the width and position of my scrollView:


https://user-images.githubusercontent.com/24510629/127751081-7f2f8fb8-1e8f-4376-8821-31043e2f09a8.mov


This is what I've tried to do so far:
1. I went into the storyboard and moved the position of the scrollView. Then in the code in the ViewController file inside the positionListItems function and initially it says to have the following to position the items:

`func positionListItems() {
    let listHeight = listView.frame.height
    let itemHeight: CGFloat = listHeight * 1.33
    let aspectRatio = UIScreen.main.bounds.height / UIScreen.main.bounds.width
    let itemWidth: CGFloat = itemHeight / aspectRatio
    
    let horizontalPadding: CGFloat = 10.0
    
    for i in herbs.indices {
      let imageView = listView.viewWithTag(i) as! UIImageView
      imageView.frame = CGRect(
        x: CGFloat(i) * itemWidth + CGFloat(i+1) * horizontalPadding, y: 0.0,
        width: itemWidth, height: itemHeight)
    }
    
    listView.contentSize = CGSize(
      width: CGFloat(herbs.count) * (itemWidth + horizontalPadding) + horizontalPadding,
      height:  0)
}`




