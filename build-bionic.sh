#!/bin/bash
#This script will recompile Bionic in hardfp mode, and substitute the necessary libraries into prebuilt/ndk/9/../ path, so we can build the rest of the system in hardfp.

#Removing out/ files for:
#libc
rm -rf out/target/product/flame/obj/lib/crt*
rm -rf out/target/product/flame/obj/lib/libc.so
rm -rf out/target/product/flame/obj/SHARED_LIBRARIES/libc_*
rm -rf out/target/product/flame/obj/STATIC_LIBRARIES/libc_*
#libstd
rm -rf out/target/product/flame/obj/lib/libstdc++.so
rm -rf out/target/product/flame/obj/SHARED_LIBRARIES/libstdc++*
rm -rf out/target/product/flame/obj/STATIC_LIBRARIES/libstdc++*
#libdl
rm -rf out/target/product/flame/obj/lib/libdl.so
rm -rf out/target/product/flame/obj/SHARED_LIBRARIES/libdl_*
#libm
rm -rf out/target/product/flame/obj/lib/libm.so
rm -rf out/target/product/flame/obj/SHARED_LIBRARIES/libm_*
rm -rf out/target/product/flame/obj/STATIC_LIBRARIES/libm_*

./build.sh showcommands libc 2>&1 | tee build-bionic.log
