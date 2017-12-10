class val Duration is (Equatable[Duration] & Stringable)

  let _milliseconds: ILong val

  new val from_millis(milliseconds: ILong val) =>
      _milliseconds = milliseconds

  fun string(): String iso^ =>
    let str = recover
      "Duration of " + _milliseconds.string() + " milliseconds."
    end
    str.clone()

  fun get_millis(): ILong val =>
    _milliseconds

  fun add(duration: Duration val): Duration val =>
    Duration.from_millis(get_millis() + duration.get_millis())

  fun sub(duration: Duration val): Duration val =>
    Duration.from_millis(get_millis() - duration.get_millis())

  fun box eq(that: Duration box): Bool val =>
    this.get_millis() == that.get_millis()
