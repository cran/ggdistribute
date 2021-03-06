.pt <- 72.27 / 25.4
.stroke <- 96 / 25.4


#' theme_mejr color mejr_palette
#'
#' @return list
#' @export
#'
#' @examples
#' mejr_palette()
mejr_palette <- function() {
  list(
    black="#141214", gray="#939393", lightgray="#E8E8E8", yellow="#E0CF7C",
    magenta="#E069C6", cyan="#60ADAB", midline="#767698", fill="#8989B2",
    colour="#585872"
  )
}

#' Custom ggplot2 theme
#'
#' A complete, minimal theme to be used with the `ggplot2` package
#'
#' You can use `theme_update` to change some aspect of this theme after
#' using `theme_set`.
#'
#' @inheritParams ggplot2::theme_gray
#' @param black  Values from 0 to 255, indicating the darkest line and
#' text colors (255).
#' @param margin_add additive adjustment of margin spacing and tick length (in "pt"
#' units). May be positive or negative.
#' @param debug Add debug info to text.
#' @param FUN Call a function before returning the theme elements.
#' @param ... Arguments passed to `FUN`
#' @seealso [mejr_geom_defaults], [ggplot2::theme_update], [ggplot2::theme_set]
#' @export
#' @examples
#' \donttest{
#' library(ggplot2)
#'
#' theme_set(theme_mejr(debug = TRUE))
#' example_plot()
#'
#' theme_set(theme_mejr())
#' theme_update(axis.text = element_blank()) # any updates can go here
#' example_plot()
#' }
theme_mejr <- function(base_size=11, base_family=getOption("ggdistribute.font"),
                       black=67, margin_add=2, debug=FALSE, FUN=NULL, ...) {
  black <- gray2(black)

  if (is.null(margin_add) | scale_add(base_size, 1 / 7, margin_add) < 0) {
    margin_add <- 0
  }

  mejr_geom_defaults(base_size, black)

  if (!is.null(FUN)) {
    do.call(match.fun(FUN), list(...))
  }

  # make theme elements --------------------------------------------------------

  light_gray <- rgb(0, 0, 0, .05)

  theme(
    line=element_line(
      colour=black, size=scale_add(base_size, 1 / 36), linetype=1, lineend="butt"
    ),
    rect=element_rect(
      fill="transparent", colour=black,
      size=scale_add(base_size, 1 / 18), linetype=1
    ),
    text=element_text(
      family=base_family, face="plain", colour=black, size=base_size,
      hjust=0.5, vjust=0.5, angle=0, lineheight=1,
      margin=margin(
        t=scale_add(base_size, 0.45), r=scale_add(base_size, 0.45),
        b=scale_add(base_size, 0.45), l=scale_add(base_size, 0.45),
        unit="pt"
      ), debug=debug
    ),
    title=element_text(
      family=base_family, face="plain", colour=black,
      size=scale_add(base_size, 1.1), hjust=0, vjust=0.5, angle=0, lineheight=0.9,
      margin=margin(
        t=0, r=0, b=scale_add(base_size, 0.25, margin_add), l=0, unit="pt"
      ),
      debug=debug
    ),
    axis.line=element_line(),
    axis.line.x=NULL,
    axis.line.y=NULL,
    axis.ticks=element_line(),
    axis.ticks.x=element_line(),
    axis.ticks.y=element_line(),
    axis.ticks.length=grid::unit(clip_range(margin_add / 1.25, 1), "pt"),
    axis.text=element_text(size=rel(.75)),
    axis.text.x=element_text(
      hjust=0.5, vjust=1,
      margin=margin(
        t=scale_add(base_size, 0.25, margin_add),
        r=scale_add(base_size, 0.25, margin_add), b=scale_add(base_size, 0.125),
        l=scale_add(base_size, 0.25, margin_add), unit="pt"
      )
    ),
    axis.text.x.top=element_text(
      vjust=0, margin=margin(
        t=scale_add(base_size, 0.125),
        r=scale_add(base_size, 0.25, margin_add),
        b=scale_add(base_size, 0.25, margin_add),
        l=scale_add(base_size, 0.25, margin_add), unit="pt"
      )
    ),
    axis.text.y=element_text(hjust=1, margin=margin(
      t=scale_add(base_size, 0.25, margin_add),
      r=scale_add(base_size, 0.25, margin_add),
      b=scale_add(base_size, 0.25, margin_add),
      l=scale_add(base_size, 0.125), unit="pt"
    )),
    axis.text.y.right=element_text(
      hjust=0, margin=margin(
        t=scale_add(base_size, 0.25, margin_add),
        r=scale_add(base_size, 0.125),
        b=scale_add(base_size, 0.25, margin_add),
        l=scale_add(base_size, 0.25, margin_add), unit="pt"
      )
    ),
    axis.title=element_text(face="bold", size=rel(0.875)),
    axis.title.x=element_text(
      vjust=0.5, hjust=0.5,
      margin=margin(
        t=scale_add(base_size, 0.4, margin_add / 2), r=scale_add(base_size, 0),
        b=scale_add(base_size, 0), l=scale_add(base_size, 0), unit="pt"
      )
    ),
    axis.title.x.top=element_text(
      margin=margin(
        t=scale_add(base_size, 0), r=scale_add(base_size, 0),
        b=scale_add(base_size, 0.4, margin_add / 2),
        l=scale_add(base_size, 0), unit="pt"
      )
    ),
    axis.title.y=element_text(
      angle=90, vjust=0.5, hjust=0,
      margin=margin(
        t=scale_add(base_size, 0), r=scale_add(base_size, 0.4, margin_add / 2),
        b=scale_add(base_size, 0), l=scale_add(base_size, 0), unit="pt"
      )
    ),
    axis.title.y.right=element_text(
      hjust=1, vjust=0.5, angle=270,
      margin=margin(
        t=scale_add(base_size, 0), r=scale_add(base_size, 0),
        b=scale_add(base_size, 0),
        l=scale_add(base_size, 0.4, margin_add / 2), unit="pt"
      )
    ),
    legend.background=element_blank(),
    legend.key=element_blank(),
    legend.key.size=grid::unit(scale_add(base_size, 1.25), "pt"),
    legend.key.height=NULL,
    legend.key.width=NULL,
    legend.text=element_text(size=rel(0.5)),
    legend.text.align=0.5,
    legend.title=element_text(face="plain", size=rel(0.7)),
    legend.title.align=0.5,
    legend.position="bottom",
    legend.direction="horizontal",
    legend.justification="center",
    legend.box="horizontal",
    legend.box.just="center",
    legend.box.background=element_rect(
      colour=black, size=rel(0.25), fill="transparent"
    ),
    legend.box.margin=margin(
      t=scale_add(base_size, 0.125), r=scale_add(base_size, 0.125),
      b=scale_add(base_size, 0.125), l=scale_add(base_size, 0.125), unit="pt"
    ),
    legend.box.spacing=grid::unit(scale_add(base_size, 1 / 3, margin_add / 2), "pt"),
    legend.margin=margin(
      t=scale_add(base_size, 0.125), r=scale_add(base_size, 1 / 3),
      b=scale_add(base_size, 0.125), l=scale_add(base_size, 1 / 3), unit="pt"
    ),
    legend.spacing=grid::unit(scale_add(base_size, 0.125, margin_add), "pt"),
    legend.spacing.x=NULL,
    legend.spacing.y=NULL,
    panel.background=element_blank(),
    panel.border=element_rect(size=rel(0.9), colour=light_gray),
    panel.grid=element_blank(),
    panel.grid.major=element_blank(),
    panel.grid.minor=element_blank(),
    panel.grid.major.y=NULL,
    panel.grid.minor.y=NULL,
    panel.grid.major.x=NULL,
    panel.grid.minor.x=NULL,
    panel.ontop=FALSE,
    panel.spacing=grid::unit(scale_add(base_size, 0.25, margin_add), "pt"),
    panel.spacing.x=NULL,
    panel.spacing.y=NULL,
    strip.background=element_rect(colour=gray(.94), size=rel(0.5), fill=light_gray),
    strip.text=element_text(size=rel(0.7), face="bold"),
    strip.text.x=element_text(
      hjust=0.5, vjust=0.5,
      margin=margin(
        t=scale_add(base_size, 0.25), r=scale_add(base_size, 0.125),
        b=scale_add(base_size, 0.25), l=scale_add(base_size, 0.125), unit="pt"
      )
    ),
    strip.text.y=element_text(
      vjust=0.5, hjust=0.5, angle=270,
      margin=margin(
        t=scale_add(base_size, 0.125), r=scale_add(base_size, 0.25),
        b=scale_add(base_size, 0.125), l=scale_add(base_size, 0.25), unit="pt"
      )
    ),
    strip.placement="outside",
    strip.placement.x=NULL,
    strip.placement.y=NULL,
    strip.switch.pad.grid=grid::unit(scale_add(base_size, 0.25, margin_add), "pt"),
    strip.switch.pad.wrap=grid::unit(scale_add(base_size, 0.25, margin_add), "pt"),
    plot.background=element_blank(),
    plot.title=element_text(
      face="bold", hjust=0,
      margin=margin(
        t=scale_add(base_size, 0), r=scale_add(base_size, 0),
        b=scale_add(base_size, 1 / 3, margin_add / 1.5),
        l=scale_add(base_size, 0), unit="pt"
      )
    ),
    plot.tag=element_text(face="bold"),
    plot.tag.position="topleft",
    plot.subtitle=element_text(
      hjust=0, face="plain", size=rel(0.9),
      margin=margin(
        t=scale_add(base_size, 0), r=scale_add(base_size, 0),
        b=scale_add(base_size, 1 / 3, margin_add),
        l=scale_add(base_size, 0), unit="pt"
      )
    ),
    plot.caption=element_text(
      hjust=0.5, size=rel(0.75), face="italic",
      margin=margin(
        t=scale_add(base_size, 0.5, margin_add), r=scale_add(base_size, 0.75),
        b=scale_add(base_size, 0.125), l=scale_add(base_size, 0.75), unit="pt"
      )
    ),
    plot.margin=margin(
      t=scale_add(base_size, 1 / 7), r=scale_add(base_size, 1 / 7),
      b=scale_add(base_size, 1 / 7), l=scale_add(base_size, 1 / 7), unit="pt"
    ),
    complete=TRUE
  )
}

