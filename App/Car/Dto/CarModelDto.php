<?php
declare(strict_types=1);

namespace App\Car\Dto;

use DateTime;
use JetBrains\PhpStorm\Immutable;

#[Immutable]
final readonly class CarModelDto
{
    public readonly int $id;
    public readonly CarBrandDto $brand;
    public readonly string $model;
    public readonly string $bodyType;
    public readonly string $imageUrl;
    public readonly DateTime|null $manufactureBeginDate;
    public readonly DateTime|null $manufactureEndDate;

    public function __construct(int $id, CarBrandDto $brand, string $model, string $bodyType, string $imageUrl,
                                ?DateTime $manufactureBeginDate, ?DateTime $manufactureEndDate)
    {
        $this->id = $id;
        $this->brand = $brand;
        $this->model = $model;
        $this->bodyType = $bodyType;
        $this->imageUrl = $imageUrl;
        $this->manufactureBeginDate = $manufactureBeginDate;
        $this->manufactureEndDate = $manufactureEndDate;
    }
}