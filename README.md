# Weather app - REST api

1. копируем .env и прокидываем свои переменные:

   ```bash
   make env
2. docker-compose: билдим, создаём миграции и запускаем (rails + postgresql + redis):

   ```bash
   make build
   make db_init
   make up
3. Теперь у нас работает REST:\
  http://localhost:3000/health - status: OK\
  \
  http://localhost:3000/weather/current - Текущая температура\
  http://localhost:3000/weather/historical - Почасовая температура за последние 24 часа\
  http://localhost:3000/weather/historical/max - Максимальная темперетура за 24 часа\
  http://localhost:3000/weather/historical/min - Минимальная темперетура за 24 часа\
  http://localhost:3000/weather/historical/avg - Средняя темперетура за 24 часа\
  http://localhost:3000/weather/by_time?timestamp=1621823790 - Найти ближайшую температуру к переданному timestamp
