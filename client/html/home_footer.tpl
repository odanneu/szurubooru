<ul>
    <li>현재 총 <%- ctx.postCount %> 개의 짤 수집됨</li><span class='sep'>
    </span><li><%= ctx.makeFileSize(ctx.diskUsage) %></li><span class='sep'>
    </span><li>빌드 <a class='version' href='https://github.com/odanneu/szurubooru'><%- ctx.version %></a><%- ctx.isDevelopmentMode ? " (DEV MODE)" : "" %> from <%= ctx.makeRelativeTime(ctx.buildDate) %></li><span class='sep'>
    </span><% if (ctx.canListSnapshots) { %><li><a href='<%- ctx.formatClientLink('history') %>'>수정 목록</a></li><span class='sep'>
    </span><% } %>
</ul>
