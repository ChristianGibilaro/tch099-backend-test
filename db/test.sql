-- 1) Trouver la liste d'amis d'un utilisateur (
SELECT u.*
FROM UserFriend uf
JOIN User u ON uf.FriendID = u.ID
WHERE uf.UserID = 1;

-- 2) Trouver la liste d'amis de façon bidirectionnelle 
-- (permet de récupérer aussi les utilisateurs pour lesquels X est FriendID)
SELECT u.*
FROM UserFriend uf
JOIN User u ON uf.FriendID = u.ID
WHERE uf.UserID = 1
UNION
SELECT u.*
FROM UserFriend uf
JOIN User u ON uf.UserID = u.ID
WHERE uf.FriendID = 2;

-- 3) Trouver les membres d'une équipe (ID = Y)
SELECT u.*
FROM UserTeam ut
JOIN User u ON ut.UserID = u.ID
WHERE ut.TeamID = 1;

-- 4) Trouver les membres d'une équipe ET leur rang
SELECT
  u.ID       AS UserID,
  u.Pseudo   AS UserPseudo,
  u.Name     AS UserName,
  r.Name     AS RankName
FROM UserTeam ut
JOIN User     u ON ut.UserID = u.ID
JOIN Rank     r ON ut.RankID = r.ID
WHERE ut.TeamID = 1;

-- 5) Trouver les équipes d'un utilisateur 
SELECT t.*
FROM UserTeam ut
JOIN Team t ON ut.TeamID = t.ID
WHERE ut.UserID = 2;

-- 6) Trouver les matchs d'une équipe 
SELECT m.*
FROM `Match` m
WHERE m.TeamID = 1
LIMIT 0, 25;


-- 7) Trouver les utilisateurs que X a bloqués
SELECT u.*
FROM UserBlocked ub
JOIN User u ON ub.BlockedID = u.ID
WHERE ub.UserID = 1;
