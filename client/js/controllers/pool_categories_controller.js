"use strict";

const api = require("../api.js");
const pools = require("../pools.js");
const PoolCategoryList = require("../models/pool_category_list.js");
const topNavigation = require("../models/top_navigation.js");
const PoolCategoriesView = require("../views/pool_categories_view.js");
const EmptyView = require("../views/empty_view.js");

class PoolCategoriesController {
    constructor() {
        if (!api.hasPrivilege("poolCategories:list")) {
            this._view = new EmptyView();
            this._view.showError(
                "풀 카테고리를 볼 권한이 없습니다."
            );
            return;
        }

        topNavigation.activate("pools");
        topNavigation.setTitle("풀 목록");
        PoolCategoryList.get().then(
            (response) => {
                this._poolCategories = response.results;
                this._view = new PoolCategoriesView({
                    poolCategories: this._poolCategories,
                    canEditName: api.hasPrivilege("poolCategories:edit:name"),
                    canEditColor: api.hasPrivilege(
                        "poolCategories:edit:color"
                    ),
                    canDelete: api.hasPrivilege("poolCategories:delete"),
                    canCreate: api.hasPrivilege("poolCategories:create"),
                    canSetDefault: api.hasPrivilege(
                        "poolCategories:setDefault"
                    ),
                });
                this._view.addEventListener("submit", (e) =>
                    this._evtSubmit(e)
                );
            },
            (error) => {
                this._view = new EmptyView();
                this._view.showError(error.message);
            }
        );
    }

    _evtSubmit(e) {
        this._view.clearMessages();
        this._view.disableForm();
        this._poolCategories.save().then(
            () => {
                pools.refreshCategoryColorMap();
                this._view.enableForm();
                this._view.showSuccess("변경 저장됨.");
            },
            (error) => {
                this._view.enableForm();
                this._view.showError(error.message);
            }
        );
    }
}

module.exports = (router) => {
    router.enter(["pool-categories"], (ctx, next) => {
        ctx.controller = new PoolCategoriesController(ctx, next);
    });
};
