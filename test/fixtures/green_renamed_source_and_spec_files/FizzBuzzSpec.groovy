import spock.lang.*

class FizzBuzzSpec extends Specification {

    def "three is fizz" () {
        expect:
            new FizzBuzz().say(3) == 'Fizz'
    }
}
