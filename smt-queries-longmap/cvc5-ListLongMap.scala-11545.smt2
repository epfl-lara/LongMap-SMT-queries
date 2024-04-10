; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134390 () Bool)

(assert start!134390)

(declare-fun b!1569292 () Bool)

(declare-fun res!1072546 () Bool)

(declare-fun e!874817 () Bool)

(assert (=> b!1569292 (=> (not res!1072546) (not e!874817))))

(declare-datatypes ((B!2504 0))(
  ( (B!2505 (val!19614 Int)) )
))
(declare-datatypes ((tuple2!25330 0))(
  ( (tuple2!25331 (_1!12676 (_ BitVec 64)) (_2!12676 B!2504)) )
))
(declare-datatypes ((List!36734 0))(
  ( (Nil!36731) (Cons!36730 (h!38177 tuple2!25330) (t!51642 List!36734)) )
))
(declare-fun l!750 () List!36734)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1569292 (= res!1072546 (or (not (is-Cons!36730 l!750)) (bvsge (_1!12676 (h!38177 l!750)) key1!37) (bvsge (_1!12676 (h!38177 l!750)) key2!21)))))

(declare-fun res!1072547 () Bool)

(assert (=> start!134390 (=> (not res!1072547) (not e!874817))))

(assert (=> start!134390 (= res!1072547 (not (= key1!37 key2!21)))))

(assert (=> start!134390 e!874817))

(assert (=> start!134390 true))

(declare-fun e!874816 () Bool)

(assert (=> start!134390 e!874816))

(declare-fun tp_is_empty!39055 () Bool)

(assert (=> start!134390 tp_is_empty!39055))

(declare-fun b!1569291 () Bool)

(declare-fun res!1072548 () Bool)

(assert (=> b!1569291 (=> (not res!1072548) (not e!874817))))

(declare-fun isStrictlySorted!1004 (List!36734) Bool)

(assert (=> b!1569291 (= res!1072548 (isStrictlySorted!1004 l!750))))

(declare-fun v1!32 () B!2504)

(declare-fun b!1569293 () Bool)

(declare-fun insertStrictlySorted!590 (List!36734 (_ BitVec 64) B!2504) List!36734)

(assert (=> b!1569293 (= e!874817 (not (isStrictlySorted!1004 (insertStrictlySorted!590 l!750 key1!37 v1!32))))))

(declare-fun b!1569294 () Bool)

(declare-fun tp!114102 () Bool)

(assert (=> b!1569294 (= e!874816 (and tp_is_empty!39055 tp!114102))))

(assert (= (and start!134390 res!1072547) b!1569291))

(assert (= (and b!1569291 res!1072548) b!1569292))

(assert (= (and b!1569292 res!1072546) b!1569293))

(assert (= (and start!134390 (is-Cons!36730 l!750)) b!1569294))

(declare-fun m!1443739 () Bool)

(assert (=> b!1569291 m!1443739))

(declare-fun m!1443741 () Bool)

(assert (=> b!1569293 m!1443741))

(assert (=> b!1569293 m!1443741))

(declare-fun m!1443743 () Bool)

(assert (=> b!1569293 m!1443743))

(push 1)

(assert (not b!1569291))

(assert (not b!1569293))

(assert (not b!1569294))

(assert tp_is_empty!39055)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163877 () Bool)

(declare-fun res!1072577 () Bool)

(declare-fun e!874840 () Bool)

(assert (=> d!163877 (=> res!1072577 e!874840)))

(assert (=> d!163877 (= res!1072577 (or (is-Nil!36731 l!750) (is-Nil!36731 (t!51642 l!750))))))

(assert (=> d!163877 (= (isStrictlySorted!1004 l!750) e!874840)))

(declare-fun b!1569329 () Bool)

(declare-fun e!874841 () Bool)

(assert (=> b!1569329 (= e!874840 e!874841)))

(declare-fun res!1072578 () Bool)

(assert (=> b!1569329 (=> (not res!1072578) (not e!874841))))

(assert (=> b!1569329 (= res!1072578 (bvslt (_1!12676 (h!38177 l!750)) (_1!12676 (h!38177 (t!51642 l!750)))))))

