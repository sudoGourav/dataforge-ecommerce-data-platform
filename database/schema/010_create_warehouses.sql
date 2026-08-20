CREATE TABLE warehouses (
    warehouse_id BIGSERIAL PRIMARY KEY,

    warehouse_name VARCHAR(150) NOT NULL UNIQUE,

    address_line_1 VARCHAR(255) NOT NULL,
    address_line_2 VARCHAR(255),

    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL DEFAULT 'India',

    warehouse_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_warehouse_status
        CHECK (
            warehouse_status IN (
                'ACTIVE',
                'INACTIVE',
                'MAINTENANCE'
            )
        )
);