<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Dto.DtoRtime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.Dao"%>
<%@page import="Dto.Dto" %>
<%@page import="Dto.DtoPlace" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>

<body>
	
	<div class="container">
		<h1>자전거 월별 사용금액</h1>
		<h2>1월 사용금액</h2>
		<div id="demo-1"></div>

		<script src="./Easygraphs.js"></script>
		<script>
			var eg1 = new Easygraphs({
				container : document.getElementById('demo-1'),
				width : 880,
				height : 200,
				padding : {
					top : 30,
					right : 30,
					left : 55
				},
				tooltip : {
					template : '자전거 이용 금액 : {{ value }}',
					widthAuto : true,
					color : '#222',
					background : '#FFF'
				},
				yAxis : {
					text : {
						toFixed : 0
					},
					title : {
						text : 'January'
					},
					grid : {
						dasharray : '1%'
					}
				},
				xAxis : {
					labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
							'10', '11', '12', '13', '14', '15', '16', '17',
							'18', '19', '20', '21', '22', '23', '24', '25',
							'26', '27', '28', '29', '30', '31' ],
					grid : {
						dasharray : '1%'
					}
				},
				data : [ {
					name : 'Using',
					dots : {
						color : 'rgb(246, 75, 47)'
					},
					line : {
						width : 2,
						color : 'rgb(246, 75, 47)',
						fill : 'rgba(246, 75, 47, 0.5)'
					},
					values : [ 90, 22, 25, 23, 32, 34, 120, 90, 95, 40, 51, 56,
							52, 70, 68, 72, 74, 78, 91, 92, 95, 96, 98, 121,
							70, 78, 76, 68, 72, 71, 92 ]
				} ]
			});
			eg1.render();
		</script>
		</div>
</body>
