# androidx.annotation

This patch is built on the official androidx.annotation version 1.8.0 to support platform OpenHarmony。

# How to publish

## 1. download android-platform-frameworks-support
At first, clone google `AOSP` project in local:

```
git clone https://android.googlesource.com/platform/frameworks/support
```

checkout commit [4e5e9e3ddec39fb6f9f34c89b1b4f9b58a1ab627](https://android.googlesource.com/platform/frameworks/support/+/4e5e9e3ddec39fb6f9f34c89b1b4f9b58a1ab627) and create branch:

```
git checkout 4e5e9e3ddec39fb6f9f34c89b1b4f9b58a1ab627
```

## 2. apply patch

download [ov-androidx.annotation-1.8.0.patch](ov-androidx.annotation-1.8.0.patch) to local, and apply it:

```
git apply ov-androidx.annotation-1.8.0.patch
```

## 3. maven configuration

open `gradle.properties` , then config your remote maven url, username, password

```
maven.remote.url=https://xxxx/repository/maven/xxx
maven.remote.username=user_A
maven.remote.password=password_A
```

and change your own annotation version in `libraryversions.toml`
```
ANNOTATION=xxxx
```

## 4. publish androidx.annotation

enter `android-platform-frameworks-support` project' root path, and run the following commands
```
cd playground-projects/collection-playground
./gradlew studio
```
a sub-project will be opened with a specific `Android Studio`, run publishing gradle task to deploy `annotation:annotation` after syncing.

# How to import

import androidx.annotation in `libs.version.toml`

```
annotationVersion = "xxxx"

lib-androidx-annotation = { group = "androidx.annotation", name = "annotation", version.ref = "annotationVersion" }
```

and implementation in module's `build.gradle.kts`
```
implementation(lib.androidx.annotation)
```