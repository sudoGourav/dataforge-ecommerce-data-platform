CREATE TABLE inventory (
    inventory_id BIGSERIAL PRIMARY KEY,

    product_id BIGINT NOT NULL,
    warehouse_id BIGINT NOT NULL,

    quantity_available INTEGER NOT NULL DEFAULT 0,
    quantity_reserved INTEGER NOT NULL DEFAULT 0,

    reorder_level INTEGER NOT NULL DEFAULT 10,

    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_inventory_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT fk_inventory_warehouse
        FOREIGN KEY (warehouse_id)
        REFERENCES warehouses(warehouse_id),

    CONSTRAINT uq_inventory_product_warehouse
        UNIQUE (product_id, warehouse_id),

    CONSTRAINT chk_inventory_available
        CHECK (quantity_available >= 0),

    CONSTRAINT chk_inventory_reserved
        CHECK (quantity_reserved >= 0),

    CONSTRAINT chk_inventory_reorder
        CHECK (reorder_level >= 0),

    CONSTRAINT chk_inventory_reserved_limit
        CHECK (quantity_reserved <= quantity_available)
);