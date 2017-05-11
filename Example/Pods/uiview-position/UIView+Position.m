//
//  UIView+Position.m
//
//  Created by AbZorba Games on 1/14/13.
//  Updated on 2016.
//  Copyright (c) 2013-2016 Abzorba Games. All rights reserved.
//

#import "UIView+Position.h"

@implementation UIView (Position)

#pragma mark - origin

- (CGPoint)frameOrigin {
    return self.frame.origin;
}

- (void)setFrameOrigin:(CGPoint)newOrigin {
    CGRect frame = self.frame;
    frame.origin = newOrigin;
    self.frame   = frame;
}

#pragma mark - frame size

- (CGSize)frameSize {
    return self.frame.size;
}

- (void)setFrameSize:(CGSize)newSize {
    CGRect frame = self.frame;
    frame.size   = newSize;
    self.frame   = frame;
}

- (CGFloat)frameWidth {
    return CGRectGetWidth(self.frame);
}

- (void)setFrameWidth:(CGFloat)newWidth {
    CGRect frame     = self.frame;
    frame.size.width = newWidth;
    self.frame       = frame;
}

- (CGFloat)frameHeight {
    return CGRectGetHeight(self.frame);
}

- (void)setFrameHeight:(CGFloat)newHeight {
    CGRect frame      = self.frame;
    frame.size.height = newHeight;
    self.frame        = frame;
}

#pragma mark - farme x and y

- (CGFloat)frameX {
    return CGRectGetMinX(self.frame);
}

- (void)setFrameX:(CGFloat)newX {
    CGRect frame   = self.frame;
    frame.origin.x = newX;
    self.frame     = frame;
}

- (CGFloat)frameY {
    return CGRectGetMinY(self.frame);
}

- (void)setFrameY:(CGFloat)newY {
    CGRect frame   = self.frame;
    frame.origin.y = newY;
    self.frame     = frame;
}

#pragma mark - frame extermities

- (CGFloat)frameLeft {
    return self.frameX;
}

- (void)setFrameLeft:(CGFloat)frameLeft {
    self.frameX = frameLeft;
}


- (CGFloat)frameTop {
    return self.frameY;
}

- (void)setFrameTop:(CGFloat)frameTop {
    self.frameY = frameTop;
}


- (CGFloat)frameRight {
    return CGRectGetMaxX(self.frame);
}

- (void)setFrameRight:(CGFloat)newRight {
    CGRect frame   = self.frame;
    frame.origin.x = newRight - self.frameWidth;
    self.frame     = frame;
}


- (CGFloat)frameBottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setFrameBottom:(CGFloat)newBottom {
    CGRect frame   = self.frame;
    frame.origin.y = newBottom - self.frameHeight;
    self.frame     = frame;
}


- (CGPoint)frameTopLeft {
    return self.frameOrigin;
}

- (void)setFrameTopLeft:(CGPoint)frameTopLeft {
    self.frameOrigin = frameTopLeft;
}


- (CGPoint)frameTopRight {
    return CGPointMake(self.frameRight, self.frameTop);
}

- (void)setFrameTopRight:(CGPoint)frameTopRight {
    self.frameTop   = frameTopRight.y;
    self.frameRight = frameTopRight.x;
}


- (CGPoint)frameBottomLeft {
    return CGPointMake(self.frameLeft, self.frameBottom);
}

- (void)setFrameBottomLeft:(CGPoint)frameBottomLeft {
    self.frameBottom = frameBottomLeft.y;
    self.frameLeft   = frameBottomLeft.x;
}


- (CGPoint)frameBottomRight {
    return CGPointMake(self.frameRight, self.frameBottom);
}

- (void)setFrameBottomRight:(CGPoint)frameBottomRight {
    self.frameBottom = frameBottomRight.y;
    self.frameRight  = frameBottomRight.x;
}


- (CGPoint)frameTopCenter {
    return CGPointMake(self.centerX, self.frameTop);
}

- (void)setFrameTopCenter:(CGPoint)frameTopCenter {
    self.frameTop = frameTopCenter.y;
    self.centerX  = frameTopCenter.x;
}


- (CGPoint)frameBottomCenter {
    return CGPointMake(self.centerX, self.frameBottom);
}

- (void)setFrameBottomCenter:(CGPoint)frameBottomCenter {
    self.frameBottom = frameBottomCenter.y;
    self.centerX     = frameBottomCenter.x;
}


- (CGPoint)frameLeftCenter {
    return CGPointMake(self.frameLeft, self.centerY);
}

- (void)setFrameLeftCenter:(CGPoint)frameLeftCenter {
    self.frameLeft = frameLeftCenter.x;
    self.centerY   = frameLeftCenter.y;
}


