#!/bin/sh

killall dart
dart ./server.dart 1>~/server.dart.log 2>&1 &
