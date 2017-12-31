trait Chronology
  fun getYear(milliseconds: ILong val): I32

class IsoChronology is Chronology

  fun getYear(milliseconds: ILong val): I32 =>
    1970
