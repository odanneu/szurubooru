<div class='content-wrapper pool-edit'>
    <form>
        <ul class='input'>
            <li class='names'>
                <% if (ctx.canEditNames) { %>
                    <%= ctx.makeTextInput({
                        text: '제목',
                        value: ctx.pool.names.join(' '),
                        required: true,
                    }) %>
                <% } %>
            </li>
            <li class='category'>
                <% if (ctx.canEditCategory) { %>
                    <%= ctx.makeSelect({
                        text: '카테고리',
                        keyValues: ctx.categories,
                        selectedKey: ctx.pool.category,
                        required: true,
                    }) %>
                <% } %>
            </li>
            <li class='description'>
                <% if (ctx.canEditDescription) { %>
                    <%= ctx.makeTextarea({
                        text: '설명',
                        value: ctx.pool.description,
                    }) %>
                <% } %>
            </li>
            <li class='posts'>
                <% if (ctx.canEditPosts) { %>
                    <%= ctx.makeTextInput({
                        text: '포스트',
                        placeholder: '띄어쓰기로 포스트 ID 구분',
                        value: ctx.pool.posts.map(post => post.id).join(' ')
                    }) %>
                <% } %>
            </li>
        </ul>

        <% if (ctx.canEditAnything) { %>
            <div class='messages'></div>

            <div class='buttons'>
                <input type='submit' class='save' value='변경사항 저장'>
            </div>
        <% } %>
    </form>
</div>
