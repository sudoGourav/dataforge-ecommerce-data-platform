CREATE TABLE customer_addresses (
    address_id BIGSERIAL PRIMARY KEY,

    customer_id BIGINT NOT NULL,

    address_type VARCHAR(20) NOT NULL,

    address_line_1 VARCHAR(255) NOT NULL,
    address_line_2 VARCHAR(255),

    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL DEFAULT 'India',

    is_default BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_customer_addresses_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE CASCADE,

    CONSTRAINT chk_customer_address_type
        CHECK (
            address_type IN (
                'HOME',
                'OFFICE',
                'OTHER'
            )
        )
);