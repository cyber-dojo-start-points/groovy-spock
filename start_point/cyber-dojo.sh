
# There appears to be no way to pass all the Spec class names
# to groovy in one go. So I'm calling groovy once for each one.

SPECS=($(ls *Spec.groovy | cut -d '.' -f 1))
for SPEC in "${SPECS[@]}"
do
  groovy -cp /groovy/spock-core-2.4-groovy-5.0.jar ${SPEC}
done
