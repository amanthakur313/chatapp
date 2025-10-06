


plugins {
    id("com.android.application")
    id("kotlin-android")

    // Flutter Gradle plugin must be applied after Android and Kotlin
    id("dev.flutter.flutter-gradle-plugin")

    // Add the Google services Gradle plugin
    id("com.google.gms.google-services")
}

android { 
    namespace = "com.amanthakur.chatapp.chatapp"
    compileSdk = flutter.compileSdkVersion
    // ndkVersion = flutter.ndkVersion
    ndkVersion = "27.0.12077973"
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.amanthakur.chatapp.chatapp"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        multiDexEnabled = true
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Import the Firebase BoM (Bill of Materials)
    implementation(platform("com.google.firebase:firebase-bom:34.3.0"))

    // Example Firebase SDKs (choose as per your need)
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-auth")
    implementation("com.google.firebase:firebase-firestore")
    // implementation("com.google.firebase:firebase-messaging") // if you need FCM
}
