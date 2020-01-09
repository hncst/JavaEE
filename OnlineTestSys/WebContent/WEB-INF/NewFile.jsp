<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
   <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
   <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- 模态框（Modal） -->
<div class="modal fade" id="showModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" style="width:900px;">
      <div class="modal-content">
        <!-- 内容动态填充 -->
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>

<a data-toggle='modal'   data-target='#showModal' onclick=targetto()>+ row.title+</a>;

<script type="text/javascript">
 function targetto(id){
     $("#showModal").modal({
          remote: "showAction.action?id="+id
       });
    }
    $("#showModal").on("hidden.bs.modal", function() {
        $(this).removeData("bs.modal");
    });
</script> 
</body>
</html>