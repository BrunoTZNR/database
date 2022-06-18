# mysql
```sql
CREATE DATABASE `dataBaseName`
DEFAULT CHARACTER SET utf8mb4
DAFAULT COLLATE utf8mb4_general_ci;
```

```sql
USE `dataBaseName`;
```

```sql
CREATE TABLE IF NOT EXISTS `tableName`(
    ...atributes...
)ENGINE=InnoDB, DEFAULT CHARSET=utf8mb4;
```

```sql
INSERT INTO `tableName` (`atributes`) VALUES (`values`);

INSERT INTO `tableName` VALUES (`values`);
```

```sql
ALTER TABLE `tableName` ADD `atributes` `constraint`;

ALTER TABLE `tableName` ADD `atributes` `constraint` FIRST;

ALTER TABLE `tableName` ADD `atributes` `constraint` AFTER `atributeName`;

ALTER TABLE `tableName` DROP `atributes`;

ALTER TABLE `tableName` MODIFY `atribute` `constraint`;

ALTER TABLE `tableName` CHANGE `beforeAtributeName` `afterAtributeName` `constraint`;

ALTER TABLE `tableName` RENAME TO `newNameTable`;
```

```sql
UPDATE `tableName` SET `atribute`='value' WHERE `atribute`='value';
```

```sql
DELETE FROM `tableName` WHERE `atribute`='value';
```

```sql
TRUNCATE `tableName`;
```

```sql
SELECT * FROM `tableName`;

SELECT `atribute1`, `atribute2`, `atribute3` FROM `tableName`;
```

```sql
SELECT * FROM `tableName` LIMIT 5;
```

```sql
SELECT * FROM `tableName` ORDER BY `atribute` ASC;

SELECT * FROM `tableName` ORDER BY `atribute` DESC;
```

```sql
SELECT * FROM `tableName` WHERE `atribute`;

SELECT * FROM `tableName` WHERE `atribute` ORDER BY `atribute`;
```

```sql
WHERE OPERATORS (>,<,<=,>=,!=,BETWEEN,AND,IN,OR,NOT IN)
```

```sql
SELECT * FROM `tableName` WHERE `atribute` LIKE 'char%';

SELECT * FROM `tableName` WHERE `atribute` LIKE '%char';

SELECT * FROM `tableName` WHERE `atribute` LIKE '%char%';
```

```sql
SELECT DISTINCT `atribute` FROM `tableName`;
```

```sql
SELECT count(`atribute` or *) FROM `tableName`;

SELECT max(`atribute`) FROM `tableName`;

SELECT min(`atribute`) FROM `tableName`;

SELECT avg(`atribute`) FROM `tableName`;
```

```sql
SELECT * FROM `tableName` GROUP BY `atribute`;

SELECT count(`atribute` or *) FROM `tableName` GROUP BY `atribute`;
```

```sql
SELECT `atribute`, `atribute` FROM `tableName1` INNER JOIN `tableName2` ON `tableName1`.primaryKey = `tableName2`.foreignKey;

SELECT `atribute`, `atribute` FROM `tableName1` AS tb1 INNER JOIN `tableName2` AS tb2 ON tb1.PK = tb2.FK;
```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```
