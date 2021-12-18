# VigorV2
This is a native iOS application that allows users to find gyms in their area in the midst of a global pandemic. In the app,
users will be given a search bar that will utilize Apple's MKLocalSearch API to determine the location of nearby businesses and pin the location, to provide a better understanding of distance from a user's current location. There is also another aspect to the project, which is the ability to watch fitness trainer videos in-app, for effective exercises that will assist in building strength and preventing possible injuries.
## Features
- Implements Apple MKLocalSearch/CLLocation API's in-app to find the user's location, display it, and show nearby businessees using keywords like "Gym" or "Pizza" for example.
- Utilizes YouTube Data API via various protocols to parse through the given YouTube playlist given and play the videos in-app, instead of being taken to a 3rd party application (i.e YouTube).
- Gives accurate depiction of distance between user's current location and the organization selected. This is done by employing MKMapView to display all locations in an Apple Maps format within the app, giving numerical distance in terms of minutes, while also displaying the quickest route to said location.
- Permits the creation of multiple user accounts via the employment of popular Google database known as fireBase. To utilize this service, it was necessary to install the FireBase framework within our application to use it's features inline.
- Incorporated webView, UIImageView, and the Decodable framework to enhance user experience and ensure app displays correct info.
- Integrated Cocoapods into the xcodeproject file in order to extend the breadth of external libraries at our disposal during the production of this application.
## Link:
- For a more detailed explanation, please visit the link provided here:
https://www.youtube.com/watch?v=y6MOB4vERDU
