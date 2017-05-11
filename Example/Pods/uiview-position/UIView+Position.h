//
//  UIView+Position.h
//
//  Created by AbZorba Games on 1/14/13.
//  Updated on 2016.
//  Copyright (c) 2013-2016 Abzorba Games. All rights reserved.
//

@import UIKit;

@interface UIView (Position)

/*
 With the following methods you can obtain and set nearly any corner or edge of 
 a UIView both in the superview's coordinate system (frame, center) either on the
 view's coordinate system (bounds, own*).
 
 *----------*----------*
 |                     |
 |                     |
 *          *          *
 |                     |
 |                     |
 *----------*----------*
 
 You can obtain and set any '*' point in the above figure either as a CGPoint
 either independently as a CGFloat value.

 */

/*********************************
 * Superview's coordinate system *
 *********************************/

/// The frame origin as in self.frame.origin (superview's coordinate system)
@property (nonatomic, assign) CGPoint frameOrigin;


/// The frame center.x (superview's coordinate system)
@property (nonatomic, assign) CGFloat centerX;
/// The frame center.y (superview's coordinate system)
@property (nonatomic, assign) CGFloat centerY;

/// x of frame's origin (superview's coordinate system)
@property (nonatomic, assign) CGFloat frameX;
/// y of frame's origin (superview's coordinate system)
@property (nonatomic, assign) CGFloat frameY;

/*** Edges ***/

/// The left edge of the frame (superview's coordinate system)
@property (nonatomic, assign) CGFloat frameLeft; // equivalent to frameX
/// The top edge of the frame (superview's coordinate system)
@property (nonatomic, assign) CGFloat frameTop; // equivalent to frameY
/// The right edge of the frame (superview's coordinate system)
@property (nonatomic, assign) CGFloat frameRight;
/// The bottom edge of the frame (superview's coordinate system)
@property (nonatomic, assign) CGFloat frameBottom;

/*** Corners ***/

/// The top left corner of the frame (superview's coordinate system)
@property (nonatomic, assign) CGPoint frameTopLeft;
/// The top right corner of the frame (superview's coordinate system)
@property (nonatomic, assign) CGPoint frameTopRight;
/// The bottom left corner of the frame (superview's coordinate system)
@property (nonatomic, assign) CGPoint frameBottomLeft;
/// The bottom right corner of the frame (superview's coordinate system)
@property (nonatomic, assign) CGPoint frameBottomRight;

/*** Middle of Edges ***/

/// The top center virtual point of the frame (superview's coordinate system)
@property (nonatomic, assign) CGPoint frameTopCenter;
/// The bottom center virtual point of the frame (superview's coordinate system)
@property (nonatomic, assign) CGPoint frameBottomCenter;

/// The left center virtual point of the frame (superview's coordinate system)
@property (nonatomic, assign) CGPoint frameLeftCenter;
/// The right center virtual point of the frame (superview's coordinate system)
@property (nonatomic, assign) CGPoint frameRightCenter;

/*** Sizes ***/

/// The frame size as in self.frame.size
@property (nonatomic, assign) CGSize frameSize;

/// The frame width (takes into account the current transformations)
@property (nonatomic, assign) CGFloat frameWidth;
/// The frame height (takes into account the current transformations)
@property (nonatomic, assign) CGFloat frameHeight;

/****************************
 * View's coordinate system *
 ****************************/

/// The bounds width (in the view's coordinate system, not taking into account any transformations)
@property (nonatomic, assign) CGFloat boundsWidth;
/// The bounds height (in the view's coordinate system, not taking into account any transformations)
@property (nonatomic, assign) CGFloat boundsHeight;

/// The bounds size (in the view's coordinate system, not taking into account any transformations)
@property (nonatomic, assign) CGSize boundsSize;

/// The bounds center (in the view's coordinate system) @warning you nearly never want to set this
@property (nonatomic, assign) CGPoint ownCenter;
/// x of bounds center (in the view's coordinate system) @warning you nearly never want to set this
@property (nonatomic, assign) CGFloat ownCenterX;
/// y of bounds center (in the view's coordinate system) @warning you nearly never want to set this
@property (nonatomic, assign) CGFloat ownCenterY;

/// The bounds origin as in self.bounds.origin (view's coordinate system) @warning you nearly never want to set this
@property (nonatomic, assign) CGPoint ownOrigin;

/// The left edge of the bounds (in the view's coordinate system)  @warning you nearly never want to set this
@property (nonatomic, assign) CGFloat ownLeft;
/// The right edge of the bounds (in the view's coordinate system)
@property (nonatomic, assign) CGFloat ownRight;
/// The top edge of the bounds (in the view's coordinate system) @warning you nearly never want to set this
@property (nonatomic, assign) CGFloat ownTop;
/// The bottom edge of the bounds (in the view's coordinate system)
@property (nonatomic, assign) CGFloat ownBottom;

