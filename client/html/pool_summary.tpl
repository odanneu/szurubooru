<div class='content-wrapper pool-summary'>
    <section class='details'>
        <section>
            카테고리:
            <span class='<%= ctx.makeCssName(ctx.pool.category, 'pool') %>'><%- ctx.pool.category %></span>
        </section>

        <section>
        별칭:<br/>
        <ul><!--
            --><% for (let name of ctx.pool.names.slice(1)) { %><!--
                --><li><%= ctx.makePoolLink(ctx.pool.id, false, false, ctx.pool, name) %></li><!--
            --><% } %><!--
        --></ul>
        </section>
    </section>

    <section class='description'>
        <hr/>
        <%= ctx.makeMarkdown(ctx.pool.description || 'This pool has no description yet.') %>
        <p>이 풀은 <a href='<%- ctx.formatClientLink('posts', {query: 'pool:' + ctx.pool.id}) %>'><%- ctx.pool.postCount %> 개의 포스트가 있습니다</a>.</p>
    </section>
</div>
