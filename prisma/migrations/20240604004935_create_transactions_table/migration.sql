-- CreateTable
CREATE TABLE "transactions" (
    "idTransaction" UUID NOT NULL,
    "id_user" UUID NOT NULL,
    "id_category" UUID NOT NULL,
    "id_bank_account" UUID NOT NULL,
    "desc_transaction" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "type" "category_types" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "transactions_pkey" PRIMARY KEY ("idTransaction")
);

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_id_category_fkey" FOREIGN KEY ("id_category") REFERENCES "categories"("id_category") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_id_bank_account_fkey" FOREIGN KEY ("id_bank_account") REFERENCES "bank_accounts"("idBankAccount") ON DELETE CASCADE ON UPDATE CASCADE;
