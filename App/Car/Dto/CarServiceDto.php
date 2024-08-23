<?php
declare(strict_types=1);

namespace App\Car\Dto;
use JetBrains\PhpStorm\Immutable;

#[Immutable]
final class CarServiceDto
{
    public readonly int  $id;
    public readonly string $service;

    public function __construct(int $id, string $service) {
        $this->id = $id;
        $this->service = $service;
    }
}