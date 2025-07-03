# androidx.lifecycle

This patch is built on the official androidx.lifecycle version 2.8.0 to support platform OpenHarmony。

# How to publish

## 1. download android-platform-frameworks-support
At first, clone google `AOSP` project in local:

```
git clone https://android.googlesource.com/platform/frameworks/support
```

checkout commit [7ad6b8bbf8fa3d5a3c97feca6c52a1a2bf98a622](https://android.googlesource.com/platform/frameworks/support/+/7ad6b8bbf8fa3d5a3c97feca6c52a1a2bf98a622) and create branch:

```
git checkout 7ad6b8bbf8fa3d5a3c97feca6c52a1a2bf98a622
```

## 2. apply patch

download [ov-androidx.lifecycle-2.8.0.patch](ov-androidx.lifecycle-2.8.0.patch) to local, and apply it:

```
git apply ov-androidx.lifecycle-1.8.0.patch
```

## 3. maven configuration

open `gradle.properties` , then config your remote maven url, username, password

```
maven.remote.url=https://xxxx/repository/maven/xxx
maven.remote.username=user_A
maven.remote.password=password_A
```

and change your own lifecycle version in `libraryversions.toml`
```
LIFECYCLE=xxxx
```

## 4. publish androidx.lifecycle

enter `android-platform-frameworks-support` project' root path, and run the following commands
```
cd playground-projects/lifecycle-playground
./gradlew studio
```
a sub-project will be opened with a specific `Android Studio`, run publishing gradle task to deploy `lifecycle:lifecycle` after syncing.

# How to import

import androidx.lifecycle in `libs.version.toml`

```
lifecycleVersion = "xxxx"

lib-androidx-lifecycle-xxx = { group = "androidx.lifecycle", name = "lifecycle-xxx", version.ref = "lifecycleVersion" }
```

and implementation in module's `build.gradle.kts`
```
implementation(lib.androidx.lifecycle.xxx)
```