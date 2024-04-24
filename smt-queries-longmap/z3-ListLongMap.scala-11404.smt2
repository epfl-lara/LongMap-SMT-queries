; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133200 () Bool)

(assert start!133200)

(declare-fun res!1065246 () Bool)

(declare-fun e!867829 () Bool)

(assert (=> start!133200 (=> (not res!1065246) (not e!867829))))

(declare-datatypes ((B!2300 0))(
  ( (B!2301 (val!19236 Int)) )
))
(declare-datatypes ((tuple2!24902 0))(
  ( (tuple2!24903 (_1!12462 (_ BitVec 64)) (_2!12462 B!2300)) )
))
(declare-datatypes ((List!36299 0))(
  ( (Nil!36296) (Cons!36295 (h!37759 tuple2!24902) (t!51012 List!36299)) )
))
(declare-fun l!1177 () List!36299)

(declare-fun isStrictlySorted!913 (List!36299) Bool)

(assert (=> start!133200 (= res!1065246 (isStrictlySorted!913 l!1177))))

(assert (=> start!133200 e!867829))

(declare-fun e!867830 () Bool)

(assert (=> start!133200 e!867830))

(assert (=> start!133200 true))

(declare-fun tp_is_empty!38311 () Bool)

(assert (=> start!133200 tp_is_empty!38311))

(declare-fun b!1558041 () Bool)

(declare-fun res!1065245 () Bool)

(assert (=> b!1558041 (=> (not res!1065245) (not e!867829))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1558041 (= res!1065245 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36295) l!1177)) (= (_1!12462 (h!37759 l!1177)) otherKey!50))))))

(declare-fun b!1558042 () Bool)

(declare-fun newValue!105 () B!2300)

(declare-fun insertStrictlySorted!538 (List!36299 (_ BitVec 64) B!2300) List!36299)

(assert (=> b!1558042 (= e!867829 (not (isStrictlySorted!913 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))))))

(declare-fun b!1558043 () Bool)

(declare-fun tp!112308 () Bool)

(assert (=> b!1558043 (= e!867830 (and tp_is_empty!38311 tp!112308))))

(assert (= (and start!133200 res!1065246) b!1558041))

(assert (= (and b!1558041 res!1065245) b!1558042))

(assert (= (and start!133200 ((_ is Cons!36295) l!1177)) b!1558043))

(declare-fun m!1435829 () Bool)

(assert (=> start!133200 m!1435829))

(declare-fun m!1435831 () Bool)

(assert (=> b!1558042 m!1435831))

(assert (=> b!1558042 m!1435831))

(declare-fun m!1435833 () Bool)

(assert (=> b!1558042 m!1435833))

(check-sat (not b!1558042) (not start!133200) (not b!1558043) tp_is_empty!38311)
(check-sat)
(get-model)

(declare-fun d!162691 () Bool)

(declare-fun res!1065263 () Bool)

(declare-fun e!867847 () Bool)

(assert (=> d!162691 (=> res!1065263 e!867847)))

(assert (=> d!162691 (= res!1065263 (or ((_ is Nil!36296) (insertStrictlySorted!538 l!1177 newKey!105 newValue!105)) ((_ is Nil!36296) (t!51012 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105)))))))

(assert (=> d!162691 (= (isStrictlySorted!913 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105)) e!867847)))

(declare-fun b!1558066 () Bool)

(declare-fun e!867848 () Bool)

(assert (=> b!1558066 (= e!867847 e!867848)))

(declare-fun res!1065264 () Bool)

(assert (=> b!1558066 (=> (not res!1065264) (not e!867848))))

(assert (=> b!1558066 (= res!1065264 (bvslt (_1!12462 (h!37759 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))) (_1!12462 (h!37759 (t!51012 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))))))))

(declare-fun b!1558067 () Bool)

(assert (=> b!1558067 (= e!867848 (isStrictlySorted!913 (t!51012 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))))))

