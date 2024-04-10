; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88868 () Bool)

(assert start!88868)

(declare-fun b!1020028 () Bool)

(declare-fun e!574104 () Bool)

(declare-datatypes ((B!1704 0))(
  ( (B!1705 (val!11936 Int)) )
))
(declare-datatypes ((tuple2!15418 0))(
  ( (tuple2!15419 (_1!7720 (_ BitVec 64)) (_2!7720 B!1704)) )
))
(declare-datatypes ((List!21624 0))(
  ( (Nil!21621) (Cons!21620 (h!22818 tuple2!15418) (t!30634 List!21624)) )
))
(declare-fun lt!449778 () List!21624)

(declare-fun l!996 () List!21624)

(declare-fun length!52 (List!21624) Int)

(assert (=> b!1020028 (= e!574104 (not (= (length!52 lt!449778) (length!52 l!996))))))

(declare-fun b!1020027 () Bool)

(declare-fun e!574103 () Bool)

(assert (=> b!1020027 (= e!574103 e!574104)))

(declare-fun res!683709 () Bool)

(assert (=> b!1020027 (=> (not res!683709) (not e!574104))))

(declare-fun key!261 () (_ BitVec 64))

(assert (=> b!1020027 (= res!683709 (and (or (not (is-Cons!21620 l!996)) (bvsge (_1!7720 (h!22818 l!996)) key!261)) (or (not (is-Cons!21620 l!996)) (not (= (_1!7720 (h!22818 l!996)) key!261)))))))

(declare-fun value!172 () B!1704)

(declare-fun insertStrictlySorted!367 (List!21624 (_ BitVec 64) B!1704) List!21624)

(assert (=> b!1020027 (= lt!449778 (insertStrictlySorted!367 l!996 key!261 value!172))))

(declare-fun res!683710 () Bool)

(assert (=> start!88868 (=> (not res!683710) (not e!574103))))

(declare-fun isStrictlySorted!689 (List!21624) Bool)

(assert (=> start!88868 (= res!683710 (isStrictlySorted!689 l!996))))

(assert (=> start!88868 e!574103))

(declare-fun e!574102 () Bool)

(assert (=> start!88868 e!574102))

(assert (=> start!88868 true))

(declare-fun tp_is_empty!23771 () Bool)

(assert (=> start!88868 tp_is_empty!23771))

(declare-fun b!1020029 () Bool)

(declare-fun tp!71197 () Bool)

(assert (=> b!1020029 (= e!574102 (and tp_is_empty!23771 tp!71197))))

(declare-fun b!1020026 () Bool)

(declare-fun res!683711 () Bool)

(assert (=> b!1020026 (=> (not res!683711) (not e!574103))))

(declare-fun containsKey!549 (List!21624 (_ BitVec 64)) Bool)

(assert (=> b!1020026 (= res!683711 (containsKey!549 l!996 key!261))))

(assert (= (and start!88868 res!683710) b!1020026))

(assert (= (and b!1020026 res!683711) b!1020027))

(assert (= (and b!1020027 res!683709) b!1020028))

(assert (= (and start!88868 (is-Cons!21620 l!996)) b!1020029))

(declare-fun m!940167 () Bool)

(assert (=> b!1020028 m!940167))

(declare-fun m!940169 () Bool)

(assert (=> b!1020028 m!940169))

(declare-fun m!940171 () Bool)

(assert (=> b!1020027 m!940171))

(declare-fun m!940173 () Bool)

(assert (=> start!88868 m!940173))

(declare-fun m!940175 () Bool)

(assert (=> b!1020026 m!940175))

(push 1)

(assert (not b!1020026))

(assert (not b!1020027))

(assert (not b!1020028))

(assert (not b!1020029))

(assert (not start!88868))

(assert tp_is_empty!23771)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122295 () Bool)

(declare-fun size!31164 (List!21624) Int)

(assert (=> d!122295 (= (length!52 lt!449778) (size!31164 lt!449778))))

(declare-fun bs!29716 () Bool)

(assert (= bs!29716 d!122295))

(declare-fun m!940177 () Bool)

(assert (=> bs!29716 m!940177))

(assert (=> b!1020028 d!122295))

(declare-fun d!122297 () Bool)

(assert (=> d!122297 (= (length!52 l!996) (size!31164 l!996))))

(declare-fun bs!29717 () Bool)

(assert (= bs!29717 d!122297))

