<div class='pool-list-header'>
    <form class='horizontal'>
        <ul class='input'>
            <li>
                <%= ctx.makeTextInput({text: 'Search query', id: 'search-text', name: 'search-text', value: ctx.parameters.query}) %>
            </li>
        </ul>

        <div class='buttons'>
            <input type='submit' value='Search'/>
            <a class='button append' href='<%- ctx.formatClientLink('help', 'search', 'pools') %>'>문법 도움말</a>

            <% if (ctx.canCreate) { %>
                <a class='append' href='<%- ctx.formatClientLink('pool', 'create') %>'>새 풀 만들기</a>
            <% } %>

            <% if (ctx.canEditPoolCategories) { %>
                <a class='append' href='<%- ctx.formatClientLink('pool-categories') %>'>풀 카테고리</a>
            <% } %>
        </div>
    </form>
</div>
