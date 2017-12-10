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
    h.assert_eq[ILong](400, four_hundred_millis.get_millis())

    let three_hundred_milis = Duration.from_millis(300)
    h.assert_eq[ILong](300, three_hundred_milis.get_millis())

    // sum of two Durations
    let sum = four_hundred_millis + (three_hundred_milis)
    h.assert_eq[ILong](700, sum.get_millis())

    // positive difference
    let diff = four_hundred_millis - (three_hundred_milis)
    h.assert_eq[ILong](100, diff.get_millis())

    // negative difference
    let negative_diff = three_hundred_milis - (four_hundred_millis)
    h.assert_eq[ILong](-100, negative_diff.get_millis())

    // negative difference
    let minus_one_hundred_milis = Duration.from_millis(-100)
    h.assert_eq[Duration](minus_one_hundred_milis, negative_diff)
