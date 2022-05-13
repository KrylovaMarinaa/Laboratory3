<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Laboratory3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Id" DataSourceID="SqlDataSource1" BorderColor="#003300" BorderStyle="Solid" BorderWidth="3px" CellPadding="3" CellSpacing="3" Font-Bold="False" Font-Italic="False" Font-Names="Microsoft Sans Serif" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" ForeColor="Black" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Имя" SortExpression="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Фамилия" SortExpression="Surname" />
                    <asp:BoundField DataField="YearOfBirth" HeaderText="Год рождения" ReadOnly="True" SortExpression="YearOfBirth" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Добавить Заказчика" BackColor="#003300" Font-Names="Microsoft Sans Serif" Font-Strikeout="False" ForeColor="White" />
            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Редактировать заказчика" BackColor="#003300" Font-Names="Microsoft Sans Serif" Font-Size="Small" ForeColor="White" />
            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" style="margin-bottom: 0px" Text="Удалить заказчика" BackColor="#003300" Font-Names="Microsoft Sans Serif" ForeColor="White" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3DBConnectionString %>" DeleteCommand="Delete from Customers where Id=@Id
Delete from Orders where Orders.IdCust = @Id" InsertCommand="Insert into Customers (Name,Surname,YearOfBirth) values (@Name,@Surname,@YearOfBirth)" SelectCommand="SELECT * FROM [Customers]" UpdateCommand="Update Customers set Name=@Name, Surname=@Surname,YearOfBirth=@YearOfBirth where Id=@Id" OnSelecting="SqlDataSource1_Selecting">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox4" Name="Name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox5" Name="Surname" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox6" Name="YearOfBirth" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Name" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="Surname" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="YearOfBirth" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Panel ID="Panel2" runat="server" Visible="False" Font-Names="Microsoft Sans Serif" Font-Overline="False" Font-Size="Small">
                <br />
                Имя:<asp:TextBox ID="TextBox4" runat="server" BackColor="#CCFFCC"></asp:TextBox>
                <br />
                <br />
                Фамилия:<asp:TextBox ID="TextBox5" runat="server" BackColor="#CCFFCC"></asp:TextBox>
                <br />
                <br />
                Год рождения:<asp:TextBox ID="TextBox6" runat="server" BackColor="#CCFFCC"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Добавить" BackColor="#003300" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Отменить" BackColor="#003300" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                <br />
                <br />
            </asp:Panel>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" BorderColor="#003300" BorderStyle="Solid" BorderWidth="3px" CellPadding="3" CellSpacing="3" Font-Names="Microsoft Sans Serif" ForeColor="Black" GridLines="None" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Название товара" SortExpression="Title" />
                    <asp:BoundField DataField="IdCust" HeaderText="Номер заказчика" ReadOnly="True" ShowHeader="False" SortExpression="IdCust" />
                    <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                    <asp:BoundField DataField="Quant" HeaderText="Количество" SortExpression="Quant" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3DBConnectionString %>" DeleteCommand="Delete from Orders where Id=@Id" InsertCommand="Insert into Orders (Title,IdCust,Price,Quant) values (@Title,@IdCust,@Price,@Quant)" SelectCommand="SELECT * FROM [Orders] WHERE ([IdCust] = @IdCust)" UpdateCommand="Update Orders set Title=@Title, IdCust=@IdCust,Price=@Price,Quant=@Quant where Id=@Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GridView1" Name="IdCust" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Price" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox3" Name="Quant" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="IdCust" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="Title" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="IdCust" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Price" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Quant" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Добавить заказ" BackColor="#003300" Font-Names="Microsoft Sans Serif" ForeColor="White" />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Редактировать заказы" BackColor="#003300" Font-Names="Microsoft Sans Serif" ForeColor="White" />
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Удалить заказ" BackColor="#003300" Font-Names="Microsoft Sans Serif" ForeColor="White" />
        </div>
        <asp:Panel ID="Panel1" runat="server" Visible="False" Font-Names="Microsoft Sans Serif" Font-Size="Small">
            <br />
            Название товара:<asp:TextBox ID="TextBox1" runat="server" BackColor="#CCFFCC"></asp:TextBox>
            <br />
            <br />
            Цена:<asp:TextBox ID="TextBox2" runat="server" BackColor="#CCFFCC"></asp:TextBox>
            <br />
            <br />
            Количество:<asp:TextBox ID="TextBox3" runat="server" BackColor="#CCFFCC"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Добавить" BackColor="#003300" Font-Names="Microsoft Sans Serif" ForeColor="White" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Отменить" BackColor="#003300" Font-Names="Microsoft Sans Serif" ForeColor="White" />
            <br />
        </asp:Panel>
    </form>
</body>
</html>
