<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="gen.aspx.cs" Inherits="Hajj.Contact" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

       
      <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">
              

                  <div class="col-lg-12">
                    <div class="card">
                      <div class="card-header">
                        <strong></strong> Form
                      </div>
                      <div class="card-body card-block">
                       <div class="form-group has-success">
                                        <label for="cc-name" class="control-label mb-1">ID of Holder</label>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control cc-name valid"></asp:TextBox>
                                        <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                    </div>
                                    <div class="form-group has-success">
                                        <label for="cc-name" class="control-label mb-1">Coins</label>
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control cc-name valid"></asp:TextBox>
                                        <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                    </div>

                                    <div class="form-group has-success">
                                          <div class="col-lg-6">
                                        <input type="button" id="Button1" value="generate" onclick="generateQR()" class="btn btn-lg btn-info btn-block" />
                                              </div>
                                      <div class="col-lg-6">
                                        <input type="button" id="Button2" value="Print" onclick="xx()" class="btn btn-lg btn-info btn-block" />
                                          </div>
                                    </div>
                      </div>
                      
                    </div>
                    
                       
                    </div>
                  </div>

                    

            </div><!-- .animated -->
        </div><!-- .content -->
 
 

    <div id="qrcodeCanvas" style="width: 300px; height: 300px;">
    </div>


    <%--from  https://github.com/jeromeetienne/jquery-qrcode--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script src="src/jquery.qrcode.js"></script>
    <script src="src/qrcode.js"></script>

    <%--from https://html2canvas.hertzen.com/--%>
    <script src="src/html2canvas.js"></script>

    <script type="text/javascript">

        function generateQR() {
            jQuery.noConflict(true);
            var textcode = document.getElementById('<%= TextBox1.ClientID %>').value;
            jQuery('#qrcodeCanvas').qrcode({
                text: textcode
            });
        }

        function xx() {
            html2canvas(document.querySelector('#qrcodeCanvas')).then(function (canvas) {

                console.log(canvas);
                saveAs(canvas.toDataURL(), 'file-name.png');
            });
        }


        function saveAs(uri, filename) {

            var link = document.createElement('a');

            if (typeof link.download === 'string') {

                link.href = uri;
                link.download = filename;

                //Firefox requires the link to be in the body
                document.body.appendChild(link);

                //simulate click
                link.click();

                //remove the link when done
                document.body.removeChild(link);

            } else {

                window.open(uri);

            }
        }
    </script>
</asp:Content>
