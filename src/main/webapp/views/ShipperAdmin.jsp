<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link  rel="stylesheet" href="<c:url value="/css/admin.css"/>" >
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
	<div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#" >
                        <span class="icon">
                            <ion-icon name="logo-apple"></ion-icon>
                        </span>
                        <span class="title">Tất cả danh mục</span>
                    </a>
                </li>
                 <li>
                    <a href="#" onclick="purchase(this)">
                        <span class="icon">
                            <ion-icon name="logo-apple"></ion-icon>
                        </span>
                        <span class="title">Nhận đơn</span>
                    </a>
                </li>
                 <li>
                    <a href="#" onclick="purchase(this)">
                        <span class="icon">
                            <ion-icon name="logo-apple"></ion-icon>
                        </span>
                        <span class="title">Chờ lấy hàng </span>
                    </a>
                </li>
                 <li>
                    <a href="#" onclick="purchase(this)">
                        <span class="icon" >
                            <ion-icon name="logo-apple"></ion-icon>
                        </span>
                        <span class="title">Chờ đi giao</span>
                    </a>
                </li>
                 <li>
                    <a href="#" onclick="purchase(this)">
                        <span class="icon">
                            <ion-icon name="logo-apple"></ion-icon>
                        </span>
                        <span class="title">Đã giao</span>
                    </a>
                </li>

               <li>
                    <a href="#" onclick="purchase(this)">
                        <span class="icon">
                            <ion-icon name="logo-apple"></ion-icon>
                        </span>
                        <span class="title">Khách không nhận</span>
                    </a>
                </li>
               

                <li>
                    <a href="/Shopee/login">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">Đăng xuất</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- ========================= Main ==================== -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <!-- <div class="search">
                    <label>
                        <input type="text" placeholder="Search here">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>

                <div class="user">
                    <img src="assets/imgs/customer01.jpg" alt="">
                </div> -->
            </div>

            <!-- ======================= Cards ================== -->
            

           <!-- ================ Order Details List ================= -->
           <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Đơn hàng</h2>
                        
                    </div>
                    <%-- <div class="flexWrapper">
                    	<canvas id="chartElement" width="200" height="50"></canvas>
                    </div> --%>
					
                    <table>
                        <thead>
                            <tr>
                                <td>Người đặt</td>
                                <td>Tên sản phẩm</td>
                                <td>Hình ảnh</td>
                               
                                <td>Giá tiền</td>
                                <td>Tình trạng đơn hàng</td>
                            </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${listO}" var="o">
										<tr style="margin: 8px 0;">
											<td>${o.order.user.uName}</td>
											<td>${o.product.pName}</td>
											<td><img src="${o.product.pImage}"
												style="width: 90px; height: 90px;"></td>
											<td>${o.totalPrice}</td>
											<td>${o.status.nameStatus}</td>
											<c:set var = "s" value = "${o.status.idStatus}"/>
											<c:choose>
												<c:when test="${s==7}">
													<td><button id="orderStatus" onclick="editStatus(this, ${o.order.orderId})" value="${o.id}">Nhận đơn</button></td>													
												</c:when>
												<c:when test="${s==2}">
													<td><button id="orderStatus" onclick="editStatus(this, ${o.order.orderId})" value="${o.id}">Xác nhận lấy hàng</button></td>									
												</c:when>
												<c:when test="${s==3}">
													<td><button id="orderStatus" onclick="editStatus(this, ${o.order.orderId})" value="${o.id}">Xác nhận đã giao</button></td>
													<td><button id="orderStatus" onclick="editStatus(this, ${o.order.orderId})" value="${o.id}">Khách không nhận</button></td>									
												</c:when>									
											</c:choose>
											<td>
                                               <h3 class="detail">Xem
                                                <%-- <ul class="navbarItem__user-list-detail">
                                                    <li class="navbarItem__user-item">
                                                        <a href="" class="navbarItem__user-link">
                                                            Tên shop: ${o.order.shop.shopName}
                                                        </a>
                                                    </li>
                                                    <li class="navbarItem__user-item">
                                                        <a href="" class="navbarItem__user-link">
                                                            Địa chỉ shop: ${o.order.shop.shopAddress}
                                                        </a>
                                                    </li>
                                                    <li class="navbarItem__user-item">
                                                        <a href="" class="navbarItem__user-link">
                                                            Địa chỉ nhận hàng: ${o.order.uAddress}
                                                        </a>
                                                    </li>
                                                </ul> --%>
                                               </h3>
                                               
                                             </td>
										</tr>
									</c:forEach>
                          

                        </tbody>
                    </table>
                    <c:choose>
							<c:when test="${empty listO}">
								<div style="text-align: center;" class="home-product-shipping">
									<img
										src="https://icons.veryicon.com/png/o/miscellaneous/contribution/empty-box-1.png"
										alt="" style="width: 90px; height: 90px;">
									<p>Chưa có đơn hàng</p>
								</div>
							</c:when>
							<c:otherwise>
								<div style="text-align: center;" class="home-product-shipping">

								</div>
							</c:otherwise>
						</c:choose>
                </div>
                <!-- ================= New Customers ================ -->
                
            </div>
        </div>
    </div>

    <!-- =========== Scripts =========  -->
    <script src="<c:url value="/js/shipper.js"/>"></script>
    <script src="<c:url value="/js/admin.js"/>"></script>
    <%-- <script src="<c:url value ="/js/stats.js" />"><</script>
 --%>    
	<script> 
	let statusLabel=["Chờ xác nhận","Chờ lấy hàng","Đang giao","Đã giao","Đã hủy","Trả hàng"],statusInfo=[]
	
		statusInfo.push(${orderdetail.countStatusByIdStatus(1)});
		statusInfo.push(${orderdetail.countStatusByIdStatus(2)});
		statusInfo.push(${orderdetail.countStatusByIdStatus(3)});
		statusInfo.push(${orderdetail.countStatusByIdStatus(4)});
		statusInfo.push(${orderdetail.countStatusByIdStatus(5)});
		statusInfo.push(${orderdetail.countStatusByIdStatus(6)});
		window.onload = function(){
			cateChart("chartElement",statusLabel,statusInfo)
		}
	</script>
    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    
</body>
</html>
</body>
</html>