- (CGPoint)frameRightCenter {
    return CGPointMake(self.frameRight, self.centerY);
}

- (void)setFrameRightCenter:(CGPoint)frameRightCenter {
    self.frameRight = frameRightCenter.x;
    self.centerY    = frameRightCenter.y;
}


#pragma mark - center

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.centerY);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

#pragma mark - bounds size

- (CGFloat)boundsWidth {
    return CGRectGetWidth(self.bounds);
}

- (CGFloat)boundsHeight {
    return CGRectGetHeight(self.bounds);
}


- (void)setBoundsWidth:(CGFloat)boundsWidth {
    CGRect bounds = self.bounds;
    bounds.size.width = boundsWidth;
    self.bounds = bounds;
}

- (void)setBoundsHeight:(CGFloat)boundsHeight {
    CGRect bounds = self.bounds;
    bounds.size.height = boundsHeight;
    self.bounds = bounds;
}


- (CGSize)boundsSize {
    return self.bounds.size;
}

- (void)setBoundsSize:(CGSize)boundsSize {
    CGRect bounds = self.bounds;
    bounds.size = boundsSize;
    self.bounds = bounds;
}

#pragma mark - internal center

- (CGPoint)ownOrigin {
    return self.bounds.origin;
}

- (void)setOwnOrigin:(CGPoint)ownOrigin {
    CGRect bounds = self.bounds;
    bounds.origin = ownOrigin;
    self.bounds = bounds;
}

- (CGPoint)ownCenter {
    return CGPointMake(self.ownCenterX, self.ownCenterY);
}

- (void)setOwnCenter:(CGPoint)ownCenter {
    CGRect bounds = self.bounds;
    CGFloat xDiff = self.ownCenter.x - ownCenter.x;
    CGFloat yDiff = self.ownCenter.y - ownCenter.y;
    bounds.origin.x += xDiff;
    bounds.origin.y += yDiff;
    self.bounds = bounds;
}


- (CGFloat)ownCenterX {
    return CGRectGetMidX(self.bounds);
}

- (void)setOwnCenterX:(CGFloat)ownCenterX {
    CGRect bounds = self.bounds;
    bounds.origin.x = ownCenterX;
    self.bounds = bounds;
}


- (CGFloat)ownCenterY {
    return CGRectGetMidY(self.bounds);
}

- (void)setOwnCenterY:(CGFloat)ownCenterY {
    CGRect bounds = self.bounds;
    bounds.origin.y = ownCenterY;
    self.bounds = bounds;
}


- (CGFloat)ownLeft {
    return CGRectGetMinX(self.bounds);
}

- (void)setOwnLeft:(CGFloat)ownLeft {
    CGRect bounds = self.bounds;
    bounds.origin.x = ownLeft;
    self.bounds = bounds;
}


- (CGFloat)ownRight {
    return CGRectGetMaxX(self.bounds);
}

- (void)setOwnRight:(CGFloat)ownRight {
    CGRect bounds = self.bounds;
    bounds.size.width = ownRight;
    self.bounds = bounds;
}


- (CGFloat)ownTop {
    return CGRectGetMinY(self.bounds);
}

- (void)setOwnTop:(CGFloat)ownTop {
    CGRect bounds = self.bounds;
    bounds.origin.y = ownTop;
    self.bounds = bounds;
}


- (CGFloat)ownBottom {
    return CGRectGetMaxY(self.bounds);
}

- (void)setOwnBottom:(CGFloat)ownBottom {
    CGRect bounds = self.bounds;
    bounds.size.height = ownBottom;
    self.bounds = bounds;
}


- (CGPoint)ownTopLeft {
    return self.ownOrigin;
}

- (void)setOwnTopLeft:(CGPoint)ownTopLeft {
    self.ownTop  = ownTopLeft.y;
    self.ownLeft = ownTopLeft.x;
}


- (CGPoint)ownTopRight {
    return CGPointMake(self.ownRight, self.ownTop);
}

- (void)setOwnTopRight:(CGPoint)ownTopRight {
    self.ownTop   = ownTopRight.y;
    self.ownRight = ownTopRight.x;
}


- (CGPoint)ownBottomLeft {
    return CGPointMake(self.ownLeft, self.ownBottom);
}

- (void)setOwnBottomLeft:(CGPoint)ownBottomLeft {
    self.ownBottom = ownBottomLeft.y;
    self.ownLeft   = ownBottomLeft.x;
}


- (CGPoint)ownBottomRight {
    return CGPointMake(self.ownRight, self.ownBottom);
}

