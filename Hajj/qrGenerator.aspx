<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qrGenerator.aspx.cs" Inherits="Hajj.qrGenerator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--from  https://github.com/jeromeetienne/jquery-qrcode--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script src="src/jquery.qrcode.js"></script>
    <script src="src/qrcode.js"></script>

    <%--from https://html2canvas.hertzen.com/--%>
    <script src="src/html2canvas.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <input type="button" id="Button1" value="generate" onclick="generateQR()" />

        </div>
        <div id="capture" style="width: 300px">
            sdssffs
            ffff
        <div id="qrcodeCanvas"></div>
        </div>
        <input type="button" id="Button2" value="Button" onclick="xx()" />
    </form>
    <script type="text/javascript">
        function generateQR() {
            var textcode = document.getElementById('<%= TextBox1.ClientID %>').value;
            jQuery('#qrcodeCanvas').qrcode({
                text: textcode
            });
        }


        function xx() {
            html2canvas(document.querySelector('#capture')).then(function (canvas) {

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
</body>
</html>
