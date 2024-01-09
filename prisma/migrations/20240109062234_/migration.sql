/*
  Warnings:

  - You are about to drop the column `isHard` on the `Plants` table. All the data in the column will be lost.
  - You are about to drop the column `plantName` on the `Plants` table. All the data in the column will be lost.
  - Added the required column `isEasy` to the `Plants` table without a default value. This is not possible if the table is not empty.
  - Added the required column `plant` to the `Plants` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Plants` DROP COLUMN `isHard`,
    DROP COLUMN `plantName`,
    ADD COLUMN `isEasy` BOOLEAN NOT NULL,
    ADD COLUMN `plant` VARCHAR(191) NOT NULL;