#' Setup defaults for specific geoms
#'
#' @inheritParams theme_mejr
#' @param gray gray color value (0-255)
#' @param lty linetype
#' @param lwd linewidth
#' @param cex point size
#' @param stroke stroke width
#' @param alpha alpha
#' @param pch point shape
#' @param txt text size
#' @param reset reset all back to default
#'
#' @return NULL
#' @export
#'
#' @examples
#' # This will change the point size and shape for
#' #  all geoms in which GeomPoint inherits from.
#' mejr_geom_defaults(cex = 1.1, pch = 19)
#'
#' # Reset defaults back to their original state.
#' mejr_geom_defaults(reset=TRUE)
mejr_geom_defaults <- function(base_size=11, black=51, gray=214, lty=3, lwd=base_size /
                                 20,
                               cex=base_size / 9, stroke=base_size * .05, alpha=0.5,
                               pch=21, txt=base_size / 4, reset=FALSE) {
  gray <- gray2(gray)
  black <- gray2(black)

  updates <- list(
    text=list(geoms="text", opts=list(size=txt, colour=black)),
    lines=list(geoms=c(
      "line", "hline", "vline", "linerange", "errorbar",
      "errorbarh"
    ), opts=list(size=lwd, colour=black)),
    ablines=list(
      geoms=c("hline", "vline", "abline"),
      opts=list(size=lwd, colour=gray, linetype=lty)
    ),
    bar=list(geoms="bar", opts=list(size=lwd, colour=NA)),
    smooth=list(geoms="smooth", opts=list(
      size=lwd, colour=black, fill=gray
    )),
    point=list(geoms="point", opts=list(
      size=cex, colour=black, shape=pch,
      stroke=stroke, fill=NA, alpha=alpha
    ))
  )

  gg_defaults <- getOption("ggdistribute.geom.defaults")
  gg_edited <- getOption("ggdistribute.geom.edits")

  on.exit({
    options(ggdistribute.geom.defaults=gg_defaults)
    options(ggdistribute.geom.edits=gg_edited)
  })

  for (u in seq_along(updates)) {
    geoms <- updates[[u]]$geoms
    changes <- updates[[u]]$opts

    for (g in geoms) {
      if (length(gg_defaults[[g]]) < 1) {
        gg_defaults[[g]] <- geom_defaults(g)
      }
      if (reset) {
        update_geom_defaults(g, gg_defaults[[g]])
      } else {
        gg_defaults$edited <- TRUE
        gg_edited[[g]] <- changes
        update_geom_defaults(g, changes)
      }
    }
  }

  invisible()
}


