-- CreateEnum
CREATE TYPE "BankAccountType" AS ENUM ('SAVINGS', 'CHECKING', 'CASH');

-- CreateTable
CREATE TABLE "bank_accounts" (
    "idBankAccount" UUID NOT NULL,
    "idUser" UUID NOT NULL,
    "desc_bank_account" TEXT NOT NULL,
    "initial_balance" DOUBLE PRECISION NOT NULL,
    "current_balance" DOUBLE PRECISION NOT NULL,
    "account_type" "BankAccountType" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "color" TEXT NOT NULL,

    CONSTRAINT "bank_accounts_pkey" PRIMARY KEY ("idBankAccount")
);
