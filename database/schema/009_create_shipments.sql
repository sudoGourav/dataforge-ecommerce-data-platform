CREATE TABLE shipments (
    shipment_id BIGSERIAL PRIMARY KEY,

    order_id BIGINT NOT NULL,

    carrier VARCHAR(50) NOT NULL,

    tracking_number VARCHAR(100) NOT NULL UNIQUE,

    shipment_status VARCHAR(30) NOT NULL DEFAULT 'PROCESSING',

    shipped_at TIMESTAMPTZ,

    estimated_delivery_date DATE,

    delivered_at TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_shipments_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT chk_shipments_status
        CHECK (
            shipment_status IN (
                'PROCESSING',
                'SHIPPED',
                'IN_TRANSIT',
                'OUT_FOR_DELIVERY',
                'DELIVERED',
                'CANCELLED',
                'RETURNED'
            )
        )
);