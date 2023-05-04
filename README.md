# TikTok_clone

A cross-platform TikTok clone project created with Flutter and Firebase. 


## Tech Stack

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)

## Dependencies 

```dart
  dependencies:
    flutter:
      sdk: flutter

    flutter_localizations:
      sdk: flutter

    intl: any

    cupertino_icons: ^1.0.2                
    font_awesome_flutter: 10.3.0          
    video_player: 2.4.10                 
    visibility_detector: 0.3.3            
    google_fonts: 4.0.1
    go_router: 6.0.2                       // GoRouter
    camera: ^0.10.4
    permission_handler: ^10.2.0
    gallery_saver: 2.3.2
    image_picker: 0.8.6+1
    provider: 6.0.5                       
    shared_preferences: ^2.1.0
    flutter_riverpod: ^2.1.3              // Riverpod
    firebase_core: ^2.10.0                // Firebase
    firebase_auth: ^4.4.2                 // Firebase Authentication
    cloud_firestore: ^4.5.2               // Cloud Firestore
    firebase_storage: ^11.1.1             // Firebase Storage
    cloud_functions: ^4.1.1               // Google Cloud Functions
```

## General Implementations

- [x] Responsive Design - iOS, Android, Web
- [x] State Management with Riverpod
- [x] MVVM Architecture
- [x] Navigation - Combination of `GoRouter` and Navigator 1
- [x] Dark Mode
- [x] Text Theme - Typography
- [x] Localization 
- [x] Unit, Widget, Integration Testing
- [x] NoSQL Architecture - Firebase 
  - [x] Firebase Authentication
  - [x] Firebase Firestore
  - [x] Cloud Storage
  - [x] Google Cloud Functions
  - [x] Messaging
  - [x] Security
  
## Features 

  <table>
    <tr> 
      <th colspan="3">Feature</th>
      <th>Description</th>
    </tr>
    <tr>
      <th rowspan="8">Authentication</th>
      <td colspan="2" align="center">Flutter Widgets</td>
      <td><code>SafeArea</code>, <code>TextField</code>, <code>Form</code>, <code>TextFormField</code>, <code>GestureDetector</code>, <code>CupertinoDatePicker</code>, <code>SnackBar</code></td>
    </tr>
    <tr> 
      <td rowspan="7" align="center">Screens</td>
      <td align="center">Sign-Up</td>
      <td> :heavy_check_mark: Navigates the user either to the Login screen or the Username screen. <br> :heavy_check_mark: Allows Social Signup with Github.</td>
    </tr>
    <tr> 
      <td align="center">Username</td>
      <td> :heavy_check_mark: Navigates the user to the Email screen. <br> :heavy_check_mark: Updates the sign-up form state to include the inserted username. </td>
    </tr>
    <tr> 
      <td align="center">Email</td>
      <td> :heavy_check_mark: Navigates the user to the Password screen. <br> :heavy_check_mark: Updates the sign-up form state to include the inserted email. <br> :heavy_check_mark: Validates the input before sending the user to the next screen by displaying an <code>errorText</code>. </td>
    </tr>
    <tr> 
      <td align="center">Password</td>
      <td> :heavy_check_mark: Navigates the user to the Birthday screen. <br> :heavy_check_mark: Updates the sign-up form state to include the inserted password. <br> :heavy_check_mark: Validates the input's length and character before sending the user to the next screen. <br> :heavy_check_mark: Allows the user to see the obscured password. </td>
    </tr>
    <tr> 
      <td align="center">Birthday</td>
      <td> :heavy_check_mark: Creates a user account with the form's email and password in `Firebase-Auth`. <br> :heavy_check_mark: Updates the sign-up form state to include the inserted birthday. <br> :heavy_check_mark: Limits users younger than 12 yrs. <br> :heavy_check_mark: Navigates the user to the Interests screen if there are no errors. </td>
    </tr>
    <tr> 
      <td align="center">Log-In</td>
      <td> :heavy_check_mark: Navigates the user to the Login Form. <br> :heavy_check_mark: Allows Social login with Github. </td>
    </tr>
    <tr> 
      <td align="center">Login Form</td>
      <td> :heavy_check_mark: Logs the user in with the saved values of the `TextFormField`. <br> :heavy_check_mark: The "login" button is disabled until <code>Firebase-Auth</code> checks in the user. <br> :heavy_check_mark: Navigates the user to the Home screen if there are no errors. </td>
    </tr>
    <tr>
      <th rowspan="3">Onboarding</th>
      <td colspan="2" align="center">Flutter Widgets</td>
      <td><code>AnimatedOpacity</code>, <code>Scrollbar</code>, <code>SingleChildScrollView</code>, <code>AnimatedCrossFade</code>, <code>AnimatedContainer</code></td>
    </tr>
    <tr> 
      <td rowspan="2" align="center">Screens</td>
      <td align="center">Interest</td>
      <td> :heavy_check_mark: Hides the `AppBar` when the user scrolls down. <br> :heavy_check_mark: Allows user to select and deselect interests. <br> :heavy_check_mark: Navigates the user to the Tutorial screen.</td>
    </tr>
    <tr> 
      <td align="center">Tutorial</td>
      <td> :heavy_check_mark: Detects the user's finger movements across the x-axis to move the user back and forward between pages 1 to 2 (of `AnimatedCrossFade`).  <br> :heavy_check_mark: Navigates the user to the Home screen with 
