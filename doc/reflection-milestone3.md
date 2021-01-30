# Reflection
## Implementation of the dashboard:
By developing our initial idea and proposal, our team has completed a dashboard including 4 plots corresponding to the relationship among location, family history, workplace benefits, gender, whether an individual sought help. The dashboard is pretty close to our beginning sketch and has reached most of the functionalities we proposed in milestone1.

According to the feedback from TA, we finally have chosen to use a proportion of the population to represent Y-axis instead of the count, since the proportion is more straightforward for users to have a sense of the distribution. We achieved this by manipulating the pandas dataframe and calculated the proportion before plotting.

The left panel contains two filters that users can choose to filter by location or/and filter by date. The location filter affects the first bar plot in the top left and users can choose the countries that they want to see. For example, they can filter the USA, Canada, the UK, France, etc. By changing the date, all the 4 plots will only include the corresponding input date range. Hence, users can fix a certain period that they are extremely interested in. The user can also filter the plots for a particular gender by clicking on the corresponding gender on the legend.

In the right panel, there are 4 bar plots to represent the proportion of the population based on country, family history, workplace benefits, whether an individual sought help, separately. All the plots are divided by gender using facets as well.

## Issues Encountered and Improvements made from previous Implementation:
- One of the big hurdles we encountered early on was with the rendering of the dashboard. The dashboard rendered aesthetically as expected on Apple devices but failed on other operating systems. After rigorous debugging, we concluded that it was an issue with wrapping the content with dbcContainer.

- We updated our plot axis titles to "percent of participants" in order to more appropriately fit the plots.

- We have also rigorously re-analyzed the dataset to gain a deeper understanding of the data. This new gained insights along with inputs from the TA, we have revised the research questions and user scenario.

## Future improvements and additions for the dashboard:
There are still a few points our team may cover and enhance in the next milestone/implementation.

- After re-understanding the raw data, our team found the field work_interfere hints us whether an individual has a mental illness or not. work_interfere includes levels, 'Often', 'Rarely', 'Never', 'Sometimes', and nan. Anyone who said 'Often' or 'Rarely' means they have some sort of mental illness. By adding work_interfere in the processed data, our dashboard can reveal useful information such as which country might have the highest possibility to encounter mental illness problem for living in 2014, do female have a higher chance to face much working pressure leading to mental illnesses compared with a male, etc.

- Improve the user experience of the dashboard, and use more meaningful colour to interpret the processed data in the dashboard.

- From our analysis, the USA and Canada has a considerable amount of examples in the dataset. It would be beneficial to further breakdown our plots by state in the USA or by province in Canada to gain useful insights.