- (void)setOwnBottomRight:(CGPoint)ownBottomRight {
    self.ownBottom = ownBottomRight.y;
    self.ownRight  = ownBottomRight.x;
}


- (CGPoint)ownTopCenter {
    return CGPointMake(self.ownCenterX, self.ownTop);
}

- (void)setOwnTopCenter:(CGPoint)ownTopCenter {
    self.ownTop     = ownTopCenter.y;
    self.ownCenterX = ownTopCenter.x;
}


- (CGPoint)ownBottomCenter {
    return CGPointMake(self.ownCenterX, self.ownBottom);
}

- (void)setOwnBottomCenter:(CGPoint)ownBottomCenter {
    self.ownBottom  = ownBottomCenter.y;
    self.ownCenterX = ownBottomCenter.x;
}


- (CGPoint)ownLeftCenter {
    return CGPointMake(self.ownLeft, self.ownCenterY);
}

- (void)setOwnLeftCenter:(CGPoint)ownLeftCenter {
    self.ownLeft    = ownLeftCenter.x;
    self.ownCenterY = ownLeftCenter.y;
}


- (CGPoint)ownRightCenter {
    return CGPointMake(self.ownRight, self.ownCenterY);
}

- (void)setOwnRightCenter:(CGPoint)ownRightCenter {
    self.ownRight   = ownRightCenter.x;
    self.ownCenterY = ownRightCenter.y;
}

#pragma mark - Flooring/Ceiling

- (CGRect)flooredFrame {
    CGRect flooredFrame = self.frame;
    flooredFrame.origin = self.flooredFrameOrigin;
    flooredFrame.size   = self.flooredFrameSize;
    return flooredFrame;
}

- (CGRect)ceiledFrame {
    CGRect ceiledFrame = self.frame;
    ceiledFrame.origin = self.ceiledFrameOrigin;
    ceiledFrame.size   = self.ceiledFrameSize;
    return ceiledFrame;
}

- (CGPoint)flooredFrameOrigin {
    return CGPointFloored(self.frameOrigin);
}

- (CGPoint)ceiledFrameOrigin {
    return CGPointCeiled(self.frameOrigin);
}

- (CGSize)flooredFrameSize {
    return CGSizeFloored(self.frameSize);
}

- (CGSize)ceiledFrameSize {
    return CGSizeCeiled(self.frameSize);
}

- (UIView *)floorFrame {
    self.frame = self.flooredFrame;
    return self;
}

- (UIView *)ceilFrame {
    self.frame = self.ceiledFrame;
    return self;
}

- (UIView *)floorFrameOrigin {
    self.frameOrigin = self.flooredFrameOrigin;
    return self;
}

- (UIView *)ceilFrameOrigin {
    self.frameOrigin = self.ceiledFrameOrigin;
    return self;
}

- (UIView *)floorFrameSize {
    self.frameSize = self.flooredFrameSize;
    return self;
}

- (UIView *)ceilFrameSize {
    self.frameSize = self.ceiledFrameSize;
    return self;
}


#pragma mark - CGPoint, CGSize, CGRect extensions

CGPoint CGPointFloored(CGPoint point) {
    CGPoint flooredPoint = point;
    CGPointFloor(&flooredPoint);
    return flooredPoint;
}

void CGPointFloor(CGPoint *point) {
    point->x = floor(point->x);
    point->y = floor(point->y);
}

CGPoint CGPointCeiled(CGPoint point) {
    CGPoint ceiledPoint = point;
    CGPointCeil(&ceiledPoint);
    return ceiledPoint;
}

void CGPointCeil(CGPoint *point) {
    point->x = ceil(point->x);
    point->y = ceil(point->y);
}

CGSize CGSizeFloored(CGSize size) {
    CGSize flooredSize = size;
    CGSizeFloor(&flooredSize);
    return flooredSize;
}

void CGSizeFloor(CGSize *size) {
    size->width  = floor(size->width);
    size->height = floor(size->height);
}

CGSize CGSizeCeiled(CGSize size) {
    CGSize ceiledSize = size;
    CGSizeFloor(&ceiledSize);
    return ceiledSize;
}

void CGSizeCeil(CGSize *size) {
    size->width  = ceil(size->width);
    size->height = ceil(size->height);
}


CGRect CGRectFloored(CGRect rect) {
    rect.origin = CGPointFloored(rect.origin);
    rect.size = CGSizeFloored(rect.size);
    return rect;
}

void CGRectFloor(CGRect *rect) {
    CGPointFloor(&(rect->origin));
    CGSizeFloor(&(rect->size));
}

CGRect CGRectCeiled(CGRect rect) {
    rect.origin = CGPointCeiled(rect.origin);
    rect.size = CGSizeCeiled(rect.size);
    return rect;
}

