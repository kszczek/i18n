// generated by diplomat-tool

part of 'lib.g.dart';

/// An ICU4X Date object capable of containing a date and time for any calendar.
///
/// See the [Rust documentation for `Date`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html) for more information.
final class Date implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  Date._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  @_DiplomatFfiUse('ICU4XDate_destroy')
  static final _finalizer = ffi.NativeFinalizer(
    ffi.Native.addressOf(_ICU4XDate_destroy),
  );

  /// Creates a new [`Date`] representing the ISO date and time
  /// given but in a given calendar
  ///
  /// See the [Rust documentation for `new_from_iso`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.new_from_iso) for more information.
  ///
  /// Throws [Error] on failure.
  factory Date.fromIsoInCalendar(
    int year,
    int month,
    int day,
    Calendar calendar,
  ) {
    final result = _ICU4XDate_create_from_iso_in_calendar(
      year,
      month,
      day,
      calendar._ffi,
    );
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._ffi == result.union.err);
    }
    return Date._fromFfi(result.union.ok, []);
  }

  /// Creates a new [`Date`] from the given codes, which are interpreted in the given calendar system
  ///
  /// See the [Rust documentation for `try_new_from_codes`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.try_new_from_codes) for more information.
  ///
  /// Throws [Error] on failure.
  factory Date.fromCodesInCalendar(
    String eraCode,
    int year,
    String monthCode,
    int day,
    Calendar calendar,
  ) {
    final temp = ffi2.Arena();
    final eraCodeView = eraCode.utf8View;
    final monthCodeView = monthCode.utf8View;
    final result = _ICU4XDate_create_from_codes_in_calendar(
      eraCodeView.allocIn(temp),
      eraCodeView.length,
      year,
      monthCodeView.allocIn(temp),
      monthCodeView.length,
      day,
      calendar._ffi,
    );
    temp.releaseAll();
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._ffi == result.union.err);
    }
    return Date._fromFfi(result.union.ok, []);
  }

  /// Convert this date to one in a different calendar
  ///
  /// See the [Rust documentation for `to_calendar`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.to_calendar) for more information.
  Date toCalendar(Calendar calendar) {
    final result = _ICU4XDate_to_calendar(_ffi, calendar._ffi);
    return Date._fromFfi(result, []);
  }

  /// Converts this date to ISO
  ///
  /// See the [Rust documentation for `to_iso`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.to_iso) for more information.
  IsoDate toIso() {
    final result = _ICU4XDate_to_iso(_ffi);
    return IsoDate._fromFfi(result, []);
  }

  /// Returns the 1-indexed day in the year for this date
  ///
  /// See the [Rust documentation for `day_of_year_info`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.day_of_year_info) for more information.
  int get dayOfYear {
    final result = _ICU4XDate_day_of_year(_ffi);
    return result;
  }

  /// Returns the 1-indexed day in the month for this date
  ///
  /// See the [Rust documentation for `day_of_month`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.day_of_month) for more information.
  int get dayOfMonth {
    final result = _ICU4XDate_day_of_month(_ffi);
    return result;
  }

  /// Returns the day in the week for this day
  ///
  /// See the [Rust documentation for `day_of_week`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.day_of_week) for more information.
  IsoWeekday get dayOfWeek {
    final result = _ICU4XDate_day_of_week(_ffi);
    return IsoWeekday.values.firstWhere((v) => v._ffi == result);
  }

  /// Returns the week number in this month, 1-indexed, based on what
  /// is considered the first day of the week (often a locale preference).
  ///
  /// `first_weekday` can be obtained via `first_weekday()` on [`WeekCalculator`]
  ///
  /// See the [Rust documentation for `week_of_month`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.week_of_month) for more information.
  int weekOfMonth(IsoWeekday firstWeekday) {
    final result = _ICU4XDate_week_of_month(_ffi, firstWeekday._ffi);
    return result;
  }

  /// Returns the week number in this year, using week data
  ///
  /// See the [Rust documentation for `week_of_year`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.week_of_year) for more information.
  ///
  /// Throws [Error] on failure.
  WeekOf weekOfYear(WeekCalculator calculator) {
    final result = _ICU4XDate_week_of_year(_ffi, calculator._ffi);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._ffi == result.union.err);
    }
    return WeekOf._fromFfi(result.union.ok);
  }

  /// Returns 1-indexed number of the month of this date in its year
  ///
  /// Note that for lunar calendars this may not lead to the same month
  /// having the same ordinal month across years; use month_code if you care
  /// about month identity.
  ///
  /// See the [Rust documentation for `month`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.month) for more information.
  int get ordinalMonth {
    final result = _ICU4XDate_ordinal_month(_ffi);
    return result;
  }

  /// Returns the month code for this date. Typically something
  /// like "M01", "M02", but can be more complicated for lunar calendars.
  ///
  /// See the [Rust documentation for `month`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.month) for more information.
  ///
  /// Throws [Error] on failure.
  String get monthCode {
    final writeable = _Writeable();
    final result = _ICU4XDate_month_code(_ffi, writeable._ffi);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._ffi == result.union.err);
    }
    return writeable.finalize();
  }

  /// Returns the year number in the current era for this date
  ///
  /// See the [Rust documentation for `year`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.year) for more information.
  int get yearInEra {
    final result = _ICU4XDate_year_in_era(_ffi);
    return result;
  }

  /// Returns the era for this date,
  ///
  /// See the [Rust documentation for `year`](https://docs.rs/icu/latest/icu/struct.Date.html#method.year) for more information.
  ///
  /// Additional information: [1](https://docs.rs/icu/latest/icu/types/struct.Era.html)
  ///
  /// Throws [Error] on failure.
  String get era {
    final writeable = _Writeable();
    final result = _ICU4XDate_era(_ffi, writeable._ffi);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._ffi == result.union.err);
    }
    return writeable.finalize();
  }

  /// Returns the number of months in the year represented by this date
  ///
  /// See the [Rust documentation for `months_in_year`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.months_in_year) for more information.
  int get monthsInYear {
    final result = _ICU4XDate_months_in_year(_ffi);
    return result;
  }

  /// Returns the number of days in the month represented by this date
  ///
  /// See the [Rust documentation for `days_in_month`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.days_in_month) for more information.
  int get daysInMonth {
    final result = _ICU4XDate_days_in_month(_ffi);
    return result;
  }

  /// Returns the number of days in the year represented by this date
  ///
  /// See the [Rust documentation for `days_in_year`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.days_in_year) for more information.
  int get daysInYear {
    final result = _ICU4XDate_days_in_year(_ffi);
    return result;
  }

  /// Returns the [`Calendar`] object backing this date
  ///
  /// See the [Rust documentation for `calendar`](https://docs.rs/icu/latest/icu/calendar/struct.Date.html#method.calendar) for more information.
  Calendar get calendar {
    final result = _ICU4XDate_calendar(_ffi);
    return Calendar._fromFfi(result, []);
  }
}

