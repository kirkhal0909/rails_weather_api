# Weather app - REST api

1. копируем .env и прокидываем свои переменные:

   ```bash
   make env
2. REST:\
  http://localhost:3000/health - status: OK\
  \
  http://localhost:3000/weather/current - Текущая температура\
  http://localhost:3000/weather/historical - Почасовая температура за последние 24 часа\
  http://localhost:3000/weather/historical/max - Максимальная темперетура за 24 часа\
  http://localhost:3000/weather/historical/min - Минимальная темперетура за 24 часа\
  http://localhost:3000/weather/historical/avg - Средняя темперетура за 24 часа\
  http://localhost:3000/weather/by_time?timestamp=1621823790 - Найти ближайшую температуру к переданному timestamp (например 1621823790 должен отдать температуру за 2021-05-24 08:00. Из имеющихся данных, если такого времени нет вернуть 404)
