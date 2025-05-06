library(dplyr)

Italy_ <- Italy_ %>% rename(Time_Period = `TIME PERIOD`, NPL_Ratio = 3) %>% mutate(Country = "Italy")
France_ <- France_ %>% rename(Time_Period = `TIME PERIOD`, NPL_Ratio = 3) %>% mutate(Country = "France")
Germany_ <- Germany_ %>% rename(Time_Period = `TIME PERIOD`, NPL_Ratio = 3) %>% mutate(Country = "Germany")
Spain_ <- Spain_ %>% rename(Time_Period = `TIME PERIOD`, NPL_Ratio = 3) %>% mutate(Country = "Spain")
EU_av_ <- EU_av_ %>% rename(Time_Period = `TIME PERIOD`, NPL_Ratio = 3) %>% mutate(Country = "EU Avg")

# Uniamo tutti i file
npl_data <- bind_rows(Italy_, France_, Germany_, Spain_, EU_av_)

head(npl_data)



library(ggplot2)

ggplot(npl_data, aes(x = Time_Period, y = NPL_Ratio, color = Country, group = Country)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(title = "NPL Ratio Comparison (2014–2023)",
       subtitle = "Italy vs EU countries – Non-Performing Loans as % of Gross Loans",
       x = "Quarter", y = "NPL Ratio (%)") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold", hjust = 0.5),
    legend.title = element_blank()
  )




# Filtro: solo etichette Q4
q4_labels <- npl_data$Time_Period[grepl("Q4", npl_data$Time_Period)]

ggplot(npl_data, aes(x = Time_Period, y = NPL_Ratio, color = Country, group = Country)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  scale_x_discrete(breaks = q4_labels) +
  labs(title = "NPL Ratio Comparison (2014–2023)",
       subtitle = "Italy vs EU countries – Non-Performing Loans as % of Gross Loans",
       x = "Quarter", y = "NPL Ratio (%)") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold", hjust = 0.5),
    legend.title = element_blank()
  )






