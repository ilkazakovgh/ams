<?php
declare(strict_types=1);

namespace App\Car\Controller;

use App\Car\Dto\CarModelDto;
use App\Car\Dto\CarServicePriceDto;
use App\Car\Repository\CarModelRepository;

class CarController
{
    private readonly CarModelRepository $carModelRepository;

    public function __construct() {
        $this->carModelRepository = new CarModelRepository(DATABASE_HOST, DATABASE_USER,
            DATABASE_PASSWORD, DATABASE_NAME);
    }

    /**
     * @throws \Exception
     */
    public function actualModelsServices(float $priceLimit) : string {
        $actualModelsServices = $this->carModelRepository->getActualModelsServices($priceLimit);

        $result = array_map(function(CarServicePriceDto $carServicePriceDto) {
            return [
                'brand' => $carServicePriceDto->carModel->brand->name,
                'model' => $carServicePriceDto->carModel->model,
                'service' => $carServicePriceDto->carService->service,
                'price' => $carServicePriceDto->price,
            ];
        }, $actualModelsServices);

        return json_encode($result, JSON_UNESCAPED_UNICODE);
    }

    /**
     * @throws \Exception
     */
    public function outdatedModels(string $date) : string {
        $outdatedModels = $this->carModelRepository->getOutdatedModels($date);

        $result = array_map(function(CarModelDto $carModelDto) {
            return [
                'brand' => $carModelDto->brand->name,
                'model' => $carModelDto->model,
                'manufacture_end_date' => $carModelDto->manufactureEndDate,
            ];
        }, $outdatedModels);

        return json_encode($result, JSON_UNESCAPED_UNICODE);
    }

}