(declare-fun b!1569330 () Bool)

(assert (=> b!1569330 (= e!874841 (isStrictlySorted!1004 (t!51642 l!750)))))

(assert (= (and d!163877 (not res!1072577)) b!1569329))

(assert (= (and b!1569329 res!1072578) b!1569330))

(declare-fun m!1443759 () Bool)

(assert (=> b!1569330 m!1443759))

(assert (=> b!1569291 d!163877))

(declare-fun d!163883 () Bool)

(declare-fun res!1072581 () Bool)

(declare-fun e!874844 () Bool)

(assert (=> d!163883 (=> res!1072581 e!874844)))

(assert (=> d!163883 (= res!1072581 (or (is-Nil!36731 (insertStrictlySorted!590 l!750 key1!37 v1!32)) (is-Nil!36731 (t!51642 (insertStrictlySorted!590 l!750 key1!37 v1!32)))))))

(assert (=> d!163883 (= (isStrictlySorted!1004 (insertStrictlySorted!590 l!750 key1!37 v1!32)) e!874844)))

(declare-fun b!1569333 () Bool)

(declare-fun e!874845 () Bool)

(assert (=> b!1569333 (= e!874844 e!874845)))

(declare-fun res!1072582 () Bool)

(assert (=> b!1569333 (=> (not res!1072582) (not e!874845))))

(assert (=> b!1569333 (= res!1072582 (bvslt (_1!12676 (h!38177 (insertStrictlySorted!590 l!750 key1!37 v1!32))) (_1!12676 (h!38177 (t!51642 (insertStrictlySorted!590 l!750 key1!37 v1!32))))))))

(declare-fun b!1569334 () Bool)

(assert (=> b!1569334 (= e!874845 (isStrictlySorted!1004 (t!51642 (insertStrictlySorted!590 l!750 key1!37 v1!32))))))

(assert (= (and d!163883 (not res!1072581)) b!1569333))

(assert (= (and b!1569333 res!1072582) b!1569334))

(declare-fun m!1443763 () Bool)

(assert (=> b!1569334 m!1443763))

(assert (=> b!1569293 d!163883))

(declare-fun b!1569375 () Bool)

(declare-fun e!874873 () List!36734)

(declare-fun call!72076 () List!36734)

(assert (=> b!1569375 (= e!874873 call!72076)))

(declare-fun b!1569376 () Bool)

(declare-fun c!144720 () Bool)

(assert (=> b!1569376 (= c!144720 (and (is-Cons!36730 l!750) (bvsgt (_1!12676 (h!38177 l!750)) key1!37)))))

(declare-fun e!874871 () List!36734)

(assert (=> b!1569376 (= e!874871 e!874873)))

(declare-fun bm!72071 () Bool)

(declare-fun call!72074 () List!36734)

(declare-fun call!72075 () List!36734)

(assert (=> bm!72071 (= call!72074 call!72075)))

(declare-fun bm!72072 () Bool)

(assert (=> bm!72072 (= call!72076 call!72074)))

(declare-fun b!1569377 () Bool)

(declare-fun e!874872 () List!36734)

(assert (=> b!1569377 (= e!874872 call!72075)))

(declare-fun e!874870 () List!36734)

(declare-fun b!1569378 () Bool)

(assert (=> b!1569378 (= e!874870 (insertStrictlySorted!590 (t!51642 l!750) key1!37 v1!32))))

(declare-fun b!1569379 () Bool)

(declare-fun e!874874 () Bool)

(declare-fun lt!673302 () List!36734)

(declare-fun contains!10421 (List!36734 tuple2!25330) Bool)

(assert (=> b!1569379 (= e!874874 (contains!10421 lt!673302 (tuple2!25331 key1!37 v1!32)))))

(declare-fun b!1569380 () Bool)

(declare-fun res!1072596 () Bool)

(assert (=> b!1569380 (=> (not res!1072596) (not e!874874))))

(declare-fun containsKey!863 (List!36734 (_ BitVec 64)) Bool)

(assert (=> b!1569380 (= res!1072596 (containsKey!863 lt!673302 key1!37))))

