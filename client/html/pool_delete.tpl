<div class='pool-delete'>
    <form>
        <p>이 풀은 <a href='<%- ctx.formatClientLink('posts', {query: 'pool:' + ctx.pool.id}) %>'><%- ctx.pool.postCount %> 개의 포스트를 가지고 있습니다</a>.</p>

        <ul class='input'>
            <li>
                <%= ctx.makeCheckbox({
                    name: 'confirm-deletion',
                    text: '이 풀을 삭제하는 것을 확인합니다.',
                    required: true,
                }) %>
            </li>
        </ul>

        <div class='messages'></div>

        <div class='buttons'>
            <input type='submit' value='풀 지우기'/>
        </div>
    </form>
</div>
