import spock.lang.*

class HikerSpec extends Specification {

    def "life the universe and everything" () {
        for (int i = 0; i != 20000; i++) {
            System.out.println "debug: i is ${i}"
        }
        expect:
            new Hiker().answer() == 42
    }
}
