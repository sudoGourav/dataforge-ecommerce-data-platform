CREATE TABLE payments (
    payment_id BIGSERIAL PRIMARY KEY,

    order_id BIGINT NOT NULL,

    payment_method VARCHAR(30) NOT NULL,

    payment_status VARCHAR(20) NOT NULL DEFAULT 'PENDING',

    amount NUMERIC(12, 2) NOT NULL,

    transaction_ref VARCHAR(100) NOT NULL UNIQUE,

    payment_date TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_payments_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT chk_payments_method
        CHECK (
            payment_method IN (
                'UPI',
                'CREDIT_CARD',
                'DEBIT_CARD',
                'NET_BANKING',
                'WALLET',
                'COD'
            )
        ),

    CONSTRAINT chk_payments_status
        CHECK (
            payment_status IN (
                'PENDING',
                'SUCCESS',
                'FAILED',
                'REFUNDED'
            )
        ),

    CONSTRAINT chk_payments_amount
        CHECK (amount >= 0)
);