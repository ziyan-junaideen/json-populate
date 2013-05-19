#! /bin/sh
# Build Script for Project json-populate
coffee --compile --output dist/ src/

# minification of result
minify dist/jquery.jsonPopulate.js dist/jquery.jsonPopulate.min.js 