(declare-fun bm!72073 () Bool)

(declare-fun c!144717 () Bool)

(declare-fun $colon$colon!994 (List!36734 tuple2!25330) List!36734)

(assert (=> bm!72073 (= call!72075 ($colon$colon!994 e!874870 (ite c!144717 (h!38177 l!750) (tuple2!25331 key1!37 v1!32))))))

(declare-fun c!144718 () Bool)

(assert (=> bm!72073 (= c!144718 c!144717)))

(declare-fun d!163887 () Bool)

(assert (=> d!163887 e!874874))

(declare-fun res!1072595 () Bool)

(assert (=> d!163887 (=> (not res!1072595) (not e!874874))))

(assert (=> d!163887 (= res!1072595 (isStrictlySorted!1004 lt!673302))))

(assert (=> d!163887 (= lt!673302 e!874872)))

(assert (=> d!163887 (= c!144717 (and (is-Cons!36730 l!750) (bvslt (_1!12676 (h!38177 l!750)) key1!37)))))

(assert (=> d!163887 (isStrictlySorted!1004 l!750)))

(assert (=> d!163887 (= (insertStrictlySorted!590 l!750 key1!37 v1!32) lt!673302)))

(declare-fun c!144719 () Bool)

(declare-fun b!1569381 () Bool)

(assert (=> b!1569381 (= e!874870 (ite c!144719 (t!51642 l!750) (ite c!144720 (Cons!36730 (h!38177 l!750) (t!51642 l!750)) Nil!36731)))))

(declare-fun b!1569382 () Bool)

(assert (=> b!1569382 (= e!874872 e!874871)))

(assert (=> b!1569382 (= c!144719 (and (is-Cons!36730 l!750) (= (_1!12676 (h!38177 l!750)) key1!37)))))

(declare-fun b!1569383 () Bool)

(assert (=> b!1569383 (= e!874873 call!72076)))

(declare-fun b!1569384 () Bool)

(assert (=> b!1569384 (= e!874871 call!72074)))

(assert (= (and d!163887 c!144717) b!1569377))

(assert (= (and d!163887 (not c!144717)) b!1569382))

(assert (= (and b!1569382 c!144719) b!1569384))

(assert (= (and b!1569382 (not c!144719)) b!1569376))

(assert (= (and b!1569376 c!144720) b!1569375))

(assert (= (and b!1569376 (not c!144720)) b!1569383))

(assert (= (or b!1569375 b!1569383) bm!72072))

(assert (= (or b!1569384 bm!72072) bm!72071))

(assert (= (or b!1569377 bm!72071) bm!72073))

(assert (= (and bm!72073 c!144718) b!1569378))

(assert (= (and bm!72073 (not c!144718)) b!1569381))

(assert (= (and d!163887 res!1072595) b!1569380))

(assert (= (and b!1569380 res!1072596) b!1569379))

(declare-fun m!1443769 () Bool)

(assert (=> b!1569378 m!1443769))

(declare-fun m!1443771 () Bool)

(assert (=> b!1569379 m!1443771))

(declare-fun m!1443773 () Bool)

(assert (=> bm!72073 m!1443773))

(declare-fun m!1443775 () Bool)

(assert (=> d!163887 m!1443775))

(assert (=> d!163887 m!1443739))

(declare-fun m!1443777 () Bool)

(assert (=> b!1569380 m!1443777))

(assert (=> b!1569293 d!163887))

(declare-fun b!1569401 () Bool)

(declare-fun e!874883 () Bool)

(declare-fun tp!114111 () Bool)

(assert (=> b!1569401 (= e!874883 (and tp_is_empty!39055 tp!114111))))

(assert (=> b!1569294 (= tp!114102 e!874883)))

(assert (= (and b!1569294 (is-Cons!36730 (t!51642 l!750))) b!1569401))

(push 1)

(assert (not b!1569378))

(assert (not bm!72073))

(assert (not b!1569379))

(assert (not b!1569330))

(assert (not b!1569401))

(assert (not d!163887))

(assert (not b!1569334))

(assert tp_is_empty!39055)

(assert (not b!1569380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

