
#' This is the list in the standard:
#' https://w3c.github.io/webdriver/webdriver-spec.html#keyboard-actions
#' Our list was last updated on 2016-09-30
#' I removed the keys that can be transmitted in a simpler way.
#'
#' TODO: check what is actually supported by the various drivers.
#' A fun task. :)
#' @noRd
NULL

#' Special keys, so that we can refer to them with an easier syntax
#'
#' @examples
#' \dontrun{
#' el$send_keys("xyz")
#' el$send_keys("x", "y", "z")
#' el$send_keys("username", key$enter, "password", key$enter)
#'
#' ## Sending CTRL+A
#' el$send_keys(key$control, "a")
#'
#' ## Note that modifier keys (control, alt, shift, meta) are sticky,
#' ## they remain in effect in the rest of the send_keys() call. E.g.
#' ## this sends CTRL+X and CTRL+S
#' el$send_keys(key$control, "x", "s")
#'
#' ## You will need multiple calls to release control and send CTRL+X S
#' el$send_keys(key$control, "x")
#' el$send_keys("s")
#' }
#'
#' @export

key <- list(
  "unidentified"  = "\uE000",
  "cancel"        = "\ue001",
  "help"          = "\ue002",
  "backspace"     = "\ue003",
  "tab"           = "\ue004",
  "clear"         = "\ue005",
  "return"        = "\ue006",
  "enter"         = "\ue007",
  "shift"         = "\ue008",
  "control"       = "\ue009",
  "alt"           = "\ue00a",
  "pause"         = "\ue00b",
  "escape"        = "\ue00c",
  "pageup"        = "\ue00e",
  "pagedown"      = "\ue00f",
  "end"           = "\ue010",
  "home"          = "\ue011",
  "arrowleft"     = "\ue012",
  "arrowup"       = "\ue013",
  "arrowright"    = "\ue014",
  "arrowdown"     = "\ue015",
  "insert"        = "\ue016",
  "delete"        = "\ue017",
  "f1"            = "\ue031",
  "f2"            = "\ue032",
  "f3"            = "\ue033",
  "f4"            = "\ue034",
  "f5"            = "\ue035",
  "f6"            = "\ue036",
  "f7"            = "\ue037",
  "f8"            = "\ue038",
  "f9"            = "\ue039",
  "f10"           = "\ue03a",
  "f11"           = "\ue03b",
  "f12"           = "\ue03c",
  "meta"          = "\ue03d",
  "zenkakuhankak" = "\ue040",
  "shift"         = "\ue050",
  "control"       = "\ue051",
  "alt"           = "\ue052",
  "meta"          = "\ue053",
  "pageup"        = "\ue054",
  "pagedown"      = "\ue055",
  "end"           = "\ue056",
  "home"          = "\ue057",
  "arrowleft"     = "\ue058",
  "arrowup"       = "\ue059",
  "arrowright"    = "\ue05a",
  "arrowdown"     = "\ue05b",
  "insert"        = "\ue05c",
  "delete"        = "\ue05d"
)

#' Send keys to element
#'
#' @param self object
#' @param private private object
#' @param ... see examples at \code{\link{key}}
#'
#' @keywords internal

element_send_keys <- function(self, private, ...) {

  "!DEBUG element_send_keys `private$id`"
  response <- private$session_private$make_request(
    "ELEMENT SEND KEYS",
    list(value = paste(list(...), collapse = "")),
    params = list(element_id = private$id)
  )

  invisible(self)
}