(declare-fun m!940179 () Bool)

(assert (=> bs!29717 m!940179))

(assert (=> b!1020028 d!122297))

(declare-fun d!122299 () Bool)

(declare-fun res!683722 () Bool)

(declare-fun e!574115 () Bool)

(assert (=> d!122299 (=> res!683722 e!574115)))

(assert (=> d!122299 (= res!683722 (or (is-Nil!21621 l!996) (is-Nil!21621 (t!30634 l!996))))))

(assert (=> d!122299 (= (isStrictlySorted!689 l!996) e!574115)))

(declare-fun b!1020040 () Bool)

(declare-fun e!574116 () Bool)

(assert (=> b!1020040 (= e!574115 e!574116)))

(declare-fun res!683723 () Bool)

(assert (=> b!1020040 (=> (not res!683723) (not e!574116))))

(assert (=> b!1020040 (= res!683723 (bvslt (_1!7720 (h!22818 l!996)) (_1!7720 (h!22818 (t!30634 l!996)))))))

(declare-fun b!1020041 () Bool)

(assert (=> b!1020041 (= e!574116 (isStrictlySorted!689 (t!30634 l!996)))))

(assert (= (and d!122299 (not res!683722)) b!1020040))

(assert (= (and b!1020040 res!683723) b!1020041))

(declare-fun m!940187 () Bool)

(assert (=> b!1020041 m!940187))

(assert (=> start!88868 d!122299))

(declare-fun bm!43177 () Bool)

(declare-fun call!43180 () List!21624)

(declare-fun call!43182 () List!21624)

(assert (=> bm!43177 (= call!43180 call!43182)))

(declare-fun bm!43178 () Bool)

(declare-fun call!43181 () List!21624)

(assert (=> bm!43178 (= call!43181 call!43180)))

(declare-fun c!103490 () Bool)

(declare-fun c!103491 () Bool)

(declare-fun e!574172 () List!21624)

(declare-fun b!1020139 () Bool)

(assert (=> b!1020139 (= e!574172 (ite c!103490 (t!30634 l!996) (ite c!103491 (Cons!21620 (h!22818 l!996) (t!30634 l!996)) Nil!21621)))))

(declare-fun b!1020140 () Bool)

(declare-fun e!574173 () List!21624)

(assert (=> b!1020140 (= e!574173 call!43180)))

(declare-fun b!1020141 () Bool)

(declare-fun e!574175 () List!21624)

(assert (=> b!1020141 (= e!574175 call!43182)))

(declare-fun d!122307 () Bool)

(declare-fun e!574174 () Bool)

(assert (=> d!122307 e!574174))

(declare-fun res!683752 () Bool)

(assert (=> d!122307 (=> (not res!683752) (not e!574174))))

(declare-fun lt!449787 () List!21624)

(assert (=> d!122307 (= res!683752 (isStrictlySorted!689 lt!449787))))

(assert (=> d!122307 (= lt!449787 e!574175)))

(declare-fun c!103492 () Bool)

(assert (=> d!122307 (= c!103492 (and (is-Cons!21620 l!996) (bvslt (_1!7720 (h!22818 l!996)) key!261)))))

(assert (=> d!122307 (isStrictlySorted!689 l!996)))

(assert (=> d!122307 (= (insertStrictlySorted!367 l!996 key!261 value!172) lt!449787)))

(declare-fun b!1020142 () Bool)

(declare-fun res!683753 () Bool)

(assert (=> b!1020142 (=> (not res!683753) (not e!574174))))

(assert (=> b!1020142 (= res!683753 (containsKey!549 lt!449787 key!261))))

(declare-fun bm!43179 () Bool)

(declare-fun $colon$colon!597 (List!21624 tuple2!15418) List!21624)

(assert (=> bm!43179 (= call!43182 ($colon$colon!597 e!574172 (ite c!103492 (h!22818 l!996) (tuple2!15419 key!261 value!172))))))

(declare-fun c!103489 () Bool)

(assert (=> bm!43179 (= c!103489 c!103492)))

(declare-fun b!1020143 () Bool)

(assert (=> b!1020143 (= e!574175 e!574173)))

(assert (=> b!1020143 (= c!103490 (and (is-Cons!21620 l!996) (= (_1!7720 (h!22818 l!996)) key!261)))))

(declare-fun b!1020144 () Bool)

(declare-fun e!574176 () List!21624)

