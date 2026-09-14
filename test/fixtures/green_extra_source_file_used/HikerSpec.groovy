import spock.lang.*

class HikerSpec extends Specification {

    def "life the universe and everything" () {
        expect:
            new Hiker().answer() == 42
    }

    def "the answer is two digits long" () {
        expect:
            new Hiker().digitsInAnswer() == 2
    }
}
