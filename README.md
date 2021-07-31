# PresentationController

I'm doing a tutorial in RayWenderlich animation book and I'm stuck on the chapter that discusses `UIViewControllerAnimatedTransitioning` and `UIViewControllerTransitioningDelegate`.

This is currently the issue I am facing when trying to change the width and position of my scrollView:


https://user-images.githubusercontent.com/24510629/127751081-7f2f8fb8-1e8f-4376-8821-31043e2f09a8.mov


This is what I've tried to do so far:

1. I went into the storyboard and moved the position of the scrollView. Then in the code in the ViewController file inside the positionListItems function and initially it says to have the following to position the items:

<img width="787" alt="image" src="https://user-images.githubusercontent.com/24510629/127751192-8ef17505-0b63-4429-8cca-0fcb0bf5b55f.png">

So what I did initially is remove the * 1.33 and it works fine but I want to now increase the width so I change the following function to this:

<img width="808" alt="image" src="https://user-images.githubusercontent.com/24510629/127751247-04a14f81-91c9-4858-a790-e1c8b52b6bdf.png">

and that's what is giving the following effect in the video above. 


