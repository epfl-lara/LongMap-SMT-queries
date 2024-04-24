; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133310 () Bool)

(assert start!133310)

(declare-fun res!1065586 () Bool)

(declare-fun e!868283 () Bool)

(assert (=> start!133310 (=> (not res!1065586) (not e!868283))))

(declare-datatypes ((B!2350 0))(
  ( (B!2351 (val!19261 Int)) )
))
(declare-datatypes ((tuple2!24952 0))(
  ( (tuple2!24953 (_1!12487 (_ BitVec 64)) (_2!12487 B!2350)) )
))
(declare-datatypes ((List!36324 0))(
  ( (Nil!36321) (Cons!36320 (h!37784 tuple2!24952) (t!51037 List!36324)) )
))
(declare-fun l!1177 () List!36324)

(declare-fun isStrictlySorted!935 (List!36324) Bool)

(assert (=> start!133310 (= res!1065586 (isStrictlySorted!935 l!1177))))

(assert (=> start!133310 e!868283))

(declare-fun e!868285 () Bool)

(assert (=> start!133310 e!868285))

(assert (=> start!133310 true))

(declare-fun tp_is_empty!38361 () Bool)

(assert (=> start!133310 tp_is_empty!38361))

(declare-fun b!1558716 () Bool)

(declare-fun tp!112428 () Bool)

(assert (=> b!1558716 (= e!868285 (and tp_is_empty!38361 tp!112428))))

(declare-fun b!1558717 () Bool)

(declare-fun e!868286 () Bool)

(assert (=> b!1558717 (= e!868283 (not e!868286))))

(declare-fun res!1065587 () Bool)

