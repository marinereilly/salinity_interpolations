#' kayak data adjuster
#'
#' This function adds gpx files and excel files for the salinity kayak survey
#' @param x The name of the gpx dataframe you want to append to
#' @param y The name of the excel dataframe you want to use. default is salinity_master
#' @keywords salinity
#' @import tidyverse
#' @import sf
#' @export
#' @examples
#' salinity_format(gpx_dataframe, excel_dataframe)

simplify_gpx<-function(x){
  select(x, Waypoint = name, cmt, geometry)
}

no_factor<-function(x){
  x$Waypoint<-as.numeric(as.character(x$Waypoint))
}

add_gps_data<-function(x,y = salinity_master){
  left_join(x,y, by="Waypoint")
}

salinity_format<-function(x){
  x<-simplify_gpx(x)
  x$Waypoint<-no_factor(x)
  x<-add_gps_data(x)
}
