SELECT DISTINCT id +1
FROM trans_hdr
WHERE id + 1 NOT IN (SELECT DISTINCT id FROM trans_hdr);

SELECT * 
FROM trans_hdr
WHERE id = 845