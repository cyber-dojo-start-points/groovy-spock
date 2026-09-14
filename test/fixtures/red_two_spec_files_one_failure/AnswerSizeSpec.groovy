import spock.lang.*

class AnswerSizeSpec extends Specification {

    def "the answer is two digits long" () {
        expect:
            new Hiker().answer().toString().length() == 2
    }

    def "the answer is three digits long" () {
        expect:
            new Hiker().answer().toString().length() == 3
    }
}
