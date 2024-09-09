Create Table products (
    id              Text Primary Key,
    name            Text,
    description     Text,
    sales_unit      Text
);

Create Table locations (
    id              Text Primary Key,
    name            Text
);

Create Table prices (
    "date"          Date Default Date(),
    qty             Float,

    Foreign Key(product_id)
                    References products(id),
    Foreign Key(location_id)
                    References locations(id),

    price           Float
);

Create Table baskets (
    id              Integer Primary Key,
    name            Text
);

Craete Table basket_product (
    Foreign Key(basket_id)
                    References baskets(id),
    Foreign Key(product_id)
                    References products(id),
    Foreign Key(location_id)
                    References locations(id),
    qty             Float
);



Insert Into locations (id, name)
Values
    ('PL/WAW', 'Dowolne miejsce w Warszawie');

Insert Into products (id, name, sales_unit)
Values
    ('BIGMAC', 'BigMac w McDonalds', 'g'),
    ('PB95', 'Benzyna Pb95', 'l');

Insert Into prices ("date", product_id, location_id, qty, price)
Values
    ('2024-09-09', 'BIGMAC', 'PL/WAW', 2273.0 / 965.0 * 100.0, 19.90),
    ('2024-09-09', 'PB95', 'PL/WAW', 1.0, 6.25);

Insert Into baskets
Values (1, 'Mateusz');

Insert Into basket_product
Values
    (1, 'BIGMAC', 'PL/WAW', 2.0),
    (1, 'PB95', 'PL/WAW', 10.0);
