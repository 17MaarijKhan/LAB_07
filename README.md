# LAB_07
Create Assets Folder:
In your Flutter project, right-click on the root folder > select New > Directory > name it assets.

Add Images:
Copy your images (e.g., pic1.png and pic2.png) into the assets folder.

Edit pubspec.yaml:
Open pubspec.yaml and add these lines (remove the #):
flutter:
  assets:
    - assets/pic1.png
    - assets/pic2.png
    
Save and Run:
Save the file, then run flutter pub get (it usually runs automatically).

Use in Code:
Image.asset('assets/pic1.png')


    
