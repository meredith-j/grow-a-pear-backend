-- CreateTable
CREATE TABLE `UserEmails` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userEmail` VARCHAR(191) NOT NULL,
    `zoneId` INTEGER NOT NULL,
    `plantId` INTEGER NOT NULL,
    `reviewId` INTEGER NOT NULL,

    UNIQUE INDEX `UserEmails_userEmail_key`(`userEmail`),
    UNIQUE INDEX `UserEmails_zoneId_key`(`zoneId`),
    UNIQUE INDEX `UserEmails_plantId_key`(`plantId`),
    UNIQUE INDEX `UserEmails_reviewId_key`(`reviewId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `UserEmails` ADD CONSTRAINT `UserEmails_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zones`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserEmails` ADD CONSTRAINT `UserEmails_plantId_fkey` FOREIGN KEY (`plantId`) REFERENCES `Plants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserEmails` ADD CONSTRAINT `UserEmails_reviewId_fkey` FOREIGN KEY (`reviewId`) REFERENCES `PlantReview`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
