package com.zhangsys.dao;

import java.util.List;

import com.zhangsys.po.Function;
import com.zhangsys.po.Users;

public interface FunctionDao {
	public int addFunction(Function function);
	public List<Function> findAllFunctions();
	public List<Function> findFunctionByRoleId(Integer id);
	public int delFunction(Function function);
	public Function findFunctionById(Function function);
	public int updateFunction(Function function);
}
