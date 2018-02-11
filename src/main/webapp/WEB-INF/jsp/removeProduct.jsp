<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Remove Product</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        
        <!------------------- select2-------------------------------->
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2.min.css" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2.min.js"></script>
        <!------------------- select2----------end---------------------->        
        <script>
            $(document).ready(function () {
                $("#btnSubmit").click(function () {
                    $.post("valuereceive", {productName: "", productQty: ""}, function () {

                    });
                    window.location.reload();
                });
            });
        </script>
    </head>
    <body>
        <h1>Hi</h1>

        <div class="container">            
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Remove Product</button>
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" id="hjk">&times;</button>
                            <h4 class="modal-title">Remove</h4>
                        </div>
                        <div class="modal-body">
                            <span id="select2Form">
                                <table class="table table-striped" style="width: 80%">
                                    <tr>
                                        <td>
                                            <select name="productName" id="productName"  class="form-control select2-select productName"
                                                    data-placeholder="Select Item" style="height: 40px;" required="">
                                                <option></option>
                                                <c:forEach items="${plist}" var="productList">
                                                    <option value="${productList.name}">${productList.name}</option>
                                                </c:forEach>
                                            </select>
                                        </td>                                        
                                    </tr>                                    
                                    <tr>
                                        <td><input type="text" name="proQty" id="productQty" style="width: 100%; border-radius: 5px; padding-left: 5px;" placeholder="Qty" onkeyup="if (/\D/g.test(this.value))
                                                    this.value = this.value.replace(/\D/g, '')" required=""/></td>
                                    </tr>
                                    <tr>
                                        <td><span id="qtyerror" style="color: red"></span></td>
                                    </tr>
                                    <tr>
                                        <td><button class="add" id="add">add</button></td>
                                    </tr>
                                </table>                                
                            </span>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
        <form action="javascript:void(0)">
            <fieldset id="buildyourform">                
                <legend>Build your own form!</legend>

            </fieldset>
            <button id="btnSubmit">OK</button>
        </form>

        <script>
            var productMap = new Map();
            $(document).ready(function () {
                (function () {
                    $.post("clearmap", {productName: "", productQty: ""}, function () {

                    });
                    $("#btnSubmit").hide();
                })();
                $("#add").click(function () {
                    var productName = $("#productName").val();
                    var productQty = $("#productQty").val();
                    var productNameLength = productName.length;
                    var productQtyLength = productQty.length;
                    var productnameforclass;
                    console.log(isNaN(productQty) + " product qty");
                    if ((productNameLength > 0 && productQtyLength > 0) && !isNaN(productQty)) {
                        if (!productMap.has(productName)) {
                            productnameforclass = productName.replace(/ /g, "_");
                            console.log(productnameforclass);

                            productMap.set(productName, productQty);
                            var lastField = $("#buildyourform div:last");
                            var intId = (lastField && lastField.length && lastField.data("idx") + 1) || 1;
                            console.log(intId);
                            var fieldWrapper = $("<div class=\"fieldwrapper\" id=\"field" + intId + "\"/>");
                            fieldWrapper.data("idx", intId);
                            var fName = $("<input type=\"text\" class=\"productName" + intId + "\" value=\"" + productName + "\"/>");
                            var pQty = $("<input type=\"text\" class=\"productQuantity" + productnameforclass + "\" value=\"" + productQty + "\"/>");

                            var removeButton = $("<input type=\"button\" class=\"remove\" value=\"X\" />");
                            removeButton.click(function () {
                                $.post("removeqtyfrommap", {productName: productName, productQty: productQty}, function () {

                                });
                                productMap.delete(productName);
                                var s = productMap.size;
                                if (s > 0) {
                                    $("#btnSubmit").show("slow");
                                    console.log('boor');
                                } else {
                                    $("#btnSubmit").hide();
                                }
                                $(this).parent().remove();
                            });
                            fieldWrapper.append(fName);
                            fieldWrapper.append(pQty);
                            fieldWrapper.append(removeButton);

                            $("#buildyourform").append(fieldWrapper);
                            $.post("valuereceive", {productName: productName, productQty: productQty}, function () {

                            });
                            $("#productQty").val('');
                            var s = productMap.size;
                            if (s > 0) {
                                $("#btnSubmit").show("slow");
                                console.log('boor');
                            } else {
                                $("#btnSubmit").hide();
                            }
                        } else {
                            productnameforclass = productName.replace(/ /g, "_");
                            console.log('ace');
                            console.log(productnameforclass);
                            var exitProductQty = productMap.get(productName);
                            console.log(exitProductQty);
                            var totalQty = +productQty + +exitProductQty;
                            console.log(totalQty);
                            $.post("valuereceive", {productName: productName, productQty: productQty}, function () {

                            });
                            $(".productQuantity" + productnameforclass).val(totalQty);
                            productMap.set(productName, totalQty);
                            $("#productQty").val('');
                        }

                    } else {
                        $("#qtyerror").text('Every field is required');
                    }
                });

                $("#preview").click(function () {
                    $("#yourform").remove();
                    var fieldSet = $("<fieldset id=\"yourform\"><legend>Your Form</legend></fieldset>");
                    $("#buildyourform div").each(function () {
                        var id = "input" + $(this).attr("id").replace("field", "");
                        var label = $("<label for=\"" + id + "\">" + $(this).find("input.fieldname").first().val() + "</label>");
                        fieldSet.append(label);
                    });
                    $("body").append(fieldSet);
                });
            });

            $(document).ready(function () {
                $('#select2Form')
                        .find('[name="productName"]')
                        .select2();
            });
            // enter qty and check it available or not
            $("#productQty").keyup(function () {
                var productName = $("#productName").val();
                var productQty = $("#productQty").val();

                if (productName.length > 0 && productQty.length > 0) {
                    if (isNaN(productQty)) {
                        $("#qtyerror").text('Digit only');
                        $(".add").hide("slow");
                    } else {
                        $.ajax({
                            type: 'POST',
                            url: "checkqtywithdatabase",
                            data: {
                                productName: productName,
                                productQty: productQty
                            },
                            success: function (data, textStatus, jqXHR) {
                                var finData = data;
                                $("#qtyerror").text(data);
                                if (finData === 'Not Available') {
                                    $(".add").hide("slow");
                                } else {
                                    $(".add").show("slow");
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("error " + textStatus + " " + errorThrown + " jqxhr " + jqXHR);
                            }
                        });
                    }
                }
            });

            $("#productName").change(function () {

                var productName = $("#productName").val();
                var productQty = $("#productQty").val();

                if (productName.length > 0 && productQty.length > 0) {
                    if (isNaN(productQty)) {
                        $("#qtyerror").text('Digit only');
                        $(".add").hide("slow");
                    } else {
                        $.ajax({
                            type: 'POST',
                            url: "checkqtywithdatabase",
                            data: {
                                productName: productName,
                                productQty: productQty
                            },
                            success: function (data, textStatus, jqXHR) {
                                var finData = data;
                                $("#qtyerror").text(data);
                                if (finData === 'Not Available') {
                                    $(".add").hide("slow");
                                } else {
                                    $(".add").show("slow");
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("error " + textStatus + " " + errorThrown + " jqxhr " + jqXHR);
                            }
                        });
                    }
                }
            });
            console.log(productMap.length);
        </script>
    </body>
</html>