@_DiplomatFfiUse('ICU4XDate_destroy')
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_destroy',
)
// ignore: non_constant_identifier_names
external void _ICU4XDate_destroy(ffi.Pointer<ffi.Void> self);

@_DiplomatFfiUse('ICU4XDate_create_from_iso_in_calendar')
@ffi.Native<
  _ResultOpaqueInt32 Function(
    ffi.Int32,
    ffi.Uint8,
    ffi.Uint8,
    ffi.Pointer<ffi.Opaque>,
  )
>(isLeaf: true, symbol: 'ICU4XDate_create_from_iso_in_calendar')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XDate_create_from_iso_in_calendar(
  int year,
  int month,
  int day,
  ffi.Pointer<ffi.Opaque> calendar,
);

@_DiplomatFfiUse('ICU4XDate_create_from_codes_in_calendar')
@ffi.Native<
  _ResultOpaqueInt32 Function(
    ffi.Pointer<ffi.Uint8>,
    ffi.Size,
    ffi.Int32,
    ffi.Pointer<ffi.Uint8>,
    ffi.Size,
    ffi.Uint8,
    ffi.Pointer<ffi.Opaque>,
  )
>(isLeaf: true, symbol: 'ICU4XDate_create_from_codes_in_calendar')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XDate_create_from_codes_in_calendar(
  ffi.Pointer<ffi.Uint8> eraCodeData,
  int eraCodeLength,
  int year,
  ffi.Pointer<ffi.Uint8> monthCodeData,
  int monthCodeLength,
  int day,
  ffi.Pointer<ffi.Opaque> calendar,
);

@_DiplomatFfiUse('ICU4XDate_to_calendar')
@ffi.Native<
  ffi.Pointer<ffi.Opaque> Function(
    ffi.Pointer<ffi.Opaque>,
    ffi.Pointer<ffi.Opaque>,
  )
>(isLeaf: true, symbol: 'ICU4XDate_to_calendar')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _ICU4XDate_to_calendar(
  ffi.Pointer<ffi.Opaque> self,
  ffi.Pointer<ffi.Opaque> calendar,
);

@_DiplomatFfiUse('ICU4XDate_to_iso')
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_to_iso',
)
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _ICU4XDate_to_iso(
  ffi.Pointer<ffi.Opaque> self,
);

