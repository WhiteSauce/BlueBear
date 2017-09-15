//License can be found in License (duh)

/* 
Feel free to add features! Might just make it into the official tweak!! Plus you’ll be credited in the settings!
Also, if anyone knows how to do the postNotification thing, please don’t hesitate in adding it! Thanks!

Before compiling make sure to link Theos!!!!
*/

#import <UIKit/UIKit.h>

#define PLIST_PATH @"/var/mobile/Library/Preferences/bluebear.ws.plist"
  inline bool GetPrefBool (NSString * key) 
{
return[[[NSDictionary dictionaryWithContentsOfFile: PLIST_PATH] valueForKey:key] boolValue];
}

//Done with Logos

%hook YTVideoAdsCoordinatorState //Disables playback advertisements

 -(bool) prerollSeen 
{
 
if (GetPrefBool (@"noAds"))
    
    {
 
return TRUE;
 
}
  
return %orig;

}
%end 
 
%hook UIKeyboardPredictionView //Enables the prediction keyboard bar

 -(bool) enabled 
{
  
if (GetPrefBool (@"prediction"))
    
    {
      
return TRUE;
    
}
  
return %orig;
 
}
%end 
 
%hook UIKeyboardImpl //Actually makes the prediction keyboard bar work + Enables auto-correction

 -(bool) predictionForTraitsWithForceEnable:(bool) 
  arg1 
  
{
  
if (GetPrefBool (@"prediction"))
    
    {
 
arg1 = TRUE;
      
return TRUE;
    
}
  
return %orig;

}

 -(bool) autocorrectionPreferenceForTraits
{
 
if (GetPrefBool (@"autocorrect"))
    
    {
 
return TRUE;

}

return %orig;
 
}
%end 
  
%hook YTSingleVideoController //Enables video backgrounding

 -(bool) isCurrentlyBackgroundable 
{
 
if (GetPrefBool (@"background"))
    
    {
      
return TRUE;
 
}
 
return %orig;
 
}
%end 
 
%hook UITextInputTraits //Disables emoji keyboard as it does not work well with prediction on + Enables white keyboard theme

 -(long long) keyboardType 
{

if (GetPrefBool (@"prediction"))

    {

return 1;
 
}

return %orig;

}

-(long long) keyboardAppearance 
{
  
if (GetPrefBool (@"whiteKeys"))
    
    {
      
return 0;
 
}
  
return %orig;

}
%end 
 
%hook UIStatusBar //Makes the StatusBard black
 
 -(bool) simulatesLegacyAppearance 
{
 
if (GetPrefBool (@"blackStatus"))
    
    {
 
return TRUE;
 
}
 
return %orig;
 
}
%end 
 
%hook UIApplication //This shrinks YouTube’s UI

 -(bool) _isClassic 
{
  
if (GetPrefBool (@"classic"))
    
    {
      
return TRUE;
    
}
  
return %orig;

}
%end 
 
%hook YTSettings //Disables adult restriction

 -(bool) isAdultContentConfirmed 
{
 
if (GetPrefBool (@"adultRes"))
    
    {
 
return TRUE;
    
}
 
return %orig;
 
}
%end 
 
%hook YTDoubleTapToSkipGestureRecognizer //Disables forward/rewind double tapping

 -(bool) shouldTrackTouch:(id) 
  arg1
  
{
  
if (GetPrefBool (@"doubleTap"))
    
    {
 
return FALSE;
      
arg1 = NULL;
    
}
 
return %orig;

}
%end 
 
%hook YTSlimVideoDetailsActionsView //Removes the save button. Useful if you don’t have Youtube Red!

 -(void) setOfflineButtonVisible: (bool) 
 arg1 
 dimmed: (bool) 
 arg2 
 animated: (bool) 
 arg3 
 completion:(id) 
 arg4
{
  
if (GetPrefBool (@"removeDL"))
    {
      
arg1 = FALSE;
      
return %orig(FALSE,arg2,arg3,arg4);
    
}
  
return %orig;

}
%end 
    
%hook YTLocalPlaybackController //Enables vertical mode for every type of video.

 -(bool) isCurrentVideoVertical 
  {
      
if (GetPrefBool (@"verticalEvery"))
      {
	
return TRUE;
      
}
    
return %orig;
  
}
%end 
 
%hook YTContentVideoPlayerOverlayView //Hides share button from the video player

-(void) setShareButtonHidden:(bool)arg1 animated:(bool) arg2{
if(GetPrefBool(@"clean")) {
arg1 = TRUE;
arg2 = TRUE;
}
return %orig;
}
%end

%hook YTContentVideoPlayerOverlayView //Hides add-to button from the video player

-(void) setAddToButtonHidden:(bool)arg1 animated:(bool) arg2{
if(GetPrefBool(@"clean")) {
arg1 = TRUE;
}
return %orig;
}
%end

%hook YTContentVideoPlayerOverlayView //Hides the video title from the video player

-(void) setTitleVisible:(bool)arg1 {
if(GetPrefBool(@"clean")) {
arg1 = FALSE;
}
return %orig;
}
%end

%hook YTVideoPlayerOverlayView //Hides the Next/Previous buttons from video player

-(void) setNextPreviousButtonsVisible:(bool)arg1 {
if(GetPrefBool(@"clean")) {
arg1 = FALSE;
}
return %orig;
}
%end

%hook YTVideoPlayerOverlayViewController //Hides the Cardboard button from the video player

-(void) setOverflowCardboardButtonHidden:(bool)arg1 {
if(GetPrefBool(@"clean")) {
arg1 = TRUE;
}
return %orig;
}
%end