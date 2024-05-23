<div id='post-upload'>
    <form>
        <div class='dropper-container'></div>

        <div class='control-strip'>
            <input type='submit' value='모두 업로드' class='submit'/>

            <span class='skip-duplicates'>
                <%= ctx.makeCheckbox({
                    text: '중복 건너뛰기',
                    name: 'skip-duplicates',
                    checked: false,
                }) %>
            </span>

            <span class='always-upload-similar'>
                <%= ctx.makeCheckbox({
                    text: '항상 비슷한 짤 업로드r',
                    name: 'always-upload-similar',
                    checked: false,
                }) %>
            </span>

            <span class='pause-remain-on-error'>
                <%= ctx.makeCheckbox({
                    text: '오류시 멈춤',
                    name: 'pause-remain-on-error',
                    checked: true,
                }) %>
            </span>

            <input type='button' value='취소' class='cancel'/>
        </div>

        <div class='messages'></div>

        <ul class='uploadables-container'></ul>
    </form>
</div>
