<?php
declare(strict_types=1);

namespace App\Car\Dto;

use JetBrains\PhpStorm\Immutable;

#[Immutable]
final class CarServicePriceDto
{
    public readonly int $id;
    public readonly CarModelDto $carModel;
    public readonly CarServiceDto $carService;
    public readonly float $price;
    public readonly float $durationHour;
    public function __construct(int $id, CarModelDto $carModel, CarServiceDto $carService, float $price, float $durationHour) {
        $this->id = $id;
        $this->carModel = $carModel;
        $this->carService = $carService;
        $this->price = $price;
        $this->durationHour = $durationHour;
    }

    public function toJson(): string {
        return json_encode([
            'id' => $this->id,
            'carModel' => $this->carModel,
            'carService' => $this->carService,
            'price' => $this->price,
            'durationHour' => $this->durationHour,
        ]);
    }
}