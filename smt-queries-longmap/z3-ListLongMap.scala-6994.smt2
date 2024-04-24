; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88912 () Bool)

(assert start!88912)

(declare-fun res!683590 () Bool)

(declare-fun e!574109 () Bool)

(assert (=> start!88912 (=> (not res!683590) (not e!574109))))

(declare-datatypes ((B!1670 0))(
  ( (B!1671 (val!11919 Int)) )
))
(declare-datatypes ((tuple2!15388 0))(
  ( (tuple2!15389 (_1!7705 (_ BitVec 64)) (_2!7705 B!1670)) )
))
(declare-datatypes ((List!21596 0))(
  ( (Nil!21593) (Cons!21592 (h!22799 tuple2!15388) (t!30592 List!21596)) )
))
(declare-fun l!996 () List!21596)

(declare-fun isStrictlySorted!660 (List!21596) Bool)

(assert (=> start!88912 (= res!683590 (isStrictlySorted!660 l!996))))

(assert (=> start!88912 e!574109))

(declare-fun e!574108 () Bool)

(assert (=> start!88912 e!574108))

(assert (=> start!88912 true))

(declare-fun tp_is_empty!23737 () Bool)

(assert (=> start!88912 tp_is_empty!23737))

(declare-fun b!1020070 () Bool)

(declare-fun e!574110 () Bool)

(assert (=> b!1020070 (= e!574109 e!574110)))

(declare-fun res!683589 () Bool)

(assert (=> b!1020070 (=> (not res!683589) (not e!574110))))

(declare-fun key!261 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1020070 (= res!683589 (and ((_ is Cons!21592) l!996) (bvslt (_1!7705 (h!22799 l!996)) key!261)))))

(declare-fun value!172 () B!1670)

(declare-fun lt!450107 () List!21596)

(declare-fun insertStrictlySorted!351 (List!21596 (_ BitVec 64) B!1670) List!21596)

(assert (=> b!1020070 (= lt!450107 (insertStrictlySorted!351 l!996 key!261 value!172))))

(declare-fun b!1020072 () Bool)

(declare-fun tp!71095 () Bool)

(assert (=> b!1020072 (= e!574108 (and tp_is_empty!23737 tp!71095))))

(declare-fun b!1020071 () Bool)

(assert (=> b!1020071 (= e!574110 (not (isStrictlySorted!660 (t!30592 l!996))))))

(declare-fun b!1020069 () Bool)

(declare-fun res!683591 () Bool)

(assert (=> b!1020069 (=> (not res!683591) (not e!574109))))

(declare-fun containsKey!534 (List!21596 (_ BitVec 64)) Bool)

(assert (=> b!1020069 (= res!683591 (containsKey!534 l!996 key!261))))

(assert (= (and start!88912 res!683590) b!1020069))

(assert (= (and b!1020069 res!683591) b!1020070))

(assert (= (and b!1020070 res!683589) b!1020071))

(assert (= (and start!88912 ((_ is Cons!21592) l!996)) b!1020072))

(declare-fun m!941133 () Bool)

(assert (=> start!88912 m!941133))

(declare-fun m!941135 () Bool)

(assert (=> b!1020070 m!941135))

(declare-fun m!941137 () Bool)

(assert (=> b!1020071 m!941137))

(declare-fun m!941139 () Bool)

(assert (=> b!1020069 m!941139))

(check-sat (not b!1020069) (not start!88912) tp_is_empty!23737 (not b!1020072) (not b!1020071) (not b!1020070))
(check-sat)
(get-model)

(declare-fun bm!43070 () Bool)

(declare-fun call!43075 () List!21596)

(declare-fun call!43074 () List!21596)

(assert (=> bm!43070 (= call!43075 call!43074)))

(declare-fun b!1020151 () Bool)

(declare-fun e!574163 () List!21596)

(assert (=> b!1020151 (= e!574163 call!43074)))

(declare-fun b!1020152 () Bool)

(declare-fun c!103629 () Bool)

(assert (=> b!1020152 (= c!103629 (and ((_ is Cons!21592) l!996) (bvsgt (_1!7705 (h!22799 l!996)) key!261)))))

(declare-fun e!574164 () List!21596)

(declare-fun e!574167 () List!21596)

(assert (=> b!1020152 (= e!574164 e!574167)))

(declare-fun bm!43071 () Bool)

(declare-fun call!43073 () List!21596)

(assert (=> bm!43071 (= call!43073 call!43075)))

(declare-fun b!1020153 () Bool)

