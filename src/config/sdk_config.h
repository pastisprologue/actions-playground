
#ifndef APP_VERSION_MAJOR
#define APP_VERSION_MAJOR 2
#endif

// <o> APP_VERSION_MINOR - Minor version  <0-1000> 


#ifndef APP_VERSION_MINOR
#define APP_VERSION_MINOR 8
#endif

// <o> APP_VERSION_PATCH - Patch version  <0-1000> 


#ifndef APP_VERSION_PATCH
#define APP_VERSION_PATCH 20
#endif

// <s> APP_VERSION_PRERELEASE - Prerelease, eg. "-1.alpha"

// <i> If not empty, this string should include the leading hyphen (-).
// <i> This string might be normalized at run-time to not contain characters
// <i> illegal in Semantic Versioning.
#ifndef APP_VERSION_PRERELEASE
#define APP_VERSION_PRERELEASE "-dev"""
#endif

// <s> APP_VERSION_METADATA - Metadata, e.g. "+some-string.01-01-2018-23-59-59"

// <i> If not empty, this string should include the leading plus (+).
// <i> This string might be normalized at run-time to not contain characters
// <i> illegal in Semantic Versioning.
#ifndef APP_VERSION_METADATA
#define APP_VERSION_METADATA "+" __DATE__ " " __TIME__
#endif