(assert (= (and d!162691 (not res!1065263)) b!1558066))

(assert (= (and b!1558066 res!1065264) b!1558067))

(declare-fun m!1435847 () Bool)

(assert (=> b!1558067 m!1435847))

(assert (=> b!1558042 d!162691))

(declare-fun e!867879 () List!36299)

(declare-fun c!144450 () Bool)

(declare-fun b!1558112 () Bool)

(declare-fun c!144449 () Bool)

(assert (=> b!1558112 (= e!867879 (ite c!144450 (t!51012 l!1177) (ite c!144449 (Cons!36295 (h!37759 l!1177) (t!51012 l!1177)) Nil!36296)))))

(declare-fun b!1558113 () Bool)

(declare-fun e!867881 () List!36299)

(declare-fun call!71686 () List!36299)

(assert (=> b!1558113 (= e!867881 call!71686)))

(declare-fun d!162693 () Bool)

(declare-fun e!867880 () Bool)

(assert (=> d!162693 e!867880))

(declare-fun res!1065282 () Bool)

(assert (=> d!162693 (=> (not res!1065282) (not e!867880))))

(declare-fun lt!671238 () List!36299)

(assert (=> d!162693 (= res!1065282 (isStrictlySorted!913 lt!671238))))

(declare-fun e!867877 () List!36299)

(assert (=> d!162693 (= lt!671238 e!867877)))

(declare-fun c!144448 () Bool)

(assert (=> d!162693 (= c!144448 (and ((_ is Cons!36295) l!1177) (bvslt (_1!12462 (h!37759 l!1177)) newKey!105)))))

(assert (=> d!162693 (isStrictlySorted!913 l!1177)))

(assert (=> d!162693 (= (insertStrictlySorted!538 l!1177 newKey!105 newValue!105) lt!671238)))

(declare-fun b!1558114 () Bool)

(assert (=> b!1558114 (= e!867879 (insertStrictlySorted!538 (t!51012 l!1177) newKey!105 newValue!105))))

(declare-fun b!1558115 () Bool)

(assert (=> b!1558115 (= e!867877 e!867881)))

(assert (=> b!1558115 (= c!144450 (and ((_ is Cons!36295) l!1177) (= (_1!12462 (h!37759 l!1177)) newKey!105)))))

(declare-fun b!1558116 () Bool)

(declare-fun e!867878 () List!36299)

(declare-fun call!71687 () List!36299)

(assert (=> b!1558116 (= e!867878 call!71687)))

(declare-fun b!1558117 () Bool)

(declare-fun call!71685 () List!36299)

(assert (=> b!1558117 (= e!867877 call!71685)))

(declare-fun b!1558118 () Bool)

(assert (=> b!1558118 (= c!144449 (and ((_ is Cons!36295) l!1177) (bvsgt (_1!12462 (h!37759 l!1177)) newKey!105)))))

(assert (=> b!1558118 (= e!867881 e!867878)))

(declare-fun b!1558119 () Bool)

(declare-fun contains!10220 (List!36299 tuple2!24902) Bool)

(assert (=> b!1558119 (= e!867880 (contains!10220 lt!671238 (tuple2!24903 newKey!105 newValue!105)))))

(declare-fun bm!71682 () Bool)

(declare-fun $colon$colon!959 (List!36299 tuple2!24902) List!36299)

(assert (=> bm!71682 (= call!71685 ($colon$colon!959 e!867879 (ite c!144448 (h!37759 l!1177) (tuple2!24903 newKey!105 newValue!105))))))

(declare-fun c!144451 () Bool)

(assert (=> bm!71682 (= c!144451 c!144448)))

(declare-fun bm!71683 () Bool)

(assert (=> bm!71683 (= call!71686 call!71685)))

(declare-fun b!1558120 () Bool)

(declare-fun res!1065281 () Bool)