void CGRectCeil(CGRect *rect) {
    CGPointCeil(&(rect->origin));
    CGSizeCeil(&(rect->size));
}

CGPoint CGRecGetTopLeftPoint(CGRect rect) {
    return CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetTopRightPoint(CGRect rect) {
    return CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetBottomLeftPoint(CGRect rect) {
    return CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
}

CGPoint CGRectGetBottomRightPoint(CGRect rect) {
    return CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
}

CGPoint CGRectGetTopCenterPoint(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetBottomCenterPoint(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
}

CGPoint CGRectGetLeftCenterPoint(CGRect rect) {
    return CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
}
CGPoint CGRectGetRightCenterPoint(CGRect rect) {
    return CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
}


CGPoint CGRectGetCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}


/* Creating CGRect with unusual points */

CGRect CGRectMakeWithCenter(CGPoint center, CGSize size) {
    CGFloat x = center.x - (size.width * .5);
    CGFloat y = center.y - (size.height * .5);
    CGPoint origin = CGPointMake(x, y);
    
    CGRect result = CGRectZero;
    result.origin = origin;
    result.size = size;
    return result;
}

/* using the middle of the sides */
CGRect CGRectMakeWithRightCenter(CGPoint rightCenter, CGSize size) {
    CGFloat x = rightCenter.x - size.width;
    CGFloat y = rightCenter.y - (size.height * .5);
    CGPoint origin = CGPointMake(x, y);

    CGRect result = CGRectZero;
    result.origin = origin;
    result.size = size;
    return result;
}

CGRect CGRectMakeWithLeftCenter(CGPoint leftCenter, CGSize size) {
    CGFloat x = leftCenter.x;
    CGFloat y = leftCenter.y - (size.height * .5);
    CGPoint origin = CGPointMake(x, y);

    CGRect result = CGRectZero;
    result.origin = origin;
    result.size = size;
    return result;
}

CGRect CGRectMakeWithTopCenter(CGPoint topCenter, CGSize size) {
    CGFloat x = topCenter.x - (size.width * .5);
    CGFloat y = topCenter.y;
    CGPoint origin = CGPointMake(x, y);

    CGRect result = CGRectZero;
    result.origin = origin;
    result.size = size;
    return result;
}

CGRect CGRectMakeWithBottomCenter(CGPoint bottomCenter, CGSize size) {
    CGFloat x = bottomCenter.x - (size.width * .5);
    CGFloat y = bottomCenter.y - size.height;
    CGPoint origin = CGPointMake(x, y);

    CGRect result = CGRectZero;
    result.origin = origin;
    result.size = size;
    return result;
}

/* using corners */
CGRect CGRectMakeWithTopRight(CGPoint topRight, CGSize size) {
    CGFloat x = topRight.x - size.width;
    CGFloat y = topRight.y;
    CGPoint origin = CGPointMake(x, y);

    CGRect result = CGRectZero;
    result.origin = origin;
    result.size = size;
    return result;
}

CGRect CGRectMakeWithTopLeft(CGPoint topLeft, CGSize size) {
    // alias for the CGRectMake
    return CGRectMake(topLeft.x,
                      topLeft.y,
                      size.width,
                      size.height);
}

CGRect CGRectMakeWithBottomLeft(CGPoint bottomLeft, CGSize size) {
    CGFloat x = bottomLeft.x;
    CGFloat y = bottomLeft.y - size.height;
    CGPoint origin = CGPointMake(x, y);

    CGRect result = CGRectZero;
    result.origin = origin;
    result.size = size;
    return result;
}

CGRect CGRectMakeWithBottomRight(CGPoint bottomRight, CGSize size) {
    CGFloat x = bottomRight.x - size.width;
    CGFloat y = bottomRight.y - size.height;
    CGPoint origin = CGPointMake(x, y);

    CGRect result = CGRectZero;
    result.origin = origin;
    result.size = size;
    return result;
}

CGPoint CGPointDeriveTranslatedPoint(CGPoint point, CGFloat dx, CGFloat dy) {
    point.x += dx;
    point.y += dy;
    return point;
}

CGRect CGRectDeriveTranslatedRect(CGRect rect, CGFloat dx, CGFloat dy) {
    rect.origin = CGPointDeriveTranslatedPoint(rect.origin, dx, dy);
    return rect;
}

void CGPointTranslate(CGPoint *point, CGFloat dx, CGFloat dy) {
    point->x += dx;
    point->y += dy;
}

void CGRectTranslate(CGRect *rect, CGFloat dx, CGFloat dy) {
    CGPointTranslate(&(rect->origin), dx, dy);
}

@end
