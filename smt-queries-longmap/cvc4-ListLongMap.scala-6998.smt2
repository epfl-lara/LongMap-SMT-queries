; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88820 () Bool)

(assert start!88820)

(declare-fun res!683582 () Bool)

(declare-fun e!573913 () Bool)

(assert (=> start!88820 (=> (not res!683582) (not e!573913))))

(declare-datatypes ((B!1698 0))(
  ( (B!1699 (val!11933 Int)) )
))
(declare-datatypes ((tuple2!15412 0))(
  ( (tuple2!15413 (_1!7717 (_ BitVec 64)) (_2!7717 B!1698)) )
))
(declare-datatypes ((List!21621 0))(
  ( (Nil!21618) (Cons!21617 (h!22815 tuple2!15412) (t!30628 List!21621)) )
))
(declare-fun l!996 () List!21621)

(declare-fun isStrictlySorted!686 (List!21621) Bool)

(assert (=> start!88820 (= res!683582 (isStrictlySorted!686 l!996))))

(assert (=> start!88820 e!573913))

(declare-fun e!573914 () Bool)

(assert (=> start!88820 e!573914))

(assert (=> start!88820 true))

(declare-fun tp_is_empty!23765 () Bool)

(assert (=> start!88820 tp_is_empty!23765))

(declare-fun b!1019751 () Bool)

(declare-fun e!573915 () Bool)

(assert (=> b!1019751 (= e!573913 e!573915)))

(declare-fun res!683581 () Bool)

