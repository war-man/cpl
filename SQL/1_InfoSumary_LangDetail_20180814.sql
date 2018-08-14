USE CPL

UPDATE LangDetail SET [Value] = N'My Profile' WHERE [Name] = N'MyProfile' AND LangId = 1
UPDATE LangDetail SET [Value] = N'私のプロフィール' WHERE [Name] = N'MyProfile' AND LangId = 2

INSERT INTO LangDetail VALUES(1, N'ClickHereToEnableTwoFactor', N'Click <a href="Profile/Security">here</a> to change.');
INSERT INTO LangDetail VALUES(2, N'ClickHereToEnableTwoFactor', N'有効にするにはこのページ下部で設定。<a href="Profile/Security">ここ</a>をクリック。');

INSERT INTO LangDetail VALUES (1, N'KYCWarning', N'Kindly <u><a href="/Profile/Index/"> check your profile </a></u> information carefully. Once your KYC is submitted and verified, you cannot change it !');
INSERT INTO LangDetail VALUES (2, N'KYCWarning', N'親切に<u> <a href="/Profile/Index/">あなたのプロフィールを確認してください</a></ u>。 あなたのKYCが提出され、確認されたら、それを変更することはできません！');

INSERT INTO LangDetail VALUES (1, N'KYCPendingNote', N'You cannot edit profile because your KYC is successfully verified by us.');
INSERT INTO LangDetail VALUES (2, N'KYCPendingNote', N'KYCが正常に認証されたため、プロフィールを編集できません。');

INSERT INTO LangDetail VALUES (1, N'KYCVerifiedNote', N'You cannot edit profile because your KYC is verifying by us.');
INSERT INTO LangDetail VALUES (2, N'KYCVerifiedNote', N'KYCが私たちによって確認されているため、プロフィールを編集することはできません。');