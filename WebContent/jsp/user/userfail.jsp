<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="<%=path%>/css/common.css">
  <link rel="stylesheet" href="<%=path%>/css/style.css">
  <link rel="stylesheet" href="<%=path%>/css/main.css">
  
  <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=path%>/js/jquery.SuperSlide.js"></script>
  <script type="text/javascript" src="<%=path%>/js/colResizable-1.3.min.js"></script>
  <script type="text/javascript" src="<%=path%>/js/common.js"></script>
  

	  <c:if test="${allErrors!=null }">
	  <c:forEach items="${allErrors }" var="error">
	  <script type="text/javascript">
				 window.alert(" ${ error.defaultMessage}");
		</script>
	  </c:forEach>
	</c:if>
  
			     
			    
  
  
  
  <script type="text/javascript">
  $(function(){
      $(".sideMenu").slide({
         titCell:"h3", 
         targetCell:"ul",
         defaultIndex:0, 
         effect:'slideDown', 
         delayTime:'500' , 
         trigger:'click', 
         triggerTime:'150', 
         defaultPlay:true, 
         returnDefault:false,
         easing:'easeInQuint',
         endFun:function(){
              scrollWW();
         }
       });
      $(window).resize(function() {
          scrollWW();
      });
  });
  function scrollWW(){
    if($(".side").height()<$(".sideMenu").height()){
       $(".scroll").show();
       var pos = $(".sideMenu ul:visible").position().top-38;
       $('.sideMenu').animate({top:-pos});
    }else{
       $(".scroll").hide();
       $('.sideMenu').animate({top:0});
       n=1;
    }
  } 

var n=1;
function menuScroll(num){
  var Scroll = $('.sideMenu');
  var ScrollP = $('.sideMenu').position();
  /*alert(n);
  alert(ScrollP.top);*/
  if(num==1){
     Scroll.animate({top:ScrollP.top-38});
     n = n+1;
  }else{
    if (ScrollP.top > -38 && ScrollP.top != 0) { ScrollP.top = -38; }
    if (ScrollP.top<0) {
      Scroll.animate({top:38+ScrollP.top});
    }else{
      n=1;
    }
    if(n>1){
      n = n-1;
    }
  }
}
  </script>
  <title>失败页面</title>
</head>
<body>
    <div class="top">
      <div id="top_t">
        <div id="logo" class="fl"></div>
        <div id="photo_info" class="fr">
          <div id="photo" class="fl">
            <a href="#"><img src="<%=path%>/images/a.png" alt="" width="60" height="60"></a>
          </div>
          <div id="base_info" class="fr">
            <div class="help_info">
              <a href="" id="hp">&nbsp;</a>
              <a href="${pageContext.request.contextPath }/user/userLogout.action" id="gy">&nbsp;</a>
              <a href="${pageContext.request.contextPath }/user/index.action" id="out">&nbsp;</a>
            </div>
            <div class="info_center">
              ${user.userName}
              
            </div>
          </div>
        </div>
      </div>
      <div id="side_here">
        <div id="side_here_l" class="fl"></div>
        <div id="here_area" class="fl">当前位置：失败页面</div>
      </div>
    </div>
    <div class="side">
        <div class="sideMenu" style="margin:0 auto">
          <h3>用户信息管理</h3>
          <ul>
            <li><a href="${pageContext.request.contextPath }/jsp/user/userregist.jsp">用户注册</a></li>
            <li><a href="${pageContext.request.contextPath }/jsp/user/userlogin.jsp">用户登录</a></li>            
            <li><a href="${pageContext.request.contextPath }/jsp/user/check/userinfomation.jsp">查看用户信息</a></li>
            <li><a href="${pageContext.request.contextPath }/jsp/user/check/updateuserinfomation.jsp">修改用户信息</a></li>            
          </ul>
          <h3><a href="${pageContext.request.contextPath }/user/check/findPaidGuideByUserId.action">查看已购买的指导</a></h3>
          
           </div>
    </div>
    <div class="main" style=" overflow-y:auto; ">
		 <p class="td_right" style:"font-size:20px;"> ${msg }</p>
			
			<c:if test="${allErrors!=null }">
			    <c:forEach items="${allErrors }" var="error">
			        ${ error.defaultMessage}<br/>
			    </c:forEach>
			</c:if>
			
			
    </div>
    <div class="bottom">
      <div id="bottom_bg">版权</div>
    </div>
    <div class="scroll">
          <a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(1);"></a>
          <a href="javascript:;" class="next" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(2);"></a>
    </div>
</body>

</html>