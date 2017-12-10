use "ponytest"

actor Main is TestList
  new create(env: Env) => PonyTest(env, this)
  new make() => None


fun tag tests(test: PonyTest) =>
  test(_TestDuration)


class iso _TestDuration is UnitTest
  fun name(): String => "duration"

  fun apply(h: TestHelper) =>
    let duration = Duration.from_millis(200)
    h.assert_eq[ULong](200, duration.get_millis())
