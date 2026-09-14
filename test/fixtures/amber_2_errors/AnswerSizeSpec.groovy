import spock.lang.*

class AnswerSizeSpec extends Specification {

    def "the answer is two digits long" () {
        def columns = 0
        expect:
            new Hiker().answer().toString().length() / columns == 2
    }
}
