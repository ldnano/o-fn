output_letter := '';
FOR letteri := 1 TO 26 BY 1 DO
    IF EQ_STRING(input_letter, lowercase_letters[letteri]) THEN
        output_letter := uppercase_letters[letteri];
        RETURN;
    ELSIF EQ_STRING(input_letter, uppercase_letters[letteri]) THEN
        output_letter := input_letter;
        RETURN;
    END_IF;
END_FOR;