@_DiplomatFfiUse('ICU4XDate_day_of_year')
@ffi.Native<ffi.Uint16 Function(ffi.Pointer<ffi.Opaque>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_day_of_year',
)
// ignore: non_constant_identifier_names
external int _ICU4XDate_day_of_year(ffi.Pointer<ffi.Opaque> self);

@_DiplomatFfiUse('ICU4XDate_day_of_month')
@ffi.Native<ffi.Uint32 Function(ffi.Pointer<ffi.Opaque>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_day_of_month',
)
// ignore: non_constant_identifier_names
external int _ICU4XDate_day_of_month(ffi.Pointer<ffi.Opaque> self);

@_DiplomatFfiUse('ICU4XDate_day_of_week')
@ffi.Native<ffi.Int32 Function(ffi.Pointer<ffi.Opaque>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_day_of_week',
)
// ignore: non_constant_identifier_names
external int _ICU4XDate_day_of_week(ffi.Pointer<ffi.Opaque> self);

@_DiplomatFfiUse('ICU4XDate_week_of_month')
@ffi.Native<ffi.Uint32 Function(ffi.Pointer<ffi.Opaque>, ffi.Int32)>(
  isLeaf: true,
  symbol: 'ICU4XDate_week_of_month',
)
// ignore: non_constant_identifier_names
external int _ICU4XDate_week_of_month(
  ffi.Pointer<ffi.Opaque> self,
  int firstWeekday,
);

@_DiplomatFfiUse('ICU4XDate_week_of_year')
@ffi.Native<
  _ResultWeekOfFfiInt32 Function(
    ffi.Pointer<ffi.Opaque>,
    ffi.Pointer<ffi.Opaque>,
  )
>(isLeaf: true, symbol: 'ICU4XDate_week_of_year')
// ignore: non_constant_identifier_names
external _ResultWeekOfFfiInt32 _ICU4XDate_week_of_year(
  ffi.Pointer<ffi.Opaque> self,
  ffi.Pointer<ffi.Opaque> calculator,
);

@_DiplomatFfiUse('ICU4XDate_ordinal_month')
@ffi.Native<ffi.Uint32 Function(ffi.Pointer<ffi.Opaque>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_ordinal_month',
)
// ignore: non_constant_identifier_names
external int _ICU4XDate_ordinal_month(ffi.Pointer<ffi.Opaque> self);

@_DiplomatFfiUse('ICU4XDate_month_code')
@ffi.Native<
  _ResultVoidInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)
>(isLeaf: true, symbol: 'ICU4XDate_month_code')
// ignore: non_constant_identifier_names
external _ResultVoidInt32 _ICU4XDate_month_code(
  ffi.Pointer<ffi.Opaque> self,
  ffi.Pointer<ffi.Opaque> writeable,
);

@_DiplomatFfiUse('ICU4XDate_year_in_era')
@ffi.Native<ffi.Int32 Function(ffi.Pointer<ffi.Opaque>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_year_in_era',
)
// ignore: non_constant_identifier_names
external int _ICU4XDate_year_in_era(ffi.Pointer<ffi.Opaque> self);

@_DiplomatFfiUse('ICU4XDate_era')
@ffi.Native<
  _ResultVoidInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)
>(isLeaf: true, symbol: 'ICU4XDate_era')
// ignore: non_constant_identifier_names
external _ResultVoidInt32 _ICU4XDate_era(
  ffi.Pointer<ffi.Opaque> self,
  ffi.Pointer<ffi.Opaque> writeable,
);

@_DiplomatFfiUse('ICU4XDate_months_in_year')
@ffi.Native<ffi.Uint8 Function(ffi.Pointer<ffi.Opaque>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_months_in_year',
)
// ignore: non_constant_identifier_names
external int _ICU4XDate_months_in_year(ffi.Pointer<ffi.Opaque> self);

@_DiplomatFfiUse('ICU4XDate_days_in_month')
@ffi.Native<ffi.Uint8 Function(ffi.Pointer<ffi.Opaque>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_days_in_month',
)
// ignore: non_constant_identifier_names
external int _ICU4XDate_days_in_month(ffi.Pointer<ffi.Opaque> self);

@_DiplomatFfiUse('ICU4XDate_days_in_year')
@ffi.Native<ffi.Uint16 Function(ffi.Pointer<ffi.Opaque>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_days_in_year',
)
// ignore: non_constant_identifier_names
external int _ICU4XDate_days_in_year(ffi.Pointer<ffi.Opaque> self);

@_DiplomatFfiUse('ICU4XDate_calendar')
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>)>(
  isLeaf: true,
  symbol: 'ICU4XDate_calendar',
)
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _ICU4XDate_calendar(
  ffi.Pointer<ffi.Opaque> self,
);
