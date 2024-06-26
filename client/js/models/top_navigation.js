"use strict";

const events = require("../events.js");
const api = require("../api.js");

class TopNavigationItem {
    constructor(accessKey, title, url, available, imageUrl) {
        this.accessKey = accessKey;
        this.title = title;
        this.url = url;
        this.available = available === undefined ? true : available;
        this.imageUrl = imageUrl === undefined ? null : imageUrl;
        this.key = null;
    }
}

class TopNavigation extends events.EventTarget {
    constructor() {
        super();
        this.activeItem = null;
        this._keyToItem = new Map();
        this._items = [];
    }

    getAll() {
        return this._items;
    }

    get(key) {
        if (!this._keyToItem.has(key)) {
            throw `키 ${key} 에 해당하는 아이템이 존재하지 않습니다.`;
        }
        return this._keyToItem.get(key);
    }

    add(key, item) {
        item.key = key;
        if (this._keyToItem.has(key)) {
            throw `키 ${key} 에 해당하는 아이템 이미 추가되어 있습니다.`;
        }
        this._keyToItem.set(key, item);
        this._items.push(item);
    }

    activate(key) {
        this.activeItem = null;
        this.dispatchEvent(
            new CustomEvent("activate", {
                detail: {
                    key: key,
                    item: key ? this.get(key) : null,
                },
            })
        );
    }

    setTitle(title) {
        api.fetchConfig().then(() => {
            document.oldTitle = null;
            document.title = api.getName() + (title ? " – " + title : "");
        });
    }

    showAll() {
        for (let item of this._items) {
            item.available = true;
        }
    }

    show(key) {
        this.get(key).available = true;
    }

    hide(key) {
        this.get(key).available = false;
    }
}

function _makeTopNavigation() {
    const ret = new TopNavigation();
    ret.add("home", new TopNavigationItem("H", "대문", ""));
    ret.add("posts", new TopNavigationItem("P", "짤", "posts"));
    ret.add("upload", new TopNavigationItem("U", "업로드", "upload"));
    ret.add("comments", new TopNavigationItem("C", "댓글", "comments"));
    ret.add("tags", new TopNavigationItem("T", "태그", "tags"));
    ret.add("pools", new TopNavigationItem("O", "풀", "pools"));
    ret.add("users", new TopNavigationItem("S", "사용자", "users"));
    ret.add("account", new TopNavigationItem("A", "계정", "user/{me}"));
    ret.add("register", new TopNavigationItem("R", "가입", "register"));
    ret.add("login", new TopNavigationItem("L", "로그인", "login"));
    ret.add("logout", new TopNavigationItem("O", "로그아웃", "logout"));
    ret.add("help", new TopNavigationItem("E", "정보", "help"));
    ret.add(
        "settings",
        new TopNavigationItem(null, "<i class='fa fa-cog'></i>", "settings")
    );
    return ret;
}

module.exports = _makeTopNavigation();