geom_defaults <- function(geom) {
  if (is.character(geom)) {
    g <- find_subclass("Geom", geom, parent.frame())
  } else {
    if (inherits(geom, "Geom")) {
      g <- geom
    } else {
      stop("`geom` must be a string (like \"point\")",
        " or a Geom object (like GeomPoint).",
        call.=FALSE)
    }
  }
  unclass(g$default_aes)
}


#' Test theme by printing plots to pdf and viewport
#'
#' @param w pdf width (inches)
#' @param h pdf height (inches)
#' @param eplot list of options for `example_plot`
#' @param mejr list of options for `theme_mejr(...)`
#' @param gg further theme customization with ggplot::theme(...)
#' @param print show the `eplot` plot
#' @param with_test_theme also print the same plot using `ggplot2::theme_test`
#' @param dir directory where to save temp pdf files, such as tempdir()
#' @return NULL
test_mejr_theme <- function(w=6.875, h=4.5, eplot=list(), mejr=list(), gg=theme(),
                            print=TRUE, with_test_theme=FALSE, dir) {
  if (length(eplot) < 1) {
    eplot <- list()
  }

  if (length(mejr) < 1) {
    mejr <- list()
  }

  cat(dir)

  if (with_test_theme) {
    test_theme_args <- list(base_size=11, debug=FALSE)
    test_theme_args <- modifyList(
      test_theme_args, Filter(Negate(is.null), mejr[c("base_size", "debug")]),
      keep.null=TRUE
    )

    mejr_geom_defaults(reset=TRUE)
    theme_set(do.call("theme_test", list()))

    ggsave(
      filename=normalizePath(file.path(dir, "theme_test.pdf"), mustWork=F),
      example_plot() + do.call("theme_test", test_theme_args) + gg, width=w,
      height=h, device="pdf"
    )
  }

  theme_set(theme_mejr())

  p_mejr1 <- example_plot() + do.call(theme_mejr, mejr) + gg
  p_mejr2 <- do.call(example_plot, eplot) + do.call(theme_mejr, mejr) + gg

  ggsave(
    filename=normalizePath(file.path(dir, "theme_mejr1.pdf"), mustWork=FALSE),
    p_mejr1, width=w, height=h, device="pdf"
  )

  ggsave(
    filename=normalizePath(file.path(dir, "theme_mejr2.pdf"), mustWork=FALSE),
    p_mejr2, width=w, height=h, device="pdf"
  )

  if (print) {
    grid::grid.draw(p_mejr2)
  }

  invisible()
}