(assert (=> b!1020153 (= e!574164 call!43075)))

(declare-fun c!103630 () Bool)

(declare-fun e!574165 () List!21596)

(declare-fun b!1020154 () Bool)

(assert (=> b!1020154 (= e!574165 (ite c!103630 (t!30592 l!996) (ite c!103629 (Cons!21592 (h!22799 l!996) (t!30592 l!996)) Nil!21593)))))

(declare-fun lt!450118 () List!21596)

(declare-fun b!1020155 () Bool)

(declare-fun e!574166 () Bool)

(declare-fun contains!5922 (List!21596 tuple2!15388) Bool)

(assert (=> b!1020155 (= e!574166 (contains!5922 lt!450118 (tuple2!15389 key!261 value!172)))))

(declare-fun b!1020156 () Bool)

(assert (=> b!1020156 (= e!574165 (insertStrictlySorted!351 (t!30592 l!996) key!261 value!172))))

(declare-fun b!1020157 () Bool)

(declare-fun res!683632 () Bool)

(assert (=> b!1020157 (=> (not res!683632) (not e!574166))))

(assert (=> b!1020157 (= res!683632 (containsKey!534 lt!450118 key!261))))

(declare-fun b!1020158 () Bool)

(assert (=> b!1020158 (= e!574167 call!43073)))

(declare-fun d!122401 () Bool)

(assert (=> d!122401 e!574166))

(declare-fun res!683633 () Bool)

(assert (=> d!122401 (=> (not res!683633) (not e!574166))))

(assert (=> d!122401 (= res!683633 (isStrictlySorted!660 lt!450118))))

(assert (=> d!122401 (= lt!450118 e!574163)))

(declare-fun c!103628 () Bool)

(assert (=> d!122401 (= c!103628 (and ((_ is Cons!21592) l!996) (bvslt (_1!7705 (h!22799 l!996)) key!261)))))

(assert (=> d!122401 (isStrictlySorted!660 l!996)))

(assert (=> d!122401 (= (insertStrictlySorted!351 l!996 key!261 value!172) lt!450118)))

(declare-fun b!1020159 () Bool)

(assert (=> b!1020159 (= e!574167 call!43073)))

(declare-fun bm!43072 () Bool)

(declare-fun $colon$colon!581 (List!21596 tuple2!15388) List!21596)

(assert (=> bm!43072 (= call!43074 ($colon$colon!581 e!574165 (ite c!103628 (h!22799 l!996) (tuple2!15389 key!261 value!172))))))

(declare-fun c!103631 () Bool)

(assert (=> bm!43072 (= c!103631 c!103628)))

(declare-fun b!1020160 () Bool)

(assert (=> b!1020160 (= e!574163 e!574164)))

(assert (=> b!1020160 (= c!103630 (and ((_ is Cons!21592) l!996) (= (_1!7705 (h!22799 l!996)) key!261)))))

(assert (= (and d!122401 c!103628) b!1020151))

(assert (= (and d!122401 (not c!103628)) b!1020160))

(assert (= (and b!1020160 c!103630) b!1020153))

(assert (= (and b!1020160 (not c!103630)) b!1020152))

(assert (= (and b!1020152 c!103629) b!1020159))

(assert (= (and b!1020152 (not c!103629)) b!1020158))

(assert (= (or b!1020159 b!1020158) bm!43071))

(assert (= (or b!1020153 bm!43071) bm!43070))

(assert (= (or b!1020151 bm!43070) bm!43072))

(assert (= (and bm!43072 c!103631) b!1020156))

(assert (= (and bm!43072 (not c!103631)) b!1020154))

(assert (= (and d!122401 res!683633) b!1020157))

(assert (= (and b!1020157 res!683632) b!1020155))

(declare-fun m!941161 () Bool)

(assert (=> b!1020156 m!941161))

(declare-fun m!941163 () Bool)

(assert (=> b!1020155 m!941163))

(declare-fun m!941165 () Bool)

(assert (=> bm!43072 m!941165))

(declare-fun m!941167 () Bool)

(assert (=> b!1020157 m!941167))

(declare-fun m!941169 () Bool)

(assert (=> d!122401 m!941169))

(assert (=> d!122401 m!941133))

(assert (=> b!1020070 d!122401))

(declare-fun d!122413 () Bool)

(declare-fun res!683644 () Bool)

(declare-fun e!574187 () Bool)

(assert (=> d!122413 (=> res!683644 e!574187)))

