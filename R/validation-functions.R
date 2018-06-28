#' Check Supplied Channels.
#' 
#' @param x an object of class \code{flowFrame}, \code{flowSet} or \code{GatingSet}.
#' @param channels vector of length 1 or 2 indicating the names of the channels to use for plotting and gating.
#'
#' @return Stops gating process if channels are incorrect or returns NULL.
#' 
#' @importFrom BiocGenerics colnames
#' 
#' @export
checkChannels <- function(x, channels){
  
  chans <- colnames(x)
  
  if(!length(channels) %in% c(1,2)){
    
    stop("Incorrect number of channels supplied. Please supply 1-2 channel names for plotting and gating.")
  
  }
  
  if(length(channels) == 1){
    
    if(channels %in% chans == FALSE){
      
      stop(paste(channels[channels %in% chans == FALSE]),"is not a valid channel for this", class(x),"!")
      
    }else{
      
      
    }
  
  }else if(length(channels) == 2){
    
    if(sum(channels %in% chans) == 0){
      
      stop(paste(paste(channels[channels %in% chans == FALSE], collapse = " & "), "are not valid channels for this", class(x)),"!")
      
    }else if(sum(channels %in% chans) == 1){
      
      stop(paste(channels[channels %in% chans == FALSE],"is not a valid channel for this", class(x)),"!")
      
    }else{
      
      
    }
    
    
  }
  
}

#' Check Supplied Gate Types(s).
#' 
#' @param gate_type vector indicating the types of gates to construct using \code{drawGate}.
#' 
#' @return Stops gating process if gate_type is incorrect or returns \code{gate_type} as full lower case name(s).
#' 
#' @export
checkGateType <- function(gate_type){
  
  gts <- c("polygon", "Polygon", "p", "P","rectangle", "Rectangle", "r", "R","interval", "Interval", "i", "I","threshold", "Threshold", "t", "T", "boundary", "Boundary", "b", "B","ellipse", "Ellipse", "e", "E","quadrant", "Quadrant", "q", "Q")
  
  if(!all(gate_type %in% gts)){
    
  if(length(gate_type[gate_type %in% gts == FALSE]) >= 2){
      
    stop(paste(paste(gate_type[gate_type %in% gts == FALSE], collapse = " & "), "are not valid gate_types for drawGate!"))
      
  }else{
      
    stop(paste(gate_type[gate_type %in% gts == FALSE],"is not a valid gate_type for drawGate!"))
      
  }
    
  }
  
  gate_type[gate_type %in% c("polygon", "Polygon", "p", "P")] <- "polygon"
  gate_type[gate_type %in% c("rectangle", "Rectangle", "r", "R")] <- "rectangle"
  gate_type[gate_type %in% c("interval", "Interval", "i", "I")] <- "interval"
  gate_type[gate_type %in% c("threshold", "Threshold", "t", "T")] <- "threshold"
  gate_type[gate_type %in% c("boundary", "Boundary", "b", "B")] <- "boundary"
  gate_type[gate_type %in% c("ellipse", "Ellipse", "e", "E")] <- "ellipse"
  gate_type[gate_type %in% c("quadrant", "Quadrant", "q", "Q")] <- "quadrant"
  
  return(gate_type)
}

#' Check Supplied Alias
#' 
#' @param alias vector indicating the names of the populations to be gated.
#' @param gate_type vector indicating the type(s) of gate(s) to be constructed.
#' 
#' @return Stops the gating process if alias is missing or \code{length(alias) != length(gate_type)}.
#'
#' @export
checkAlias <- function(alias, gate_type){
  
  if(is.null(alias)){
    
    stop("The name(s) of the population(s) to gate must be supplied as the alias argument.")
  
  }
  
  if(length(gate_type) > 1){
    
    if(length(alias) != length(gate_type)){
      
      stop("Length of alias must be the same length as gate_type for multi-gates.")
      
    }
  }
}