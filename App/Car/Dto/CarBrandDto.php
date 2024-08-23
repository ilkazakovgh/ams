<?php
declare(strict_types=1);

namespace App\Car\Dto;

use JetBrains\PhpStorm\Immutable;

#[Immutable]
final readonly class CarBrandDto
{
    public readonly int $id;
    public readonly string $name;

    public function __construct(int $id, string $name) {
        $this->id = $id;
        $this->name = $name;
    }
}