(assert (=> b!1019751 (=> (not res!683581) (not e!573915))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun value!172 () B!1698)

(declare-fun lt!449736 () List!21621)

(assert (=> b!1019751 (= res!683581 (and (bvsge (_1!7717 (h!22815 l!996)) key!261) (is-Cons!21617 l!996) (= (_1!7717 (h!22815 l!996)) key!261) (= lt!449736 (Cons!21617 (tuple2!15413 key!261 value!172) (t!30628 l!996)))))))

(declare-fun insertStrictlySorted!364 (List!21621 (_ BitVec 64) B!1698) List!21621)

(assert (=> b!1019751 (= lt!449736 (insertStrictlySorted!364 l!996 key!261 value!172))))

(declare-fun b!1019750 () Bool)

(declare-fun res!683580 () Bool)

(assert (=> b!1019750 (=> (not res!683580) (not e!573913))))

(declare-fun containsKey!546 (List!21621 (_ BitVec 64)) Bool)

(assert (=> b!1019750 (= res!683580 (containsKey!546 l!996 key!261))))

(declare-fun b!1019753 () Bool)

(declare-fun tp!71176 () Bool)

(assert (=> b!1019753 (= e!573914 (and tp_is_empty!23765 tp!71176))))

(declare-fun b!1019752 () Bool)

(declare-fun length!49 (List!21621) Int)

(assert (=> b!1019752 (= e!573915 (not (= (length!49 lt!449736) (length!49 l!996))))))

(assert (= (and start!88820 res!683582) b!1019750))

(assert (= (and b!1019750 res!683580) b!1019751))

(assert (= (and b!1019751 res!683581) b!1019752))

(assert (= (and start!88820 (is-Cons!21617 l!996)) b!1019753))

(declare-fun m!939999 () Bool)

(assert (=> start!88820 m!939999))

(declare-fun m!940001 () Bool)

(assert (=> b!1019751 m!940001))

(declare-fun m!940003 () Bool)

(assert (=> b!1019750 m!940003))

(declare-fun m!940005 () Bool)

(assert (=> b!1019752 m!940005))

(declare-fun m!940007 () Bool)

(assert (=> b!1019752 m!940007))

(push 1)

(assert (not b!1019751))

(assert tp_is_empty!23765)

(assert (not b!1019753))

(assert (not start!88820))

(assert (not b!1019752))

(assert (not b!1019750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122211 () Bool)

(declare-fun res!683599 () Bool)

(declare-fun e!573941 () Bool)

(assert (=> d!122211 (=> res!683599 e!573941)))

(assert (=> d!122211 (= res!683599 (and (is-Cons!21617 l!996) (= (_1!7717 (h!22815 l!996)) key!261)))))

(assert (=> d!122211 (= (containsKey!546 l!996 key!261) e!573941)))

(declare-fun b!1019794 () Bool)

(declare-fun e!573942 () Bool)

(assert (=> b!1019794 (= e!573941 e!573942)))

(declare-fun res!683600 () Bool)

(assert (=> b!1019794 (=> (not res!683600) (not e!573942))))

(assert (=> b!1019794 (= res!683600 (and (or (not (is-Cons!21617 l!996)) (bvsle (_1!7717 (h!22815 l!996)) key!261)) (is-Cons!21617 l!996) (bvslt (_1!7717 (h!22815 l!996)) key!261)))))

(declare-fun b!1019795 () Bool)

(assert (=> b!1019795 (= e!573942 (containsKey!546 (t!30628 l!996) key!261))))

(assert (= (and d!122211 (not res!683599)) b!1019794))

(assert (= (and b!1019794 res!683600) b!1019795))

(declare-fun m!940021 () Bool)

(assert (=> b!1019795 m!940021))

(assert (=> b!1019750 d!122211))

(declare-fun b!1019874 () Bool)

(declare-fun e!573993 () List!21621)

(declare-fun call!43144 () List!21621)

(assert (=> b!1019874 (= e!573993 call!43144)))

(declare-fun b!1019875 () Bool)

(declare-fun e!573992 () List!21621)

(declare-fun call!43145 () List!21621)

(assert (=> b!1019875 (= e!573992 call!43145)))

(declare-fun b!1019876 () Bool)

(assert (=> b!1019876 (= e!573992 call!43145)))

(declare-fun b!1019877 () Bool)

(declare-fun e!573996 () List!21621)

(assert (=> b!1019877 (= e!573996 (insertStrictlySorted!364 (t!30628 l!996) key!261 value!172))))

(declare-fun c!103432 () Bool)

(declare-fun c!103431 () Bool)

(declare-fun b!1019878 () Bool)

(assert (=> b!1019878 (= e!573996 (ite c!103431 (t!30628 l!996) (ite c!103432 (Cons!21617 (h!22815 l!996) (t!30628 l!996)) Nil!21618)))))

(declare-fun b!1019879 () Bool)

(declare-fun e!573995 () List!21621)

(assert (=> b!1019879 (= e!573995 e!573993)))

(assert (=> b!1019879 (= c!103431 (and (is-Cons!21617 l!996) (= (_1!7717 (h!22815 l!996)) key!261)))))

(declare-fun bm!43141 () Bool)

(assert (=> bm!43141 (= call!43145 call!43144)))

(declare-fun bm!43142 () Bool)

(declare-fun call!43146 () List!21621)

(assert (=> bm!43142 (= call!43144 call!43146)))

(declare-fun b!1019880 () Bool)

(assert (=> b!1019880 (= e!573995 call!43146)))

(declare-fun b!1019881 () Bool)

(declare-fun e!573994 () Bool)

(declare-fun lt!449745 () List!21621)

(declare-fun contains!5913 (List!21621 tuple2!15412) Bool)

(assert (=> b!1019881 (= e!573994 (contains!5913 lt!449745 (tuple2!15413 key!261 value!172)))))

(declare-fun b!1019882 () Bool)

(declare-fun res!683629 () Bool)

(assert (=> b!1019882 (=> (not res!683629) (not e!573994))))

(assert (=> b!1019882 (= res!683629 (containsKey!546 lt!449745 key!261))))

(declare-fun b!1019883 () Bool)

(assert (=> b!1019883 (= c!103432 (and (is-Cons!21617 l!996) (bvsgt (_1!7717 (h!22815 l!996)) key!261)))))

(assert (=> b!1019883 (= e!573993 e!573992)))

(declare-fun d!122215 () Bool)

(assert (=> d!122215 e!573994))

(declare-fun res!683630 () Bool)

(assert (=> d!122215 (=> (not res!683630) (not e!573994))))

(assert (=> d!122215 (= res!683630 (isStrictlySorted!686 lt!449745))))

(assert (=> d!122215 (= lt!449745 e!573995)))

(declare-fun c!103430 () Bool)

(assert (=> d!122215 (= c!103430 (and (is-Cons!21617 l!996) (bvslt (_1!7717 (h!22815 l!996)) key!261)))))

(assert (=> d!122215 (isStrictlySorted!686 l!996)))

(assert (=> d!122215 (= (insertStrictlySorted!364 l!996 key!261 value!172) lt!449745)))

(declare-fun bm!43143 () Bool)

(declare-fun $colon$colon!594 (List!21621 tuple2!15412) List!21621)

(assert (=> bm!43143 (= call!43146 ($colon$colon!594 e!573996 (ite c!103430 (h!22815 l!996) (tuple2!15413 key!261 value!172))))))

(declare-fun c!103429 () Bool)

(assert (=> bm!43143 (= c!103429 c!103430)))

(assert (= (and d!122215 c!103430) b!1019880))

(assert (= (and d!122215 (not c!103430)) b!1019879))

(assert (= (and b!1019879 c!103431) b!1019874))

(assert (= (and b!1019879 (not c!103431)) b!1019883))

(assert (= (and b!1019883 c!103432) b!1019876))

(assert (= (and b!1019883 (not c!103432)) b!1019875))

(assert (= (or b!1019876 b!1019875) bm!43141))

(assert (= (or b!1019874 bm!43141) bm!43142))

(assert (= (or b!1019880 bm!43142) bm!43143))

(assert (= (and bm!43143 c!103429) b!1019877))

(assert (= (and bm!43143 (not c!103429)) b!1019878))

(assert (= (and d!122215 res!683630) b!1019882))

(assert (= (and b!1019882 res!683629) b!1019881))

(declare-fun m!940047 () Bool)

(assert (=> d!122215 m!940047))

(assert (=> d!122215 m!939999))

(declare-fun m!940049 () Bool)

(assert (=> b!1019877 m!940049))

(declare-fun m!940051 () Bool)

(assert (=> b!1019881 m!940051))

(declare-fun m!940053 () Bool)

(assert (=> bm!43143 m!940053))

(declare-fun m!940055 () Bool)

(assert (=> b!1019882 m!940055))

(assert (=> b!1019751 d!122215))

(declare-fun d!122229 () Bool)

(declare-fun size!31162 (List!21621) Int)

(assert (=> d!122229 (= (length!49 lt!449736) (size!31162 lt!449736))))

(declare-fun bs!29711 () Bool)

(assert (= bs!29711 d!122229))

(declare-fun m!940057 () Bool)

(assert (=> bs!29711 m!940057))

(assert (=> b!1019752 d!122229))

(declare-fun d!122231 () Bool)

(assert (=> d!122231 (= (length!49 l!996) (size!31162 l!996))))

(declare-fun bs!29712 () Bool)

(assert (= bs!29712 d!122231))

(declare-fun m!940059 () Bool)

(assert (=> bs!29712 m!940059))

(assert (=> b!1019752 d!122231))

(declare-fun d!122233 () Bool)

(declare-fun res!683635 () Bool)

(declare-fun e!574001 () Bool)

(assert (=> d!122233 (=> res!683635 e!574001)))

(assert (=> d!122233 (= res!683635 (or (is-Nil!21618 l!996) (is-Nil!21618 (t!30628 l!996))))))

(assert (=> d!122233 (= (isStrictlySorted!686 l!996) e!574001)))

(declare-fun b!1019888 () Bool)

(declare-fun e!574002 () Bool)

(assert (=> b!1019888 (= e!574001 e!574002)))

(declare-fun res!683636 () Bool)

(assert (=> b!1019888 (=> (not res!683636) (not e!574002))))

(assert (=> b!1019888 (= res!683636 (bvslt (_1!7717 (h!22815 l!996)) (_1!7717 (h!22815 (t!30628 l!996)))))))

(declare-fun b!1019889 () Bool)

(assert (=> b!1019889 (= e!574002 (isStrictlySorted!686 (t!30628 l!996)))))

(assert (= (and d!122233 (not res!683635)) b!1019888))

(assert (= (and b!1019888 res!683636) b!1019889))

(declare-fun m!940061 () Bool)

(assert (=> b!1019889 m!940061))

(assert (=> start!88820 d!122233))

(declare-fun b!1019894 () Bool)

(declare-fun e!574005 () Bool)

(declare-fun tp!71185 () Bool)

(assert (=> b!1019894 (= e!574005 (and tp_is_empty!23765 tp!71185))))

(assert (=> b!1019753 (= tp!71176 e!574005)))

(assert (= (and b!1019753 (is-Cons!21617 (t!30628 l!996))) b!1019894))

(push 1)

(assert (not b!1019889))

(assert (not d!122231))

(assert (not b!1019795))

(assert tp_is_empty!23765)

(assert (not b!1019881))

(assert (not b!1019882))

(assert (not d!122215))

(assert (not bm!43143))

(assert (not b!1019877))

(assert (not d!122229))

(assert (not b!1019894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122271 () Bool)

(assert (=> d!122271 (= ($colon$colon!594 e!573996 (ite c!103430 (h!22815 l!996) (tuple2!15413 key!261 value!172))) (Cons!21617 (ite c!103430 (h!22815 l!996) (tuple2!15413 key!261 value!172)) e!573996))))

(assert (=> bm!43143 d!122271))

(declare-fun d!122273 () Bool)

(declare-fun lt!449764 () Int)

(assert (=> d!122273 (>= lt!449764 0)))

(declare-fun e!574056 () Int)

(assert (=> d!122273 (= lt!449764 e!574056)))

(declare-fun c!103451 () Bool)

(assert (=> d!122273 (= c!103451 (is-Nil!21618 lt!449736))))

(assert (=> d!122273 (= (size!31162 lt!449736) lt!449764)))

(declare-fun b!1019965 () Bool)

(assert (=> b!1019965 (= e!574056 0)))

(declare-fun b!1019966 () Bool)

(assert (=> b!1019966 (= e!574056 (+ 1 (size!31162 (t!30628 lt!449736))))))

(assert (= (and d!122273 c!103451) b!1019965))

(assert (= (and d!122273 (not c!103451)) b!1019966))

(declare-fun m!940119 () Bool)

(assert (=> b!1019966 m!940119))

(assert (=> d!122229 d!122273))

(declare-fun d!122275 () Bool)

(declare-fun lt!449767 () Bool)

(declare-fun content!492 (List!21621) (Set tuple2!15412))

(assert (=> d!122275 (= lt!449767 (member (tuple2!15413 key!261 value!172) (content!492 lt!449745)))))

(declare-fun e!574061 () Bool)

(assert (=> d!122275 (= lt!449767 e!574061)))

(declare-fun res!683673 () Bool)

(assert (=> d!122275 (=> (not res!683673) (not e!574061))))

