; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88702 () Bool)

(assert start!88702)

(declare-fun b!1018933 () Bool)

(declare-fun e!573386 () Bool)

(declare-datatypes ((B!1676 0))(
  ( (B!1677 (val!11922 Int)) )
))
(declare-datatypes ((tuple2!15390 0))(
  ( (tuple2!15391 (_1!7706 (_ BitVec 64)) (_2!7706 B!1676)) )
))
(declare-datatypes ((List!21610 0))(
  ( (Nil!21607) (Cons!21606 (h!22804 tuple2!15390) (t!30614 List!21610)) )
))
(declare-fun l!996 () List!21610)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!535 (List!21610 (_ BitVec 64)) Bool)

(assert (=> b!1018933 (= e!573386 (not (containsKey!535 (t!30614 l!996) key!261)))))

(declare-fun b!1018934 () Bool)

(declare-fun e!573385 () Bool)

(declare-fun tp_is_empty!23743 () Bool)

(declare-fun tp!71113 () Bool)

(assert (=> b!1018934 (= e!573385 (and tp_is_empty!23743 tp!71113))))

(declare-fun b!1018935 () Bool)

(declare-fun res!683171 () Bool)

(assert (=> b!1018935 (=> (not res!683171) (not e!573386))))

(declare-fun isStrictlySorted!675 (List!21610) Bool)

(assert (=> b!1018935 (= res!683171 (isStrictlySorted!675 (t!30614 l!996)))))

(declare-fun b!1018936 () Bool)

(declare-fun res!683168 () Bool)

(declare-fun e!573387 () Bool)

(assert (=> b!1018936 (=> (not res!683168) (not e!573387))))

(assert (=> b!1018936 (= res!683168 (containsKey!535 l!996 key!261))))

(declare-fun res!683170 () Bool)

(assert (=> start!88702 (=> (not res!683170) (not e!573387))))

(assert (=> start!88702 (= res!683170 (isStrictlySorted!675 l!996))))

(assert (=> start!88702 e!573387))

(assert (=> start!88702 e!573385))

(assert (=> start!88702 true))

(assert (=> start!88702 tp_is_empty!23743))

(declare-fun b!1018937 () Bool)

(assert (=> b!1018937 (= e!573387 e!573386)))

(declare-fun res!683169 () Bool)

(assert (=> b!1018937 (=> (not res!683169) (not e!573386))))

(assert (=> b!1018937 (= res!683169 (and (is-Cons!21606 l!996) (bvslt (_1!7706 (h!22804 l!996)) key!261)))))

(declare-fun value!172 () B!1676)

(declare-fun lt!449610 () List!21610)

(declare-fun insertStrictlySorted!353 (List!21610 (_ BitVec 64) B!1676) List!21610)

(assert (=> b!1018937 (= lt!449610 (insertStrictlySorted!353 l!996 key!261 value!172))))

(assert (= (and start!88702 res!683170) b!1018936))

(assert (= (and b!1018936 res!683168) b!1018937))

(assert (= (and b!1018937 res!683169) b!1018935))

(assert (= (and b!1018935 res!683171) b!1018933))

(assert (= (and start!88702 (is-Cons!21606 l!996)) b!1018934))

(declare-fun m!939535 () Bool)

(assert (=> start!88702 m!939535))

(declare-fun m!939537 () Bool)

(assert (=> b!1018937 m!939537))

(declare-fun m!939539 () Bool)

(assert (=> b!1018933 m!939539))

(declare-fun m!939541 () Bool)

(assert (=> b!1018936 m!939541))

(declare-fun m!939543 () Bool)

(assert (=> b!1018935 m!939543))

(push 1)

(assert (not b!1018933))

(assert tp_is_empty!23743)

(assert (not b!1018937))

(assert (not b!1018934))

(assert (not b!1018935))

(assert (not start!88702))

