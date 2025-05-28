# kotlinx.atomicfu

This patch is built on the official kotlinx.atomicfu version 0.23.2 to support platform OpenHarmony。

# How to publish

## 1. download kotlinx.atomicfu
At first, clone offcial kotlin.atomicfu project in local:

```
git clone https://github.com/Kotlin/kotlinx.atomicfu.git
```

checkout tag 0.23.2 and create branch:

```
git checkout -b v0.23.2 0.23.2
```

## 2. apply patch

download patch to local, and apply it:

```
git apply kotlinx-atomicfu.patch
```

## 3. maven configuration

open `gradle.properties` , then config your upload maven url 、username、password

```
maven_publish_url=https://xxxx/repository/maven/xxx
maven_username=user_A
maven_password=password_A
```

and change your own kotlinx.atomicfu version
```
version=xxxx
```

## 4. publish kotlinx.atomicfu

after gradle sync, enter kotlinx.atomicfu project' root path, execute `publish` ，publish kotlinx.atomicfu to your own maven
```
./gradlew publish
```

# How to import

import kotlinx.atomicfu in `libs.version.toml`

```
atomicfuVersion = "xxxx"

lib-kotlin-atomicfu = { group = "org.jetbrains.kotlinx", name = "kotlinx-atomicfu", version.ref = "atomicfuVersion" }
```

and implementation in module's `build.gradle.kts`
```
implementation(lib.kotlin.atomicfu)
```