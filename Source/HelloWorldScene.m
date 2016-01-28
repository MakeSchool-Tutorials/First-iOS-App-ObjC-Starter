#import "HelloWorldScene.h"

@implementation HelloWorldScene

CCSprite *ship1;
CCSprite *ship2;

- (id)init
{
    if (self = [super init])
    {
        //Initialize the ship sprite with a specific file, the ship image
        ship1 = [CCSprite spriteWithImageNamed: @"ship.png"];
        
        //Set the ship's position. (0,0) is at the bottom left
        ship1.position = ccp( 50, 200 );
        
        //Initialize the other sprite
        ship2 = [CCSprite spriteWithImageNamed: @"ship.png"];
        
        //Set the other ship's position
        ship2.position = ccp( 100, 50 );
        
        //Add the ships to the game
        [self addChild:ship1];
        [self addChild:ship2];
      
        //Allow player to interact with this scene
        self.userInteractionEnabled = TRUE;
    }
    return self;
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // we want to know the location of our touch in this scene
    CGPoint touchLocation = [touch locationInNode:self];
    
    // move the ship animated to the touch position
    [ship2 runAction: [CCActionMoveTo actionWithDuration:1.f position:touchLocation]];
}

//method gets called every frame on every of your scenes
- (void)update:(CCTime)delta
{
    //move the ship only in the x direction by a fixed amount every frame
    ship1.position = ccp( ship1.position.x + 100*delta, ship1.position.y );
    
    if (ship1.position.x > self.contentSizeInPoints.width+ship1.contentSizeInPoints.width/2)
    {
        //if the ship reaches the edge of the screen, loop around
        ship1.position = ccp( -ship1.contentSizeInPoints.width/2, ship1.position.y);
    }
}

@end
