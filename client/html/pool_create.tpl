<div class='content-wrapper pool-create'>
    <form>
        <ul class='input'>
            <li class='names'>
                <%= ctx.makeTextInput({
                    text: '제목',
                    value: '',
                    required: true,
                }) %>
            </li>
            <li class='category'>
                <%= ctx.makeSelect({
                    text: '카테고리',
                    keyValues: ctx.categories,
                    selectedKey: 'default',
                    required: true,
                }) %>
            </li>
            <li class='description'>
                <%= ctx.makeTextarea({
                    text: '설명',
                    value: '',
                }) %>
            </li>
            <li class='posts'>
                <%= ctx.makeTextInput({
                    text: '포스트',
                    value: '',
                    placeholder: '띄어쓰기로 포스트 ID 구분',
                }) %>
            </li>
        </ul>

        <% if (ctx.canCreate) { %>
            <div class='messages'></div>

            <div class='buttons'>
                <input type='submit' class='save' value='Create pool'>
            </div>
        <% } %>
    </form>
</div>
