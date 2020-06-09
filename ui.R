nba=read.csv("all_seasons.csv")
vars <- setdiff(names(nba), "Species")

pageWithSidebar(
  headerPanel('NBA Data Clustered Using Expectation-Maximization Algorithm'),
  sidebarPanel(
    selectInput('xvar', 'X Variable', vars),
    selectInput('yvar', 'Y Variable', vars, selected = vars[[2]]),
    numericInput('clusters', 'Cluster count', 4, min = 1, max = 12)
  ),
  mainPanel(
    plotOutput('plot1'),
    h1("Descriptive Stats"),
    h2("The means for the Clusters are:"),
    textOutput("descrip"),
    h2("The sigmas for the Clusters are:"),
    textOutput("descrip1")
  )
)
