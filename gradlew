#!/usr/bin/env sh

APP_HOME="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
APP_BASE_NAME=$(basename "$0")
CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

# shellcheck disable=SC2039
if [ -n "$JAVA_HOME" ] ; then
    JAVACMD="$JAVA_HOME/bin/java"
else
    JAVACMD="java"
fi

if [ ! -r "$CLASSPATH" ]; then
    echo "ERROR: Gradle wrapper JAR not found at $CLASSPATH" >&2
    echo "Please generate the wrapper using a real Gradle installation or commit the official wrapper jar." >&2
    exit 1
fi

exec "$JAVACMD" -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
