#!/bin/bash
set -e

OPENCV_VERSION=4.10.0
DEPLOYMENT_TARGET="14.0"
FRAMEWORK_NAME=opencv2
XCFRAMEWORK="${FRAMEWORK_NAME}.xcframework"

PYTHON_VERSION="3.9.1"

SCRIPT_DIR="$(cd $(dirname $0) && pwd)"
OPENCV_DIR="${SCRIPT_DIR}/opencv"
#CONTRIB_DIR="${SCRIPT_DIR}/opencv-contrib"
OUTPUT_DIR="${SCRIPT_DIR}/frameworks"

build_xcframework="${OPENCV_DIR}/platforms/apple/build_xcframework.py"

echo "Generate OpenCV iOS Framework [${OPENCV_VERSION}]" >&1

# Check version
cd "${SCRIPT_DIR}"

echo "Check cmake version" >&1
brew list cmake || brew install cmake

echo "Check pyenv version" >&1
brew list pyenv || brew install pyenv
pyenv install ${PYTHON_VERSION} --skip-existing
eval "$(pyenv init --path)"
pyenv global ${PYTHON_VERSION}

# Remove tmp dirs
echo "Remove tmp dirs" >&1

rm -rf "${OPENCV_DIR}"
rm -rf "${OUTPUT_DIR}/${XCFRAMEWORK}"
# rm -rf "${CONTRIB_DIR}"
rm -rf "${OUTPUT_DIR}"

# Download
echo "Download OpenCV ${OPENCV_VERSION}" >&1

curl -L -o opencv.zip "https://github.com/opencv/opencv/archive/refs/tags/${OPENCV_VERSION}.zip"
unzip -q opencv.zip && rm opencv.zip
mv "opencv-${OPENCV_VERSION}" opencv

# curl -L -o opencv_contrib.zip "https://github.com/opencv/opencv_contrib/archive/refs/tags/${OPENCV_VERSION}.zip"
# unzip -q opencv_contrib.zip && rm opencv_contrib.zip
# mv "opencv_contrib-${OPENCV_VERSION}" opencv_contrib

# Build
echo "Build OpenCV ${OPENCV_VERSION}" >&1

cd "${OPENCV_DIR}"
python3 ${build_xcframework} \
  --iphoneos_archs arm64 \
  --iphonesimulator_archs x86_64,arm64 \
  --build_only_specified_archs \
  --iphoneos_deployment_target ${DEPLOYMENT_TARGET} \
  --out ${OUTPUT_DIR} \
  --framework_name ${FRAMEWORK_NAME} \
  # --contrib ../opencv_contrib

echo "Build Success!!" >&1

# Remove tmp dirs
echo "Clear tmp dirs" >&1
cd "${SCRIPT_DIR}"
rm -rf "${OPENCV_DIR}"
rm -rf "${CONTRIB_DIR}"

# Zip
echo "Zip framework" >&1
cd "${OUTPUT_DIR}"
zip -r "${XCFRAMEWORK}.zip" "${XCFRAMEWORK}"

# Checksum
echo "checksum" >&1
swift package compute-checksum "${XCFRAMEWORK}.zip"
