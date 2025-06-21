create database GAG;
use GAG;
#TABLE 1 = CRUSHES
CREATE TABLE Crushes (
    crush_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    crush_stage ENUM('Suspect', 'Prospect', 'Approach', 'Negotiation', 'Closure', 'Order') NOT NULL,
    stage_updated_on DATE
);
INSERT INTO Crushes (name, crush_stage, stage_updated_on)
VALUES 
('Hrishita', 'Suspect', '2025-05-01'),
('Tanya', 'Suspect', '2025-05-01'),
('Meher', 'Suspect', '2025-05-01'),
('Sanya', 'Suspect', '2025-05-01'),
('Rhea', 'Suspect', '2025-05-01'),
('Pooja', 'Suspect', '2025-05-01');
#suspect table
select * from Crushes;

#Filter and Transition Girls Through SPANCO

#Tanya goes till Prospect → Rejected
UPDATE Crushes SET crush_stage = 'Prospect', stage_updated_on = '2025-05-02' WHERE name = 'Tanya';
-- She didn't vibe. Goes back to suspect
UPDATE Crushes SET crush_stage = 'Suspect', stage_updated_on = '2025-05-04' WHERE name = 'Tanya';

#Meher goes till Approach → Ghosted
UPDATE Crushes SET crush_stage = 'Prospect', stage_updated_on = '2025-05-02' WHERE name = 'Meher';
UPDATE Crushes SET crush_stage = 'Approach', stage_updated_on = '2025-05-05' WHERE name = 'Meher';
-- Ghost ho gayi :(
UPDATE Crushes SET crush_stage = 'Suspect', stage_updated_on = '2025-05-07' WHERE name = 'Meher';

#Sanya goes till Negotiation → Unrealistic demands
UPDATE Crushes SET crush_stage = 'Prospect', stage_updated_on = '2025-05-02' WHERE name = 'Sanya';
UPDATE Crushes SET crush_stage = 'Approach', stage_updated_on = '2025-05-05' WHERE name = 'Sanya';
UPDATE Crushes SET crush_stage = 'Negotiation', stage_updated_on = '2025-05-07' WHERE name = 'Sanya';
-- Negotiation broke down
UPDATE Crushes SET crush_stage = 'Suspect', stage_updated_on = '2025-05-09' WHERE name = 'Sanya';

# Rhea goes till Closure → Changed her mind
UPDATE Crushes SET crush_stage = 'Prospect', stage_updated_on = '2025-05-02' WHERE name = 'Rhea';
UPDATE Crushes SET crush_stage = 'Approach', stage_updated_on = '2025-05-05' WHERE name = 'Rhea';
UPDATE Crushes SET crush_stage = 'Negotiation', stage_updated_on = '2025-05-07' WHERE name = 'Rhea';
UPDATE Crushes SET crush_stage = 'Closure', stage_updated_on = '2025-05-09' WHERE name = 'Rhea';
-- Last moment ditch
UPDATE Crushes SET crush_stage = 'Suspect', stage_updated_on = '2025-05-11' WHERE name = 'Rhea';

#Pooja goes till Negotiation → Got back with ex
UPDATE Crushes SET crush_stage = 'Prospect', stage_updated_on = '2025-05-02' WHERE name = 'Pooja';
UPDATE Crushes SET crush_stage = 'Approach', stage_updated_on = '2025-05-05' WHERE name = 'Pooja';
UPDATE Crushes SET crush_stage = 'Negotiation', stage_updated_on = '2025-05-07' WHERE name = 'Pooja';
-- Ex ka comeback 😞
UPDATE Crushes SET crush_stage = 'Suspect', stage_updated_on = '2025-05-10' WHERE name = 'Pooja';

#UPDATE Crushes SET crush_stage = 'Prospect', stage_updated_on = '2025-05-02' WHERE name = 'Pooja';
UPDATE Crushes SET crush_stage = 'Approach', stage_updated_on = '2025-05-05' WHERE name = 'Pooja';
UPDATE Crushes SET crush_stage = 'Negotiation', stage_updated_on = '2025-05-07' WHERE name = 'Pooja';
-- Ex ka comeback 😞
UPDATE Crushes SET crush_stage = 'Suspect', stage_updated_on = '2025-05-10' WHERE name = 'Pooja';

#Hrishita Reaches "Order" 🏆 
UPDATE Crushes SET crush_stage = 'Prospect', stage_updated_on = '2025-05-02' WHERE name = 'Hrishita';
UPDATE Crushes SET crush_stage = 'Approach', stage_updated_on = '2025-05-04' WHERE name = 'Hrishita';
UPDATE Crushes SET crush_stage = 'Negotiation', stage_updated_on = '2025-05-06' WHERE name = 'Hrishita';
UPDATE Crushes SET crush_stage = 'Closure', stage_updated_on = '2025-05-08' WHERE name = 'Hrishita';
UPDATE Crushes SET crush_stage = 'Order', stage_updated_on = '2025-05-10' WHERE name = 'Hrishita';

#stage table
SELECT name, crush_stage, stage_updated_on
FROM Crushes
ORDER BY FIELD(crush_stage, 'Suspect', 'Prospect', 'Approach', 'Negotiation', 'Closure', 'Order');











