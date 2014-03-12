﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="ContosoUniversity.Students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:HyperLink NavigateUrl="~/AddStudent.aspx" Text="Add New Student" runat="server" />
    
    <br /><br />
    <asp:Label runat="server" Text="Show:" />
    <asp:DropDownList runat="server" AutoPostBack="true" ID="DisplayYear">
        <asp:ListItem Text="All" Value="" />
        <asp:ListItem Text="Freshman"/>
        <asp:ListItem Text="Sophomore" />
        <asp:ListItem Text="Junior" />
        <asp:ListItem Text="Senior" />
    </asp:DropDownList>
    <asp:ValidationSummary ShowModelStateErrors="true" runat="server" />
    
    <asp:GridView runat="server" ID="studentsGrid" 
        ItemType="ContosoUniversity.Models.Student" 
        DataKeyNames="StudentID" 
        SelectMethod="studentsGrid_GetData" 
        UpdateMethod="studentsGrid_UpdateItem" 
        DeleteMethod="studentsGrid_DeleteItem" 
        AutoGenerateEditButton="false" 
        AutoGenerateDeleteButton="true"
        AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true" PageSize="4">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="StudentID" DataNavigateUrlFormatString="editStudent.aspx?studentID={0}" Text="Edit" />
            <asp:DynamicField DataField="StudentID" />
            <asp:DynamicField DataField="LastName" />
            <asp:DynamicField DataField="FirstName" />
            <asp:DynamicField DataField="Year" />
            <asp:DynamicField DataField="EnrollmentDate" />
            <asp:TemplateField HeaderText="Total Credits">
                <ItemTemplate>
                    <asp:Label Text="<%# Item.Enrollments.Sum(en => en.Course.Credits) %>" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField Text="Courses" 
                DataNavigateUrlFormatString="~/Courses.aspx?StudentID={0}" 
                DataNavigateUrlFields="StudentID" />
        </Columns>
    </asp:GridView>
</asp:Content>