(assert (not b!1018936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121967 () Bool)

(declare-fun res!683208 () Bool)

(declare-fun e!573418 () Bool)

(assert (=> d!121967 (=> res!683208 e!573418)))

(assert (=> d!121967 (= res!683208 (and (is-Cons!21606 l!996) (= (_1!7706 (h!22804 l!996)) key!261)))))

(assert (=> d!121967 (= (containsKey!535 l!996 key!261) e!573418)))

(declare-fun b!1018980 () Bool)

(declare-fun e!573419 () Bool)

(assert (=> b!1018980 (= e!573418 e!573419)))

(declare-fun res!683209 () Bool)

(assert (=> b!1018980 (=> (not res!683209) (not e!573419))))

(assert (=> b!1018980 (= res!683209 (and (or (not (is-Cons!21606 l!996)) (bvsle (_1!7706 (h!22804 l!996)) key!261)) (is-Cons!21606 l!996) (bvslt (_1!7706 (h!22804 l!996)) key!261)))))

(declare-fun b!1018981 () Bool)

(assert (=> b!1018981 (= e!573419 (containsKey!535 (t!30614 l!996) key!261))))

(assert (= (and d!121967 (not res!683208)) b!1018980))

(assert (= (and b!1018980 res!683209) b!1018981))

(assert (=> b!1018981 m!939539))

(assert (=> b!1018936 d!121967))

(declare-fun d!121973 () Bool)

(declare-fun res!683214 () Bool)

(declare-fun e!573424 () Bool)

(assert (=> d!121973 (=> res!683214 e!573424)))

(assert (=> d!121973 (= res!683214 (or (is-Nil!21607 l!996) (is-Nil!21607 (t!30614 l!996))))))

(assert (=> d!121973 (= (isStrictlySorted!675 l!996) e!573424)))

(declare-fun b!1018986 () Bool)

(declare-fun e!573425 () Bool)

(assert (=> b!1018986 (= e!573424 e!573425)))

(declare-fun res!683215 () Bool)

(assert (=> b!1018986 (=> (not res!683215) (not e!573425))))

(assert (=> b!1018986 (= res!683215 (bvslt (_1!7706 (h!22804 l!996)) (_1!7706 (h!22804 (t!30614 l!996)))))))

(declare-fun b!1018987 () Bool)

(assert (=> b!1018987 (= e!573425 (isStrictlySorted!675 (t!30614 l!996)))))

(assert (= (and d!121973 (not res!683214)) b!1018986))

(assert (= (and b!1018986 res!683215) b!1018987))

(assert (=> b!1018987 m!939543))

(assert (=> start!88702 d!121973))

(declare-fun d!121977 () Bool)

(declare-fun res!683216 () Bool)

(declare-fun e!573426 () Bool)

(assert (=> d!121977 (=> res!683216 e!573426)))

(assert (=> d!121977 (= res!683216 (or (is-Nil!21607 (t!30614 l!996)) (is-Nil!21607 (t!30614 (t!30614 l!996)))))))

(assert (=> d!121977 (= (isStrictlySorted!675 (t!30614 l!996)) e!573426)))

(declare-fun b!1018988 () Bool)

(declare-fun e!573427 () Bool)

(assert (=> b!1018988 (= e!573426 e!573427)))

(declare-fun res!683217 () Bool)

(assert (=> b!1018988 (=> (not res!683217) (not e!573427))))

(assert (=> b!1018988 (= res!683217 (bvslt (_1!7706 (h!22804 (t!30614 l!996))) (_1!7706 (h!22804 (t!30614 (t!30614 l!996))))))))

(declare-fun b!1018989 () Bool)

(assert (=> b!1018989 (= e!573427 (isStrictlySorted!675 (t!30614 (t!30614 l!996))))))

(assert (= (and d!121977 (not res!683216)) b!1018988))

(assert (= (and b!1018988 res!683217) b!1018989))

(declare-fun m!939567 () Bool)

(assert (=> b!1018989 m!939567))

(assert (=> b!1018935 d!121977))

(declare-fun b!1019046 () Bool)

(declare-fun e!573465 () List!21610)

(declare-fun call!43034 () List!21610)

(assert (=> b!1019046 (= e!573465 call!43034)))

(declare-fun b!1019047 () Bool)

(declare-fun e!573466 () List!21610)

(declare-fun call!43035 () List!21610)

(assert (=> b!1019047 (= e!573466 call!43035)))

(declare-fun bm!43030 () Bool)

(assert (=> bm!43030 (= call!43034 call!43035)))

(declare-fun b!1019048 () Bool)

(declare-fun res!683242 () Bool)

(declare-fun e!573464 () Bool)

(assert (=> b!1019048 (=> (not res!683242) (not e!573464))))

(declare-fun lt!449621 () List!21610)

(assert (=> b!1019048 (= res!683242 (containsKey!535 lt!449621 key!261))))

(declare-fun call!43033 () List!21610)

(declare-fun e!573467 () List!21610)

(declare-fun bm!43031 () Bool)

(declare-fun c!103253 () Bool)

(declare-fun $colon$colon!584 (List!21610 tuple2!15390) List!21610)

(assert (=> bm!43031 (= call!43033 ($colon$colon!584 e!573467 (ite c!103253 (h!22804 l!996) (tuple2!15391 key!261 value!172))))))

(declare-fun c!103252 () Bool)

(assert (=> bm!43031 (= c!103252 c!103253)))

(declare-fun b!1019049 () Bool)

(declare-fun e!573468 () List!21610)

(assert (=> b!1019049 (= e!573468 e!573466)))

(declare-fun c!103254 () Bool)

(assert (=> b!1019049 (= c!103254 (and (is-Cons!21606 l!996) (= (_1!7706 (h!22804 l!996)) key!261)))))

(declare-fun b!1019051 () Bool)

(declare-fun c!103251 () Bool)

(assert (=> b!1019051 (= c!103251 (and (is-Cons!21606 l!996) (bvsgt (_1!7706 (h!22804 l!996)) key!261)))))

(assert (=> b!1019051 (= e!573466 e!573465)))

(declare-fun bm!43032 () Bool)

(assert (=> bm!43032 (= call!43035 call!43033)))

(declare-fun b!1019052 () Bool)

(declare-fun contains!5904 (List!21610 tuple2!15390) Bool)

(assert (=> b!1019052 (= e!573464 (contains!5904 lt!449621 (tuple2!15391 key!261 value!172)))))

(declare-fun b!1019053 () Bool)

(assert (=> b!1019053 (= e!573468 call!43033)))

(declare-fun b!1019054 () Bool)

(assert (=> b!1019054 (= e!573467 (ite c!103254 (t!30614 l!996) (ite c!103251 (Cons!21606 (h!22804 l!996) (t!30614 l!996)) Nil!21607)))))

(declare-fun b!1019055 () Bool)

(assert (=> b!1019055 (= e!573465 call!43034)))

(declare-fun d!121979 () Bool)

(assert (=> d!121979 e!573464))

(declare-fun res!683243 () Bool)

(assert (=> d!121979 (=> (not res!683243) (not e!573464))))

(assert (=> d!121979 (= res!683243 (isStrictlySorted!675 lt!449621))))

(assert (=> d!121979 (= lt!449621 e!573468)))

(assert (=> d!121979 (= c!103253 (and (is-Cons!21606 l!996) (bvslt (_1!7706 (h!22804 l!996)) key!261)))))

(assert (=> d!121979 (isStrictlySorted!675 l!996)))

(assert (=> d!121979 (= (insertStrictlySorted!353 l!996 key!261 value!172) lt!449621)))

(declare-fun b!1019050 () Bool)

(assert (=> b!1019050 (= e!573467 (insertStrictlySorted!353 (t!30614 l!996) key!261 value!172))))

(assert (= (and d!121979 c!103253) b!1019053))

(assert (= (and d!121979 (not c!103253)) b!1019049))

(assert (= (and b!1019049 c!103254) b!1019047))

(assert (= (and b!1019049 (not c!103254)) b!1019051))

(assert (= (and b!1019051 c!103251) b!1019046))

(assert (= (and b!1019051 (not c!103251)) b!1019055))

(assert (= (or b!1019046 b!1019055) bm!43030))

(assert (= (or b!1019047 bm!43030) bm!43032))

(assert (= (or b!1019053 bm!43032) bm!43031))

(assert (= (and bm!43031 c!103252) b!1019050))

(assert (= (and bm!43031 (not c!103252)) b!1019054))

(assert (= (and d!121979 res!683243) b!1019048))

(assert (= (and b!1019048 res!683242) b!1019052))

(declare-fun m!939573 () Bool)

(assert (=> d!121979 m!939573))

(assert (=> d!121979 m!939535))

(declare-fun m!939575 () Bool)

(assert (=> b!1019050 m!939575))

(declare-fun m!939577 () Bool)

(assert (=> b!1019052 m!939577))

(declare-fun m!939579 () Bool)

(assert (=> b!1019048 m!939579))

(declare-fun m!939581 () Bool)

(assert (=> bm!43031 m!939581))

(assert (=> b!1018937 d!121979))

(declare-fun d!121989 () Bool)

(declare-fun res!683244 () Bool)

(declare-fun e!573469 () Bool)

(assert (=> d!121989 (=> res!683244 e!573469)))

(assert (=> d!121989 (= res!683244 (and (is-Cons!21606 (t!30614 l!996)) (= (_1!7706 (h!22804 (t!30614 l!996))) key!261)))))

(assert (=> d!121989 (= (containsKey!535 (t!30614 l!996) key!261) e!573469)))

(declare-fun b!1019056 () Bool)

(declare-fun e!573470 () Bool)

(assert (=> b!1019056 (= e!573469 e!573470)))

(declare-fun res!683245 () Bool)

(assert (=> b!1019056 (=> (not res!683245) (not e!573470))))

(assert (=> b!1019056 (= res!683245 (and (or (not (is-Cons!21606 (t!30614 l!996))) (bvsle (_1!7706 (h!22804 (t!30614 l!996))) key!261)) (is-Cons!21606 (t!30614 l!996)) (bvslt (_1!7706 (h!22804 (t!30614 l!996))) key!261)))))

(declare-fun b!1019057 () Bool)

(assert (=> b!1019057 (= e!573470 (containsKey!535 (t!30614 (t!30614 l!996)) key!261))))

(assert (= (and d!121989 (not res!683244)) b!1019056))

(assert (= (and b!1019056 res!683245) b!1019057))

(declare-fun m!939583 () Bool)

(assert (=> b!1019057 m!939583))

(assert (=> b!1018933 d!121989))

(declare-fun b!1019072 () Bool)

(declare-fun e!573478 () Bool)

(declare-fun tp!71122 () Bool)

(assert (=> b!1019072 (= e!573478 (and tp_is_empty!23743 tp!71122))))

(assert (=> b!1018934 (= tp!71113 e!573478)))

(assert (= (and b!1018934 (is-Cons!21606 (t!30614 l!996))) b!1019072))

(push 1)

(assert (not b!1018981))

(assert (not d!121979))

(assert (not b!1019050))

(assert (not b!1018989))

(assert tp_is_empty!23743)

(assert (not b!1018987))

(assert (not b!1019048))

(assert (not bm!43031))

(assert (not b!1019057))

(assert (not b!1019072))

(assert (not b!1019052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

