CREATE OR REPLACE PROCEDURE BETA()
DECLARE
   pe_score NUMBER(3,2);
BEGIN
   SELECT price/earnings INTO pe_score FROM ind_stocks
      WHERE symbol = 'RELIANCE'; 
   INSERT INTO stock_stats (symbol, ratio) VALUES ('RELIANCE', pe_ratio);
  
  COMMIT;

EXCEPTION  
   WHEN ZERO_DIVIDE THEN  
      DBMS_OUTPUT.PUT_LINE (' DIvision by zero not allowed');
	  INSERT INTO stock_stats (symbol, ratio) VALUES ('RELIANCE', NULL);
      
	  COMMIT;
   
   WHEN OTHERS THEN  -- handles all other errors
       DBMS_OUTPUT.PUT_LINE (' NOT GOOD IDEA');
       ROLLBACK;


END;  