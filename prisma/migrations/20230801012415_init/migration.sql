-- CreateTable
CREATE TABLE `Zones` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `zone` INTEGER NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `notableRegions` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Zones_zone_key`(`zone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `zoneId` INTEGER NOT NULL,
    `gardenXp` INTEGER NOT NULL,

    UNIQUE INDEX `Users_email_key`(`email`),
    UNIQUE INDEX `Users_zoneId_key`(`zoneId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Plants` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `plantName` VARCHAR(191) NOT NULL,
    `apiId` VARCHAR(191) NOT NULL,
    `isHard` BOOLEAN NOT NULL,
    `count` INTEGER NOT NULL,
    `zoneId` INTEGER NOT NULL,

    UNIQUE INDEX `Plants_zoneId_key`(`zoneId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PlantReview` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `review` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `userId` INTEGER NOT NULL,
    `plantId` INTEGER NOT NULL,

    UNIQUE INDEX `PlantReview_userId_key`(`userId`),
    UNIQUE INDEX `PlantReview_plantId_key`(`plantId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Gardens` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `listName` VARCHAR(191) NOT NULL,
    `userId` INTEGER NOT NULL,
    `zoneId` INTEGER NOT NULL,

    UNIQUE INDEX `Gardens_userId_key`(`userId`),
    UNIQUE INDEX `Gardens_zoneId_key`(`zoneId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GardenPlants` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `plantId` INTEGER NOT NULL,
    `zoneId` INTEGER NOT NULL,
    `gardensId` INTEGER NULL,

    UNIQUE INDEX `GardenPlants_plantId_key`(`plantId`),
    UNIQUE INDEX `GardenPlants_zoneId_key`(`zoneId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Keywords` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `keyword` INTEGER NOT NULL,

    UNIQUE INDEX `Keywords_keyword_key`(`keyword`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ZoneKeywords` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `zoneId` INTEGER NOT NULL,
    `keywordId` INTEGER NOT NULL,

    UNIQUE INDEX `ZoneKeywords_zoneId_key`(`zoneId`),
    UNIQUE INDEX `ZoneKeywords_keywordId_key`(`keywordId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zones`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Plants` ADD CONSTRAINT `Plants_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zones`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PlantReview` ADD CONSTRAINT `PlantReview_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PlantReview` ADD CONSTRAINT `PlantReview_plantId_fkey` FOREIGN KEY (`plantId`) REFERENCES `Plants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Gardens` ADD CONSTRAINT `Gardens_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Gardens` ADD CONSTRAINT `Gardens_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zones`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GardenPlants` ADD CONSTRAINT `GardenPlants_plantId_fkey` FOREIGN KEY (`plantId`) REFERENCES `Plants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GardenPlants` ADD CONSTRAINT `GardenPlants_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zones`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GardenPlants` ADD CONSTRAINT `GardenPlants_gardensId_fkey` FOREIGN KEY (`gardensId`) REFERENCES `Gardens`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ZoneKeywords` ADD CONSTRAINT `ZoneKeywords_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Plants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ZoneKeywords` ADD CONSTRAINT `ZoneKeywords_keywordId_fkey` FOREIGN KEY (`keywordId`) REFERENCES `Keywords`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
