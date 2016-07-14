//
//  test.m
//  AnimationDemo
//
//  Created by boolean on 16/7/1.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "test.h"

@implementation test

//- (void) drawRooftopAtTopPointof:(CGPoint)paramTopPoint textToDisplay:(NSString *)paramText lineJoin:(CGLineJoin)paramLineJoin{
//    /* Set the color that we want to use to draw the line */ [[UIColor brownColor] set];
//    /* Get the current graphics context */
//    CGContextRef currentContext = UIGraphicsGetCurrentContext(); /* Set the line join */
//    CGContextSetLineJoin(currentContext,paramLineJoin);
//    /* Set the width for the lines */
//    CGContextSetLineWidth(currentContext,20.0f);
//    /* Start the line at this point */
//    CGContextMoveToPoint(currentContext,paramTopPoint.x - 140,paramTopPoint.y + 100);
//    /* And end it at this point */
//    CGContextAddLineToPoint(currentContext,paramTopPoint.x,paramTopPoint.y);
//    /* Extend the line to another point to
//     make the rooftop */
//    CGContextAddLineToPoint(currentContext,paramTopPoint.x + 140,paramTopPoint.y + 100);
//    /* Use the context's current color to draw the lines */
//    CGContextStrokePath(currentContext);
//    /* Draw the text in the rooftop using a black color */
//    [[UIColor blackColor] set];
//    /* Now draw the text */
//    CGPoint drawingPoint = CGPointMake(paramTopPoint.x - 40.0f, paramTopPoint.y + 60.0f);
//    [paramText drawAtPoint:drawingPoint
//                  withFont:[UIFont boldSystemFontOfSize:30.0f]];
//}
//- (void)drawRect:(CGRect)rect{
//    [self drawRooftopAtTopPointof:CGPointMake(160.0f, 40.0f) textToDisplay:@"Miter"
//                         lineJoin:kCGLineJoinMiter];
//    [self drawRooftopAtTopPointof:CGPointMake(160.0f, 180.0f) textToDisplay:@"Bevel"
//                         lineJoin:kCGLineJoinBevel];
//    [self drawRooftopAtTopPointof:CGPointMake(160.0f, 320.0f) textToDisplay:@"Round"
//                         lineJoin:kCGLineJoinRound];
//}

- (void)drawRect:(CGRect)rect
{
    /* Create the path */
    CGMutablePathRef path = CGPathCreateMutable();
    
    /* How big is the screen? We want the X to cover
     the whole screen */
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    /* Start from top-left */
    CGPathMoveToPoint(path,
                      NULL,
                      screenBounds.origin.x,
                      screenBounds.origin.y);
    /* Draw a line from top-left to bottom-right of the screen */
    CGPathAddLineToPoint(path,
                         NULL,
                         screenBounds.size.width,
                         screenBounds.size.height);
    /* Start another line from top-right */
    CGPathMoveToPoint(path,
                      NULL,
                      screenBounds.size.width,
                      screenBounds.origin.y);
    /* Draw a line from top-right to bottom-left */
    CGPathAddLineToPoint(path,
                         NULL,
                         screenBounds.origin.x,
                         screenBounds.size.height);
    /* Get the context that the path has to be drawn on */
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    /* Add the path to the context so we can
     draw it later */
    CGContextAddPath(currentContext,path);
    /* Set the blue color as the stroke color */
    [[UIColor blueColor] setStroke];
    /* Draw the path with stroke color */
    CGContextDrawPath(currentContext,kCGPathStroke);
    /* Finally release the path object */
    CGPathRelease(path);
}
@end
