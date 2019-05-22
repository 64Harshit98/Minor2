<%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
            <%@page import="java.sql.Connection"%>
            <%@page import="java.util.*"%>
            
            	<jsp:useBean id="obj" class="com.list.SubsetsOfSetJava"/>
            	
<%  int a;              
	String Name = request.getParameter("name");
	/*String Quant = request.getParameter("quant");*/
	int Quant = Integer.parseInt(request.getParameter("quant"));
	
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "scm";
	String userid = "root";
	String password = "";
	try {
	Class.forName(driver);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	ResultSet rs = null;
%>
                    
<!DOCTYPE html>
<html>
    <head>
        <title>Supply Chain Management</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="style.css">
	    <style>
            h3{
            text-align:center;
            }
        </style>
    </head>
<body>
<div class="navbar navbar-inverse navbar-top">
           <div class="container">
               <div class="navbar-header">
                   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                   <a href="index.jsp" class="navbar-brand">Supply Chain Management</a>
                </div>
               <div class="collapse navbar-collapse" id="myNavbar">
			       	<%
			       		String name = (String)session.getAttribute("user");
			       	%>
			       		<ul class="nav navbar-nav navbar-right">
		                  	<li><div class="dropdown">
								  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    <span class="glyphicon glyphicon-user"></span> <%=name %>
								  </button>
								  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								    <a class="dropdown-item" href="Logout.jsp">Logout</a>
								</div>
							</li>
		            	</ul>                   
               </div>
           </div>
       </div>
     <div class="container">
         <div class="row row_style">
             <div class="col-xs-2">
                 <div class="panel">

                 </div>
             </div>
             <div class="col-xs-8">
                 <div class="panel panel-default">
                     <div class="panel-heading">
                         <h3>Vendors having your product</h3>
                     </div>
                     <div class="panel-body">
                         
                         <div class="container">
                             <div class="row">
                                 <div class="col-xs-10">
                                     <table border="1" width="600">
                                         <tr>
                                             <th>Vendor Id</th>
                                             <th>Vendor Name</th>
                                             <th>Item name</th>
                                             <th>Item Quantity</th>
                                             <th>Cost per Quantity</th>
                                             <th>Contact Number</th>

                                         </tr>
<%
		try{
		
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
		statement=connection.createStatement();
		/*String sql1 = "Declare @item as String;set @item := @Name";
		resultSet = statement.executeQuery(sql1);*/
		String sql ="select * from stock where item = '"+request.getParameter("name")+"' ";
		resultSet = statement.executeQuery(sql);
		
		while(resultSet.next()){
			
			
%>
		       <tr>
		           <td>
		               <%=resultSet.getString("vid") %>
		           </td>
		           <td>
		               <%=resultSet.getString("vname") %>
		           </td>
		           <td>
		               <%=resultSet.getString("item") %>
		           </td>
		           <td>
		               <%=resultSet.getString("item_qty") %>
		           </td>
		           <td>
		               <%=resultSet.getString("cost_qty") %>
		           </td>
		           <td>
		               <%=resultSet.getString("contact") %>
		           </td>
                  </tr>
<%
			
		}
					connection.close();
		            } catch (Exception e) {
					e.printStackTrace();
					}

%>
           </table>



                                      </div>
                                  </div>
                              </div>

                          </div>
                          <br>
                        
                      </div>
                  </div>
              </div>
            </div>
           <br><br>
                        <%
                  
int[] arr = new int[100];
int[] array = new int[100];
int i=0;
int t=0;
int c;
int totalc;
int b=0;
int req = Integer.parseInt(request.getParameter("quant"));
try{

connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql ="select item_qty from stock where item = '"+request.getParameter("name")+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	b++;
	
	arr[i] = resultSet.getInt("item_qty");
	/*out.println(arr[i]);*/
    i++;
	}

int max = arr[0];
for(i = 1; i < arr.length;i++)
{
	if(arr[i] > max)
	{
		max = arr[i];
	}
}




if (req < max)
	t=t+1;{
		
	
	 %>
                            <div class="container">
                                <div class="row row_style">
                                    <div class="col-xs-2">
                                        <div class="panel">

                                        </div>
                                    </div>
                                    <div class="col-xs-8">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h2 style="text-align:center;">The requirement from user is <%=req%></h2>
                                                <br>
                                                <h4 style="text-align:center;"> Following table shows if your requirements can be fulfilled within one transaction.</h4>
                                            </div>
                                            <div class="panel-body">
                                                <!-- <p class="text-warning">Shopkeeper must be signed in to access</p> -->
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-xs-10">
                                                            <table border="1" width="600">
                                                                <tr>
                                                                    <th>Vendor Id</th>
                                                                    <th>Vendor Name</th>
                                                                    <th>Item name</th>
                                                                    <th>Item Quantity</th>
                                                                    <th>Cost per Quantity</th>
                                                                    <th>Contact Number</th>
                                                                    <th>Total cost of purchase</th>
                                                                    <th>Number of transaction</th>

                                                                </tr>
                                                                <%
                                                                int ab = 0;
	 for(i=0;i < arr.length;i++)
	 {
		 if(arr[i]>=req)
		 {
			 
			 
			 String sql1 ="select * from stock where item = '"+request.getParameter("name")+"' and item_qty='"+arr[i]+"' ";
			 /*String sql2 ="select cost from stock where item = '"+request.getParameter("name")+"' and item_qty='"+arr[i]+"' ";
			 
			 rs=statement.executeQuery(sql2);
			 c = resultSet.getInt("item_qty");
			 totalc = c*req;*/
			 resultSet = statement.executeQuery(sql1);
			 
			 while(resultSet.next()){
				 ab++;
				 %>
                                                                    <tr>
                                                                        <td>
                                                                            <%=resultSet.getString("vid") %>
                                                                        </td>
                                                                        <td>
                                                                            <%=resultSet.getString("vname") %>
                                                                        </td>
                                                                        <td>
                                                                            <%=resultSet.getString("item") %>
                                                                        </td>
                                                                        <td>
                                                                            <%=resultSet.getString("item_qty") %>
                                                                        </td>
                                                                        <td>
                                                                            <%=resultSet.getString("cost_qty") %>
                                                                        </td>
                                                                        <td>
                                                                            <%=resultSet.getString("contact") %>
                                                                        </td>

                                                                        <td>
                                                                            <%=resultSet.getInt("cost_qty")*req%>
                                                                        </td>
                                                                        <td>
                                                                            <%=t %>
                                                                        </td>
                                                                    </tr>
                                                                    <%
				 }
			 
		 }
		 else{
			 
			
		 }
	 }
	
	}%> </table> <br><br> 
	 <h1>Analysing all possibilities using subsets.</h1><br>
	  <br><br><% 
	ArrayList[][] dou = new ArrayList[10][10];
	List<List<Integer>> list = new ArrayList<List<Integer>>();
	int[] nums =  new int[100];
	int sum;
    nums=Arrays.copyOf(arr,b);
    /* for( i=0;i<nums.length;++i){
		out.print(nums[i]+" ");}*/
	List<List<Integer>> subsets = obj.subsets(nums);
	for (List<Integer> subset: subsets) {
		out.println(" "+subset+"");
		
	}%><br><br><%
	for (List<Integer> subset: subsets) {
		sum=0;
		for( i = 0; i < subset.size(); i++)
        {
            
            sum = sum + subset.get(i);
        }
        out.println("The subset is "+subset+" and its Sum is :"+sum);
		if(sum>req){
			
			t=subset.size();
			list.add(subset);
			 out.println(" Possible in this combination as sum is greater than requirement");%><br><%
			 out.println(" No of transaction in this case "+t);%><br><br><%
		}
		else{
			 out.println(" Therefore, it is not possible in this combination");%><br><br><%
		}
		
	}%>
	<h1>Displaying result of all possibilities</h1>

                                                                </tr><%
	for ( i = 0; i < list.size(); i++) { 
		%><br><br>
		<table border="1" width="600">
	                                                                <tr>
	                                                                    <th>Vendor Id</th>
	                                                                    <th>Vendor Name</th>
	                                                                    <th>Item name</th>
	                                                                    <th>Item Quantity</th>
	                                                                    <th>Cost per Quantity</th>
	                                                                    <th>Contact Number</th>
	                                                                   <th>Cost of purchase</th>
	                                                                    <th>Number of transaction</th> 

	                                                                </tr><%
        for (int j = 0; j < list.get(i).size(); j++) { 
        	req = Integer.parseInt(request.getParameter("quant"));
        	String sql1 ="select * from stock where item = '"+request.getParameter("name")+"' and item_qty='"+list.get(i).get(j)+"' ";
        	resultSet = statement.executeQuery(sql1);
			 
			 while(resultSet.next()){
				
				 %>
                                                                   <tr>
                                                                       <td>
                                                                           <%=resultSet.getString("vid") %>
                                                                       </td>
                                                                       <td>
                                                                           <%=resultSet.getString("vname") %>
                                                                       </td>
                                                                       <td>
                                                                           <%=resultSet.getString("item") %>
                                                                       </td>
                                                                       <td>
                                                                           <%=resultSet.getString("item_qty") %>
                                                                       </td>
                                                                       <td>
                                                                           <%=resultSet.getString("cost_qty") %>
                                                                       </td>
                                                                       <td>
                                                                           <%=resultSet.getString("contact") %>
                                                                       </td>

                                                                        <td>
                                                                           <%=resultSet.getInt("cost_qty")*req%>
                                                                       </td>
                                                                       <td>
                                                                           <%=list.get(i).size() %>
                                                                       </td>
                                                                   
                                                                   <%
                                                                   
                                 /* req= req-Integer.parseInt(request.getParameter("quant"));*/                                            
				 }
			 
        } 
	     %><br><%
        %></tr><%
        out.println(); 
    } 
                                                                                                             
    %> </table><%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
	
	
%>



                    </body>

                    </html>