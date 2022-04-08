Using the MVVM design pattern, and SwiftUI for laying out the views, please build an app that adheres to the layout.

Clicking on "Go to Tokens page" should push the second page on to the UI.

Clicking on "Logout" from either page should present the "Login Screen" as a modal on top of the rest of the UI.

Clicking on "Login" should always present the first "Name" page even if the second, "Tokens" was where "Logout" was clicked.

Created an AccountManager service that manages the logged in/out state, provides the name on the account, and on each new login, generates a randomly generated UUID value for Tokens.
 
This app is backwards compatible such that any iOS 14.x device can run it.

The app follows the flow illustrated.
![thumbnail](https://user-images.githubusercontent.com/2362373/162496060-26047827-fb9e-4cfc-a389-b36f5666d349.jpg)
