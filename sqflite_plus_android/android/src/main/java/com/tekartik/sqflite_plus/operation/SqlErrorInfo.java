package com.tekartik.sqflite_plus.operation;

import static com.tekartik.sqflite_plus.Constant.PARAM_SQL;
import static com.tekartik.sqflite_plus.Constant.PARAM_SQL_ARGUMENTS;

import com.tekartik.sqflite_plus.SqlCommand;

import java.util.HashMap;
import java.util.Map;

public class SqlErrorInfo {

    static public Map<String, Object> getMap(Operation operation) {
        Map<String, Object> map = null;
        SqlCommand command = operation.getSqlCommand();
        if (command != null) {
            map = new HashMap<>();
            map.put(PARAM_SQL, command.getSql());
            map.put(PARAM_SQL_ARGUMENTS, command.getRawSqlArguments());
        }
        return map;
    }
}