#' Write text to one of four corners of a plot
#'
#' @details If multiple panels, will write to all panels.
#'
#' @param text character string
#' @param pos character of `"tl"`, `"tr"`, `"bl"`, `"br"` to
#' indicate position (you may also use the full names, `"bottomleft"`, etc...)
#' @param ... additional options passed to [ggplot2::geom_label]
#' @param geom "text" or "label" geoms
#'
#' @return ggplot layer
#' @export
#'
#' @examples
#' posterior_plot() + annotate_corner("Hi.", "bottomright")
annotate_corner <- function(text, pos="tl", geom=c("text", "label"), ...) {
  x <- -Inf
  y <- Inf
  h <- 0
  v <- 1

  switch(tolower(pos), topleft= , tl={
    x <- -Inf
    y <- Inf
    h <- 0
    v <- 1
  }, topright= , tr={
    x <- Inf
    y <- Inf
    h <- 1
    v <- 1
  }, bottomleft= , bl={
    x <- -Inf
    y <- -Inf
    h <- 0
    v <- 0
  }, bottomright= ,
  br={
    x <- Inf
    y <- -Inf
    h <- 1
    v <- 0
  }, stop("incorrect position"))

  annotate(match.arg(geom), x, y, label=text, hjust=h, vjust=v, ...)
}


#' Add labels to existing plot
#'
#' Uses a normalized coordinate system to add text anywhere on the current plot.
#'
#' @param labels character vector of labels to use
#' @param x horz positions of items in `labels`
#' @param y vert positions of items in `labels`
#' @param g list of options passed to [grid::gpar]
#' @param ... optional args passed to [grid::grid.text]
#'
#' @return NULL. prints to current graphics device.
#' @export
#' @seealso [grid::grid.text], [grid::gpar]
#' @examples
#' example_plot()
#' label_plot(c('a label', 'another one'), c(.1, .9), c(.95, .1))
#'
#' # use extra options from grid::grid.text
#' label_plot('last one', 0.5, 0.5, just='center')
label_plot <- function(labels, x, y, g=list(fontsize=14, fontface="bold"), ...) {
  l <- length(labels)
  if (!all(unlist(lapply(list(labels, x, y), length)) == l)) {
    stop("make sure length of labels, x, y are equal")
  }
  for (i in seq_len(l)) {
    grid::grid.text(
      label=labels[i], x=unit(x[i], "npc"), y=unit(y[i], "npc"),
      gp=do.call(grid::gpar, g), ...
    )
  }
}
