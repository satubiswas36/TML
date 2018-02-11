<%-- 
    Document   : supplier
    Created on : Feb 8, 2018, 2:22:50 PM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--         datatable-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>        
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
    </head>
    <body>
        <table class="table table-striped table-bordered" id="mydata">
            <thead>
            <th style="text-align: center">Id</th>
            <th style="text-align: center">Name</th>
            <th style="text-align: center">Address</th>
            <th style="text-align: left">Mobile1</th>
            <th style="text-align: center">Mobile2</th>                                               
            <th style="text-align: center">Date</th>                                               
            <th style="text-align: center">Update</th>                                               
        </thead>
        <tbody>
            <c:forEach var="supplier" items="${suppliers}">
                <tr>
                    <td>${supplier.supId}</td>
                    <td>${supplier.supName}</td>
                    <td>${supplier.supAddress}</td>
                    <td>${supplier.supContact01}</td>
                    <td>${supplier.supContact02}</td>
                    <td>${supplier.date}</td>
                    <td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#satu${supplier.supId}">Edit</button>
                        <!--            update model -->
                        <div id="satu${supplier.supId}" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Supplier Update</h4>
                                    </div>
                                    <div class="modal-body">
                                        <center>
                                            <table>
                                                <tr>
                                                    <td>ID    :</td>
                                                    <td><input type="text" name="customerid" id="supplierid${supplier.id}" value="${supplier.supId}" readonly=""/></td>
                                                </tr>
                                                <tr>
                                                    <td>Name :</td>
                                                    <td><input type="text" name="customername" id="supplier_name${supplier.id}" value="${supplier.supName}"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Address :</td>
                                                    <td><input type="text" name="customerid" id="supplier_address${supplier.id}" value="${supplier.supAddress}"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Mobile1 :</td>
                                                    <td><input type="text" name="customerid" id="supplier_mobile1${supplier.id}" value="${supplier.supContact01}"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Mobile2 :</td>
                                                    <td><input type="text" name="customerid" id="supplier_mobile2${supplier.id}" value="${supplier.supContact02}"/></td>
                                                </tr>                                                        
                                                <tr>
                                                    <td>Status :</td>
                                                    <td>
                                                        <select id="sup_status${supplier.id}">
                                                            <option value="${supplier.status}">${supplier.status}</option>
                                                            <option value="Active">Active</option>
                                                            <option value="Inactive">Inactive</option>
                                                        </select>
                                                    </td>
                                                </tr>

                                            </table>
                                        </center>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" onclick="saveUpdateSupplier(${supplier.id})">Save</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--            update model -->
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script>
        function saveUpdateSupplier(id) {
            var supId = $("#supplierid" + id).val();
            var supName = $("#supplier_name" + id).val();
            var supAddress = $("#supplier_address" + id).val();
            var supMobile1 = $("#supplier_mobile1" + id).val();
            var supMobile2 = $("#supplier_mobile2" + id).val();
            var supStatus = $("#sup_status" + id).val();

            //console.log(supName + " " + supAddress + " " + supMobile1 + " " + supMobile2 + " " + supStatus);
            $.ajax({
                type: 'POST',
                url: "updatesupplierbyid",
                data: {
                    "supId": supId,
                    "supName": supName,
                    "supAddress": supAddress,
                    "supMobile1": supMobile1,
                    "supMobile2": supMobile2,
                    "supStatus": supStatus
                },
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus+errorThrown);
                }
            });
        }
    </script>
    <script>
        $("#mydata").dataTable({
            "pagingType": "simple_numbers",
            language: {
                search: "_INPUT_",
                searchPlaceholder: "Search..."
            }
        });
    </script>
</body>
</html>
