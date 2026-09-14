import spock.lang.*

class HikerSpec extends Specification {

    def "life the universe and everything" () {
        expect:
            new Hiker().answer() == 42
    }

    def "the answer is even" () {
        expect:
            new Hiker().answer() % 2 == 0
    }

    def "the hiker is called arthur" () {
        expect:
            new Hiker().name() == 'Arthur Dent'
    }
}
