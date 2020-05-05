#' HomeRun_2017 data
#'
#' @docType data
#'
#' @details This data measures variables for all home runs hit in the 2017 Major League baseball season.
#'
#'
#' @usage data(HomeRun_2017)
#'
#' @format The variables are
#'
#' - `Date`: Date the home run was hit.
#' - `Hitter`: The name of the player who hit the home run.
#' - `HitterTeam`: The team of the player who hit the home run.
#' - `Pitcher`: The name of the pitcher who gave up the home run.
#' - `PitcherTeam`: The team of the pitcher who gave up the home run.
#' - `Inning`: The inning the home run was hit.
#' - `Ballpark`: The name of the baseball park where the home run was hit.
#' - `Distance`: Distance the home run traveled (measured in feet)
#' - `SpeedOffBat`: Speed of the ball, in miles per hour, when the ball left the bat.
#' - `ElevAngle`: Launch angle of the ball.
#' - `HorizAngle`: The initial direction of the ball as it left the bat in degrees, where 45 degrees is straight down the right field line, 90 degrees is straight over second base and 135 degrees is straight down the left field line.
#' - `Type`: The type of home run.  JE: Just enough - home run barely cleared the fence by less than 10 vertical feet, OR that it landed less than one fence height past the fence.  ND: No doubt- which means the ball cleared the fence by at least 20 vertical feet AND landed at least 50 feet past the fence. ITP: Inside the park home run. Ball did not travel over the outfield fence. PL: Plenty (all the rest)

#'
#' @keywords datasets
#'
#' @source baseballsavant.mlb.com
#'
"HomeRun_2017"
