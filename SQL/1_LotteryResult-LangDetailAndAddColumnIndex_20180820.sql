INSERT INTO LangDetail VALUES(1, N'LetBuyLottery', N'Let buy lottery !');

INSERT INTO LangDetail VALUES(1, N'SorryForThisTime', N'Sorry for this time');

INSERT INTO LangDetail VALUES(1, N'YouHaveANextChance', N'you have a next chance!');

INSERT INTO LangDetail VALUES(1, N'OtherResult', N'Other results');

ALTER TABLE LotteryPrize Add [Index] int NOT NULL Default(0)

ALTER TABLE Lottery ADD UpdatedDate Datetime