/// The top left corner of the bounds (in the view's coordinate system)  @warning you nearly never want to set this
@property (nonatomic, assign) CGPoint ownTopLeft;
/// The top right corner of the bounds (in the view's coordinate system)  @warning you nearly never want to set this
@property (nonatomic, assign) CGPoint ownTopRight;
/// The bottom left corner of the bounds (in the view's coordinate system)  @warning you nearly never want to set this
@property (nonatomic, assign) CGPoint ownBottomLeft;
/// The bottom right corner of the bounds (in the view's coordinate system)  @warning you nearly never want to set this
@property (nonatomic, assign) CGPoint ownBottomRight;

/// The top center virtual point of the bounds (in the view's coordinate system)  @warning you nearly never want to set this
@property (nonatomic, assign) CGPoint ownTopCenter;
/// The bottom center virtual point of the bounds (in the view's coordinate system)  @warning you nearly never want to set this
@property (nonatomic, assign) CGPoint ownBottomCenter;

/// The left center virtual point of the bounds (in the view's coordinate system)  @warning you nearly never want to set this
@property (nonatomic, assign) CGPoint ownLeftCenter;
/// The right center virtual point of the bounds (in the view's coordinate system)  @warning you nearly never want to set this
@property (nonatomic, assign) CGPoint ownRightCenter;


/// The frame of the view that has origin.x, origin.y, size.width and size.height floor()ed
@property (nonatomic, readonly) CGRect flooredFrame;
/// The frame of the view that has origin.x, origin.y, size.width and size.height ceil()ed
@property (nonatomic, readonly) CGRect ceiledFrame;

/// The size of the view that has its width and height floor()ed
@property (nonatomic, readonly) CGSize flooredFrameSize;
/// The size of the view that has its width and height ceiled()ed
@property (nonatomic, readonly) CGSize ceiledFrameSize;

/// The origin of the view that has its x and y floor()ed
@property (nonatomic, readonly) CGPoint flooredFrameOrigin;
/// The origin of the view that has its x and y ceil()ed
@property (nonatomic, readonly) CGPoint ceiledFrameOrigin;


/* Mutating Actions */

/// Floors the whole frame, returns self
- (UIView *)floorFrame;
/// Ceils the whole frame, returns self
- (UIView *)ceilFrame;

/// Floors only the frame's origin, returns self
- (UIView *)floorFrameOrigin;
/// Ceils only the frame's origin, returns self
- (UIView *)ceilFrameOrigin;

/// Floors only the frame's size, returns self
- (UIView *)floorFrameSize;
/// Ceils only the frame's size, returns self
- (UIView *)ceilFrameSize;

/* CGPoint, CGSize, CGRect Extensions */

/* CGPoint */
CGPoint CGPointFloored(CGPoint point);
void CGPointFloor(CGPoint *point);
CGPoint CGPointCeiled(CGPoint point);
void CGPointCeil(CGPoint *point);

/* CGSize */
CGSize CGSizeFloored(CGSize point);
void CGSizeFloor(CGSize *point);
CGSize CGSizeCeiled(CGSize point);
void CGSizeCeil(CGSize *point);

/* CGRect */
CGRect CGRectFloored(CGRect rect);
void CGRectFloor(CGRect *rect);
CGRect CGRectCeiled(CGRect rect);
void CGRectCeil(CGRect *rect);

/* Getting CGPoint from CGRect */
CGPoint CGRecGetTopLeftPoint(CGRect rect);
CGPoint CGRectGetTopRightPoint(CGRect rect);
CGPoint CGRectGetBottomLeftPoint(CGRect rect);
CGPoint CGRectGetBottomRightPoint(CGRect rect);

CGPoint CGRectGetTopCenterPoint(CGRect rect);
CGPoint CGRectGetBottomCenterPoint(CGRect rect);
CGPoint CGRectGetLeftCenterPoint(CGRect rect);
CGPoint CGRectGetRightCenterPoint(CGRect rect);

CGPoint CGRectGetCenter(CGRect rect);

/* Creating CGRect with unusual points */

CGRect CGRectMakeWithCenter(CGPoint center, CGSize size);

/* using the middle of the sides */
CGRect CGRectMakeWithRightCenter(CGPoint rightCenter, CGSize size);
CGRect CGRectMakeWithLeftCenter(CGPoint leftCenter, CGSize size);
CGRect CGRectMakeWithTopCenter(CGPoint topCenter, CGSize size);
CGRect CGRectMakeWithBottomCenter(CGPoint bottomCenter, CGSize size);

/* using corners */
CGRect CGRectMakeWithTopRight(CGPoint topRight, CGSize size);
CGRect CGRectMakeWithTopLeft(CGPoint topLeft, CGSize size); // alias for the CGRectMake
CGRect CGRectMakeWithBottomLeft(CGPoint bottomLeft, CGSize size);
CGRect CGRectMakeWithBottomRight(CGPoint bottomRight, CGSize size);

CGPoint CGPointDeriveTranslatedPoint(CGPoint point, CGFloat dx, CGFloat dy);
CGRect CGRectDeriveTranslatedRect(CGRect rect, CGFloat dx, CGFloat dy);

void CGPointTranslate(CGPoint *point, CGFloat dx, CGFloat dy);
void CGRectTranslate(CGRect *rect, CGFloat dx, CGFloat dy);


@end