(assert (=> b!1558120 (=> (not res!1065281) (not e!867880))))

(declare-fun containsKey!797 (List!36299 (_ BitVec 64)) Bool)

(assert (=> b!1558120 (= res!1065281 (containsKey!797 lt!671238 newKey!105))))

(declare-fun bm!71684 () Bool)

(assert (=> bm!71684 (= call!71687 call!71686)))

(declare-fun b!1558121 () Bool)

(assert (=> b!1558121 (= e!867878 call!71687)))

(assert (= (and d!162693 c!144448) b!1558117))

(assert (= (and d!162693 (not c!144448)) b!1558115))

(assert (= (and b!1558115 c!144450) b!1558113))

(assert (= (and b!1558115 (not c!144450)) b!1558118))

(assert (= (and b!1558118 c!144449) b!1558121))

(assert (= (and b!1558118 (not c!144449)) b!1558116))

(assert (= (or b!1558121 b!1558116) bm!71684))

(assert (= (or b!1558113 bm!71684) bm!71683))

(assert (= (or b!1558117 bm!71683) bm!71682))

(assert (= (and bm!71682 c!144451) b!1558114))

(assert (= (and bm!71682 (not c!144451)) b!1558112))

(assert (= (and d!162693 res!1065282) b!1558120))

(assert (= (and b!1558120 res!1065281) b!1558119))

(declare-fun m!1435853 () Bool)

(assert (=> d!162693 m!1435853))

(assert (=> d!162693 m!1435829))

(declare-fun m!1435855 () Bool)

(assert (=> b!1558114 m!1435855))

(declare-fun m!1435857 () Bool)

(assert (=> b!1558119 m!1435857))

(declare-fun m!1435859 () Bool)

(assert (=> b!1558120 m!1435859))

(declare-fun m!1435861 () Bool)

(assert (=> bm!71682 m!1435861))

(assert (=> b!1558042 d!162693))

(declare-fun d!162703 () Bool)

(declare-fun res!1065283 () Bool)

(declare-fun e!867884 () Bool)

(assert (=> d!162703 (=> res!1065283 e!867884)))

(assert (=> d!162703 (= res!1065283 (or ((_ is Nil!36296) l!1177) ((_ is Nil!36296) (t!51012 l!1177))))))

(assert (=> d!162703 (= (isStrictlySorted!913 l!1177) e!867884)))

(declare-fun b!1558128 () Bool)

(declare-fun e!867885 () Bool)

(assert (=> b!1558128 (= e!867884 e!867885)))

(declare-fun res!1065284 () Bool)

(assert (=> b!1558128 (=> (not res!1065284) (not e!867885))))

(assert (=> b!1558128 (= res!1065284 (bvslt (_1!12462 (h!37759 l!1177)) (_1!12462 (h!37759 (t!51012 l!1177)))))))

(declare-fun b!1558130 () Bool)

(assert (=> b!1558130 (= e!867885 (isStrictlySorted!913 (t!51012 l!1177)))))

(assert (= (and d!162703 (not res!1065283)) b!1558128))

(assert (= (and b!1558128 res!1065284) b!1558130))

(declare-fun m!1435863 () Bool)

(assert (=> b!1558130 m!1435863))

(assert (=> start!133200 d!162703))

(declare-fun b!1558148 () Bool)

(declare-fun e!867896 () Bool)

(declare-fun tp!112317 () Bool)

(assert (=> b!1558148 (= e!867896 (and tp_is_empty!38311 tp!112317))))

(assert (=> b!1558043 (= tp!112308 e!867896)))

(assert (= (and b!1558043 ((_ is Cons!36295) (t!51012 l!1177))) b!1558148))

(check-sat (not b!1558067) (not b!1558148) (not b!1558119) (not bm!71682) (not d!162693) tp_is_empty!38311 (not b!1558120) (not b!1558114) (not b!1558130))
(check-sat)
