## Getting Started

To configure the project for Android, please complete the following setups.
1. Please add your secure key to the android.properties file.
2. Set the ACCESS_TOKEN variable in the CommonConstants file with your public key to run the Android application.

To configure the project for IOS, please complete the following setups.
1. Create a file with the .netrc extension in the home directory(System home directory not project directory).
2. Then add below commands with your secret keys
machine api.mapbox.com
  login mapbox
  password YOUR_SECRET_MAPBOX_ACCESS_TOKEN
