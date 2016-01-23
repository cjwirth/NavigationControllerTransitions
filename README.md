# NavigationControllerTransitions

Do you want to animate your _UINavigationController_ push and pop transitions?

When you do, do you notice how you can't use the swipe back functionality doesn't work anymore?

All you need to do is reset the _UINavigationController_'s delegate to _nil_ when the animation is complete. That's it.

This project shows you one way to do it (_hint: it's super easy, but does feel like kind of a hack_).

### Blog Post

This is the sample app companion to a [blog post I wrote](http://cjwirth.com/2015/09/23/navigation-controller-transitions/) about fixing this bug.

# License

You can use any of this code as outlined in the [MIT License](./LICENSE.md)
