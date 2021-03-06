<%@ page language="java" contentType="text/html; charset=utf-8"  
    pageEncoding="utf-8"%>  
<!DOCTYPE html>
<html lang="zh">
	<head>
    	<meta charset="UTF-8">
    	<%@ include file="/WEB-INF/views/common/meta.jsp" %> 
    </head>
	<body>
		<div class="col-md-12" >
			<form class="form-horizontal" role="form"  style="margin-right:100px;" id="editForm">
			     <input class="col-md-12" id="id" name="id" type="hidden" value="${entity.id}">
			     <input class="col-md-12" id="status" name="status" type="hidden" value="0">
<%-- 			    <input class="col-md-12" id="Name" name="Name" type="hidden" value="${entity.name}"> --%>
			     
			   <div class="form-group">
				    <label class="col-md-2 control-label no-padding-right">
					    <span style="color:red;">*</span>工号
				    </label>
				    <div class="col-md-4">
					    <input class="col-md-12" id="code" name="code" type="text" readonly placeholder="请输入工号" maxlength="64" value="${entity.code}">
					</div>
				    <label class="col-md-2 control-label no-padding-right">
					    <span style="color:red;">*</span>姓名
				    </label>
				    <div class="col-md-4">
					    <input class="col-md-12" id="name" name="name" type="text" readonly placeholder="请输入姓名" maxlength="64" value="${entity.name}">
				    </div>	
				</div>
			   <div class="form-group">
				    <label class="col-md-2 control-label no-padding-right">
					    性别
				    </label>
				    <div class="col-md-4">
					    <select class="col-md-12 chosen-select" id="sex" name="sex"></select>
				    </div>	
				    <label class="col-md-2 control-label no-padding-right">
					    单位
				    </label>
