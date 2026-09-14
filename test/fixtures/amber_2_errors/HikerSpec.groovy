import spock.lang.*

class HikerSpec extends Specification {

    def "life the universe and everything" () {
        def hikers = 0
        expect:
            new Hiker().answer() / hikers == 42
    }
}
