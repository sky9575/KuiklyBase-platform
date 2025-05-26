# 1. Skia Compilation Guide for OpenHarmony
## 1.1 Clone skia-pack repository
```
git clone https://github.com/JetBrains/skia-pack.git

cd skia-pack
```

## 1.2 Checkout specific Skia version
```
python3 script/checkout.py --version m116-47d3027-1
```

# 2. Apply Patches

Place apply_patch.sh in the skia-pack root directory and execute:

```
cd skia-pack

sh apply_patch.sh /path/to/patches/
```
+ /path/to/patches/ should contain all .patch files


# 3. Environment Setup
## 3.1 Get OpenHarmony NDK
```
# Download Command Line Tools from OpenHarmony official site
# Extract native-linux-x64-4.0.10.5-Release.zip
unzip native-linux-x64-4.0.10.5-Release.zip -d ohos-sdk
```
## 3.2 Configure OHOS SDK Path
Modify skia/build_overrides/ohos.gni:
```
ohos_sdk_root = "/path/to/your/ohos-sdk"
```

# 4. Build Process
## 4.1 Execute Build
```
python3 script/build.py --target linux --machine arm64
```

## 4.2 Build Output
```
skia-pack/skia/out/Release-linux-arm64/libskia.so
```

# 5、Important Notes

**Patch Compatibility**：All patches are tested with Skia version m116-47d3027-1
**Requirements**：
1、Python 3.6+
2、OpenHarmony NDK 4.0.10.5
3、Linux build environment (recommended)
