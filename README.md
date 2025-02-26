Welcome to My Api
Is an Api that get the data of some wild animals.

Link to the app: https://my-api-kelo.onrender.com
link to postman Documentation:https://documenter.getpostman.com/view/42618511/2sAYdeMrhD

Task
The Task is to create an Api that has some Crud fuctionality in it, the challenge is this particular task doesnt have view I'll have to find a way to handle how I'll know if the api is working.

Description
To solve this problem, I use the knowledge gain from the past project especially BaseCamp 1 & 2.
I also have to request help from my fellow colleague on the how to go about some of the work.

Installation
To perform this task ai have to do some installations:
Ruby install
Rails install

Gems
-Doorkeeper #For token generation
-sqlite3 #For development database & testing
-devise #For user registration
-kaminari #For pagination
-redis #For caching.

Usage
The links for testing the api are in the postman documentation.
But some of the links especially those that need authorisation don't work online, because am using free tier version of render which cannot give me access to the console so i can generate the client Id and the client secret code. But if you run it locally it will do all that for you without any issue.

The app work this way: You use curl command in the terminal that will display the list of the animals for you
:http://localhost:3000/oauth/token #for generating token locally
:http://localhost:3000/wild_animals #for displaying the content, it this play 20 per page
:http://localhost:3000/wild_animals/:id #for fetching a single animal from the dataset
:http://localhost:3000/oauth/token/info #for fetching information of the token
:http://localhost:3000/wild_animals/1500 #This is to update the data of a specific animal.

All the commands are in the postman documentation, I use that because the swagger gem didn't work properly.


Made at Qwasar SV -- Software Engineering School <img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' />