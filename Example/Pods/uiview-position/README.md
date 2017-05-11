# UIView+Position Category

Quickly compute positions for `UIView`s.

Do you often write code like this?:

```
// position view so that its right edge equals the superviews right edge and the bottom right corner of that view to be the same as its superview
view.frame = CGRectMake(CGRectGetMaxY(superview.frame) - CGRectGetWidth(view.frame),
                            CGRectGetMaxY(superview.frame) - CGRectGetHeight(view.frame),
                            CGRectGetWidth(view.frame),
                            CGRectGetHeight(view.frame));
```

Wouldn't it be simpler if you wrote JUST this:

```
view.frameBottomRight = superview.ownBottomRight;
```

This category provides a convenient way to position your `UIView`s using any corner or edge of the coordinate system.

Examples:

```
// position redView so that its right edge == self.view right edge and the center.y == self.view.center.y
redView.frameRightCenter = self.view.ownRightCenter;

// position blueView so that its right edge equals redView's left edge and the center.y equals with redView's bottom
blueView.frameRightCenter = _redView.frameBottomLeft;

// position greenView so that its bottom edge equals redView's top edge and the right edge equals with redView's center.x
greenView.frameBottomRight = _redView.frameTopCenter;

// move a view down 5 points
view.frameTop += 5;
//view.frameBottom += 5;
```

## Quick start
Just add `UIView+Position.h` and `UIView+Position.m` to your project.
Import `UIView+Position.h` and start using the extensions.

```
#import "UIView+Position.h"
```


## License
This code is MIT-licensed.