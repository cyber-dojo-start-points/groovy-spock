import spock.lang.*

class AnswerSize extends Specification {

    def "the answer is two digits long" () {
        expect:
            new Hiker().answer().toString().length() == 2
    }
}
