<div class='content-wrapper' id='pool'>
    <h1><%- ctx.getPrettyName(ctx.pool.names[0]) %></h1>
    <nav class='buttons'><!--
        --><ul><!--
            --><li data-name='summary'><a href='<%- ctx.formatClientLink('pool', ctx.pool.id) %>'>요약</a></li><!--
            --><% if (ctx.canEditAnything) { %><!--
                --><li data-name='edit'><a href='<%- ctx.formatClientLink('pool', ctx.pool.id, 'edit') %>'>편집</a></li><!--
            --><% } %><!--
            --><% if (ctx.canMerge) { %><!--
                --><li data-name='merge'><a href='<%- ctx.formatClientLink('pool', ctx.pool.id, 'merge') %>'>병합&hellip;</a></li><!--
            --><% } %><!--
            --><% if (ctx.canDelete) { %><!--
                --><li data-name='delete'><a href='<%- ctx.formatClientLink('pool', ctx.pool.id, 'delete') %>'>삭제</a></li><!--
            --><% } %><!--
        --></ul><!--
    --></nav>
    <div class='pool-content-holder'></div>
</div>
