new_name := '';
FOR letteri := 0 TO LEN(input_name) BY 1 DO
    UppercaseLetter1(input_letter := MID(input_name, 1, letteri), output_letter => new_letter);
    IF NOT EQ_STRING(new_letter, '') AND LEN(new_name) < 3 THEN
        new_name := CONCAT(new_name, new_letter);
    END_IF;
END_FOR;
