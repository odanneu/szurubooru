<div class='pool-merge'>
    <form>
        <ul class='input'>
            <li class='target'>
                <%= ctx.makeTextInput({name: 'target-pool', required: true, text: 'Target pool', pattern: ctx.poolNamePattern}) %>
            </li>

            <li>
                <p>두 풀의 포스트들이 결합됩니다. 카테고리는 직접 수정해야합니다.</p>

                <%= ctx.makeCheckbox({required: true, text: '이 풀을 병합하는 것을 확인합니다.'}) %>
            </li>
        </ul>

        <div class='messages'></div>

        <div class='buttons'>
            <input type='submit' value='풀 병합'/>
        </div>
    </form>
</div>
