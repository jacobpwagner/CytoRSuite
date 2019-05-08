#' Automatically register ppdrawGate, drawGate and manualGate with openCyto upon
#' loading package...
#'
#' @noRd
.onLoad <- function(libname, pkgname) {
  options("locatorBell" = FALSE)
  options("CytoRSuite_interact" = interactive())
  options("CytoRSuite_wd_check" = TRUE)
  options("CytoRSuite_overlay_display" = TRUE)
  openCyto::register_plugins(fun = .gate_manual, 
                            methodName = "gate_manual")
  openCyto::register_plugins(fun = .gate_draw, 
                            methodName = "gate_draw")
  openCyto::register_plugins(fun = .pp_gate_draw, 
                            methodName = "pp_gate_draw", 
                            dep = NA, "preprocessing")
}
