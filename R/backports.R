# Backport fix from R 3.3:
# https://github.com/wch/r-source/commit/4efc81c98d262f93de9e7911aaa910f5c63cd00f
if (getRversion() <= 3.2) {
  absolute.units <- getFromNamespace("absolute.units", "grid")
  absolute.units.unit <- getFromNamespace("absolute.units.unit", "grid")
  absolute.units.unit.list <- getFromNamespace("absolute.units.unit.list", "grid")
  absolute.units.unit.arithmetic <- getFromNamespace("absolute.units.unit.arithmetic", "grid")

  .onLoad <- function(...) {
    registerS3method("absolute.units", "unit", absolute.units.unit)
    registerS3method("absolute.units", "unit.list", absolute.units.unit.list)
    registerS3method("absolute.units", "unit.arithmetic", absolute.units.unit.arithmetic)
  }
}
