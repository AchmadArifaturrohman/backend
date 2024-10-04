-- CreateTable
CREATE TABLE "cars" (
    "id" SERIAL NOT NULL,
    "manufacture" VARCHAR,
    "type" VARCHAR,
    "license_no" VARCHAR,
    "seat" INTEGER,
    "baggage" INTEGER,
    "transmission" VARCHAR,
    "year" DATE,
    "name" VARCHAR,
    "description" TEXT,
    "is_driver" BOOLEAN,
    "is_available" BOOLEAN DEFAULT true,
    "image" TEXT,
    "price" INTEGER,
    "created_dt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updated_dt" TIMESTAMP(6),
    "created_by" VARCHAR,
    "updated_by" VARCHAR,

    CONSTRAINT "cars_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order" (
    "id" BIGSERIAL NOT NULL,
    "order_no" VARCHAR NOT NULL,
    "user_id" BIGINT NOT NULL,
    "car_id" INTEGER NOT NULL,
    "start_time" TIMESTAMP(6),
    "end_time" TIMESTAMP(6),
    "total" DOUBLE PRECISION,
    "is_driver" BOOLEAN,
    "is_expired" BOOLEAN,
    "status" VARCHAR,

    CONSTRAINT "order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" BIGSERIAL NOT NULL,
    "full_name" VARCHAR,
    "email" VARCHAR(30) NOT NULL,
    "password" VARCHAR NOT NULL,
    "role" VARCHAR NOT NULL,
    "address" VARCHAR NOT NULL,
    "gender" VARCHAR,
    "avatar" VARCHAR,
    "phone_number" VARCHAR NOT NULL,
    "driver_license" TEXT,
    "birthdate" DATE,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "created_by" VARCHAR,
    "updated_by" VARCHAR,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "order_order_no_key" ON "order"("order_no");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_phone_number_key" ON "users"("phone_number");

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_car_id_fkey" FOREIGN KEY ("car_id") REFERENCES "cars"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
