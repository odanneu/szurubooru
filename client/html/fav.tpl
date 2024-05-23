<% if (ctx.canFavorite) { %>
    <% if (ctx.ownFavorite) { %>
        <a href class='remove-favorite'>
            <i class='fa fa-heart'></i>
    <% } else { %>
        <a href class='add-favorite'>
            <i class='fa fa-heart-o'></i>
    <% } %>
<% } else { %>
    <a class='add-favorite inactive'>
        <i class='fa fa-heart-o'></i>
<% } %>
    <span class='vim-nav-hint'>즐겨찾기에 추가</span>
</a>
<span class='value'><%- ctx.favoriteCount %></span>
