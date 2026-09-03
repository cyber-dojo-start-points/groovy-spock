
# Each [test] press starts a JVM, and starting it is most of the wait rather
# than a part of it: it loads groovy's compiler, spock's runtime and the test
# launcher from the jars before a single spec runs. The image holds an AOT cache
# recorded when it was built, holding the classes that JVM loads in the form the
# JVM wants them; reading it back costs a fraction of loading them again.
#
# Your own classes are not in the cache, so editing them cannot invalidate it.
#
# The collector is named rather than left to the JVM to choose. A JVM that lives
# for a fraction of a second has nothing to gain from a concurrent collector,
# and replaying a cache under the one it picks by default is not reliable.
JVM_OPTS=()
JVM_OPTS+=(-XX:TieredStopAtLevel=1)      # a run is milliseconds; later tiers never repay
JVM_OPTS+=(-XX:+UseSerialGC)             # see above
JVM_OPTS+=(-XX:AOTCache=/aot/spock.aot)  # groovy's classes, spock's and the launcher's

# The groovy launcher passes JAVA_OPTS to the JVM it starts, as one string,
# which is what [*] spells.
export JAVA_OPTS="${JVM_OPTS[*]}"

# Every .groovy file is named, however deep it sits, so a file you add is
# compiled whether or not anything else refers to it yet. One that will not
# compile stops the run and says why, rather than being passed over in silence.
SOURCES=$(find . -name '*.groovy')

# All of them are handed to one JVM. Handing groovy a spec runs that one spec,
# so a JVM would start for each of them, and starting one costs more than
# running the specs in it. /run_spec_files.groovy comes from the image and
# explains which of the files below it runs as specs.
groovy -cp /groovy/spock-core-2.4-groovy-5.0.jar /run_spec_files.groovy ${SOURCES}
