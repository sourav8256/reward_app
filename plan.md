$ keytool -genkey -v -keystore "D:\backup-Backup\SHARED\WORK\dev\Flutter\news_app\meta\keystore\easynewskey.jks" -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias easynewskey
Enter keystore password:  easynewspass
Re-enter new password: easynewspass
What is your first and last name?
  [Unknown]:  sourav mandal
What is the name of your organizational unit?
  [Unknown]:  springpebbles
What is the name of your organization?
  [Unknown]:  springpebbles
What is the name of your City or Locality?
  [Unknown]:  bangalore
What is the name of your State or Province?
  [Unknown]:  karnataka
What is the two-letter country code for this unit?
  [Unknown]:
Is CN=sourav mandal, OU=springpebbles, O=springpebbles, L=bangalore, ST=karnataka, C=Unknown correct?
  [no]:  yes




keytool -list -v -keystore "D:\backup-Backup\SHARED\WORK\dev\Flutter\news_app\meta\keystore\easynewskey.jks" -alias easynewskey


keytool -list -v -keystore "D:\backup-Backup\SHARED\WORK\dev\webwork\reward_game\flutter\reward_game\android\app\meta\keystore\easynewskey.jks" -alias easynewskey