(assert (=> d!122413 (= res!683644 (and ((_ is Cons!21592) l!996) (= (_1!7705 (h!22799 l!996)) key!261)))))

(assert (=> d!122413 (= (containsKey!534 l!996 key!261) e!574187)))

(declare-fun b!1020191 () Bool)

(declare-fun e!574188 () Bool)

(assert (=> b!1020191 (= e!574187 e!574188)))

(declare-fun res!683645 () Bool)

(assert (=> b!1020191 (=> (not res!683645) (not e!574188))))

(assert (=> b!1020191 (= res!683645 (and (or (not ((_ is Cons!21592) l!996)) (bvsle (_1!7705 (h!22799 l!996)) key!261)) ((_ is Cons!21592) l!996) (bvslt (_1!7705 (h!22799 l!996)) key!261)))))

(declare-fun b!1020192 () Bool)

(assert (=> b!1020192 (= e!574188 (containsKey!534 (t!30592 l!996) key!261))))

(assert (= (and d!122413 (not res!683644)) b!1020191))

(assert (= (and b!1020191 res!683645) b!1020192))

(declare-fun m!941181 () Bool)

(assert (=> b!1020192 m!941181))

(assert (=> b!1020069 d!122413))

(declare-fun d!122417 () Bool)

(declare-fun res!683656 () Bool)

(declare-fun e!574202 () Bool)

(assert (=> d!122417 (=> res!683656 e!574202)))

(assert (=> d!122417 (= res!683656 (or ((_ is Nil!21593) (t!30592 l!996)) ((_ is Nil!21593) (t!30592 (t!30592 l!996)))))))

(assert (=> d!122417 (= (isStrictlySorted!660 (t!30592 l!996)) e!574202)))

(declare-fun b!1020212 () Bool)

(declare-fun e!574203 () Bool)

(assert (=> b!1020212 (= e!574202 e!574203)))

(declare-fun res!683657 () Bool)

(assert (=> b!1020212 (=> (not res!683657) (not e!574203))))

(assert (=> b!1020212 (= res!683657 (bvslt (_1!7705 (h!22799 (t!30592 l!996))) (_1!7705 (h!22799 (t!30592 (t!30592 l!996))))))))

(declare-fun b!1020213 () Bool)

(assert (=> b!1020213 (= e!574203 (isStrictlySorted!660 (t!30592 (t!30592 l!996))))))

(assert (= (and d!122417 (not res!683656)) b!1020212))

(assert (= (and b!1020212 res!683657) b!1020213))

(declare-fun m!941185 () Bool)

(assert (=> b!1020213 m!941185))

(assert (=> b!1020071 d!122417))

(declare-fun d!122419 () Bool)

(declare-fun res!683658 () Bool)

(declare-fun e!574204 () Bool)

(assert (=> d!122419 (=> res!683658 e!574204)))

(assert (=> d!122419 (= res!683658 (or ((_ is Nil!21593) l!996) ((_ is Nil!21593) (t!30592 l!996))))))

(assert (=> d!122419 (= (isStrictlySorted!660 l!996) e!574204)))

(declare-fun b!1020214 () Bool)

(declare-fun e!574205 () Bool)

(assert (=> b!1020214 (= e!574204 e!574205)))

(declare-fun res!683659 () Bool)

(assert (=> b!1020214 (=> (not res!683659) (not e!574205))))

(assert (=> b!1020214 (= res!683659 (bvslt (_1!7705 (h!22799 l!996)) (_1!7705 (h!22799 (t!30592 l!996)))))))

(declare-fun b!1020215 () Bool)

(assert (=> b!1020215 (= e!574205 (isStrictlySorted!660 (t!30592 l!996)))))

(assert (= (and d!122419 (not res!683658)) b!1020214))

(assert (= (and b!1020214 res!683659) b!1020215))

(assert (=> b!1020215 m!941137))

(assert (=> start!88912 d!122419))

(declare-fun b!1020220 () Bool)

(declare-fun e!574208 () Bool)

(declare-fun tp!71107 () Bool)

(assert (=> b!1020220 (= e!574208 (and tp_is_empty!23737 tp!71107))))

(assert (=> b!1020072 (= tp!71095 e!574208)))

(assert (= (and b!1020072 ((_ is Cons!21592) (t!30592 l!996))) b!1020220))

(check-sat (not b!1020215) (not b!1020157) (not bm!43072) (not b!1020156) (not d!122401) (not b!1020155) (not b!1020220) tp_is_empty!23737 (not b!1020192) (not b!1020213))
(check-sat)