<code>GoRouter</code>'s <code>go</code> method to prevent the user from returning to this screen. </td>
    </tr>
    <tr>
      <th rowspan="4">Videos</th>
      <td colspan="2" align="center">Flutter Widgets</td>
      <td><code>CircularProgressIndicator</code>, <code>RefreshIndicator</code>, <code>PageView</code>, <code>SizedBox</code>, <code>Positioned</code>, <code>Expanded</code>, <code>CircleAvatar</code>, <code>showModalBottomSheet</code>, <code>Stack</code>, <code>File</code> </td>
    </tr>
    <tr> 
      <td rowspan="3" align="center">Screens</td>
      <td align="center">Video Timeline</td>
      <td> :heavy_check_mark: Displays an infinite-scrollable list of videos that are stored in the <code>Firebase-Storage</code>. <br> :heavy_check_mark: Refreshes videos. <br> :heavy_check_mark: Allows the user to mute, play, and like a video. <br> :heavy_check_mark: Displays a <code>ModalBottomSheet</code> when the user clicks on the comments icon, and causes the video pause in the background.</td>
    </tr>
    <tr> 
      <td align="center">Video Recording</td>
      <td> :heavy_check_mark: Uses the <code>Permission</code> package to ask the user for permission before accessing the device's camera and microphone. <br> :heavy_check_mark: Allows the user to record a video of up to 10 seconds, with the available cameras (front or back). <br> :heavy_check_mark: Long pressing on the recording button triggers a circular progress bar animation, which navigates the user to the Video Preview screen when finalized. <br> :heavy_check_mark: Allows the user to choose a video from the device's gallery with the `ImagePicker` package. <br> :heavy_check_mark: Flash Mode available. </td>
    </tr>
    <tr> 
      <td align="center">Video Preview</td>
      <td> :heavy_check_mark: Displays the chosen video. <br> :heavy_check_mark: Uses the <code>GallerySaver</code> package to save the video in the device's gallery. <br> :heavy_check_mark: Uploads the video to <code>Firebase-Storage</code>. </td>
    </tr>
    <tr>
      <th rowspan="2">Discover</th>
      <td colspan="2" align="center">Flutter Widgets</td>
      <td><code>DefaultTabController</code>, <code>ConstrainedBox</code>, <code>TabBar</code>, <code>TabBarView</code>, <code>GridView</code></td>
    </tr>
    <tr> 
      <td colspan="2" align="center">Functionality</td>
      <td> :heavy_check_mark: Displays a search bar, a <code>TabBar</code>, and a <code>GridView</code>. <br> :heavy_check_mark: Hides the keyboard whenever the user scrolls  or moves to another tab. </td>
    </tr> 
    <tr>
      <th rowspan="5">Inbox</th>
      <td colspan="2" align="center">Flutter Widgets</td>
      <td><code>Dismisssible</code>, <code>ListTile</code>, <code>RichText</code>, <code>TextSpan</code>, <code>AnimatedModalBarrier</code>, <code>SlideTransition</code>, <code>FadeTransition</code>, <code>RotationTransition</code></td>
    </tr>
    <tr> 
      <td rowspan="4" align="center">Screens</td>
      <td align="center">Inbox</td>
      <td> :heavy_check_mark: Navigates the user to either the Chats screen or the Activity screen.</td>
    </tr>
    <tr> 
      <td align="center">Activity</td>
      <td> :heavy_check_mark: Displays a dropdown list of <code>ListTiles</code>. <br> :heavy_check_mark: Dismisses a <code>ListTile</code> either from the left or the right, and shows a different background color and icon depending on which side the widget is being dismissed. </td>
    </tr>
    <tr> 
      <td align="center">Chats</td>
      <td> :heavy_check_mark: Inserts a chatroom when the user presses on the plus icon. <br> :heavy_check_mark: Deletes the chatroom if it receives a long press. <br> :heavy_check_mark: Navigates the user to the Chats Detail screen.</td>
    </tr>
    <tr> 
      <td align="center">Chats Detail</td>
      <td> :heavy_check_mark: Displays a real time chat conversation. <br> :heavy_check_mark: The user's text is saved in `Firebase-Storage`, and retrieved from it. </td>
    </tr>
    <tr>
      <th rowspan="3">User Profile</th>
      <td colspan="2" align="center">Flutter Widgets</td>
      <td><code>NestedScrollView</code>, <code>SliverAppBar</code>, <code>SliverToBoxAdapter</code>, <code>SliverPersistentHeader</code></td>
    </tr>
    <tr> 
      <td rowspan="2" align="center">Screens</td>
      <td align="center">User Profile</td>
      <td> :heavy_check_mark: Allows uploading image from the user's gallery with <code>ImagePicker</code>, which is saved in <code>Firebase-Storage</code>. <br> :heavy_check_mark: Uses <code>SliverPersistentHeader</code> to pin a <code>TabBar</code> to the top of the screen when the user scrolls down. </td>
    </tr>
    <tr> 
      <td align="center">Profile Edit</td>
      <td> :heavy_check_mark: Allows editing the user's biography and link, which are then updated on the user's profile screen. <br> :heavy_check_mark: Saves the inserted text fields in the user's <code>Firebase</code> database.</td>
    </tr>
     <tr>
      <th rowspan="3">Settings</th>
      <td colspan="2" align="center">Flutter Widgets</td>
      <td><code>ListView</code>, <code>SwitchListTile</code>, <code>CheckboxListTile</code>, <code>AboutListTile</code></td>
    </tr>
    <tr> 
      <td colspan="2" align="center">Functionality</td>
      <td> :heavy_check_mark: Shows Flutter's pre-built lincense page. <br> :heavy_check_mark: Logs the user out. <br> :heavy_check_mark: Allows the user to auto mute and autoplay the videos from the Video Timeline screen. </td>
    </tr> 
  </table>


