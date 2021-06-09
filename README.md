# VigorV2IOS

Problem:
With millions of Americans being forced to shelter in place with city-wide lockdowns due to the pandemic, many of us have become complacent in our sedentary lifestyle and gained an unhealthy amount of weight as a result. This newfound plight of obesity has disseminated throughout the nation faster than it has in years past according to various scholarly sources.

That being said, now that things are beginning to open back up and vaccinations are being rolled out for everyone over the age of 16, life is showing a sign of normalcy...but the impact of covid on health will not be so easily overcome. As we know from this past year, having a considerable amount of weight over what is normal for your body (obesity) can cause extreme complications if an individual is to catch Covid, including permanent lung damage, lack of oxygen, and in the worst case, death.

This brings us to the main problem - People, now more than ever, need to find a gym fast in order to lose the weight gained during covid, but many have such busy lives that do not allow them the time to find a gym in their area or research best practices for weight lose through strength/endurance training.

Solution:
The solution is simple - the new gymFinder and wellness app - Vigor!

In my final project, titled VigorV2, I was successfully able to create an application that assists users in finding an ideal gym in their location and gives a visual representation of distance. I also implemented a way for users to have the perfect list of exercises for when they come to the gym. Often times, people tend to lose motivation because they are not sure what workouts to do that will optimize the health benefits of training. In this application I believe I was able to address several of these concerns by providing a list of youTube videos from a professional trainer that can be played in-app.

LaunchView Page:
<br>
<img width="250" alt="Screen Shot 2021-06-07 at 4 25 04 PM" src="https://user-images.githubusercontent.com/75241274/121290218-ddbc4c80-c8ab-11eb-8692-20b3280d6ed2.png">
For this initial Login page, I have a background image to set the tone of the application, the title displayed in a unique font, and two buttons: Sign Up and Log In.

Sign Up Page:
<br>
<img width="250" alt="Screen Shot 2021-06-07 at 4 15 36 PM" src="https://user-images.githubusercontent.com/75241274/121290422-34c22180-c8ac-11eb-8210-dba832be70dd.png">
On the Sign Up page, I created multiple textFields for users to enter their personal information (first name, last name, email, password) along with a Sign Up button. This portion of the project is where I begin to involve CocoaPods and FireBase Authorization, as when a user presses the sign up button, their information is saved in the online FireBase Database so that when they come back to the app later to log in, their email and password is on file. In order to do this, I first Installed CocoaPods and added it to my .xcodeproj file, turning it into a .xcworkspace file which allows me to use third party applications like Google’s FireBase.

Login Page:
<br>
<img width="250" alt="Screen Shot 2021-06-07 at 4 14 59 PM" src="https://user-images.githubusercontent.com/75241274/121290805-db0e2700-c8ac-11eb-819d-94d87d46846c.png">
For the Login page, it is pretty similar to what I did with the Sign Up page in terms of the formatting of buttons and textFields, only the functionality of the Login button is different and in this page, I utilize the Auth.auth().signIn(...) method from Firebase to sign users in, checking that their info is already in the database. If not, the red Error message at the bottom will give users a more detailed explanation on why they are unable to login successfully. As with the Sign Up button, the Login button will take users to the main page if the database is able to find their credentials.

Maps Tab Page:
<br>
<img width="250" alt="Screen Shot 2021-06-07 at 4 16 09 PM" src="https://user-images.githubusercontent.com/75241274/121290976-1dcfff00-c8ad-11eb-8b42-da516a161bea.png"> <img width="250" alt="Screen Shot 2021-06-07 at 4 16 17 PM" src="https://user-images.githubusercontent.com/75241274/121291008-29232a80-c8ad-11eb-8bde-ea7455ac7d9f.png"> <img width="250" alt="Screen Shot 2021-06-07 at 4 16 28 PM" src="https://user-images.githubusercontent.com/75241274/121291028-32ac9280-c8ad-11eb-8d2f-210f8f8bee5a.png">