(assert (=> b!1558717 (=> (not res!1065587) (not e!868286))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun lt!671317 () List!36324)

(declare-fun containsKey!810 (List!36324 (_ BitVec 64)) Bool)

(assert (=> b!1558717 (= res!1065587 (= (containsKey!810 lt!671317 otherKey!50) (containsKey!810 l!1177 otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2350)

(declare-fun insertStrictlySorted!551 (List!36324 (_ BitVec 64) B!2350) List!36324)

(assert (=> b!1558717 (= lt!671317 (insertStrictlySorted!551 l!1177 newKey!105 newValue!105))))

(declare-fun e!868284 () Bool)

(assert (=> b!1558717 e!868284))

(declare-fun res!1065585 () Bool)

(assert (=> b!1558717 (=> (not res!1065585) (not e!868284))))

(declare-fun lt!671316 () List!36324)

(assert (=> b!1558717 (= res!1065585 (= (containsKey!810 lt!671316 otherKey!50) (containsKey!810 (t!51037 l!1177) otherKey!50)))))

(assert (=> b!1558717 (= lt!671316 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51751 0))(
  ( (Unit!51752) )
))
(declare-fun lt!671315 () Unit!51751)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!35 (List!36324 (_ BitVec 64) B!2350 (_ BitVec 64)) Unit!51751)

(assert (=> b!1558717 (= lt!671315 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!35 (t!51037 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1558718 () Bool)

(declare-datatypes ((Option!847 0))(
  ( (Some!846 (v!22028 B!2350)) (None!845) )
))
(declare-fun getValueByKey!772 (List!36324 (_ BitVec 64)) Option!847)

(assert (=> b!1558718 (= e!868286 (= (getValueByKey!772 lt!671317 otherKey!50) (getValueByKey!772 l!1177 otherKey!50)))))

(declare-fun b!1558719 () Bool)

(declare-fun res!1065584 () Bool)

(assert (=> b!1558719 (=> (not res!1065584) (not e!868283))))

(assert (=> b!1558719 (= res!1065584 (and (not (= newKey!105 otherKey!50)) (is-Cons!36320 l!1177) (not (= (_1!12487 (h!37784 l!1177)) otherKey!50))))))

(declare-fun b!1558720 () Bool)

(assert (=> b!1558720 (= e!868284 (= (getValueByKey!772 lt!671316 otherKey!50) (getValueByKey!772 (t!51037 l!1177) otherKey!50)))))

(declare-fun b!1558721 () Bool)

(declare-fun res!1065588 () Bool)

(assert (=> b!1558721 (=> (not res!1065588) (not e!868283))))

(assert (=> b!1558721 (= res!1065588 (isStrictlySorted!935 (t!51037 l!1177)))))

(assert (= (and start!133310 res!1065586) b!1558719))

(assert (= (and b!1558719 res!1065584) b!1558721))

(assert (= (and b!1558721 res!1065588) b!1558717))

(assert (= (and b!1558717 res!1065585) b!1558720))

(assert (= (and b!1558717 res!1065587) b!1558718))

(assert (= (and start!133310 (is-Cons!36320 l!1177)) b!1558716))

(declare-fun m!1436113 () Bool)

(assert (=> b!1558717 m!1436113))

(declare-fun m!1436115 () Bool)

(assert (=> b!1558717 m!1436115))

(declare-fun m!1436117 () Bool)

(assert (=> b!1558717 m!1436117))

(declare-fun m!1436119 () Bool)

(assert (=> b!1558717 m!1436119))

(declare-fun m!1436121 () Bool)

(assert (=> b!1558717 m!1436121))

(declare-fun m!1436123 () Bool)

(assert (=> b!1558717 m!1436123))

(declare-fun m!1436125 () Bool)

(assert (=> b!1558717 m!1436125))

(declare-fun m!1436127 () Bool)

(assert (=> start!133310 m!1436127))

(declare-fun m!1436129 () Bool)

(assert (=> b!1558720 m!1436129))

(declare-fun m!1436131 () Bool)

(assert (=> b!1558720 m!1436131))

(declare-fun m!1436133 () Bool)

(assert (=> b!1558718 m!1436133))

(declare-fun m!1436135 () Bool)

(assert (=> b!1558718 m!1436135))

(declare-fun m!1436137 () Bool)

(assert (=> b!1558721 m!1436137))

(push 1)

(assert (not b!1558717))

(assert (not b!1558721))

(assert (not start!133310))

(assert (not b!1558720))

(assert (not b!1558718))

(assert (not b!1558716))

(assert tp_is_empty!38361)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1558773 () Bool)

(declare-fun e!868318 () Option!847)

(assert (=> b!1558773 (= e!868318 None!845)))

(declare-fun b!1558770 () Bool)

(declare-fun e!868317 () Option!847)

(assert (=> b!1558770 (= e!868317 (Some!846 (_2!12487 (h!37784 lt!671317))))))

(declare-fun b!1558772 () Bool)

(assert (=> b!1558772 (= e!868318 (getValueByKey!772 (t!51037 lt!671317) otherKey!50))))

(declare-fun b!1558771 () Bool)

(assert (=> b!1558771 (= e!868317 e!868318)))

(declare-fun c!144540 () Bool)

(assert (=> b!1558771 (= c!144540 (and (is-Cons!36320 lt!671317) (not (= (_1!12487 (h!37784 lt!671317)) otherKey!50))))))

(declare-fun d!162807 () Bool)

(declare-fun c!144539 () Bool)

(assert (=> d!162807 (= c!144539 (and (is-Cons!36320 lt!671317) (= (_1!12487 (h!37784 lt!671317)) otherKey!50)))))

(assert (=> d!162807 (= (getValueByKey!772 lt!671317 otherKey!50) e!868317)))

(assert (= (and d!162807 c!144539) b!1558770))

(assert (= (and d!162807 (not c!144539)) b!1558771))

(assert (= (and b!1558771 c!144540) b!1558772))

(assert (= (and b!1558771 (not c!144540)) b!1558773))

(declare-fun m!1436169 () Bool)

(assert (=> b!1558772 m!1436169))

(assert (=> b!1558718 d!162807))

(declare-fun b!1558785 () Bool)

(declare-fun e!868324 () Option!847)

(assert (=> b!1558785 (= e!868324 None!845)))

(declare-fun b!1558782 () Bool)

(declare-fun e!868323 () Option!847)

(assert (=> b!1558782 (= e!868323 (Some!846 (_2!12487 (h!37784 l!1177))))))

(declare-fun b!1558784 () Bool)

(assert (=> b!1558784 (= e!868324 (getValueByKey!772 (t!51037 l!1177) otherKey!50))))

(declare-fun b!1558783 () Bool)

(assert (=> b!1558783 (= e!868323 e!868324)))

(declare-fun c!144546 () Bool)

(assert (=> b!1558783 (= c!144546 (and (is-Cons!36320 l!1177) (not (= (_1!12487 (h!37784 l!1177)) otherKey!50))))))

(declare-fun d!162813 () Bool)

(declare-fun c!144545 () Bool)

(assert (=> d!162813 (= c!144545 (and (is-Cons!36320 l!1177) (= (_1!12487 (h!37784 l!1177)) otherKey!50)))))

(assert (=> d!162813 (= (getValueByKey!772 l!1177 otherKey!50) e!868323)))

(assert (= (and d!162813 c!144545) b!1558782))

(assert (= (and d!162813 (not c!144545)) b!1558783))

(assert (= (and b!1558783 c!144546) b!1558784))

(assert (= (and b!1558783 (not c!144546)) b!1558785))

(assert (=> b!1558784 m!1436131))

(assert (=> b!1558718 d!162813))

(declare-fun b!1558866 () Bool)

(declare-fun e!868371 () List!36324)

(declare-fun e!868373 () List!36324)

(assert (=> b!1558866 (= e!868371 e!868373)))

(declare-fun c!144579 () Bool)

(assert (=> b!1558866 (= c!144579 (and (is-Cons!36320 l!1177) (= (_1!12487 (h!37784 l!1177)) newKey!105)))))

(declare-fun b!1558867 () Bool)

(declare-fun call!71750 () List!36324)

(assert (=> b!1558867 (= e!868371 call!71750)))

(declare-fun b!1558868 () Bool)

(declare-fun c!144578 () Bool)

(assert (=> b!1558868 (= c!144578 (and (is-Cons!36320 l!1177) (bvsgt (_1!12487 (h!37784 l!1177)) newKey!105)))))

(declare-fun e!868370 () List!36324)

(assert (=> b!1558868 (= e!868373 e!868370)))

(declare-fun c!144580 () Bool)

(declare-fun e!868374 () List!36324)

(declare-fun bm!71747 () Bool)

(declare-fun $colon$colon!966 (List!36324 tuple2!24952) List!36324)

(assert (=> bm!71747 (= call!71750 ($colon$colon!966 e!868374 (ite c!144580 (h!37784 l!1177) (tuple2!24953 newKey!105 newValue!105))))))

(declare-fun c!144577 () Bool)

(assert (=> bm!71747 (= c!144577 c!144580)))

(declare-fun b!1558869 () Bool)

(assert (=> b!1558869 (= e!868374 (ite c!144579 (t!51037 l!1177) (ite c!144578 (Cons!36320 (h!37784 l!1177) (t!51037 l!1177)) Nil!36321)))))

(declare-fun bm!71748 () Bool)

(declare-fun call!71751 () List!36324)

(assert (=> bm!71748 (= call!71751 call!71750)))

(declare-fun b!1558870 () Bool)

(assert (=> b!1558870 (= e!868374 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105))))

(declare-fun b!1558871 () Bool)

(declare-fun res!1065631 () Bool)

(declare-fun e!868372 () Bool)

(assert (=> b!1558871 (=> (not res!1065631) (not e!868372))))

(declare-fun lt!671334 () List!36324)

(assert (=> b!1558871 (= res!1065631 (containsKey!810 lt!671334 newKey!105))))

(declare-fun bm!71749 () Bool)

(declare-fun call!71752 () List!36324)

(assert (=> bm!71749 (= call!71752 call!71751)))

(declare-fun d!162817 () Bool)

(assert (=> d!162817 e!868372))

(declare-fun res!1065630 () Bool)

(assert (=> d!162817 (=> (not res!1065630) (not e!868372))))

(assert (=> d!162817 (= res!1065630 (isStrictlySorted!935 lt!671334))))

(assert (=> d!162817 (= lt!671334 e!868371)))

(assert (=> d!162817 (= c!144580 (and (is-Cons!36320 l!1177) (bvslt (_1!12487 (h!37784 l!1177)) newKey!105)))))

(assert (=> d!162817 (isStrictlySorted!935 l!1177)))

(assert (=> d!162817 (= (insertStrictlySorted!551 l!1177 newKey!105 newValue!105) lt!671334)))

(declare-fun b!1558872 () Bool)

(assert (=> b!1558872 (= e!868370 call!71752)))

(declare-fun b!1558873 () Bool)

(assert (=> b!1558873 (= e!868370 call!71752)))

(declare-fun b!1558874 () Bool)

(assert (=> b!1558874 (= e!868373 call!71751)))

(declare-fun b!1558875 () Bool)

(declare-fun contains!10228 (List!36324 tuple2!24952) Bool)

(assert (=> b!1558875 (= e!868372 (contains!10228 lt!671334 (tuple2!24953 newKey!105 newValue!105)))))

(assert (= (and d!162817 c!144580) b!1558867))

(assert (= (and d!162817 (not c!144580)) b!1558866))

(assert (= (and b!1558866 c!144579) b!1558874))

(assert (= (and b!1558866 (not c!144579)) b!1558868))

(assert (= (and b!1558868 c!144578) b!1558873))

(assert (= (and b!1558868 (not c!144578)) b!1558872))

(assert (= (or b!1558873 b!1558872) bm!71749))

(assert (= (or b!1558874 bm!71749) bm!71748))

(assert (= (or b!1558867 bm!71748) bm!71747))

(assert (= (and bm!71747 c!144577) b!1558870))

(assert (= (and bm!71747 (not c!144577)) b!1558869))

(assert (= (and d!162817 res!1065630) b!1558871))

(assert (= (and b!1558871 res!1065631) b!1558875))

(assert (=> b!1558870 m!1436119))

(declare-fun m!1436179 () Bool)

(assert (=> b!1558875 m!1436179))

(declare-fun m!1436183 () Bool)

(assert (=> b!1558871 m!1436183))

(declare-fun m!1436187 () Bool)

(assert (=> bm!71747 m!1436187))

(declare-fun m!1436191 () Bool)

(assert (=> d!162817 m!1436191))

(assert (=> d!162817 m!1436127))

(assert (=> b!1558717 d!162817))

(declare-fun d!162831 () Bool)

(declare-fun e!868394 () Bool)

(assert (=> d!162831 e!868394))

(declare-fun res!1065648 () Bool)

(assert (=> d!162831 (=> (not res!1065648) (not e!868394))))

(assert (=> d!162831 (= res!1065648 (= (containsKey!810 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!810 (t!51037 l!1177) otherKey!50)))))

(declare-fun lt!671341 () Unit!51751)

(declare-fun choose!2056 (List!36324 (_ BitVec 64) B!2350 (_ BitVec 64)) Unit!51751)

(assert (=> d!162831 (= lt!671341 (choose!2056 (t!51037 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!868395 () Bool)

(assert (=> d!162831 e!868395))

(declare-fun res!1065649 () Bool)

(assert (=> d!162831 (=> (not res!1065649) (not e!868395))))

(assert (=> d!162831 (= res!1065649 (isStrictlySorted!935 (t!51037 l!1177)))))

(assert (=> d!162831 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!35 (t!51037 l!1177) newKey!105 newValue!105 otherKey!50) lt!671341)))

(declare-fun b!1558904 () Bool)

(assert (=> b!1558904 (= e!868395 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1558905 () Bool)

(assert (=> b!1558905 (= e!868394 (= (getValueByKey!772 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!772 (t!51037 l!1177) otherKey!50)))))

(assert (= (and d!162831 res!1065649) b!1558904))

(assert (= (and d!162831 res!1065648) b!1558905))

(assert (=> d!162831 m!1436119))

(declare-fun m!1436203 () Bool)

(assert (=> d!162831 m!1436203))

(assert (=> d!162831 m!1436123))

(assert (=> d!162831 m!1436119))

(declare-fun m!1436207 () Bool)

(assert (=> d!162831 m!1436207))

(assert (=> d!162831 m!1436137))

(assert (=> b!1558905 m!1436119))

(assert (=> b!1558905 m!1436119))

(declare-fun m!1436211 () Bool)

(assert (=> b!1558905 m!1436211))

(assert (=> b!1558905 m!1436131))

(assert (=> b!1558717 d!162831))

(declare-fun d!162837 () Bool)

(declare-fun res!1065666 () Bool)

(declare-fun e!868412 () Bool)

(assert (=> d!162837 (=> res!1065666 e!868412)))

(assert (=> d!162837 (= res!1065666 (and (is-Cons!36320 lt!671316) (= (_1!12487 (h!37784 lt!671316)) otherKey!50)))))

(assert (=> d!162837 (= (containsKey!810 lt!671316 otherKey!50) e!868412)))

(declare-fun b!1558922 () Bool)

(declare-fun e!868413 () Bool)

(assert (=> b!1558922 (= e!868412 e!868413)))

(declare-fun res!1065667 () Bool)

(assert (=> b!1558922 (=> (not res!1065667) (not e!868413))))

(assert (=> b!1558922 (= res!1065667 (and (or (not (is-Cons!36320 lt!671316)) (bvsle (_1!12487 (h!37784 lt!671316)) otherKey!50)) (is-Cons!36320 lt!671316) (bvslt (_1!12487 (h!37784 lt!671316)) otherKey!50)))))

(declare-fun b!1558923 () Bool)

(assert (=> b!1558923 (= e!868413 (containsKey!810 (t!51037 lt!671316) otherKey!50))))

(assert (= (and d!162837 (not res!1065666)) b!1558922))

(assert (= (and b!1558922 res!1065667) b!1558923))

(declare-fun m!1436217 () Bool)

(assert (=> b!1558923 m!1436217))

(assert (=> b!1558717 d!162837))

(declare-fun d!162843 () Bool)

(declare-fun res!1065670 () Bool)

(declare-fun e!868416 () Bool)

(assert (=> d!162843 (=> res!1065670 e!868416)))

(assert (=> d!162843 (= res!1065670 (and (is-Cons!36320 l!1177) (= (_1!12487 (h!37784 l!1177)) otherKey!50)))))

(assert (=> d!162843 (= (containsKey!810 l!1177 otherKey!50) e!868416)))

(declare-fun b!1558926 () Bool)

(declare-fun e!868417 () Bool)

(assert (=> b!1558926 (= e!868416 e!868417)))

(declare-fun res!1065671 () Bool)

(assert (=> b!1558926 (=> (not res!1065671) (not e!868417))))

(assert (=> b!1558926 (= res!1065671 (and (or (not (is-Cons!36320 l!1177)) (bvsle (_1!12487 (h!37784 l!1177)) otherKey!50)) (is-Cons!36320 l!1177) (bvslt (_1!12487 (h!37784 l!1177)) otherKey!50)))))

(declare-fun b!1558927 () Bool)

(assert (=> b!1558927 (= e!868417 (containsKey!810 (t!51037 l!1177) otherKey!50))))

(assert (= (and d!162843 (not res!1065670)) b!1558926))

(assert (= (and b!1558926 res!1065671) b!1558927))

(assert (=> b!1558927 m!1436123))

(assert (=> b!1558717 d!162843))

(declare-fun d!162847 () Bool)

(declare-fun res!1065674 () Bool)

(declare-fun e!868420 () Bool)

(assert (=> d!162847 (=> res!1065674 e!868420)))

(assert (=> d!162847 (= res!1065674 (and (is-Cons!36320 lt!671317) (= (_1!12487 (h!37784 lt!671317)) otherKey!50)))))

(assert (=> d!162847 (= (containsKey!810 lt!671317 otherKey!50) e!868420)))

(declare-fun b!1558930 () Bool)

(declare-fun e!868421 () Bool)

(assert (=> b!1558930 (= e!868420 e!868421)))

(declare-fun res!1065675 () Bool)

(assert (=> b!1558930 (=> (not res!1065675) (not e!868421))))

(assert (=> b!1558930 (= res!1065675 (and (or (not (is-Cons!36320 lt!671317)) (bvsle (_1!12487 (h!37784 lt!671317)) otherKey!50)) (is-Cons!36320 lt!671317) (bvslt (_1!12487 (h!37784 lt!671317)) otherKey!50)))))

(declare-fun b!1558931 () Bool)

(assert (=> b!1558931 (= e!868421 (containsKey!810 (t!51037 lt!671317) otherKey!50))))

(assert (= (and d!162847 (not res!1065674)) b!1558930))

(assert (= (and b!1558930 res!1065675) b!1558931))

(declare-fun m!1436221 () Bool)

(assert (=> b!1558931 m!1436221))

(assert (=> b!1558717 d!162847))

(declare-fun b!1558942 () Bool)

(declare-fun e!868428 () List!36324)

(declare-fun e!868430 () List!36324)

(assert (=> b!1558942 (= e!868428 e!868430)))

(declare-fun c!144593 () Bool)

(assert (=> b!1558942 (= c!144593 (and (is-Cons!36320 (t!51037 l!1177)) (= (_1!12487 (h!37784 (t!51037 l!1177))) newKey!105)))))

(declare-fun b!1558943 () Bool)

(declare-fun call!71761 () List!36324)

(assert (=> b!1558943 (= e!868428 call!71761)))

(declare-fun b!1558944 () Bool)

(declare-fun c!144592 () Bool)

(assert (=> b!1558944 (= c!144592 (and (is-Cons!36320 (t!51037 l!1177)) (bvsgt (_1!12487 (h!37784 (t!51037 l!1177))) newKey!105)))))

(declare-fun e!868427 () List!36324)

(assert (=> b!1558944 (= e!868430 e!868427)))

(declare-fun bm!71758 () Bool)

(declare-fun c!144594 () Bool)

(declare-fun e!868431 () List!36324)

(assert (=> bm!71758 (= call!71761 ($colon$colon!966 e!868431 (ite c!144594 (h!37784 (t!51037 l!1177)) (tuple2!24953 newKey!105 newValue!105))))))

(declare-fun c!144591 () Bool)

(assert (=> bm!71758 (= c!144591 c!144594)))

(declare-fun b!1558945 () Bool)

(assert (=> b!1558945 (= e!868431 (ite c!144593 (t!51037 (t!51037 l!1177)) (ite c!144592 (Cons!36320 (h!37784 (t!51037 l!1177)) (t!51037 (t!51037 l!1177))) Nil!36321)))))

(declare-fun bm!71759 () Bool)

(declare-fun call!71762 () List!36324)

(assert (=> bm!71759 (= call!71762 call!71761)))

(declare-fun b!1558946 () Bool)

(assert (=> b!1558946 (= e!868431 (insertStrictlySorted!551 (t!51037 (t!51037 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1558947 () Bool)

(declare-fun res!1065679 () Bool)

(declare-fun e!868429 () Bool)

(assert (=> b!1558947 (=> (not res!1065679) (not e!868429))))

(declare-fun lt!671343 () List!36324)

(assert (=> b!1558947 (= res!1065679 (containsKey!810 lt!671343 newKey!105))))

(declare-fun bm!71760 () Bool)

(declare-fun call!71763 () List!36324)

(assert (=> bm!71760 (= call!71763 call!71762)))

(declare-fun d!162851 () Bool)

(assert (=> d!162851 e!868429))

(declare-fun res!1065678 () Bool)

(assert (=> d!162851 (=> (not res!1065678) (not e!868429))))

(assert (=> d!162851 (= res!1065678 (isStrictlySorted!935 lt!671343))))

(assert (=> d!162851 (= lt!671343 e!868428)))

(assert (=> d!162851 (= c!144594 (and (is-Cons!36320 (t!51037 l!1177)) (bvslt (_1!12487 (h!37784 (t!51037 l!1177))) newKey!105)))))

(assert (=> d!162851 (isStrictlySorted!935 (t!51037 l!1177))))

(assert (=> d!162851 (= (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105) lt!671343)))

(declare-fun b!1558948 () Bool)

(assert (=> b!1558948 (= e!868427 call!71763)))

(declare-fun b!1558949 () Bool)

(assert (=> b!1558949 (= e!868427 call!71763)))

(declare-fun b!1558950 () Bool)

(assert (=> b!1558950 (= e!868430 call!71762)))

(declare-fun b!1558951 () Bool)

(assert (=> b!1558951 (= e!868429 (contains!10228 lt!671343 (tuple2!24953 newKey!105 newValue!105)))))

(assert (= (and d!162851 c!144594) b!1558943))

(assert (= (and d!162851 (not c!144594)) b!1558942))

(assert (= (and b!1558942 c!144593) b!1558950))

(assert (= (and b!1558942 (not c!144593)) b!1558944))

(assert (= (and b!1558944 c!144592) b!1558949))

(assert (= (and b!1558944 (not c!144592)) b!1558948))

(assert (= (or b!1558949 b!1558948) bm!71760))

(assert (= (or b!1558950 bm!71760) bm!71759))

(assert (= (or b!1558943 bm!71759) bm!71758))

(assert (= (and bm!71758 c!144591) b!1558946))

(assert (= (and bm!71758 (not c!144591)) b!1558945))

(assert (= (and d!162851 res!1065678) b!1558947))

(assert (= (and b!1558947 res!1065679) b!1558951))

(declare-fun m!1436227 () Bool)

(assert (=> b!1558946 m!1436227))

(declare-fun m!1436231 () Bool)

(assert (=> b!1558951 m!1436231))

(declare-fun m!1436235 () Bool)

(assert (=> b!1558947 m!1436235))

(declare-fun m!1436239 () Bool)

(assert (=> bm!71758 m!1436239))

(declare-fun m!1436241 () Bool)

(assert (=> d!162851 m!1436241))

(assert (=> d!162851 m!1436137))

(assert (=> b!1558717 d!162851))

(declare-fun d!162855 () Bool)

(declare-fun res!1065682 () Bool)

(declare-fun e!868434 () Bool)

(assert (=> d!162855 (=> res!1065682 e!868434)))

(assert (=> d!162855 (= res!1065682 (and (is-Cons!36320 (t!51037 l!1177)) (= (_1!12487 (h!37784 (t!51037 l!1177))) otherKey!50)))))

(assert (=> d!162855 (= (containsKey!810 (t!51037 l!1177) otherKey!50) e!868434)))

(declare-fun b!1558954 () Bool)

(declare-fun e!868435 () Bool)

(assert (=> b!1558954 (= e!868434 e!868435)))

(declare-fun res!1065683 () Bool)

(assert (=> b!1558954 (=> (not res!1065683) (not e!868435))))

(assert (=> b!1558954 (= res!1065683 (and (or (not (is-Cons!36320 (t!51037 l!1177))) (bvsle (_1!12487 (h!37784 (t!51037 l!1177))) otherKey!50)) (is-Cons!36320 (t!51037 l!1177)) (bvslt (_1!12487 (h!37784 (t!51037 l!1177))) otherKey!50)))))

(declare-fun b!1558955 () Bool)

(assert (=> b!1558955 (= e!868435 (containsKey!810 (t!51037 (t!51037 l!1177)) otherKey!50))))

(assert (= (and d!162855 (not res!1065682)) b!1558954))

(assert (= (and b!1558954 res!1065683) b!1558955))

(declare-fun m!1436245 () Bool)

(assert (=> b!1558955 m!1436245))

(assert (=> b!1558717 d!162855))

(declare-fun d!162859 () Bool)

(declare-fun res!1065696 () Bool)

(declare-fun e!868455 () Bool)

(assert (=> d!162859 (=> res!1065696 e!868455)))

(assert (=> d!162859 (= res!1065696 (or (is-Nil!36321 (t!51037 l!1177)) (is-Nil!36321 (t!51037 (t!51037 l!1177)))))))

(assert (=> d!162859 (= (isStrictlySorted!935 (t!51037 l!1177)) e!868455)))

(declare-fun b!1558981 () Bool)

(declare-fun e!868456 () Bool)

(assert (=> b!1558981 (= e!868455 e!868456)))

(declare-fun res!1065697 () Bool)

(assert (=> b!1558981 (=> (not res!1065697) (not e!868456))))

(assert (=> b!1558981 (= res!1065697 (bvslt (_1!12487 (h!37784 (t!51037 l!1177))) (_1!12487 (h!37784 (t!51037 (t!51037 l!1177))))))))

(declare-fun b!1558982 () Bool)

(assert (=> b!1558982 (= e!868456 (isStrictlySorted!935 (t!51037 (t!51037 l!1177))))))

(assert (= (and d!162859 (not res!1065696)) b!1558981))

(assert (= (and b!1558981 res!1065697) b!1558982))

(declare-fun m!1436255 () Bool)

(assert (=> b!1558982 m!1436255))

(assert (=> b!1558721 d!162859))

(declare-fun d!162867 () Bool)

(declare-fun res!1065700 () Bool)

(declare-fun e!868462 () Bool)

(assert (=> d!162867 (=> res!1065700 e!868462)))

(assert (=> d!162867 (= res!1065700 (or (is-Nil!36321 l!1177) (is-Nil!36321 (t!51037 l!1177))))))

(assert (=> d!162867 (= (isStrictlySorted!935 l!1177) e!868462)))

(declare-fun b!1558993 () Bool)

(declare-fun e!868463 () Bool)

(assert (=> b!1558993 (= e!868462 e!868463)))

(declare-fun res!1065701 () Bool)

(assert (=> b!1558993 (=> (not res!1065701) (not e!868463))))

(assert (=> b!1558993 (= res!1065701 (bvslt (_1!12487 (h!37784 l!1177)) (_1!12487 (h!37784 (t!51037 l!1177)))))))

(declare-fun b!1558994 () Bool)

(assert (=> b!1558994 (= e!868463 (isStrictlySorted!935 (t!51037 l!1177)))))

(assert (= (and d!162867 (not res!1065700)) b!1558993))

(assert (= (and b!1558993 res!1065701) b!1558994))

(assert (=> b!1558994 m!1436137))

(assert (=> start!133310 d!162867))

(declare-fun b!1558998 () Bool)

(declare-fun e!868465 () Option!847)

(assert (=> b!1558998 (= e!868465 None!845)))

(declare-fun b!1558995 () Bool)

(declare-fun e!868464 () Option!847)

(assert (=> b!1558995 (= e!868464 (Some!846 (_2!12487 (h!37784 lt!671316))))))

(declare-fun b!1558997 () Bool)

(assert (=> b!1558997 (= e!868465 (getValueByKey!772 (t!51037 lt!671316) otherKey!50))))

(declare-fun b!1558996 () Bool)

(assert (=> b!1558996 (= e!868464 e!868465)))

(declare-fun c!144604 () Bool)

(assert (=> b!1558996 (= c!144604 (and (is-Cons!36320 lt!671316) (not (= (_1!12487 (h!37784 lt!671316)) otherKey!50))))))

(declare-fun d!162869 () Bool)

(declare-fun c!144603 () Bool)

(assert (=> d!162869 (= c!144603 (and (is-Cons!36320 lt!671316) (= (_1!12487 (h!37784 lt!671316)) otherKey!50)))))

(assert (=> d!162869 (= (getValueByKey!772 lt!671316 otherKey!50) e!868464)))

(assert (= (and d!162869 c!144603) b!1558995))

(assert (= (and d!162869 (not c!144603)) b!1558996))

(assert (= (and b!1558996 c!144604) b!1558997))

(assert (= (and b!1558996 (not c!144604)) b!1558998))

(declare-fun m!1436261 () Bool)

(assert (=> b!1558997 m!1436261))

(assert (=> b!1558720 d!162869))

(declare-fun b!1559002 () Bool)

(declare-fun e!868467 () Option!847)

(assert (=> b!1559002 (= e!868467 None!845)))

(declare-fun b!1558999 () Bool)

(declare-fun e!868466 () Option!847)

(assert (=> b!1558999 (= e!868466 (Some!846 (_2!12487 (h!37784 (t!51037 l!1177)))))))

(declare-fun b!1559001 () Bool)

(assert (=> b!1559001 (= e!868467 (getValueByKey!772 (t!51037 (t!51037 l!1177)) otherKey!50))))

(declare-fun b!1559000 () Bool)

(assert (=> b!1559000 (= e!868466 e!868467)))

(declare-fun c!144606 () Bool)

(assert (=> b!1559000 (= c!144606 (and (is-Cons!36320 (t!51037 l!1177)) (not (= (_1!12487 (h!37784 (t!51037 l!1177))) otherKey!50))))))

(declare-fun d!162871 () Bool)

(declare-fun c!144605 () Bool)

(assert (=> d!162871 (= c!144605 (and (is-Cons!36320 (t!51037 l!1177)) (= (_1!12487 (h!37784 (t!51037 l!1177))) otherKey!50)))))

(assert (=> d!162871 (= (getValueByKey!772 (t!51037 l!1177) otherKey!50) e!868466)))

(assert (= (and d!162871 c!144605) b!1558999))

(assert (= (and d!162871 (not c!144605)) b!1559000))

(assert (= (and b!1559000 c!144606) b!1559001))

(assert (= (and b!1559000 (not c!144606)) b!1559002))

(declare-fun m!1436269 () Bool)

(assert (=> b!1559001 m!1436269))

(assert (=> b!1558720 d!162871))

(declare-fun b!1559015 () Bool)

(declare-fun e!868476 () Bool)

(declare-fun tp!112437 () Bool)

(assert (=> b!1559015 (= e!868476 (and tp_is_empty!38361 tp!112437))))

(assert (=> b!1558716 (= tp!112428 e!868476)))

(assert (= (and b!1558716 (is-Cons!36320 (t!51037 l!1177))) b!1559015))

(push 1)

(assert (not b!1559015))

(assert (not b!1558905))

(assert (not b!1558955))

(assert (not b!1559001))

(assert tp_is_empty!38361)

(assert (not b!1558871))

(assert (not d!162851))

(assert (not d!162831))

(assert (not b!1558784))

(assert (not bm!71758))

(assert (not b!1558947))

(assert (not d!162817))

(assert (not b!1558931))

(assert (not b!1558875))

(assert (not b!1558772))

(assert (not b!1558946))

(assert (not b!1558870))

(assert (not b!1558951))

(assert (not b!1558997))

(assert (not bm!71747))

(assert (not b!1558923))

(assert (not b!1558994))

(assert (not b!1558982))

(assert (not b!1558927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162957 () Bool)

(declare-fun res!1065768 () Bool)

(declare-fun e!868568 () Bool)

(assert (=> d!162957 (=> res!1065768 e!868568)))

(assert (=> d!162957 (= res!1065768 (or (is-Nil!36321 lt!671334) (is-Nil!36321 (t!51037 lt!671334))))))

(assert (=> d!162957 (= (isStrictlySorted!935 lt!671334) e!868568)))

(declare-fun b!1559137 () Bool)

(declare-fun e!868569 () Bool)

(assert (=> b!1559137 (= e!868568 e!868569)))

(declare-fun res!1065769 () Bool)

(assert (=> b!1559137 (=> (not res!1065769) (not e!868569))))

(assert (=> b!1559137 (= res!1065769 (bvslt (_1!12487 (h!37784 lt!671334)) (_1!12487 (h!37784 (t!51037 lt!671334)))))))

(declare-fun b!1559138 () Bool)

(assert (=> b!1559138 (= e!868569 (isStrictlySorted!935 (t!51037 lt!671334)))))

(assert (= (and d!162957 (not res!1065768)) b!1559137))

(assert (= (and b!1559137 res!1065769) b!1559138))

(declare-fun m!1436375 () Bool)

(assert (=> b!1559138 m!1436375))

(assert (=> d!162817 d!162957))

(assert (=> d!162817 d!162867))

(declare-fun d!162959 () Bool)

(declare-fun res!1065770 () Bool)

(declare-fun e!868570 () Bool)

(assert (=> d!162959 (=> res!1065770 e!868570)))

(assert (=> d!162959 (= res!1065770 (and (is-Cons!36320 (t!51037 lt!671317)) (= (_1!12487 (h!37784 (t!51037 lt!671317))) otherKey!50)))))

(assert (=> d!162959 (= (containsKey!810 (t!51037 lt!671317) otherKey!50) e!868570)))

(declare-fun b!1559139 () Bool)

(declare-fun e!868571 () Bool)

(assert (=> b!1559139 (= e!868570 e!868571)))

(declare-fun res!1065771 () Bool)

(assert (=> b!1559139 (=> (not res!1065771) (not e!868571))))

(assert (=> b!1559139 (= res!1065771 (and (or (not (is-Cons!36320 (t!51037 lt!671317))) (bvsle (_1!12487 (h!37784 (t!51037 lt!671317))) otherKey!50)) (is-Cons!36320 (t!51037 lt!671317)) (bvslt (_1!12487 (h!37784 (t!51037 lt!671317))) otherKey!50)))))

(declare-fun b!1559140 () Bool)

(assert (=> b!1559140 (= e!868571 (containsKey!810 (t!51037 (t!51037 lt!671317)) otherKey!50))))

(assert (= (and d!162959 (not res!1065770)) b!1559139))

(assert (= (and b!1559139 res!1065771) b!1559140))

(declare-fun m!1436377 () Bool)

(assert (=> b!1559140 m!1436377))

(assert (=> b!1558931 d!162959))

(declare-fun d!162961 () Bool)

(assert (=> d!162961 (= ($colon$colon!966 e!868374 (ite c!144580 (h!37784 l!1177) (tuple2!24953 newKey!105 newValue!105))) (Cons!36320 (ite c!144580 (h!37784 l!1177) (tuple2!24953 newKey!105 newValue!105)) e!868374))))

(assert (=> bm!71747 d!162961))

(declare-fun d!162963 () Bool)

(assert (=> d!162963 (= ($colon$colon!966 e!868431 (ite c!144594 (h!37784 (t!51037 l!1177)) (tuple2!24953 newKey!105 newValue!105))) (Cons!36320 (ite c!144594 (h!37784 (t!51037 l!1177)) (tuple2!24953 newKey!105 newValue!105)) e!868431))))

(assert (=> bm!71758 d!162963))

(declare-fun b!1559144 () Bool)

(declare-fun e!868573 () Option!847)

(assert (=> b!1559144 (= e!868573 None!845)))

(declare-fun e!868572 () Option!847)

(declare-fun b!1559141 () Bool)

(assert (=> b!1559141 (= e!868572 (Some!846 (_2!12487 (h!37784 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105)))))))

(declare-fun b!1559143 () Bool)

(assert (=> b!1559143 (= e!868573 (getValueByKey!772 (t!51037 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105)) otherKey!50))))

(declare-fun b!1559142 () Bool)

(assert (=> b!1559142 (= e!868572 e!868573)))

(declare-fun c!144636 () Bool)

(assert (=> b!1559142 (= c!144636 (and (is-Cons!36320 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105)) (not (= (_1!12487 (h!37784 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105))) otherKey!50))))))

(declare-fun d!162965 () Bool)

(declare-fun c!144635 () Bool)

(assert (=> d!162965 (= c!144635 (and (is-Cons!36320 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105)) (= (_1!12487 (h!37784 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(assert (=> d!162965 (= (getValueByKey!772 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105) otherKey!50) e!868572)))

(assert (= (and d!162965 c!144635) b!1559141))

(assert (= (and d!162965 (not c!144635)) b!1559142))

(assert (= (and b!1559142 c!144636) b!1559143))

(assert (= (and b!1559142 (not c!144636)) b!1559144))

(declare-fun m!1436379 () Bool)

(assert (=> b!1559143 m!1436379))

(assert (=> b!1558905 d!162965))

(assert (=> b!1558905 d!162851))

(assert (=> b!1558905 d!162871))

(declare-fun d!162967 () Bool)

(declare-fun res!1065772 () Bool)

(declare-fun e!868574 () Bool)

(assert (=> d!162967 (=> res!1065772 e!868574)))

(assert (=> d!162967 (= res!1065772 (and (is-Cons!36320 lt!671334) (= (_1!12487 (h!37784 lt!671334)) newKey!105)))))

(assert (=> d!162967 (= (containsKey!810 lt!671334 newKey!105) e!868574)))

(declare-fun b!1559145 () Bool)

(declare-fun e!868575 () Bool)

(assert (=> b!1559145 (= e!868574 e!868575)))

(declare-fun res!1065773 () Bool)

(assert (=> b!1559145 (=> (not res!1065773) (not e!868575))))

(assert (=> b!1559145 (= res!1065773 (and (or (not (is-Cons!36320 lt!671334)) (bvsle (_1!12487 (h!37784 lt!671334)) newKey!105)) (is-Cons!36320 lt!671334) (bvslt (_1!12487 (h!37784 lt!671334)) newKey!105)))))

(declare-fun b!1559146 () Bool)

(assert (=> b!1559146 (= e!868575 (containsKey!810 (t!51037 lt!671334) newKey!105))))

(assert (= (and d!162967 (not res!1065772)) b!1559145))

(assert (= (and b!1559145 res!1065773) b!1559146))

(declare-fun m!1436381 () Bool)

(assert (=> b!1559146 m!1436381))

(assert (=> b!1558871 d!162967))

(declare-fun d!162969 () Bool)

(declare-fun res!1065774 () Bool)

(declare-fun e!868576 () Bool)

(assert (=> d!162969 (=> res!1065774 e!868576)))

(assert (=> d!162969 (= res!1065774 (and (is-Cons!36320 lt!671343) (= (_1!12487 (h!37784 lt!671343)) newKey!105)))))

(assert (=> d!162969 (= (containsKey!810 lt!671343 newKey!105) e!868576)))

(declare-fun b!1559147 () Bool)

(declare-fun e!868577 () Bool)

(assert (=> b!1559147 (= e!868576 e!868577)))

(declare-fun res!1065775 () Bool)

(assert (=> b!1559147 (=> (not res!1065775) (not e!868577))))

(assert (=> b!1559147 (= res!1065775 (and (or (not (is-Cons!36320 lt!671343)) (bvsle (_1!12487 (h!37784 lt!671343)) newKey!105)) (is-Cons!36320 lt!671343) (bvslt (_1!12487 (h!37784 lt!671343)) newKey!105)))))

(declare-fun b!1559148 () Bool)

(assert (=> b!1559148 (= e!868577 (containsKey!810 (t!51037 lt!671343) newKey!105))))

(assert (= (and d!162969 (not res!1065774)) b!1559147))

(assert (= (and b!1559147 res!1065775) b!1559148))

(declare-fun m!1436383 () Bool)

(assert (=> b!1559148 m!1436383))

(assert (=> b!1558947 d!162969))

(assert (=> b!1558927 d!162855))

(assert (=> b!1558870 d!162851))

(declare-fun b!1559149 () Bool)

(declare-fun e!868579 () List!36324)

(declare-fun e!868581 () List!36324)

(assert (=> b!1559149 (= e!868579 e!868581)))

(declare-fun c!144639 () Bool)

(assert (=> b!1559149 (= c!144639 (and (is-Cons!36320 (t!51037 (t!51037 l!1177))) (= (_1!12487 (h!37784 (t!51037 (t!51037 l!1177)))) newKey!105)))))

(declare-fun b!1559150 () Bool)

(declare-fun call!71773 () List!36324)

(assert (=> b!1559150 (= e!868579 call!71773)))

(declare-fun b!1559151 () Bool)

(declare-fun c!144638 () Bool)

(assert (=> b!1559151 (= c!144638 (and (is-Cons!36320 (t!51037 (t!51037 l!1177))) (bvsgt (_1!12487 (h!37784 (t!51037 (t!51037 l!1177)))) newKey!105)))))

(declare-fun e!868578 () List!36324)

(assert (=> b!1559151 (= e!868581 e!868578)))

(declare-fun e!868582 () List!36324)

(declare-fun c!144640 () Bool)

(declare-fun bm!71770 () Bool)

(assert (=> bm!71770 (= call!71773 ($colon$colon!966 e!868582 (ite c!144640 (h!37784 (t!51037 (t!51037 l!1177))) (tuple2!24953 newKey!105 newValue!105))))))

(declare-fun c!144637 () Bool)

(assert (=> bm!71770 (= c!144637 c!144640)))

(declare-fun b!1559152 () Bool)

(assert (=> b!1559152 (= e!868582 (ite c!144639 (t!51037 (t!51037 (t!51037 l!1177))) (ite c!144638 (Cons!36320 (h!37784 (t!51037 (t!51037 l!1177))) (t!51037 (t!51037 (t!51037 l!1177)))) Nil!36321)))))

(declare-fun bm!71771 () Bool)

(declare-fun call!71774 () List!36324)

(assert (=> bm!71771 (= call!71774 call!71773)))

(declare-fun b!1559153 () Bool)

(assert (=> b!1559153 (= e!868582 (insertStrictlySorted!551 (t!51037 (t!51037 (t!51037 l!1177))) newKey!105 newValue!105))))

(declare-fun b!1559154 () Bool)

(declare-fun res!1065777 () Bool)

(declare-fun e!868580 () Bool)

(assert (=> b!1559154 (=> (not res!1065777) (not e!868580))))

(declare-fun lt!671358 () List!36324)

(assert (=> b!1559154 (= res!1065777 (containsKey!810 lt!671358 newKey!105))))

(declare-fun bm!71772 () Bool)

(declare-fun call!71775 () List!36324)

(assert (=> bm!71772 (= call!71775 call!71774)))

(declare-fun d!162971 () Bool)

(assert (=> d!162971 e!868580))

(declare-fun res!1065776 () Bool)

(assert (=> d!162971 (=> (not res!1065776) (not e!868580))))

(assert (=> d!162971 (= res!1065776 (isStrictlySorted!935 lt!671358))))

(assert (=> d!162971 (= lt!671358 e!868579)))

(assert (=> d!162971 (= c!144640 (and (is-Cons!36320 (t!51037 (t!51037 l!1177))) (bvslt (_1!12487 (h!37784 (t!51037 (t!51037 l!1177)))) newKey!105)))))

(assert (=> d!162971 (isStrictlySorted!935 (t!51037 (t!51037 l!1177)))))

(assert (=> d!162971 (= (insertStrictlySorted!551 (t!51037 (t!51037 l!1177)) newKey!105 newValue!105) lt!671358)))

(declare-fun b!1559155 () Bool)

(assert (=> b!1559155 (= e!868578 call!71775)))

(declare-fun b!1559156 () Bool)

(assert (=> b!1559156 (= e!868578 call!71775)))

(declare-fun b!1559157 () Bool)

(assert (=> b!1559157 (= e!868581 call!71774)))

(declare-fun b!1559158 () Bool)

(assert (=> b!1559158 (= e!868580 (contains!10228 lt!671358 (tuple2!24953 newKey!105 newValue!105)))))

(assert (= (and d!162971 c!144640) b!1559150))

(assert (= (and d!162971 (not c!144640)) b!1559149))

(assert (= (and b!1559149 c!144639) b!1559157))

(assert (= (and b!1559149 (not c!144639)) b!1559151))

(assert (= (and b!1559151 c!144638) b!1559156))

(assert (= (and b!1559151 (not c!144638)) b!1559155))

(assert (= (or b!1559156 b!1559155) bm!71772))

(assert (= (or b!1559157 bm!71772) bm!71771))

(assert (= (or b!1559150 bm!71771) bm!71770))

(assert (= (and bm!71770 c!144637) b!1559153))

(assert (= (and bm!71770 (not c!144637)) b!1559152))

(assert (= (and d!162971 res!1065776) b!1559154))

(assert (= (and b!1559154 res!1065777) b!1559158))

(declare-fun m!1436385 () Bool)

(assert (=> b!1559153 m!1436385))

(declare-fun m!1436387 () Bool)

(assert (=> b!1559158 m!1436387))

(declare-fun m!1436389 () Bool)

(assert (=> b!1559154 m!1436389))

(declare-fun m!1436391 () Bool)

(assert (=> bm!71770 m!1436391))

(declare-fun m!1436393 () Bool)

(assert (=> d!162971 m!1436393))

(assert (=> d!162971 m!1436255))

(assert (=> b!1558946 d!162971))

(declare-fun d!162973 () Bool)

(declare-fun res!1065778 () Bool)

(declare-fun e!868583 () Bool)

(assert (=> d!162973 (=> res!1065778 e!868583)))

(assert (=> d!162973 (= res!1065778 (and (is-Cons!36320 (t!51037 (t!51037 l!1177))) (= (_1!12487 (h!37784 (t!51037 (t!51037 l!1177)))) otherKey!50)))))

(assert (=> d!162973 (= (containsKey!810 (t!51037 (t!51037 l!1177)) otherKey!50) e!868583)))

(declare-fun b!1559159 () Bool)

(declare-fun e!868584 () Bool)

(assert (=> b!1559159 (= e!868583 e!868584)))

(declare-fun res!1065779 () Bool)

(assert (=> b!1559159 (=> (not res!1065779) (not e!868584))))

(assert (=> b!1559159 (= res!1065779 (and (or (not (is-Cons!36320 (t!51037 (t!51037 l!1177)))) (bvsle (_1!12487 (h!37784 (t!51037 (t!51037 l!1177)))) otherKey!50)) (is-Cons!36320 (t!51037 (t!51037 l!1177))) (bvslt (_1!12487 (h!37784 (t!51037 (t!51037 l!1177)))) otherKey!50)))))

(declare-fun b!1559160 () Bool)

(assert (=> b!1559160 (= e!868584 (containsKey!810 (t!51037 (t!51037 (t!51037 l!1177))) otherKey!50))))

(assert (= (and d!162973 (not res!1065778)) b!1559159))

(assert (= (and b!1559159 res!1065779) b!1559160))

(declare-fun m!1436395 () Bool)

(assert (=> b!1559160 m!1436395))

(assert (=> b!1558955 d!162973))

(declare-fun d!162975 () Bool)

(declare-fun res!1065780 () Bool)

(declare-fun e!868585 () Bool)

(assert (=> d!162975 (=> res!1065780 e!868585)))

(assert (=> d!162975 (= res!1065780 (or (is-Nil!36321 (t!51037 (t!51037 l!1177))) (is-Nil!36321 (t!51037 (t!51037 (t!51037 l!1177))))))))

(assert (=> d!162975 (= (isStrictlySorted!935 (t!51037 (t!51037 l!1177))) e!868585)))

(declare-fun b!1559161 () Bool)

(declare-fun e!868586 () Bool)

(assert (=> b!1559161 (= e!868585 e!868586)))

(declare-fun res!1065781 () Bool)

(assert (=> b!1559161 (=> (not res!1065781) (not e!868586))))

(assert (=> b!1559161 (= res!1065781 (bvslt (_1!12487 (h!37784 (t!51037 (t!51037 l!1177)))) (_1!12487 (h!37784 (t!51037 (t!51037 (t!51037 l!1177)))))))))

(declare-fun b!1559162 () Bool)

(assert (=> b!1559162 (= e!868586 (isStrictlySorted!935 (t!51037 (t!51037 (t!51037 l!1177)))))))

(assert (= (and d!162975 (not res!1065780)) b!1559161))

(assert (= (and b!1559161 res!1065781) b!1559162))

(declare-fun m!1436397 () Bool)

(assert (=> b!1559162 m!1436397))

(assert (=> b!1558982 d!162975))

(declare-fun d!162977 () Bool)

(declare-fun res!1065782 () Bool)

(declare-fun e!868587 () Bool)

(assert (=> d!162977 (=> res!1065782 e!868587)))

(assert (=> d!162977 (= res!1065782 (or (is-Nil!36321 lt!671343) (is-Nil!36321 (t!51037 lt!671343))))))

(assert (=> d!162977 (= (isStrictlySorted!935 lt!671343) e!868587)))

(declare-fun b!1559163 () Bool)

(declare-fun e!868588 () Bool)

(assert (=> b!1559163 (= e!868587 e!868588)))

(declare-fun res!1065783 () Bool)

(assert (=> b!1559163 (=> (not res!1065783) (not e!868588))))

(assert (=> b!1559163 (= res!1065783 (bvslt (_1!12487 (h!37784 lt!671343)) (_1!12487 (h!37784 (t!51037 lt!671343)))))))

(declare-fun b!1559164 () Bool)

(assert (=> b!1559164 (= e!868588 (isStrictlySorted!935 (t!51037 lt!671343)))))

(assert (= (and d!162977 (not res!1065782)) b!1559163))

(assert (= (and b!1559163 res!1065783) b!1559164))

(declare-fun m!1436399 () Bool)

(assert (=> b!1559164 m!1436399))

(assert (=> d!162851 d!162977))

(assert (=> d!162851 d!162859))

(declare-fun b!1559168 () Bool)

(declare-fun e!868590 () Option!847)

(assert (=> b!1559168 (= e!868590 None!845)))

(declare-fun b!1559165 () Bool)

(declare-fun e!868589 () Option!847)

(assert (=> b!1559165 (= e!868589 (Some!846 (_2!12487 (h!37784 (t!51037 lt!671316)))))))

(declare-fun b!1559167 () Bool)

(assert (=> b!1559167 (= e!868590 (getValueByKey!772 (t!51037 (t!51037 lt!671316)) otherKey!50))))

(declare-fun b!1559166 () Bool)

(assert (=> b!1559166 (= e!868589 e!868590)))

(declare-fun c!144642 () Bool)

(assert (=> b!1559166 (= c!144642 (and (is-Cons!36320 (t!51037 lt!671316)) (not (= (_1!12487 (h!37784 (t!51037 lt!671316))) otherKey!50))))))

(declare-fun d!162979 () Bool)

(declare-fun c!144641 () Bool)

(assert (=> d!162979 (= c!144641 (and (is-Cons!36320 (t!51037 lt!671316)) (= (_1!12487 (h!37784 (t!51037 lt!671316))) otherKey!50)))))

(assert (=> d!162979 (= (getValueByKey!772 (t!51037 lt!671316) otherKey!50) e!868589)))

(assert (= (and d!162979 c!144641) b!1559165))

(assert (= (and d!162979 (not c!144641)) b!1559166))

(assert (= (and b!1559166 c!144642) b!1559167))

(assert (= (and b!1559166 (not c!144642)) b!1559168))

(declare-fun m!1436401 () Bool)

(assert (=> b!1559167 m!1436401))

(assert (=> b!1558997 d!162979))

(declare-fun d!162981 () Bool)

(declare-fun res!1065784 () Bool)

(declare-fun e!868591 () Bool)

(assert (=> d!162981 (=> res!1065784 e!868591)))

(assert (=> d!162981 (= res!1065784 (and (is-Cons!36320 (t!51037 lt!671316)) (= (_1!12487 (h!37784 (t!51037 lt!671316))) otherKey!50)))))

(assert (=> d!162981 (= (containsKey!810 (t!51037 lt!671316) otherKey!50) e!868591)))

(declare-fun b!1559169 () Bool)

(declare-fun e!868592 () Bool)

(assert (=> b!1559169 (= e!868591 e!868592)))

(declare-fun res!1065785 () Bool)

(assert (=> b!1559169 (=> (not res!1065785) (not e!868592))))

(assert (=> b!1559169 (= res!1065785 (and (or (not (is-Cons!36320 (t!51037 lt!671316))) (bvsle (_1!12487 (h!37784 (t!51037 lt!671316))) otherKey!50)) (is-Cons!36320 (t!51037 lt!671316)) (bvslt (_1!12487 (h!37784 (t!51037 lt!671316))) otherKey!50)))))

(declare-fun b!1559170 () Bool)

(assert (=> b!1559170 (= e!868592 (containsKey!810 (t!51037 (t!51037 lt!671316)) otherKey!50))))

(assert (= (and d!162981 (not res!1065784)) b!1559169))

(assert (= (and b!1559169 res!1065785) b!1559170))

(declare-fun m!1436403 () Bool)

(assert (=> b!1559170 m!1436403))

(assert (=> b!1558923 d!162981))

(assert (=> b!1558784 d!162871))

(declare-fun b!1559174 () Bool)

(declare-fun e!868594 () Option!847)

(assert (=> b!1559174 (= e!868594 None!845)))

(declare-fun b!1559171 () Bool)

(declare-fun e!868593 () Option!847)

(assert (=> b!1559171 (= e!868593 (Some!846 (_2!12487 (h!37784 (t!51037 lt!671317)))))))

(declare-fun b!1559173 () Bool)

(assert (=> b!1559173 (= e!868594 (getValueByKey!772 (t!51037 (t!51037 lt!671317)) otherKey!50))))

(declare-fun b!1559172 () Bool)

(assert (=> b!1559172 (= e!868593 e!868594)))

(declare-fun c!144644 () Bool)

(assert (=> b!1559172 (= c!144644 (and (is-Cons!36320 (t!51037 lt!671317)) (not (= (_1!12487 (h!37784 (t!51037 lt!671317))) otherKey!50))))))

(declare-fun d!162983 () Bool)

(declare-fun c!144643 () Bool)

(assert (=> d!162983 (= c!144643 (and (is-Cons!36320 (t!51037 lt!671317)) (= (_1!12487 (h!37784 (t!51037 lt!671317))) otherKey!50)))))

(assert (=> d!162983 (= (getValueByKey!772 (t!51037 lt!671317) otherKey!50) e!868593)))

(assert (= (and d!162983 c!144643) b!1559171))

(assert (= (and d!162983 (not c!144643)) b!1559172))

(assert (= (and b!1559172 c!144644) b!1559173))

(assert (= (and b!1559172 (not c!144644)) b!1559174))

(declare-fun m!1436405 () Bool)

(assert (=> b!1559173 m!1436405))

(assert (=> b!1558772 d!162983))

(declare-fun d!162985 () Bool)

(declare-fun lt!671361 () Bool)

(declare-fun content!787 (List!36324) (Set tuple2!24952))

(assert (=> d!162985 (= lt!671361 (member (tuple2!24953 newKey!105 newValue!105) (content!787 lt!671334)))))

(declare-fun e!868600 () Bool)

(assert (=> d!162985 (= lt!671361 e!868600)))

(declare-fun res!1065791 () Bool)

(assert (=> d!162985 (=> (not res!1065791) (not e!868600))))

(assert (=> d!162985 (= res!1065791 (is-Cons!36320 lt!671334))))

(assert (=> d!162985 (= (contains!10228 lt!671334 (tuple2!24953 newKey!105 newValue!105)) lt!671361)))

(declare-fun b!1559179 () Bool)

(declare-fun e!868599 () Bool)

(assert (=> b!1559179 (= e!868600 e!868599)))

(declare-fun res!1065790 () Bool)

(assert (=> b!1559179 (=> res!1065790 e!868599)))

(assert (=> b!1559179 (= res!1065790 (= (h!37784 lt!671334) (tuple2!24953 newKey!105 newValue!105)))))

(declare-fun b!1559180 () Bool)

(assert (=> b!1559180 (= e!868599 (contains!10228 (t!51037 lt!671334) (tuple2!24953 newKey!105 newValue!105)))))

(assert (= (and d!162985 res!1065791) b!1559179))

(assert (= (and b!1559179 (not res!1065790)) b!1559180))

(declare-fun m!1436407 () Bool)

(assert (=> d!162985 m!1436407))

(declare-fun m!1436409 () Bool)

(assert (=> d!162985 m!1436409))

(declare-fun m!1436411 () Bool)

(assert (=> b!1559180 m!1436411))

(assert (=> b!1558875 d!162985))

(assert (=> d!162831 d!162859))

(assert (=> d!162831 d!162851))

(assert (=> d!162831 d!162855))

(declare-fun d!162987 () Bool)

(declare-fun res!1065792 () Bool)

(declare-fun e!868601 () Bool)

(assert (=> d!162987 (=> res!1065792 e!868601)))

(assert (=> d!162987 (= res!1065792 (and (is-Cons!36320 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105)) (= (_1!12487 (h!37784 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(assert (=> d!162987 (= (containsKey!810 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105) otherKey!50) e!868601)))

(declare-fun b!1559181 () Bool)

(declare-fun e!868602 () Bool)

(assert (=> b!1559181 (= e!868601 e!868602)))

(declare-fun res!1065793 () Bool)

(assert (=> b!1559181 (=> (not res!1065793) (not e!868602))))

(assert (=> b!1559181 (= res!1065793 (and (or (not (is-Cons!36320 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105))) (bvsle (_1!12487 (h!37784 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105))) otherKey!50)) (is-Cons!36320 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105)) (bvslt (_1!12487 (h!37784 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(declare-fun b!1559182 () Bool)

(assert (=> b!1559182 (= e!868602 (containsKey!810 (t!51037 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105)) otherKey!50))))

(assert (= (and d!162987 (not res!1065792)) b!1559181))

(assert (= (and b!1559181 res!1065793) b!1559182))

(declare-fun m!1436413 () Bool)

(assert (=> b!1559182 m!1436413))

(assert (=> d!162831 d!162987))

(declare-fun d!162989 () Bool)

(declare-fun e!868605 () Bool)

(assert (=> d!162989 e!868605))

(declare-fun res!1065796 () Bool)

(assert (=> d!162989 (=> (not res!1065796) (not e!868605))))

(assert (=> d!162989 (= res!1065796 (= (containsKey!810 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!810 (t!51037 l!1177) otherKey!50)))))

(assert (=> d!162989 true))

(declare-fun _$16!196 () Unit!51751)

(assert (=> d!162989 (= (choose!2056 (t!51037 l!1177) newKey!105 newValue!105 otherKey!50) _$16!196)))

(declare-fun b!1559185 () Bool)

(assert (=> b!1559185 (= e!868605 (= (getValueByKey!772 (insertStrictlySorted!551 (t!51037 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!772 (t!51037 l!1177) otherKey!50)))))

(assert (= (and d!162989 res!1065796) b!1559185))

(assert (=> d!162989 m!1436119))

(assert (=> d!162989 m!1436119))

(assert (=> d!162989 m!1436207))

(assert (=> d!162989 m!1436123))

(assert (=> b!1559185 m!1436119))

(assert (=> b!1559185 m!1436119))

(assert (=> b!1559185 m!1436211))

(assert (=> b!1559185 m!1436131))

(assert (=> d!162831 d!162989))

(declare-fun d!162991 () Bool)

(declare-fun lt!671362 () Bool)

(assert (=> d!162991 (= lt!671362 (member (tuple2!24953 newKey!105 newValue!105) (content!787 lt!671343)))))

(declare-fun e!868607 () Bool)

(assert (=> d!162991 (= lt!671362 e!868607)))

(declare-fun res!1065798 () Bool)

(assert (=> d!162991 (=> (not res!1065798) (not e!868607))))

(assert (=> d!162991 (= res!1065798 (is-Cons!36320 lt!671343))))

(assert (=> d!162991 (= (contains!10228 lt!671343 (tuple2!24953 newKey!105 newValue!105)) lt!671362)))

(declare-fun b!1559186 () Bool)

(declare-fun e!868606 () Bool)

(assert (=> b!1559186 (= e!868607 e!868606)))

(declare-fun res!1065797 () Bool)

(assert (=> b!1559186 (=> res!1065797 e!868606)))

(assert (=> b!1559186 (= res!1065797 (= (h!37784 lt!671343) (tuple2!24953 newKey!105 newValue!105)))))

(declare-fun b!1559187 () Bool)

(assert (=> b!1559187 (= e!868606 (contains!10228 (t!51037 lt!671343) (tuple2!24953 newKey!105 newValue!105)))))

(assert (= (and d!162991 res!1065798) b!1559186))

(assert (= (and b!1559186 (not res!1065797)) b!1559187))

(declare-fun m!1436415 () Bool)

(assert (=> d!162991 m!1436415))

(declare-fun m!1436417 () Bool)

(assert (=> d!162991 m!1436417))

(declare-fun m!1436419 () Bool)

(assert (=> b!1559187 m!1436419))

(assert (=> b!1558951 d!162991))

(assert (=> b!1558994 d!162859))

(declare-fun b!1559191 () Bool)

(declare-fun e!868609 () Option!847)

(assert (=> b!1559191 (= e!868609 None!845)))

(declare-fun b!1559188 () Bool)

(declare-fun e!868608 () Option!847)

(assert (=> b!1559188 (= e!868608 (Some!846 (_2!12487 (h!37784 (t!51037 (t!51037 l!1177))))))))

(declare-fun b!1559190 () Bool)

(assert (=> b!1559190 (= e!868609 (getValueByKey!772 (t!51037 (t!51037 (t!51037 l!1177))) otherKey!50))))

(declare-fun b!1559189 () Bool)

(assert (=> b!1559189 (= e!868608 e!868609)))

(declare-fun c!144646 () Bool)

(assert (=> b!1559189 (= c!144646 (and (is-Cons!36320 (t!51037 (t!51037 l!1177))) (not (= (_1!12487 (h!37784 (t!51037 (t!51037 l!1177)))) otherKey!50))))))

(declare-fun d!162993 () Bool)

(declare-fun c!144645 () Bool)

(assert (=> d!162993 (= c!144645 (and (is-Cons!36320 (t!51037 (t!51037 l!1177))) (= (_1!12487 (h!37784 (t!51037 (t!51037 l!1177)))) otherKey!50)))))

(assert (=> d!162993 (= (getValueByKey!772 (t!51037 (t!51037 l!1177)) otherKey!50) e!868608)))

(assert (= (and d!162993 c!144645) b!1559188))

(assert (= (and d!162993 (not c!144645)) b!1559189))

(assert (= (and b!1559189 c!144646) b!1559190))

(assert (= (and b!1559189 (not c!144646)) b!1559191))

(declare-fun m!1436421 () Bool)

(assert (=> b!1559190 m!1436421))

(assert (=> b!1559001 d!162993))

(declare-fun b!1559192 () Bool)

(declare-fun e!868610 () Bool)

(declare-fun tp!112443 () Bool)

(assert (=> b!1559192 (= e!868610 (and tp_is_empty!38361 tp!112443))))

(assert (=> b!1559015 (= tp!112437 e!868610)))

(assert (= (and b!1559015 (is-Cons!36320 (t!51037 (t!51037 l!1177)))) b!1559192))

(push 1)

(assert (not b!1559170))

(assert (not b!1559162))

(assert (not b!1559173))

(assert (not b!1559158))

(assert (not b!1559164))

(assert (not b!1559190))

(assert (not b!1559146))

(assert tp_is_empty!38361)

(assert (not b!1559143))

(assert (not b!1559148))

(assert (not b!1559182))

(assert (not d!162971))

(assert (not b!1559167))

(assert (not b!1559192))

(assert (not b!1559187))

(assert (not bm!71770))

(assert (not b!1559153))

(assert (not b!1559160))

(assert (not b!1559140))

(assert (not b!1559180))

(assert (not d!162991))

(assert (not d!162985))

(assert (not d!162989))

(assert (not b!1559154))

(assert (not b!1559138))

(assert (not b!1559185))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

