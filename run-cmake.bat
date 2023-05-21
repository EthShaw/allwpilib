set ANDROID_SDK=%userprofile%\AppData\Local\Android\Sdk
set ANDROID_NDK=%ANDROID_SDK%\ndk\25.2.9519653
set ABI=arm64-v8a

%localappdata%\Android\Sdk\cmake\3.22.1\bin\cmake.exe -G "Unix Makefiles" ^
 -DCMAKE_CXX_STANDARD=20 ^
 -DCMAKE_CXX_STANDARD_REQUIRED=1 ^
 -DCMAKE_CXX_EXTENSIONS=0 ^
 -DCMAKE_CXX_FLAGS="-std=c++20" ^
 -DCMAKE_TOOLCHAIN_FILE=%ANDROID_NDK%\build\cmake\android.toolchain.cmake ^
 -DANDROID_ABI=%ABI% ^
 -DANDROID_NATIVE_API_LEVEL=24 ^
 -DANDROID_TOOLCHAIN=clang ^
 -DCMAKE_MAKE_PROGRAM=%ANDROID_NDK%\prebuilt\windows-x86_64\bin\make.exe ^
 -DWITH_CSCORE=OFF ^
 -DWITH_GUI=OFF ^
 -DWITH_JAVA=ON ^
 -DWITH_WPILIB=OFF ^
 -DWITH_SIMULATION_MODULES=OFF ^
 -DJAVA_AWT_LIBRARY=NotNeeded ^
 -DJAVA_JVM_LIBRARY=NotNeeded ^
 -DJAVA_INCLUDE_PATH2=NotNeeded ^
 -DJAVA_AWT_INCLUDE_PATH=NotNeeded ^
 -S . -B build

cd build
%ANDROID_NDK%\prebuilt\windows-x86_64\bin\make.exe

@rem You can use the below line instead to make the build run faster.
@rem Replace 12 with the number of concurrent jobs you want to run, which
@rem should probably be no more than the number of CPU cores you have.
@rem %ANDROID_NDK%\prebuilt\windows-x86_64\bin\make.exe -j12