import spock.lang.*

class HikerSpec extends Specification {

    def "the answer multiplied by #n is #product" () {
        expect:
            new Hiker().multiplied(n) == product
        where:
            n | product
            1 | 42
            2 | 84
            3 | 126
    }
}
