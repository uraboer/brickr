
#' Collect legoize image from individual bricks into grouped bricks.
#'
#' @param image_list List output from legoize(). Contains an element  \code{Img_lego}.
#' @param mosaic_type Default is 'flat' for a "studs-up" mosaic. Other option is 'stacked' for bricks placed on top of each other.
#' @return A list with element \code{Img_bricks} containing a data frame of the x- & y-coordinates, R, G, B channels, and brick ID. Other helper elements.
#' @export 
#'
collect_bricks <- function(image_list, mosaic_type = "flat"){
  in_list <- image_list
  
  if(mosaic_type == "flat"){
    img <- in_list$Img_lego %>% 
      dplyr::select(Level, x, y, Lego_name, Lego_color) %>% 
      #4x2 bricks - horizontal
      dplyr::group_by(Level, xg = x %/% 4, yg = y %/% 2) %>% 
      dplyr::mutate(g_1_x4y2_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x4y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - horizontal- offset 1,0
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+1) %/% 4, yg = y %/% 2) %>% 
      dplyr::mutate(g_1_x4y2_1 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x4y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - horizontal- offset 2,0
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+2) %/% 4, yg = y %/% 2) %>% 
      dplyr::mutate(g_1_x4y2_2 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x4y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - horizontal- offset 3,0
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+3) %/% 4, yg = y %/% 2) %>% 
      dplyr::mutate(g_1_x4y2_3 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x4y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>%
      #4x2 bricks - horizontal- offset 0,1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+0) %/% 4, yg = (y+1) %/% 2) %>% 
      dplyr::mutate(g_1_x4y2_4 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x4y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - horizontal- offset 1,1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+1) %/% 4, yg = (y+1) %/% 2) %>% 
      dplyr::mutate(g_1_x4y2_5 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x4y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - horizontal- offset 2,1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+2) %/% 4, yg = (y+1) %/% 2) %>% 
      dplyr::mutate(g_1_x4y2_6 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x4y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - horizontal- offset 3,1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+3) %/% 4, yg = (y+1) %/% 2) %>% 
      dplyr::mutate(g_1_x4y2_7 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x4y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>%
      #4x2 bricks - vertical
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x %/% 2, yg = y %/% 4) %>% 
      dplyr::mutate(g_2_x2y4_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x2y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - vertical - offset 0,1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x) %/% 2, yg = (y+1) %/% 4) %>% 
      dplyr::mutate(g_2_x2y4_1 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x2y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - vertical - offset 0,2
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+0) %/% 2, yg = (y+2) %/% 4) %>% 
      dplyr::mutate(g_2_x2y4_2 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x2y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - vertical - offset 0,3
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+0) %/% 2, yg = (y+3) %/% 4) %>% 
      dplyr::mutate(g_2_x2y4_3 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x2y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>%
      #4x2 bricks - vertical - offset 1, 0
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+1) %/% 2, yg = y %/% 4) %>% 
      dplyr::mutate(g_2_x2y4_4 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x2y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - vertical - offset 1,1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+1) %/% 2, yg = (y+1) %/% 4) %>% 
      dplyr::mutate(g_2_x2y4_5 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x2y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - vertical - offset 1,2
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+1) %/% 2, yg = (y+2) %/% 4) %>% 
      dplyr::mutate(g_2_x2y4_6 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x2y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x2 bricks - vertical - offset 1,3
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+1) %/% 2, yg = (y+3) %/% 4) %>% 
      dplyr::mutate(g_2_x2y4_7 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 8,
                                        paste0("x2y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #2x2 bricks
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x %/% 2, yg = y %/% 2) %>% 
      dplyr::mutate(g_5_x2y2_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x2y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #2x2 bricks - offset by 1,1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+1) %/% 2, yg = (y+1) %/% 2) %>% 
      dplyr::mutate(g_5_x2y2_1 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x2y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x1 bricks - horizontal
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x %/% 4, yg = y ) %>% 
      dplyr::mutate(g_7_x4y1_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x4y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x1 bricks - horizontal - offset 1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+1) %/% 4, yg = y ) %>% 
      dplyr::mutate(g_7_x4y1_1 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x4y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>%  
      #4x1 bricks - horizontal - offset 2
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+2) %/% 4, yg = y ) %>% 
      dplyr::mutate(g_7_x4y1_2 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x4y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x1 bricks - horizontal - offset 3
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+3) %/% 4, yg = y ) %>% 
      dplyr::mutate(g_7_x4y1_3 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x4y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x1 bricks - vertical
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x, yg = y %/% 4) %>% 
      dplyr::mutate(g_8_x1y4_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x1y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>%
      #4x1 bricks - vertical - offset 1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x, yg = (y+1) %/% 4) %>% 
      dplyr::mutate(g_8_x1y4_1 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x1y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x1 bricks - vertical - offset 2
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x, yg = (y+2) %/% 4) %>% 
      dplyr::mutate(g_8_x1y4_2 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x1y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #4x1 bricks - vertical - offset 3
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x, yg = (y+3) %/% 4) %>% 
      dplyr::mutate(g_8_x1y4_3 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x1y4_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #3x1 bricks - horizontal
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x %/% 3, yg = y ) %>% 
      dplyr::mutate(g_7_x3y1_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 3,
                                        paste0("x3y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #3x1 bricks - horizontal - offset 1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+1) %/% 3, yg = y ) %>% 
      dplyr::mutate(g_7_x3y1_1 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 3,
                                        paste0("x3y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #3x1 bricks - horizontal - offset 2
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+2) %/% 3, yg = y ) %>% 
      dplyr::mutate(g_7_x3y1_2 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 3,
                                        paste0("x3y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #3x1 bricks -  vertical
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x, yg = y %/% 3) %>% 
      dplyr::mutate(g_8_x1y3_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 3,
                                        paste0("x1y3_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #3x1 bricks -  vertical - offset 1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x, yg = (y+1) %/% 3) %>% 
      dplyr::mutate(g_8_x1y3_1 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 3,
                                        paste0("x1y3_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #3x1 bricks -  vertical - offset 2
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x, yg = (y+2) %/% 3) %>% 
      dplyr::mutate(g_8_x1y3_2 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 3,
                                        paste0("x1y3_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #2x1 bricks - horizontal
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x %/% 2, yg = y ) %>% 
      dplyr::mutate(g_9_x2y1_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 2,
                                        paste0("x2y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #2x1 bricks - horizontal - offset 1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x+1) %/% 2, yg = y ) %>% 
      dplyr::mutate(g_9_x2y1_1 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 2,
                                        paste0("x2y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #2x1 bricks -  vertical
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x, yg = y %/% 2) %>% 
      dplyr::mutate(g_a_x1y2_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 2,
                                        paste0("x1y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #2x1 bricks -  vertical - offset 1
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = x, yg = (y+1) %/% 2) %>% 
      dplyr::mutate(g_a_x1y2_1 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 2,
                                        paste0("x1y2_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      dplyr::ungroup() %>% 
      #1x1
      dplyr::mutate(g_b_x1y1_0 = paste0("x1y1_", "x", x, "_y", y, "_", Level)) %>% 
      dplyr::select(-xg, -yg)
  }
  else if(mosaic_type == "stacked"){
    img <- in_list$Img_lego %>% 
      dplyr::select(Level, x, y, Lego_name, Lego_color) %>% 
      #4x1 bricks - horizontal
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x + y %% 4) %/% 4, yg = y ) %>% 
      dplyr::mutate(g_7_x4y1_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 4,
                                        paste0("x4y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #3x1 bricks - horizontal
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x + y %% 3) %/% 3, yg = y ) %>% 
      dplyr::mutate(g_7_x3y1_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 3,
                                        paste0("x3y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      #2x1 bricks - horizontal
      dplyr::ungroup() %>% dplyr::group_by(Level, xg = (x + y %% 2) %/% 2, yg = y ) %>% 
      dplyr::mutate(g_9_x2y1_0 = ifelse(length(unique(Lego_name)) == 1 & dplyr::n() == 2,
                                        paste0("x2y1_", "x", min(x), "_y", min(y), "_", Level), NA)) %>% 
      dplyr::ungroup() %>% 
      #1x1
      dplyr::mutate(g_b_x1y1_0 = paste0("x1y1_", "x", x, "_y", y, "_", Level)) %>% 
      dplyr::select(-xg, -yg)
  }
  else(stop("Use mosaic_type = 'flat' or 'stacked'"))
  
  # New calculation for piece placement, March 1, 2019.
  # https://github.com/ryantimpe/LEGOMosaics/issues/2
  img2a <- img %>% 
    tidyr::gather(Brick, brick_id, dplyr::starts_with("g_"))
  
  bricks <- unique(img2a$Brick)
  
  bricks_df <- img2a %>% 
    dplyr::filter(dplyr::row_number() <1)
  
  #Iteratively go through each brick, in order from largest to smallest, removing them and then checking the remaining image for complete bricks.
  for(bb in bricks){
    dat <- img2a %>% 
      dplyr::filter(Brick == bb) %>% 
      tidyr::drop_na(brick_id) %>% 
      dplyr::anti_join(bricks_df, by = c("Level", "x", "y")) %>% 
      #Necessary Area
      dplyr::mutate(area_tar = as.numeric(substr(brick_id, 2,2)) *  as.numeric(substr(brick_id, 4,4))) %>%
      #Actual Area
      dplyr::group_by(brick_id) %>% 
      dplyr::mutate(area_act = dplyr::n()) %>% 
      dplyr::ungroup() %>% 
      #Drop rows where the areas don't match
      dplyr::filter(area_act == area_tar) %>% 
      dplyr::select(-dplyr::starts_with("area"))
    
    bricks_df <- bricks_df %>% 
      dplyr::bind_rows(dat)
  }
  
  img2 <- bricks_df %>% 
    # min/max coord for geom_rect()
    dplyr::group_by(Level, Brick, brick_id, Lego_color, Lego_name) %>% 
    dplyr::summarise(xmin = min(x)-0.5, xmax = max(x)+0.5,
                     ymin = min(y)-0.5, ymax = max(y)+0.5) %>% 
    dplyr::ungroup()
  
  # This is very brute-force. Probably a much cleaner way to do this
  pcs <- img2 %>% 
    dplyr::select(Level, Brick, brick_id, Lego_name, Lego_color) %>% 
    dplyr::distinct() %>% 
    tidyr::separate(Brick, c("g", "gn", "size", "gi")) %>% 
    dplyr::select(-dplyr::starts_with("g")) %>% 
    dplyr::mutate(size1 = as.numeric(substr(size, 2, 2)), 
                  size2 = as.numeric(substr(size, 4, 4))) %>% 
    dplyr::mutate(Brick_size = ifelse(size1>size2, paste(size1, "x", size2), paste(size2, "x" , size1))) %>% 
    dplyr::count(Brick_size, Lego_name, Lego_color) 
  
  #Replace "x 1" bricks with "x 2". More likely to be used for a stacked mosaic
  if(mosaic_type == "stacked"){
    pcs <- pcs %>% 
      dplyr::mutate(Brick_size = gsub("x 1", "x 2", Brick_size, fixed = TRUE))
  }
  
  in_list[["Img_bricks"]] <- img2
  in_list[["ID_bricks"]] <- bricks_df
  in_list[["mosaic_type"]] <- mosaic_type
  in_list[["pieces"]] <- pcs
  
  return(in_list)
}

#' Convert image raster array to a LEGO-esque mosaic. Wrapper function.
#'
#' @param image_list List output from scale_image(). Contains an element  \code{Img_scaled}.
#' @param img_size Size of output image in pixel, where one pixel = one 'brick'. Use a single value (e.g. \code{48}) for a square image with 48 pixels on each side. 
#' Use an array of two values for a rectangular image \code{c(width, height)}.
#' @param color_table Defaults to \code{lego_colors}. Data frame of brick colors to map onto image. Must contain Name and R, G, B channels. See attached data  \code{lego_colors} as examples.
#' @param mosaic_type Default is 'flat' for a "studs-up" mosaic. Other option is 'stacked' for bricks placed on top of each other.
#' @param brightness A value >1 will increase the brightness of the image while a positive value <1 will decrease the brightness.
#' @param warhol Array of values \code{c(1, 2, 3)} associated with R, G, B color channels. Swap values in array to swap color channels for a fun visual effect.
#' @param brick_theme Theme of brick colors to use. Set to \code{"bw"} for grayscale mosaics.
#' @param contrast For \code{theme = "bw"}. A value >1 will increase the contrast of the image while a positive value <1 will decrease the contrast.
#' @return A list with element \code{Img_lego} containing a data frame of the x- & y-coordinates, R, G, B channels, and mapped color of each brick (pixel).
#' @export 
#'
image_to_bricks <- function(img, img_size = 48, color_table = lego_colors, mosaic_type = "flat",
                            brightness = 1, warhol = 1:3, brick_theme = "default", contrast = 1){
  
  in_list <- img %>% 
    scale_image(img_size = img_size, brightness = brightness, warhol = warhol) %>% 
    legoize(color_table = color_table, theme = brick_theme, contrast = contrast) %>% 
    collect_bricks(mosaic_type = mosaic_type)
  
  return(in_list)
}

