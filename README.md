# Задание №1 (БД)
Есть БД автосервиса (MySQL)
В этой БД следующие основные таблицы:
1. Таблица марок автомобилей. (Например, Audi, BMW, Volvo,
   ВАЗ)
2. Таблица моделей автомобилей. Которая включает в себя
   a. Модель автомобиля (например BMW X3)
   b. Даты начала и окончания производства
   c. Тип кузова (хэтчбек, легковой, джип)
   d. Изображение модели (ссылка на файл)
3. Таблица стоимости работ для автомобилей. Должна
   наименование работы, стоимость и время выполнения работ.
   включать
   Например: замена тормозных колодок передних, 500 рублей, 0.5 часа

База и таблицы в ней должны быть связаны между собой так, чтобы вы могли
получить следующие данные:

1. Список автомобилей, снятые с производства на сентябрь 2010 года. В
   формате Марка, Модель, Дата снятия с производства.

```sql
SELECT
car_brand.name, car_model.model, car_model.manufacture_end_date
FROM
car_model
JOIN
car_brand ON car_model.brand_id = car_brand.id
WHERE
manufacture_end_date <= DATE('2010-09-30')
```
2. Список автомобилей и работ, которые не сняты с производства на
   текущий момент, где стоимость выше 1000 рублей. В формате Марка,
   Модель, Наименование работ, Стоимость работ.
   Нужно предоставить SQL бэкап этих данных, и запросы - чтобы мы
   могли все проверить.
```sql
SELECT
    car_brand.name, car_model.model, car_service.service, car_service_price.price
FROM
    car_service_price
        JOIN
    car_service ON car_service_price.service_id = car_service.id
        JOIN
    car_model ON car_service_price.model_id = car_model.id
        JOIN
    car_brand ON car_model.brand_id = car_brand.id
WHERE
  car_service_price.price > 1000
  AND car_model.manufacture_end_date IS NULL    
```

**Нужно предоставить SQL бэкап этих данных, и запросы - чтобы мы могли все проверить.**

Дамп БД лежит в папке dump/

# Задание №2 (JS + PHP)
1. На PHP с использованием PDO написать класс, чтобы вывести на
   странице данные для запроса 1 и для запроса 2 из пред. задания

```php
require_once __DIR__.'/vendor/autoload.php';

use App\Car\Controller\CarController;

$carController = new CarController();


var_dump($carController->actualModelsServices(1000));
var_dump($carController->outdatedModels('2010-09-30'));
```