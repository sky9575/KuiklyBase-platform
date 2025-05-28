# compose-multiplatform

This patch is built on the official compose-multiplatform version 1.6.1 to support platform OpenHarmony。

# How to publish

## 1. download compose-multiplatform
At first, clone jetbrains `compose-multiplatform` project in local:

```
git clone https://github.com/JetBrains/compose-multiplatform.git
```

checkout commit `e8459e19` and create branch:

```
git checkout e8459e19
```

## 2. apply patch

download [ov-compose-multiplatform-1.6.1-e8459e19.patch](ov-compose-multiplatform-1.6.1-e8459e19.patch) to local, and apply it:

```
git apply ov-compose-multiplatform-1.6.1-e8459e19.patch
```

## 3. maven configuration

open `gradle.properties` in `gradle-plugins` and `components`, then config your remote maven url, username, password.
and change your own compose-multiplatform version.
```
maven.remote.url=https://xxxx/repository/maven/xxx
maven.remote.username=user_A
maven.remote.password=password_A

compose.version=xxx
deploy.version=xxx
```

## 4. publish compose-multiplatform

open `grale-plugins` project, run `./gradlew publish` to publish `compose-grale-plugin` to your remote maven.
and `components` project for `resource` and `ui-tooling-preview`.

# How to import

import compose-multiplatform in `libs.version.toml`

```
compose-multiplatform = "xxxx"

composeMultiplatform = { id = "org.jetbrains.compose", version.ref = "compose-multiplatform" }
```

and implementation in module's `build.gradle.kts`
```
implementation(lib.plugins.composeMultiplatform)
```