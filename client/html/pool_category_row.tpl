<% if (ctx.poolCategory.isDefault) { %><%
    %><tr data-category='<%- ctx.poolCategory.name %>' class='default'><%
%><% } else { %><%
    %><tr data-category='<%- ctx.poolCategory.name %>'><%
%><% } %>
    <td class='name'>
        <% if (ctx.canEditName) { %>
            <%= ctx.makeTextInput({value: ctx.poolCategory.name, required: true}) %>
        <% } else { %>
            <%- ctx.poolCategory.name %>
        <% } %>
    </td>
    <td class='color'>
        <% if (ctx.canEditColor) { %>
            <%= ctx.makeColorInput({value: ctx.poolCategory.color}) %>
        <% } else { %>
            <%- ctx.poolCategory.color %>
        <% } %>
    </td>
    <td class='usages'>
        <% if (ctx.poolCategory.name) { %>
            <a href='<%- ctx.formatClientLink('pools', {query: 'category:' + ctx.poolCategory.name}) %>'>
                <%- ctx.poolCategory.poolCount %>
            </a>
        <% } else { %>
            <%- ctx.poolCategory.poolCount %>
        <% } %>
    </td>
    <% if (ctx.canDelete) { %>
        <td class='remove'>
            <% if (ctx.poolCategory.poolCount) { %>
                <a class='inactive' title="Can't delete category in use">삭제</a>
            <% } else { %>
                <a href>삭제</a>
            <% } %>
        </td>
    <% } %>
    <% if (ctx.canSetDefault) { %>
        <td class='set-default'>
            <a href>기본으로 설정</a>
        </td>
    <% } %>
</tr>
