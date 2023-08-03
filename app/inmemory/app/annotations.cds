using { guitarStoreSrv } from '../srv/service.cds';

annotate guitarStoreSrv.Pitch with @odata.draft.enabled;
annotate guitarStoreSrv.Warehouse with @odata.draft.enabled;
annotate guitarStoreSrv.Discount with @odata.draft.enabled;
annotate guitarStoreSrv.Warehouse with @cds.odata.valuelist;
annotate guitarStoreSrv.Discount with @cds.odata.valuelist;
annotate guitarStoreSrv.Product with @cds.odata.valuelist;
annotate guitarStoreSrv.Product with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: productName } };
annotate guitarStoreSrv.Product with {
  ID @Common.Text: { $value: productName, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarStoreSrv.Product with @UI.Identification: [{ Value: productName }];
annotate guitarStoreSrv.Product with {
  productName @title: 'Product Name';
  productDescription @title: 'Product Description';
  price @title: 'Price'
};

annotate guitarStoreSrv.Product with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: productName },
    { $Type: 'UI.DataField', Value: productDescription },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Discount', Value: discount_ID }
];

annotate guitarStoreSrv.Product with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: productName },
    { $Type: 'UI.DataField', Value: productDescription },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Discount', Value: discount_ID }
  ]
};

annotate guitarStoreSrv.Product with {
  discount @Common.Text: { $value: discount.discountDescription, ![@UI.TextArrangement]: #TextOnly }
};

annotate guitarStoreSrv.Product with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitarStoreSrv.Pitch with @UI.HeaderInfo: { TypeName: 'Pitch', TypeNamePlural: 'Pitches', Title: { Value: targetAudience } };
annotate guitarStoreSrv.Pitch with {
  ID @Common.Text: { $value: targetAudience, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarStoreSrv.Pitch with @UI.Identification: [{ Value: targetAudience }];
annotate guitarStoreSrv.Pitch with {
  targetAudience @title: 'Target Audience';
  pitchText @title: 'Pitch Text'
};

annotate guitarStoreSrv.Pitch with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: targetAudience },
    { $Type: 'UI.DataField', Value: pitchText },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
];

annotate guitarStoreSrv.Pitch with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: targetAudience },
    { $Type: 'UI.DataField', Value: pitchText },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
  ]
};

annotate guitarStoreSrv.Pitch with {
  product @Common.Text: { $value: product.productName, ![@UI.TextArrangement]: #TextOnly }
};

annotate guitarStoreSrv.Pitch with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitarStoreSrv.Warehouse with @UI.HeaderInfo: { TypeName: 'Warehouse', TypeNamePlural: 'Warehouses', Title: { Value: stock } };
annotate guitarStoreSrv.Warehouse with {
  ID @Common.Text: { $value: stock, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarStoreSrv.Warehouse with @UI.Identification: [{ Value: stock }];
annotate guitarStoreSrv.Warehouse with {
  stock @title: 'Stock'
};

annotate guitarStoreSrv.Warehouse with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: stock }
];

annotate guitarStoreSrv.Warehouse with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: stock }
  ]
};

annotate guitarStoreSrv.Warehouse with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Product', Target : 'products/@UI.LineItem' }
];

annotate guitarStoreSrv.Discount with @UI.HeaderInfo: { TypeName: 'Discount', TypeNamePlural: 'Discounts', Title: { Value: discountDescription } };
annotate guitarStoreSrv.Discount with {
  ID @Common.Text: { $value: discountDescription, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarStoreSrv.Discount with @UI.Identification: [{ Value: discountDescription }];
annotate guitarStoreSrv.Discount with {
  discountAmount @title: 'Discount Amount';
  discountDescription @title: 'Discount Description'
};

annotate guitarStoreSrv.Discount with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: discountAmount },
    { $Type: 'UI.DataField', Value: discountDescription }
];

annotate guitarStoreSrv.Discount with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: discountAmount },
    { $Type: 'UI.DataField', Value: discountDescription }
  ]
};

annotate guitarStoreSrv.Discount with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

