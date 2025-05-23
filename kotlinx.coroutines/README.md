# kotlinx.coroutines

This patch is built on the official kotlinx.coroutines version 1.8.0 to support platform OpenHarmony。

# How to publish 

## 1. download kotlinx.coroutines
At first, clone offcial kotlin.coroutines project in local:

```
git clone https://github.com/Kotlin/kotlinx.coroutines.git
```

checkout tag 1.8.0 and create branch:

```
git checkout -b v1.8.0 1.8.0
```

## 2. apply patch

download patch to local, and apply it:

```
git apply kotlinx-coroutines.patch
```

## 3. maven configuration

open `gradle.properties` , then config your upload maven url 、username、password

```
maven_publish_url=https://xxxx/repository/maven/xxx
maven_username=user_A
maven_password=password_A
```

and change your own kotlinx.coroutines version
```
version=xxxx
```

## 4. publish kotlinx.coroutines

after gradle sync, enter kotlinx.coroutines project' root path, execute `publish` ，publish kotlinx.coroutines to your own maven
```
./gradlew publish
```

# How to import

import kotlinx.coroutines in `libs.version.toml`

```
coroutinesVersion = "xxxx"

lib-kotlin-coroutines = { group = "org.jetbrains.kotlinx", name = "kotlinx-coroutines-core", version.ref = "coroutinesVersion" }
```

and implementation in module's `build.gradle.kts`
```
implementation(lib.kotlin.coroutines)
```