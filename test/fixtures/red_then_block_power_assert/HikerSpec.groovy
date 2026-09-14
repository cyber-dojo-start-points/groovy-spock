import spock.lang.*

class HikerSpec extends Specification {

    def "life the universe and everything" () {
        given:
            def douglas = new Hiker()
        when:
            def answer = douglas.answer()
        then:
            answer == 42
    }
}
