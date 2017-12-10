use "ponytest"

actor Main is TestList
  new create(env: Env) => PonyTest(env, this)
  new make() => None


fun tag tests(test: PonyTest) =>
  test(_TestDuration)


class iso _TestDuration is UnitTest
  fun name(): String => "duration"

  fun apply(h: TestHelper) =>
    let four_hundred_millis = Duration.from_millis(400)
    h.assert_eq[ULong](400, four_hundred_millis.get_millis())

    let three_hundred_milis = Duration.from_millis(300)
    h.assert_eq[ULong](300, three_hundred_milis.get_millis())

    let sum = four_hundred_millis.plus(three_hundred_milis)
    h.assert_eq[ULong](700, sum.get_millis())

    let diff = four_hundred_millis.minus(three_hundred_milis)
    h.assert_eq[ULong](100, diff.get_millis())