<%-- 				    <input placeholder="请输入组织机构" id="unit" name="unit" type="hidden" value="${entity.unit}" class="col-md-12"> --%>
				    <div class="col-md-4">
					    <div id="unitTreeDiv"></div>
					</div>
				</div>
			   <div class="form-group">
				    <label class="col-md-2 control-label no-padding-right">
					    手机号
				    </label>
				    <div class="col-md-4">
					    <input class="col-md-12" id="mobile" name="mobile" type="text" placeholder="请输入手机号" maxlength="32" value="${entity.mobile}">
				    </div>	
				    <label class="col-md-2 control-label no-padding-right">
					    邮箱
				    </label>
				    <div class="col-md-4">
					    <input class="col-md-12" id="mail" name="mail" type="text" placeholder="请输入邮箱地址" maxlength="128" value="${entity.mail}">
					</div>
				</div>
			   <%-- <div class="form-group">
				    <label class="col-md-2 control-label no-padding-right">
					    相片地址
				    </label>
				    <div class="col-md-4">
					    <input class="col-md-12" id="photoUrl" name="photoUrl" type="text" placeholder="请输入头像地址" maxlength="256" value="${entity.photoUrl}">
				    </div>	
				</div> --%>
				<div class="form-group">
							<label class="col-md-2 control-label no-padding-right"><span style="color:red;">*</span>是否为外部人员</label>
							<div class="col-md-4">
								<select id="outStatus" class="col-md-12 chosen-select" onchange="changeUnit()"></select>
							</div>
							<label class="col-md-2 control-label no-padding-right" id="unitTitle" ><span style="color:red;">*</span>参建单位</label>
							<div class="col-md-4" id="unitDiv" style="display:none;">
								<select id="constructionUnits" class="col-md-12 chosen-select" ></select>
							</div>										
						</div>	
			      <div class="form-group">
				    <label class="col-md-2 control-label no-padding-right">
					    备注
				    </label>
				    <div class="col-md-10">
					    <textarea name="remark" placeholder="请输入备注" style="height:100px; resize:none;" class="col-md-12" maxlength="256">${entity.remark}</textarea>
				    </div>
			     </div>
			</form>
    		<div style="margin-right:100px;">
        		<button class="btn btn-xs btn-danger pull-right" data-dismiss="modal">
        			<i class="ace-icon fa fa-times"></i>
        			取消
        		</button>
        		<button id="editBtn" class="btn btn-xs btn-success pull-right"  style="margin-right:15px;">
        			<i class="ace-icon fa fa-floppy-o"></i>
        			保存
        		</button>
        	</div>
        </div>
		<script type="text/javascript">
			jQuery(function($) {
				seajs.use(['combobox','combotree','my97datepicker'], function(A){
        			var appData = ${entityJson};
        			//combobx组件
					var sexComboboxData = ${sexCombobox};
					var sexCombobox = new A.combobox({
						render: "#sex",
						//返回数据待后台返回
						datasource:sexComboboxData,
						//multiple为true时select可以多选
						multiple:false,
						//allowBlank为false表示不允许为空
						allowBlank: true,
						options:{
							"disable_search_threshold":10
						}
					}).render();
					sexCombobox.setValue(appData.sex);
					//combotree组件
					var unitTreeList = ${unitTreeList};
					var unitCombotree = new A.combotree({
						render: "#unitTreeDiv",
						name: "unit",
						//返回数据待后台返回
						datasource: unitTreeList,
						width:"210px",
						options: {
							treeId: 'unit',
							data: {
								key: {
									name: "name"
								},
								simpleData: {
									enable: true,
									idKey: "id",
									pIdKey: "parentId"
								}
							}
						}
					}).render();
					var outStatusCombobox = ${outStatusCombobox}
					var outStatusCombobox = new A.combobox({
						render: "#outStatus",
						name:"outStatus",
						datasource:outStatusCombobox,
						multiple:false,
						allowBlank:true,
						options:{
							"disable_search_threshold":10
						}
					}).render();
					outStatusCombobox.setValue(appData.outStatus);
					var constructionUnitsCombobox = ${constructionUnitsCombobox}
					var constructionUnitsCombobox = new A.combobox({
						render: "#constructionUnits",
						name:"constructionUnits",
						datasource:constructionUnitsCombobox,
						multiple:false,
						allowBlank:true,
						options:{
							"disable_search_threshold":10
						}
					}).render();
					
					constructionUnitsCombobox.setValue(appData.constructionUnits);
					if(appData.outStatus==1){
						$("#unitDiv").show();
						$("#unitTitle").show();
					}else{
						$("#unitDiv").hide();
						$("#unitTitle").hide();
					}
					unitCombotree.setValue(appData.unit);
					var id = appData.id;
					var codes = ${codes};
					$('#editForm').validate({
						debug:true,
						rules: {
							id:{maxlength:20},
							name:{required:true, maxlength:64},
							code:{required:true,maxlength:64},
							sex:{maxlength:64},
							unit:{maxlength:11},
							mobile:{maxlength:32},
							mail:{maxlength:128},
							//photoUrl:{maxlength:256},
							remark:{maxlength:256},
							outStatus:{required:true},
							constructionUnits:{maxlength:256}		
						},
						submitHandler: function (form) {
							//添加按钮
							var url = format_url("/personalManage/UpdateUser/"+appData.id);
							//serializeObject()用于Jquery将form转换成用于ajax参数的Javascript Object
							var obj = $("#editForm").serializeObject();
							var code=obj.code;
							if(codes.indexOf(code)>=0){
								alert("修改失败，人员工号不可重复");
								return;
							}
							//验证手机格式
							if(obj.mobile){
								var patrn = /^1(3|4|5|7|8)\d{9}$/;
								if(!patrn.exec(obj.mobile)){
									alert("手机号格式不正确！");
									return;
								}
							}
							if($("#outStatus").val()==1){
								var constructionUnits = $("#constructionUnits").val();
								if(constructionUnits == null || constructionUnits==""){
									alert("请选择外部人员参建单位！");
									return;
								}
							}else{
								obj.constructionUnits ="";
							}
							//验证邮箱格式
							if(obj.mail){
								var patrn = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
								if(!patrn.exec(obj.mail)){
									alert("邮箱地址格式不正确！");
									return;
								}
							}
							$("#editBtn").attr({"disabled":"disabled"}); //设置按钮只读
							$.ajax({
								url : url,
								contentType : 'application/json',
								dataType : 'JSON',
								data : JSON.stringify(obj),
								cache: false,
								type : 'POST',
								success: function(result){
									$("#editBtn").removeAttr("disabled"); //释放按钮只读
									if(result.result=='warn'){
										alert(result.data);
									}else{
										alert(result.data);
										listFormDialog.close();
									}
									
								},
								error:function(v,n){
									alert('操作失败');
								}
							});
						}
					});
					$("#editBtn").on("click", function(){
    					$("#editForm").submit();
    				});
				});
			});
			function changeUnit(){
				if($("#outStatus").val()==1){
					$("#unitDiv").show();
					$("#unitTitle").show();
				}else{
					$("#unitDiv").hide();
					$("#unitTitle").hide();
				}
			}
        </script>
    </body>
</html>