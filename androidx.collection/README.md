# androidx.collection

This patch is built on the official androidx.collection version 1.4.0 to support platform OpenHarmony。

# How to publish

## 1. download android-platform-frameworks-support
At first, clone google `AOSP` project in local:

```
git clone https://android.googlesource.com/platform/frameworks/support
```

checkout commit [6bb3d4c5410cf394070cca4ff347d46454194480](https://android.googlesource.com/platform/frameworks/support/+/6bb3d4c5410cf394070cca4ff347d46454194480) and create branch:

```
git checkout 6bb3d4c5410cf394070cca4ff347d46454194480
```

## 2. apply patch

download [ov-androidx.collection-1.4.0.patch](ov-androidx.collection-1.4.0.patch) to local, and apply it:

```
git apply ov-androidx.collection-1.4.0.patch
```

## 3. maven configuration

open `gradle.properties` , then config your remote maven url, username, password

```
maven.remote.url=https://xxxx/repository/maven/xxx
maven.remote.username=user_A
maven.remote.password=password_A
```

and change your own collection version in `libraryversions.toml`
```
COLLECTION=xxxx
```

## 4. publish androidx.collection

enter `android-platform-frameworks-support` project' root path, and run the following commands
```
cd playground-projects/collection-playground
./gradlew studio
```
a sub-project will be opened with a specific `Android Studio`, run publishing gradle task to deploy `collection:collection` after syncing.

# How to import

import androidx.collection in `libs.version.toml`

```
collectionVersion = "xxxx"

lib-androidx-collection = { group = "androidx.collection", name = "collection", version.ref = "collectionVersion" }
```

and implementation in module's `build.gradle.kts`
```
implementation(lib.androidx.collection)
```