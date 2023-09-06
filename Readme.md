# SwiftUI DeepLinking issue on iOS 17 demo
This project demonstrates an issue present in iOS 17 which materializes when you use SwiftUI's NavigationStack to present drill downs deeper than 1 level immediately on application start.

It seems to be a regression, since running this same project on iOS 16 does not exhibit this issue.

## How to use
Just build and run the app in the iOS simulator. Running on an iOS 17 simulator will show a blank screen with a back button, while running on iOS16 will show the third level view ("hello 3rd level!")