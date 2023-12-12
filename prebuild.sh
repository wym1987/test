sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
# Clone AOSP repository
#- git clone https://android.googlesource.com/platform/manifest -b android-13.0.0_r43 aosp
# Initialize the AOSP build environment
sudo curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo
sudo chmod a+x /usr/bin/repo
repo init -u https://mirrors.tuna.tsinghua.edu.cn/git/AOSP/platform/manifest -b android-13.0.0_r43 aosp
repo sync -j8
cd aosp
source build/envsetup.sh
lunch aosp_arm-eng  # Choose your target lunch configuration
# Build Android
make -j$(nproc)