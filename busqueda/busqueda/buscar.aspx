<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buscar.aspx.cs" Inherits="busqueda.buscar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/sweetalert-dev.js"></script>
        <script src="dist/sweetalert.min.js"></script>
 <link rel="stylesheet" type="text/css" href="dist/sweetalert.css"/>
    <title></title>
    
   
</head>
<body >
    <form id="form1" runat="server" class="container" >

    <div align="center"  class="col-lg-8 " >
        Buscar por: radicado salida <asp:TextBox runat="server" ID="txtnumero" CssClass="form-control" OnTextChanged="Unnamed1_TextChanged" ></asp:TextBox>
       
        <br />
        <br />
        Buscar por: radicado entrada<br />
        <asp:TextBox ID="txtentrada" runat="server" CssClass="form-control" OnTextChanged="txtentrada_TextChanged"></asp:TextBox>
       
       <br />
         Fecha<br />
&nbsp;desde<asp:TextBox runat="server" TextMode="Date" CssClass="form-group"></asp:TextBox><span class="glyphicon glyphicon-calendar" ></span> hasta<asp:TextBox runat="server" TextMode="Date" CssClass="form-group"></asp:TextBox><span class="glyphicon glyphicon-calendar" ></span>
    <br />
        <asp:Button  runat="server" CssClass="btn btn-primary" Text="buscar" ID="btnbuscar2" />

        <br />
        <br />
        <asp:GridView ID="gdbusqueda" runat="server" CssClass="table table-responsive" Font-Size="Small" AllowPaging="True" CellPadding="4"  PageSize="30"  OnSelectedIndexChanging="gdbusqueda_SelectedIndexChanging" OnPageIndexChanging="gdbusqueda_PageIndexChanging" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowSorting="True"  style="margin-top: 0px" OnSelectedIndexChanged="gdbusqueda_SelectedIndexChanged"   >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="AÑO" HeaderText="AÑO" SortExpression="AÑO" Visible="False" />
                <asp:TemplateField HeaderText="RADICADO" SortExpression="RADICADO">
                     <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("RADICADO") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ASUNTO" HeaderText="ASUNTO" SortExpression="ASUNTO" />
                <asp:BoundField DataField="FOLIOS" HeaderText="FOLIOS" SortExpression="FOLIOS" />
                <asp:BoundField DataField="NOMBRES" HeaderText="NOMBRES" SortExpression="NOMBRES" />
                <asp:BoundField DataField="APELLIDOS" HeaderText="APELLIDOS" SortExpression="APELLIDOS" />
                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                <asp:BoundField DataField="NOMBRE_T_DOC" HeaderText="NOMBRE_T_DOC" SortExpression="NOMBRE_T_DOC" />
                <asp:BoundField DataField="NOMBRE_ANEXO" HeaderText="NOMBRE_ANEXO" SortExpression="NOMBRE_ANEXO" />
                <asp:BoundField DataField="ANEXOS" HeaderText="ANEXOS" SortExpression="ANEXOS" />
                <asp:BoundField DataField="DIRIGIDO" HeaderText="DIRIGIDO" SortExpression="DIRIGIDO" />
             <%--   <asp:TemplateField HeaderText="ARCHIVO">
                    <ItemTemplate>
                        
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="Button1" runat="server"  Text="guardar" CommandArgument='<%#Container.DataItemIndex %>' OnClick="Button1_Click"   />
                        
                      </ItemTemplate>
                                      

                </asp:TemplateField >--%>
               
               
              
           
                    <asp:ButtonField DataTextField="RADICADO" Text="RADICADO"  CommandName="Select"/>
               
               
              
           
                    </Columns> 
            <EditRowStyle BorderStyle="Solid" BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" BorderStyle="Solid" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" CssClass="table table-responsive" Font-Size="Small" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                 <asp:TemplateField HeaderText="ARCHIVO">
                    <ItemTemplate>
                        
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="Button1" runat="server"  Text="guardar" CommandArgument='<%#Container.DataItemIndex %>' OnClick="Button1_Click"   />
                        
                      </ItemTemplate>
                                      

                </asp:TemplateField >
            </Columns>


            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />


        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gc1ConnectionString %>" SelectCommand="BUSCARRE" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtnumero" Name="yy" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Ruta"></asp:Label>
        <br />
        <br />
        <br />
        <br />

    </div>
    </form>
</body>
</html>
