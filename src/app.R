library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(dashBootstrapComponents)
library(ggplot2)
library(tidyverse)
library(GGally)
library(plotly)

m_data <- read_csv("data/processed/processed_survey.csv")

app <- Dash$new(external_stylesheets = dbcThemes$BOOTSTRAP)
all_countries <- unique(m_data$Country)
some_countries <- unique(m_data$Country)[1:5]
m_data$Timestamp <- as.Date(m_data$Timestamp, format= "%Y-%m-%d")
sdate <- min(m_data$Timestamp)
edate <- max(m_data$Timestamp)


SIDEBAR_STYLE <- list(
  "position"= "fixed",
  "top"= 0,
  "left"= 0,
  "bottom"= 0,
  "width"= "15rem",
  "padding"= "2rem 1rem",
  "background-color"= "#15599e",
  "color"= "white"
)


sidebar <- htmlDiv(list(
    htmlH5("Tech Worker Mental Health Tracker"),
    htmlHr(),
    htmlP(
      "Filter By: ", className="lead"
    ), htmlDiv(list(
      htmlLabel(list('Countries: ', dccDropdown(id = 'country_wid' , value = some_countries,
                                                options = all_countries %>% purrr::map(function(col) list(label = col, value = col)),
                                                multi = TRUE, style = list('color'= 'black'
                                                                           )))
    ),htmlHr(),
    htmlLabel(list('Dates:',dccDatePickerRange(
      id='date_range', start_date = sdate, end_date= edate, style = list('display' = "inline-block")
    )))))), style=SIDEBAR_STYLE)



CONTENT_STYLE <- list("margin-left" = "18rem","margin-right" = "2rem","padding" = "2rem 1rem")

content <- htmlDiv(list(dbcRow(list(dbcCol(dccGraph(id = 'country_bar', style= list(
                                        'border-width' = '0'))),
                                    dbcCol(dccGraph(id = 'fam_hist', style= list(
                                      'border-width' = '0'))))),
                        htmlBr(),
                        dbcRow(list(dbcCol(dccGraph(id = 'sought_help', style= list(
                                      'border-width' = '0'))),
                                    dbcCol(dccGraph(id = 'benefits', style= list(
                                      'border-width' = '0')))))), style = CONTENT_STYLE)


app$layout(htmlDiv(list(sidebar, content)))

app$callback(
  output('country_bar', 'figure'),
  list(input('country_wid', 'value'),
       input('date_range', 'start_date'),
       input('date_range', 'end_date')),
  function(countries, start_date, end_date) {
    data <- m_data %>% filter(Country %in% countries) %>%
      filter(Timestamp >= start_date & Timestamp <= end_date) %>%
      group_by(Country, seek_help) %>% summarise(sum_prop = sum(prop)) %>% arrange(desc(sum_prop))
    
    
    plot <- ggplot(data, aes(x=reorder(Country, -sum_prop), y= sum_prop, fill=seek_help)) + 
      geom_bar(stat = "identity") + 
      ggtitle("Location of Respondent and \n Whether They Sought Help") +
      xlab("Country") +
      ylab("Percentage of Participants") + theme(axis.text.x = element_text(angle = 90),
                                                 plot.title = element_text(size = 10,
                                                                           face = "bold",
                                                                           hjust=0.5),
                                                 legend.title = element_text(size=7)) +
      labs(fill = "Sought help")
    ggplotly(plot, tooltip = 'sum_prop')
  }
)


app$callback(
  output('fam_hist', 'figure'),
  list(input('country_wid', 'value'),
       input('date_range', 'start_date'),
       input('date_range', 'end_date')),
  function(countries, start_date, end_date) {
    data <- m_data %>% filter(Country %in% countries) %>%
      filter(Timestamp >= start_date & Timestamp <= end_date) %>%
      group_by(family_history, Gender) %>% summarise(sum_prop = sum(prop)) %>% arrange(desc(sum_prop))
    
    plot <- ggplot(data, aes(x=family_history, y=sum_prop, fill= Gender)) + 
      geom_bar(stat = "identity", position=position_dodge()) + 
      ggtitle("Family history of Mental Illness vs Gender") +
      xlab("Whether Family Has History of Mental Illness") +
      ylab("Percentage of Participants") + theme(axis.text.x = element_text(angle = 90),
                                                   plot.title = element_text(size = 10,
                                                                             face = "bold",
                                                                             hjust=0.5),
                                                   legend.title = element_text(size=9))
    ggplotly(plot, tooltip = 'sum_prop')
  }
)

app$callback(
  output('sought_help', 'figure'),
  list(input('country_wid', 'value'),
       input('date_range', 'start_date'),
       input('date_range', 'end_date')),
  function(countries, start_date, end_date) {
    data <- m_data %>% filter(Country %in% countries) %>%
      filter(Timestamp >= start_date & Timestamp <= end_date) %>%
      group_by(seek_help, Gender) %>% summarise(sum_prop = sum(prop)) %>% arrange(desc(sum_prop))
    
    plot <- ggplot(data, aes(x=seek_help, y=sum_prop, fill = Gender)) + 
      geom_bar(stat = "identity", position=position_dodge()) + 
      ggtitle("Sought Help vs Gender") +
      xlab("Sought Help or Not") +
      ylab("Percentage of Participants") + theme(axis.text.x = element_text(angle = 90),
                                                 plot.title = element_text(size = 10,
                                                                           face = "bold",
                                                                           hjust=0.5),
                                                 legend.title = element_text(size=8))
    ggplotly(plot, tooltip = 'sum_prop')
  }
)



app$callback(
  output('benefits', 'figure'),
  list(input('country_wid', 'value'),
       input('date_range', 'start_date'),
       input('date_range', 'end_date')),
  function(countries, start_date, end_date) {
    data <- m_data %>% filter(Country %in% countries) %>%
      filter(Timestamp >= start_date & Timestamp <= end_date) %>%
      group_by(benefits, Gender) %>% summarise(sum_prop = sum(prop)) %>% arrange(desc(sum_prop))
    
      plot <- ggplot(data, aes(x=benefits, y=sum_prop, fill = Gender)) + 
      geom_bar(stat = "identity", position=position_dodge()) + 
      ggtitle("Workplace Benefits vs Gender") +
      xlab("Does Company Provide Benefits") +
      ylab("Percentage of Participants") + theme(axis.text.x = element_text(angle = 90),
                                                 plot.title = element_text(size = 10,
                                                                           face = "bold",
                                                                           hjust=0.5),
                                                 legend.title = element_text(size=8))
    ggplotly(plot, tooltip = 'sum_prop')
  }
)




app$run_server(debug = T)