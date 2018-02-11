
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--         datatable-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>        
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
    </head>
    <body>
        <div class="container">            
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Customer Registration</button>
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" id="hjk">&times;</button>
                            <h4 class="modal-title">Remove</h4>
                        </div>
                        <div class="modal-body">
                            <center>
                                <form action="javascript:void(0)" method="post">
                                    <table>
                                        <tr>
                                            <td>Name   :</td>
                                            <td><input type="text" name="custName" id="custName"/></td>
                                        </tr>
                                        <tr>
                                            <td>Address   :</td>
                                            <td><input type="text" name="custAddress" id="custAddress"/></td>
                                        </tr>
                                        <tr>
                                            <td>Mobile1   :</td>
                                            <td><input type="text" name="contactNumber01" id="contactNumber01"/></td>
                                        </tr>
                                        <tr>
                                            <td>Mobile2   :</td>
                                            <td><input type="text" name="contactNumber02" id="contactNumber02"/></td>
                                        </tr>
                                    </table>
                                </form>
                            </center>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" value="Submit" id="btnSubmit"/>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-bordered" id="mydata">
                <thead>
                <th style="text-align: center">Customer id</th>
                <th style="text-align: center">Customer Name</th>
                <th style="text-align: center">Address</th>
                <th style="text-align: left">Mobile1</th>
                <th style="text-align: center">Mobile2</th>                                               
                <th style="text-align: center">Date</th>                                               
                <th style="text-align: center">Update</th>                                               
                </thead>                
                <tbody>
                    <c:forEach var="customer" items="${customers}">
                        <tr>
                            <td>${customer.custId}</td>
                            <td>${customer.custName}</td>
                            <td>${customer.custAddress}</td>
                            <td>${customer.contactNumber01}</td>
                            <td>${customer.contactNumber02}</td>
                            <td>${customer.date}</td>
<!--                            <td><button class="update" value="${customer.id}">${customer.id}</button></td>-->
<!--                            <td><button type="button" id="ss${customer.id}" onclick="updateValue(${customer.id})">${customer.id}</button></td>-->
                            <td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#satu${customer.custId}">Edit</button>
                                <!--            update model -->
                                <div id="satu${customer.custId}" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Customer Update</h4>
                                            </div>
                                            <div class="modal-body">
                                                <center>
                                                    <table>
                                                        <tr>
                                                            <td>ID    :</td>
                                                            <td><input type="text" name="customerid" id="customerid${customer.id}" value="${customer.custId}" readonly=""/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Name :</td>
                                                            <td><input type="text" name="customername" id="customer_name${customer.id}" value="${customer.custName}"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Address :</td>
                                                            <td><input type="text" name="customerid" id="customer_address${customer.id}" value="${customer.custAddress}"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Mobile1 :</td>
                                                            <td><input type="text" name="customerid" id="customer_mobile1${customer.id}" value="${customer.contactNumber01}"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Mobile2 :</td>
                                                            <td><input type="text" name="customerid" id="customer_mobile2${customer.id}" value="${customer.contactNumber02}"/></td>
                                                        </tr>                                                        
                                                        <tr>
                                                            <td>Status :</td>
                                                            <td>
                                                                <select id="cus_status${customer.id}">
                                                                    <option value="${customer.status}">${customer.status}</option>
                                                                    <option value="Active">Active</option>
                                                                    <option value="Inactive">Inactive</option>
                                                                </select>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </center>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" onclick="saveUpdateCustomer(${customer.id})">Save</button>
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

        </div>
        <script>
            $(document).ready(function () {
                $("#btnSubmit").click(function () {
                    var cusName = $("#custName").val();
                    var cusAddress = $("#custAddress").val();
                    var cusMobile1 = $("#contactNumber01").val();
                    var cusMobile2 = $("#contactNumber02").val();

                    $.ajax({
                        type: 'POST',
                        url: "customer",
                        data: {
                            "cusName": cusName,
                            "cusAddress": cusAddress,
                            "cusMobile1": cusMobile1,
                            "cusMobile2": cusMobile2
                        },
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                        }
                    });
                });

            });

            function saveUpdateCustomer(id) {
                var cus_id = $("#customerid" + id).val();
                var cus_name = $("#customer_name" + id).val();
                var cus_address = $("#customer_address" + id).val();
                var cus_mobile1 = $("#customer_mobile1" + id).val();
                var cus_mobile2 = $("#customer_mobile2" + id).val();
                var cus_status = $("#cus_status" + id).val();
                console.log("cus name : " + cus_name + " cus address : " + cus_address + " cus Mobile : " + cus_mobile1 + " cus mobile2 : " + cus_mobile2 + " cus status : " + cus_status);

                $.ajax({
                    type: 'POST',
                    url: "customerupdatebyid",
                    data: {
                        "cus_id": cus_id,
                        "cus_name": cus_name,
                        "cus_address": cus_address,
                        "cus_mobile1": cus_mobile1,
                        "cus_mobile2": cus_mobile2,
                        "cus_status": cus_status
                    },
                    success: function (data, textStatus, jqXHR) {
                        //alert(data);
                        window.location.reload();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
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
