-- CreateEnum
CREATE TYPE "category_types" AS ENUM ('INCOME', 'EXPENSE');

-- CreateTable
CREATE TABLE "categories" (
    "id_category" UUID NOT NULL,
    "id_user" UUID NOT NULL,
    "desc_category" TEXT NOT NULL,
    "icon" TEXT NOT NULL,
    "type" "category_types" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id_category")
);

-- AddForeignKey
ALTER TABLE "categories" ADD CONSTRAINT "categories_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
