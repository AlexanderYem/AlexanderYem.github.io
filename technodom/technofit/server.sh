#!/bin/sh

# just restart server if it already run
killall dart
dart ./server.dart 1>~/server.dart.log 2>&1 &
