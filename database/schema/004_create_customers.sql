CREATE TABLE customers (
    customer_id BIGSERIAL PRIMARY KEY,

    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,

    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20) UNIQUE,

    date_of_birth DATE,

    customer_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_customers_status
        CHECK (
            customer_status IN (
                'ACTIVE',
                'INACTIVE',
                'SUSPENDED'
            )
        )
);