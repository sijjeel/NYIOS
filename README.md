# NYIOS
This app displays a list of Articles from NY Times api.

## Platform:

* XCode 13.2.1
* Minimum iOS Version: 15.2
* The app supports all orientations and screen sizes.

---
## About:

* The goal of the project is to create an App that displays a list of Articles from NY Times api and display the detail page with complete article.


## Structure:

* The app is divided in 3 main targets

### NYIOS

* This target uses MVVM pattern to layout the UI. The ViewModels hold the business logic and the network interactions. They do not know about the views which makes them reuseable and portable for different projects.

* **ArticleView**: Displays a list of Articles.
* **ArticleDetailView**: Used a webview to display the web page from url.

### NYIOSCore (framework)

* Defines the entities that will be used in the app. The entities conforms to Codable protocol for json serialization

### NYNetwork (framework)

* Defines a generic protocol based APIClient.

## Code Coverage:

* NYIOS: 89%
* NYNetwork: 79.8%
* NYIOSCore: 100%

### Build and Run:

* Double Tap on NYIOS.xcodeproj and hit the run button.
* Press Command + U to run all the test cases.
* Code coverage can be seen by enabling the check mark of **Gather coverage for** and than press the report panal on left side of xcode and press the coverage for latest test case run.

