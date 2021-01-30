# Reflection
## Implementation of the dashboard:

By developing from our initial idea and proposal, our team has completed a dashboard including 4 plots corresponding to the relationship among location, family history, workplace benefits, gender, and whether an individual sought help. The dashboard is pretty close to our beginning sketch and has reached most of the functionalities we proposed in milestone1.

According to the feedback from TA, we made a choice to represent count data by proportion of participants. We achieved this by manipulating the pandas dataframe and calculated the proportion before plotting.

In the left panel, the users have the ability to filter the data by either country or date. All filters will directly affect the 4 plots produced on the right. By choosing a country, the plot will only show the data that is restricted to that particular country. By changing the dates, all 4 plots will only include the data with the corresponding input date range. Hence, users can fix a certain period that they are extremely interested in. The user can also filter the plots for a particular gender by clicking on the corresponding gender on the legend.



## Issues Encountered and Improvements made from previous Implementation:

- One of the big hurdles we encountered early on was with the rendering of the dashboard. The dashboard rendered aesthetically as expected on Apple devices but failed on other operating systems. After rigorous debugging, we concluded that it was an issue with wrapping the content with dbcContainer.

- We updated our plot axis titles to "percent of participants" in order to more appropriately fit the plots.

- We have also rigorously re-analyzed the dataset to gain a deeper understanding of the data. This new gained insights along with inputs from the TA, we have revised the research questions and user scenario.

- One group member noticed that on a big screen, there will be a lot of space between the plots and the widgets on the left. We are currently looking into this issue and will have plans to solve it in the future.

## Future improvements and additions for the dashboard:

There are still a few points our team may cover and enhance in the next milestone/implementation.

- After re-understanding the raw data, our team found the field work_interfere hints us whether an individual has a mental illness or not. work_interfere includes levels, 'Often', 'Rarely', 'Never', 'Sometimes', and nan. By adding work_interfere in the processed data, our dashboard can reveal useful information such as which country might have the highest possibility to encounter mental illness problem or stress for living in 2014 and do female have a higher chance to face much working pressure leading to mental illnesses compared with a male, etc.

- Improve the user experience of the dashboard, and use more meaningful colour to interpret the processed data in the dashboard.

- From our analysis, the USA and Canada has a considerable amount of examples in the dataset. It would be beneficial to further breakdown our plots by state in the USA or by province in Canada to gain useful insights.

- Fix the large white space between plots and widgets when viewing with a big screen.
