<?php
declare(strict_types=1);

namespace App\Car\Repository;

use DateTime;
use PDO;
use App\Car\Dto\CarModelDto;
use App\Car\Dto\CarBrandDto;
use App\Car\Dto\CarServiceDto;
use App\Car\Dto\CarServicePriceDto;

class CarModelRepository
{
    private mixed $connection;

    public function __construct(string $db_host, string $db_user, string $db_pass, string $db_name) {
        $dsn = "mysql:host=$db_host;dbname=$db_name;charset=UTF8";
        $this->connection = new PDO($dsn, $db_user, $db_pass, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    }

    /**
     * @throws \Exception
     */
    public function getActualModelsServices(float $priceLimit) : array {
        $queryActualModelsServices = "SELECT
                        car_brand.id AS brand_id, car_brand.name AS brand_name, 
                        car_model.id as model_id, car_model.brand_id, car_model.model, 
                        car_model.body_type, car_model.image_url, 
                        car_model.manufacture_begin_date, car_model.manufacture_end_date,
                        car_service.id as service_id, car_service.service, 
                        car_service_price.id as price_id, car_service_price.price, car_service_price.duration_hour
                    FROM
                        car_service_price
                            JOIN
                        car_service ON car_service_price.service_id = car_service.id
                            JOIN
                        car_model ON car_service_price.model_id = car_model.id
                            JOIN
                        car_brand ON car_model.brand_id = car_brand.id
                    WHERE
                      car_service_price.price > :price_limit
                      AND car_model.manufacture_end_date IS NULL";

        $stmt = $this->connection->prepare($queryActualModelsServices);
        $stmt->execute(['price_limit' => $priceLimit]);
        $modelServices = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $resultModelServices = [];
        foreach ($modelServices as $modelService) {
            $modelManufactureBeginDate = is_null($modelService['manufacture_begin_date']) ?
                null: new DateTime($modelService['manufacture_begin_date']);
            $modelManufactureEndDate = is_null($modelService['manufacture_end_date']) ?
                null : new DateTime($modelService['manufacture_end_date']);

            $resultModelServices[] = new CarServicePriceDto(
                $modelService['price_id'],
                new CarModelDto(
                    $modelService['model_id'],
                    new CarBrandDto($modelService['brand_id'], $modelService['brand_name']),
                    $modelService['model'],
                    $modelService['body_type'],
                    $modelService['image_url'],
                    $modelManufactureBeginDate,
                    $modelManufactureEndDate
                ),
                new CarServiceDto($modelService['service_id'], $modelService['service']),
                $modelService['price'],
                $modelService['duration_hour'],
            );
        }
        return $resultModelServices;
    }

    /**
     * @throws \Exception
     */
    public function getOutdatedModels(string $date): array {
        $queryOutdatedModels = "SELECT
                                    car_brand.id AS brand_id, car_brand.name AS brand_name, 
                                    car_model.id, car_model.brand_id, car_model.model, 
                                    car_model.body_type, car_model.image_url, 
                                    car_model.manufacture_begin_date, car_model.manufacture_end_date
                                FROM
                                    car_model
                                JOIN
                                    car_brand ON car_model.brand_id = car_brand.id
                                WHERE
                                    manufacture_end_date <= DATE(:limit_date)";

        $stmt = $this->connection->prepare($queryOutdatedModels);
        $stmt->execute(['limit_date' => $date]);
        $outdatedModels = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $resultOutdatedModels = [];

        foreach ($outdatedModels as $outdatedModel) {
            $manufactureBeginDate = is_null($outdatedModel['manufacture_begin_date']) ?
                null: new DateTime($outdatedModel['manufacture_begin_date']);
            $manufactureEndDate = is_null($outdatedModel['manufacture_end_date']) ?
                null : new DateTime($outdatedModel['manufacture_end_date']);

            $resultOutdatedModels[] = new CarModelDto(
                $outdatedModel['id'],
                new CarBrandDto($outdatedModel['brand_id'], $outdatedModel['brand_name']),
                $outdatedModel['model'],
                $outdatedModel['body_type'],
                $outdatedModel['image_url'],
                $manufactureBeginDate,
                $manufactureEndDate
            );
        }

        return $resultOutdatedModels;
    }

    public function closeConnection() : void {
        $this->connection = null;
    }

}