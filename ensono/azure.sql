-- JUST SOME BOOTSTRAP DATA
CREATE TABLE resources
(
  [Tid] int,
  [Name] varchar(255),
  [Key1] varchar(255),
  [Key2] varchar(255),
  [Key3] varchar(255),
  PRIMARY KEY (Tid)
);

CREATE TABLE resource_types
(
  [Rid] int,
  [TypeID] int,
  [Value1] varchar(255),
  [Value2] varchar(255),
  [Value3] varchar(255),
  PRIMARY KEY (Rid),
  FOREIGN KEY
  (TypeID) REFERENCES resources
  (Tid)
);

INSERT INTO resources
  ([Tid],
  [Name],
  [Key1],
  [Key2],
  [Key3])
VALUES
  (1, 'Azure Virtual Machine', 'Size', 'OS Type', 'Location'),
  (2, 'Azure SQL Database', 'Edition', 'Size', 'Location'),
  (3, 'Azure Storage Account', 'Type', 'Location', NULL);

INSERT INTO  resource_types
  ([Rid],
  [TypeID],
  [Value1],
  [Value2],
  [Value3])
VALUES
  (1, 1, 'Standard_D12_v2', 'Windows', 'westeurope'),
  (2, 1, 'Standard_D3_v2', 'Windows', 'northeurope'),
  (3, 2, 'Premium', 'P4', 'northeurope'),
  (4, 2, 'Standard', 'S0', 'northeurope'),
  (5, 3, 'Standard_GRS', 'northeurope', NULL),
  (6, 3, 'Standard_LRS', 'westeurope', NULL)

-- SQL SELECT TO RETRIEVE AZURE RESOURCES
SELECT
  resource_types.Rid, resources.Name, '{' + COALESCE('"'+resources.Key1 + '":"' + resource_types.Value1 + '"', '') + COALESCE(',"'+resources.Key2 + '":"' + resource_types.Value2 + '"', '') + COALESCE(',"'+resources.Key3 + '":"' + resource_types.Value3 + '"', '') + '}' AS ValuesJSON
FROM
  resource_types JOIN resources ON resource_types.TypeID=resources.Tid