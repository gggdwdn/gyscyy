<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<title></title>
<%@ include file="/WEB-INF/views/common/meta.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12" >
		     <c:if test="${processStatus!=0 && processStatus!=1 && processStatus!=5}">
			     <div class="form-group" style="margin-right: 50px;">
					<label class="col-md-2 control-label no-padding-right">
						<span style="color:red;" >*</span>审批意见
					</label>
					<div class="col-md-10">
						<textarea id="approveIdeaForProcess" name="approveIdea" placeholder="请输入审批意见" style="height:60px; resize:none;" class="col-md-12" maxlength="128"></textarea>
					</div>
				</div>
				<div class="form-group" style="margin-right: 50px;">
					<label class="col-md-2 control-label no-padding-right">审批人</label>
					<div class="col-sm-10">
						<select multiple="multiple" size="5" name="duallistbox_demo1[]" id="duallist">
							<c:forEach items="${userList}" var="userList" varStatus="vs">
								<option value="${userList.loginName}">${userList.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</c:if>
			<c:if test="${processStatus==0 || processStatus==1 || processStatus==5}">
				<!-- 下一节点审批人列表 -->
					<div class="col-sm-12" >
						<select multiple="multiple" size="10" name="duallistbox_demo1[]" id="duallist" >
							<c:forEach items="${userList}" var="userList" varStatus="vs">
								<option value="${userList.loginName}">${userList.name}</option>
							</c:forEach>
							<!-- 
							<option value="option6" selected="selected">Option 6</option>
							 -->
						</select>
						<div class="hr hr-16 hr-dotted"></div>
					</div>
			</c:if>
        </div>
    </div>
    <div style="margin-top: 15px;">
		<button class="btn btn-xs btn-danger pull-right" data-dismiss="modal" >
			<i class="ace-icon fa fa-times"></i>
			取消
		</button>
		
		<button id="btnSavePerson" class="btn btn-xs btn-success pull-right"  style="margin-right:15px;" >
			<i class="ace-icon fa fa-floppy-o"></i>
			确定
		</button>
	</div>
</div>
<script type="text/javascript">
	var sureSubmitDatatables;
    jQuery(function ($) {
    	seajs.use(['duallistbox'], function(A){
    		 	var demo1 = $('select[name="duallistbox_demo1[]"]').bootstrapDualListbox({infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
				var container1 = demo1.bootstrapDualListbox('getContainer');
				container1.find('.btn').addClass('btn-white btn-info btn-bold');
			
				$('#btnSavePerson').on('click',function(){
					var approveIdea = $("#approveIdeaForProcess").val();
					var selectUser=$('[name="duallistbox_demo1[]"]').val();
					if(approveIdea==''){
						alert('请填写审批意见!');
						return
					}
					if(selectUser==null||selectUser==""){
						alert('请选择审批人!');
						return;
					}
					listFormDialog.close(selectUser);
				});
    	});		
    });
    
</script>
