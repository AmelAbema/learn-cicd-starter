## Version 1.7.1 (2023-04-25)

Changes:

  - bump actions/checkout@v3 and actions/setup-go@v3 (#1375)
  - Add go1.20 and mariadb10.11 to the testing matrix (#1403)
  - Increase default maxAllowedPacket size. (#1411)

Bugfixes:

  - Use SET syntax as specified in the MySQL documentation (#1402)


## Version 1.7 (2022-11-29)

Changes:

  - Drop support of Go 1.12 (#1211)
  - Refactoring `(*textRows).readRow` in a more clear way (#1230)
  - util: Reduce boundary check in escape functions. (#1316)
  - enhancement for mysqlConn handleAuthResult (#1250)

New Features:

  - support Is comparison on MySQLError (#1210)
  - return unsigned in database type name when necessary (#1238)
  - Add API to express like a --ssl-mode=PREFERRED MySQL client (#1370)
  - Add SQLState to MySQLError (#1321)

Bugfixes:

  -  Fix parsing 0 year. (#1257)


## Version 1.6 (2021-04-01)

Changes:

  - Migrate the CI service from travis-ci to GitHub Actions (#1176, #1183, #1190)
  - `NullTime` is deprecated (#960, #1144)
  - Reduce allocations when building SET command (#1111)
  - Performance improvement for time formatting (#1118)
  - Performance improvement for time parsing (#1098, #1113)

New Features:

  - Implement `driver.Validator` interface (#1106, #1174)
  - Support returning `uint64` from `Valuer` in `ConvertValue` (#1143)
  - Add `json.RawMessage` for converter and prepared statement (#1059)
  - Interpolate `json.RawMessage` as `string` (#1058)
  - Implements `CheckNamedValue` (#1090)

Bugfixes:

  - Stop rounding times (#1121, #1172)
  - Put zero filler into the SSL handshake packet (#1066)
  - Fix checking cancelled connections back into the connection pool (#1095)
  - Fix remove last 0 byte for mysql_old_password when password is empty (#1133)


## Version 1.5 (2020-01-07)

Changes:

  - Dropped support Go 1.9 and lower (#823, #829, #886, #1016, #1017)
  - Improve buffer handling (#890)
  - Document potentially insecure TLS configs (#901)
  - Use a double-buffering scheme to prevent data races (#943)
  - Pass uint64 values without converting them to string (#838, #955)
  - Update collations and make utf8mb4 default (#877, #1054)
  - Make NullTime compatible with sql.NullTime in Go 1.13+ (#995)
  - Removed CloudSQL support (#993, #1007)
  - Add Go Module support (#1003)

New Features:

  - Implement support of optional TLS (#900)
  - Check connection liveness (#934, #964, #997, #1048, #1051, #1052)
  - Implement Connector Interface (#941, #958, #1020, #1035)

Bugfixes:

  - Mark connections as bad on error during ping (#875)
  - Mark connections as bad on error during dial (#867)
  - Fix connection leak caused by rapid context cancellation (#1024)
  - Mark connections as bad on error during Conn.Prepare (#1030)


## Version 1.4.1 (2018-11-14)

Bugfixes:

 - Fix TIME format for binary columns (#818)
 - Fix handling of empty auth plugin names (#835)
 - Fix caching_sha2_password with empty password (#826)
 - Fix canceled context broke mysqlConn (#862)
 - Fix OldAuthSwitchRequest support (#870)
 - Fix Auth Response packet for cleartext password (#887)

## Version 1.4 (2018-06-03)

Changes:

 - Documentation fixes (#530, #535, #567)
 - Refactoring (#575, #579, #580, #581, #603, #615, #704)
 - Cache column names (#444)
 - Sort the DSN parameters in DSNs generated from a config (#637)
 - Allow native password authentication by default (#644)
 - Use the default port if it is missing in the DSN (#668)
 - Removed the `strict` mode (#676)
 - Do not query `max_allowed_packet` by default (#680)
 - Dropped support Go 1.6 and lower (#696)
 - Updated `ConvertValue()` to match the database/sql/driver implementation (#760)
 - Document the usage of `0000-00-00T00:00:00` as the time.Time zero value (#783)
 - Improved the compatibility of the authentication system (#807)

New Features:

 - Multi-Results support (#537)
 - `rejectReadOnly` DSN option (#604)
 - `context.Context` support (#608, #612, #627, #761)
 - Transaction isolation level support (#619, #744)
 - Read-Only transactions support (#618, #634)
 - `NewConfig` function which initializes a config with default values (#679)
 - Implemented the `ColumnType` interfaces (#667, #724)
 - Support for custom string types in `ConvertValue` (#623)
 - Implemented `NamedValueChecker`, improving support for uint64 with high bit set (#690, #709, #710)
 - `caching_sha2_password` authentication plugin support (#794, #800, #801, #802)
 - Implemented `driver.SessionResetter` (#779)
 - `sha256_password` authentication plugin support (#808)

Bugfixes:

 - Use the DSN hostname as TLS default ServerName if `tls=true` (#564, #718)
 - Fixed LOAD LOCAL DATA INFILE for empty files (#590)
 - Removed columns definition cache since it sometimes cached invalid data (#592)
 - Don't mutate registered TLS configs (#600)
 - Make RegisterTLSConfig concurrency-safe (#613)
 - Handle missing auth data in the handshake packet correctly (#646)
 - Do not retry queries when data was written to avoid data corruption (#302, #736)
 - Cache the connection pointer for error handling before invalidating it (#678)
 - Fixed imports for appengine/cloudsql (#700)
 - Fix sending STMT_LONG_DATA for 0 byte data (#734)
 - Set correct capacity for []bytes read from length-encoded strings (#766)
 - Make RegisterDial concurrency-safe (#773)


## Version 1.3 (2016-12-01)

Changes:

 - Go 1.1 is no longer supported
 - Use decimals fields in MySQL to format time types (#249)
 - Buffer optimizations (#269)
 - TLS ServerName defaults to the host (#283)
 - Refactoring (#400, #410, #437)
 - Adjusted documentation for second generation CloudSQL (#485)
 - Documented DSN system var quoting rules (#502)
 - Made statement.Close() calls idempotent to avoid errors in Go 1.6+ (#512)

New Features:

 - Enable microsecond resolution on TIME, DATETIME and TIMESTAMP (#249)
 - Support for returning table alias on Columns() (#289, #359, #382)
 - Placeholder interpolation, can be actived with the DSN parameter `interpolateParams=true` (#309, #318, #490)
 - Support for uint64 parameters with high bit set (#332, #345)
 - Cleartext authentication plugin support (#327)
 - Exported ParseDSN function and the Config struct (#403, #419, #429)
 - Read / Write timeouts (#401)
 - Support for JSON field type (#414)
 - Support for multi-statements and multi-results (#411, #431)
 - DSN parameter to set the driver-side max_allowed_packet value manually (#489)
 - Native password authentication plugin support (#494, #524)

Bugfixes:

 - Fixed handling of queries without columns and rows (#255)
 - Fixed a panic when SetKeepAlive() failed (#298)
 - Handle ERR packets while reading rows (#321)
 - Fixed reading NULL length-encoded integers in MySQL 5.6+ (#349)
 - Fixed absolute paths support in LOAD LOCAL DATA INFILE (#356)
 - Actually zero out bytes in handshake response (#378)
 - Fixed race condition in registering LOAD DATA INFILE handler (#383)
 - Fixed tests with MySQL 5.7.9+ (#380)
 - QueryUnescape TLS config names (#397)
 - Fixed "broken pipe" error by writing to closed socket (#390)
 - Fixed LOAD LOCAL DATA INFILE buffering (#424)
 - Fixed parsing of floats into float64 when placeholders are used (#434)
 - Fixed DSN tests with Go 1.7+ (#459)
 - Handle ERR packets while waiting for EOF (#473)
 - Invalidate connection on error while discarding additional results (#513)
 - Allow terminating packets of length 0 (#516)


## Version 1.2 (2014-06-03)

Changes:

 - We switched back to a "rolling release". `go get` installs the current master branch again
 - Version v1 of the driver will not be maintained anymore. Go 1.0 is no longer supported by this driver
 - Exported errors to allow easy checking from application code
 - Enabled TCP Keepalives on TCP connections
 - Optimized INFILE handling (better buffer size calculation, lazy init, ...)
 - The DSN parser also checks for a missing separating slash
 - Faster binary date / datetime to string formatting
 - Also exported the MySQLWarning type
 - mysqlConn.Close returns the first error encountered instead of ignoring all errors
 - writePacket() automatically writes the packet size to the header
 - readPacket() uses an iterative approach instead of the recursive approach to merge splitted packets

New Features:

 - `RegisterDial` allows the usage of a custom dial function to establish the network connection
 - Setting the connection collation is possible with the `collation` DSN parameter. This parameter should be preferred over the `charset` parameter
 - Logging of critical errors is configurable with `SetLogger`
 - Google CloudSQL support

Bugfixes:

 - Allow more than 32 parameters in prepared statements
 - Various old_password fixes
 - Fixed TestConcurrent test to pass Go's race detection
 - Fixed appendLengthEncodedInteger for large numbers
 - Renamed readLengthEnodedString to readLengthEncodedString and skipLengthEnodedString to skipLengthEncodedString (fixed typo)


## Version 1.1 (2013-11-02)

Changes:

  - Go-MySQL-Driver now requires Go 1.1
  - Connections now use the collation `utf8_general_ci` by default. Adding `&charset=UTF8` to the DSN should not be necessary anymore
  - Made closing rows and connections error tolerant. This allows for example deferring rows.Close() without checking for errors
  - `[]byte(nil)` is now treated as a NULL value. Before, it was treated like an empty string / `[]byte("")`
  - DSN parameter values must now be url.QueryEscape'ed. This allows text values to contain special characters, such as '&'.
  - Use the IO buffer also for writing. This results in zero allocations (by the driver) for most queries
  - Optimized the buffer for reading
  - stmt.Query now caches column metadata
  - New Logo
  - Changed the copyright header to include all contributors
  - Improved the LOAD INFILE documentation
  - The driver struct is now exported to make the driver directly accessible
  - Refactored the driver tests
  - Added more benchmarks and moved all to a separate file
  - Other small refactoring

New Features:

  - Added *old_passwords* support: Required in some cases, but must be enabled by adding `allowOldPasswords=true` to the DSN since it is insecure
  - Added a `clientFoundRows` parameter: Return the number of matching rows instead of the number of rows changed on UPDATEs
  - Added TLS/SSL support: Use a TLS/SSL encrypted connection to the server. Custom TLS configs can be registered and used

Bugfixes:

  - Fixed MySQL 4.1 support: MySQL 4.1 sends packets with lengths which differ from the specification
  - Convert to DB timezone when inserting `time.Time`
  - Splitted packets (more than 16MB) are now merged correctly
  - Fixed false positive `io.EOF` errors when the data was fully read
  - Avoid panics on reuse of closed connections
  - Fixed empty string producing false nil values
  - Fixed sign byte for positive TIME fields


## Version 1.0 (2013-05-14)

Initial Release
