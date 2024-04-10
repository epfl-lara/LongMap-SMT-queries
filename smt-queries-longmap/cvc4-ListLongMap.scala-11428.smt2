; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133296 () Bool)

(assert start!133296)

(declare-fun res!1066139 () Bool)

(declare-fun e!868472 () Bool)

(assert (=> start!133296 (=> (not res!1066139) (not e!868472))))

(declare-datatypes ((B!2448 0))(
  ( (B!2449 (val!19310 Int)) )
))
(declare-datatypes ((tuple2!24996 0))(
  ( (tuple2!24997 (_1!12509 (_ BitVec 64)) (_2!12509 B!2448)) )
))
(declare-datatypes ((List!36344 0))(
  ( (Nil!36341) (Cons!36340 (h!37786 tuple2!24996) (t!51074 List!36344)) )
))
(declare-fun l!1292 () List!36344)

(declare-fun isStrictlySorted!984 (List!36344) Bool)

(assert (=> start!133296 (= res!1066139 (isStrictlySorted!984 l!1292))))

(assert (=> start!133296 e!868472))

(declare-fun e!868471 () Bool)

(assert (=> start!133296 e!868471))

(assert (=> start!133296 true))

(declare-fun tp_is_empty!38453 () Bool)

(assert (=> start!133296 tp_is_empty!38453))

(declare-fun b!1558894 () Bool)

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun newValue!135 () B!2448)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!847 (List!36344 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!575 (List!36344 (_ BitVec 64) B!2448) List!36344)

(assert (=> b!1558894 (= e!868472 (not (containsKey!847 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135) otherKey!62)))))

(declare-fun b!1558893 () Bool)

(declare-fun res!1066141 () Bool)

(assert (=> b!1558893 (=> (not res!1066141) (not e!868472))))

(assert (=> b!1558893 (= res!1066141 (and (not (= otherKey!62 newKey!135)) (or (not (is-Cons!36340 l!1292)) (= (_1!12509 (h!37786 l!1292)) otherKey!62))))))

(declare-fun b!1558892 () Bool)

(declare-fun res!1066140 () Bool)

(assert (=> b!1558892 (=> (not res!1066140) (not e!868472))))

(assert (=> b!1558892 (= res!1066140 (containsKey!847 l!1292 otherKey!62))))

(declare-fun b!1558895 () Bool)

(declare-fun tp!112683 () Bool)

(assert (=> b!1558895 (= e!868471 (and tp_is_empty!38453 tp!112683))))

(assert (= (and start!133296 res!1066139) b!1558892))

(assert (= (and b!1558892 res!1066140) b!1558893))

(assert (= (and b!1558893 res!1066141) b!1558894))

(assert (= (and start!133296 (is-Cons!36340 l!1292)) b!1558895))

(declare-fun m!1435363 () Bool)

(assert (=> start!133296 m!1435363))

(declare-fun m!1435365 () Bool)

(assert (=> b!1558894 m!1435365))

(assert (=> b!1558894 m!1435365))

(declare-fun m!1435367 () Bool)

(assert (=> b!1558894 m!1435367))

(declare-fun m!1435369 () Bool)

(assert (=> b!1558892 m!1435369))

(push 1)

(assert (not start!133296))

(assert (not b!1558895))

(assert (not b!1558892))

(assert (not b!1558894))

(assert tp_is_empty!38453)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162825 () Bool)

(declare-fun res!1066156 () Bool)

(declare-fun e!868487 () Bool)

(assert (=> d!162825 (=> res!1066156 e!868487)))

(assert (=> d!162825 (= res!1066156 (or (is-Nil!36341 l!1292) (is-Nil!36341 (t!51074 l!1292))))))

(assert (=> d!162825 (= (isStrictlySorted!984 l!1292) e!868487)))

(declare-fun b!1558910 () Bool)

(declare-fun e!868488 () Bool)

(assert (=> b!1558910 (= e!868487 e!868488)))

(declare-fun res!1066157 () Bool)

(assert (=> b!1558910 (=> (not res!1066157) (not e!868488))))

(assert (=> b!1558910 (= res!1066157 (bvslt (_1!12509 (h!37786 l!1292)) (_1!12509 (h!37786 (t!51074 l!1292)))))))

(declare-fun b!1558911 () Bool)

(assert (=> b!1558911 (= e!868488 (isStrictlySorted!984 (t!51074 l!1292)))))

(assert (= (and d!162825 (not res!1066156)) b!1558910))

(assert (= (and b!1558910 res!1066157) b!1558911))

(declare-fun m!1435373 () Bool)

(assert (=> b!1558911 m!1435373))

(assert (=> start!133296 d!162825))

(declare-fun d!162827 () Bool)

(declare-fun res!1066168 () Bool)

(declare-fun e!868499 () Bool)

(assert (=> d!162827 (=> res!1066168 e!868499)))

(assert (=> d!162827 (= res!1066168 (and (is-Cons!36340 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) (= (_1!12509 (h!37786 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162827 (= (containsKey!847 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135) otherKey!62) e!868499)))

(declare-fun b!1558922 () Bool)

(declare-fun e!868500 () Bool)

(assert (=> b!1558922 (= e!868499 e!868500)))

(declare-fun res!1066169 () Bool)

(assert (=> b!1558922 (=> (not res!1066169) (not e!868500))))

(assert (=> b!1558922 (= res!1066169 (and (or (not (is-Cons!36340 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) (bvsle (_1!12509 (h!37786 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62)) (is-Cons!36340 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) (bvslt (_1!12509 (h!37786 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558923 () Bool)

(assert (=> b!1558923 (= e!868500 (containsKey!847 (t!51074 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162827 (not res!1066168)) b!1558922))

(assert (= (and b!1558922 res!1066169) b!1558923))

(declare-fun m!1435379 () Bool)

(assert (=> b!1558923 m!1435379))

(assert (=> b!1558894 d!162827))

(declare-fun b!1559011 () Bool)

(declare-fun e!868555 () List!36344)

(declare-fun e!868552 () List!36344)

(assert (=> b!1559011 (= e!868555 e!868552)))

(declare-fun c!144196 () Bool)

(assert (=> b!1559011 (= c!144196 (and (is-Cons!36340 l!1292) (= (_1!12509 (h!37786 l!1292)) newKey!135)))))

(declare-fun b!1559012 () Bool)

(declare-fun call!71819 () List!36344)

(assert (=> b!1559012 (= e!868555 call!71819)))

(declare-fun b!1559013 () Bool)

(declare-fun lt!670837 () List!36344)

(declare-fun e!868554 () Bool)

(declare-fun contains!10216 (List!36344 tuple2!24996) Bool)

(assert (=> b!1559013 (= e!868554 (contains!10216 lt!670837 (tuple2!24997 newKey!135 newValue!135)))))

(declare-fun bm!71815 () Bool)

(declare-fun call!71820 () List!36344)

(declare-fun call!71818 () List!36344)

(assert (=> bm!71815 (= call!71820 call!71818)))

(declare-fun bm!71816 () Bool)

(assert (=> bm!71816 (= call!71818 call!71819)))

(declare-fun e!868553 () List!36344)

(declare-fun bm!71817 () Bool)

(declare-fun c!144195 () Bool)

(declare-fun $colon$colon!986 (List!36344 tuple2!24996) List!36344)

(assert (=> bm!71817 (= call!71819 ($colon$colon!986 e!868553 (ite c!144195 (h!37786 l!1292) (tuple2!24997 newKey!135 newValue!135))))))

(declare-fun c!144193 () Bool)

(assert (=> bm!71817 (= c!144193 c!144195)))

(declare-fun b!1559015 () Bool)

(assert (=> b!1559015 (= e!868552 call!71818)))

(declare-fun b!1559016 () Bool)

(declare-fun c!144194 () Bool)

(assert (=> b!1559016 (= c!144194 (and (is-Cons!36340 l!1292) (bvsgt (_1!12509 (h!37786 l!1292)) newKey!135)))))

(declare-fun e!868551 () List!36344)

(assert (=> b!1559016 (= e!868552 e!868551)))

(declare-fun b!1559017 () Bool)

(assert (=> b!1559017 (= e!868553 (insertStrictlySorted!575 (t!51074 l!1292) newKey!135 newValue!135))))

(declare-fun b!1559018 () Bool)

(assert (=> b!1559018 (= e!868551 call!71820)))

(declare-fun b!1559014 () Bool)

(declare-fun res!1066197 () Bool)

(assert (=> b!1559014 (=> (not res!1066197) (not e!868554))))

(assert (=> b!1559014 (= res!1066197 (containsKey!847 lt!670837 newKey!135))))

(declare-fun d!162833 () Bool)

(assert (=> d!162833 e!868554))

(declare-fun res!1066196 () Bool)

(assert (=> d!162833 (=> (not res!1066196) (not e!868554))))

(assert (=> d!162833 (= res!1066196 (isStrictlySorted!984 lt!670837))))

(assert (=> d!162833 (= lt!670837 e!868555)))

(assert (=> d!162833 (= c!144195 (and (is-Cons!36340 l!1292) (bvslt (_1!12509 (h!37786 l!1292)) newKey!135)))))

(assert (=> d!162833 (isStrictlySorted!984 l!1292)))

(assert (=> d!162833 (= (insertStrictlySorted!575 l!1292 newKey!135 newValue!135) lt!670837)))

(declare-fun b!1559019 () Bool)

(assert (=> b!1559019 (= e!868553 (ite c!144196 (t!51074 l!1292) (ite c!144194 (Cons!36340 (h!37786 l!1292) (t!51074 l!1292)) Nil!36341)))))

(declare-fun b!1559020 () Bool)

(assert (=> b!1559020 (= e!868551 call!71820)))

(assert (= (and d!162833 c!144195) b!1559012))

(assert (= (and d!162833 (not c!144195)) b!1559011))

(assert (= (and b!1559011 c!144196) b!1559015))

(assert (= (and b!1559011 (not c!144196)) b!1559016))

(assert (= (and b!1559016 c!144194) b!1559018))

(assert (= (and b!1559016 (not c!144194)) b!1559020))

(assert (= (or b!1559018 b!1559020) bm!71815))

(assert (= (or b!1559015 bm!71815) bm!71816))

(assert (= (or b!1559012 bm!71816) bm!71817))

(assert (= (and bm!71817 c!144193) b!1559017))

(assert (= (and bm!71817 (not c!144193)) b!1559019))

(assert (= (and d!162833 res!1066196) b!1559014))

(assert (= (and b!1559014 res!1066197) b!1559013))

(declare-fun m!1435397 () Bool)

(assert (=> bm!71817 m!1435397))

(declare-fun m!1435399 () Bool)

(assert (=> b!1559017 m!1435399))

(declare-fun m!1435401 () Bool)

(assert (=> b!1559013 m!1435401))

(declare-fun m!1435403 () Bool)

(assert (=> b!1559014 m!1435403))

(declare-fun m!1435405 () Bool)

(assert (=> d!162833 m!1435405))

(assert (=> d!162833 m!1435363))

(assert (=> b!1558894 d!162833))

(declare-fun d!162841 () Bool)

(declare-fun res!1066200 () Bool)

(declare-fun e!868561 () Bool)

(assert (=> d!162841 (=> res!1066200 e!868561)))

(assert (=> d!162841 (= res!1066200 (and (is-Cons!36340 l!1292) (= (_1!12509 (h!37786 l!1292)) otherKey!62)))))

(assert (=> d!162841 (= (containsKey!847 l!1292 otherKey!62) e!868561)))

(declare-fun b!1559031 () Bool)

(declare-fun e!868562 () Bool)

(assert (=> b!1559031 (= e!868561 e!868562)))

(declare-fun res!1066201 () Bool)

(assert (=> b!1559031 (=> (not res!1066201) (not e!868562))))

(assert (=> b!1559031 (= res!1066201 (and (or (not (is-Cons!36340 l!1292)) (bvsle (_1!12509 (h!37786 l!1292)) otherKey!62)) (is-Cons!36340 l!1292) (bvslt (_1!12509 (h!37786 l!1292)) otherKey!62)))))

(declare-fun b!1559032 () Bool)

(assert (=> b!1559032 (= e!868562 (containsKey!847 (t!51074 l!1292) otherKey!62))))

(assert (= (and d!162841 (not res!1066200)) b!1559031))

(assert (= (and b!1559031 res!1066201) b!1559032))

(declare-fun m!1435417 () Bool)

(assert (=> b!1559032 m!1435417))

(assert (=> b!1558892 d!162841))

(declare-fun b!1559042 () Bool)

(declare-fun e!868568 () Bool)

(declare-fun tp!112692 () Bool)

(assert (=> b!1559042 (= e!868568 (and tp_is_empty!38453 tp!112692))))

(assert (=> b!1558895 (= tp!112683 e!868568)))

(assert (= (and b!1558895 (is-Cons!36340 (t!51074 l!1292))) b!1559042))

(push 1)

(assert (not d!162833))

(assert (not b!1559032))

(assert (not b!1558911))

(assert (not b!1558923))

(assert (not b!1559017))

(assert (not b!1559042))

(assert (not b!1559014))

(assert (not b!1559013))

(assert (not bm!71817))

(assert tp_is_empty!38453)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162875 () Bool)

(assert (=> d!162875 (= ($colon$colon!986 e!868553 (ite c!144195 (h!37786 l!1292) (tuple2!24997 newKey!135 newValue!135))) (Cons!36340 (ite c!144195 (h!37786 l!1292) (tuple2!24997 newKey!135 newValue!135)) e!868553))))

(assert (=> bm!71817 d!162875))

(declare-fun d!162877 () Bool)

(declare-fun res!1066238 () Bool)

(declare-fun e!868613 () Bool)

(assert (=> d!162877 (=> res!1066238 e!868613)))

(assert (=> d!162877 (= res!1066238 (or (is-Nil!36341 lt!670837) (is-Nil!36341 (t!51074 lt!670837))))))

(assert (=> d!162877 (= (isStrictlySorted!984 lt!670837) e!868613)))

(declare-fun b!1559097 () Bool)

(declare-fun e!868614 () Bool)

(assert (=> b!1559097 (= e!868613 e!868614)))

(declare-fun res!1066239 () Bool)

(assert (=> b!1559097 (=> (not res!1066239) (not e!868614))))

(assert (=> b!1559097 (= res!1066239 (bvslt (_1!12509 (h!37786 lt!670837)) (_1!12509 (h!37786 (t!51074 lt!670837)))))))

(declare-fun b!1559098 () Bool)

(assert (=> b!1559098 (= e!868614 (isStrictlySorted!984 (t!51074 lt!670837)))))

(assert (= (and d!162877 (not res!1066238)) b!1559097))

(assert (= (and b!1559097 res!1066239) b!1559098))

(declare-fun m!1435471 () Bool)

(assert (=> b!1559098 m!1435471))

(assert (=> d!162833 d!162877))

(assert (=> d!162833 d!162825))

(declare-fun d!162879 () Bool)

(declare-fun res!1066240 () Bool)

(declare-fun e!868615 () Bool)

(assert (=> d!162879 (=> res!1066240 e!868615)))

(assert (=> d!162879 (= res!1066240 (and (is-Cons!36340 (t!51074 l!1292)) (= (_1!12509 (h!37786 (t!51074 l!1292))) otherKey!62)))))

(assert (=> d!162879 (= (containsKey!847 (t!51074 l!1292) otherKey!62) e!868615)))

(declare-fun b!1559099 () Bool)

(declare-fun e!868616 () Bool)

(assert (=> b!1559099 (= e!868615 e!868616)))

(declare-fun res!1066241 () Bool)

(assert (=> b!1559099 (=> (not res!1066241) (not e!868616))))

(assert (=> b!1559099 (= res!1066241 (and (or (not (is-Cons!36340 (t!51074 l!1292))) (bvsle (_1!12509 (h!37786 (t!51074 l!1292))) otherKey!62)) (is-Cons!36340 (t!51074 l!1292)) (bvslt (_1!12509 (h!37786 (t!51074 l!1292))) otherKey!62)))))

(declare-fun b!1559100 () Bool)

(assert (=> b!1559100 (= e!868616 (containsKey!847 (t!51074 (t!51074 l!1292)) otherKey!62))))

(assert (= (and d!162879 (not res!1066240)) b!1559099))

(assert (= (and b!1559099 res!1066241) b!1559100))

(declare-fun m!1435473 () Bool)

(assert (=> b!1559100 m!1435473))

(assert (=> b!1559032 d!162879))

(declare-fun b!1559101 () Bool)

(declare-fun e!868621 () List!36344)

(declare-fun e!868618 () List!36344)

(assert (=> b!1559101 (= e!868621 e!868618)))

(declare-fun c!144212 () Bool)

(assert (=> b!1559101 (= c!144212 (and (is-Cons!36340 (t!51074 l!1292)) (= (_1!12509 (h!37786 (t!51074 l!1292))) newKey!135)))))

(declare-fun b!1559102 () Bool)

(declare-fun call!71831 () List!36344)

(assert (=> b!1559102 (= e!868621 call!71831)))

(declare-fun b!1559103 () Bool)

(declare-fun lt!670847 () List!36344)

(declare-fun e!868620 () Bool)

(assert (=> b!1559103 (= e!868620 (contains!10216 lt!670847 (tuple2!24997 newKey!135 newValue!135)))))

(declare-fun bm!71827 () Bool)

(declare-fun call!71832 () List!36344)

(declare-fun call!71830 () List!36344)

(assert (=> bm!71827 (= call!71832 call!71830)))

(declare-fun bm!71828 () Bool)

(assert (=> bm!71828 (= call!71830 call!71831)))

(declare-fun bm!71829 () Bool)

(declare-fun c!144211 () Bool)

(declare-fun e!868619 () List!36344)

(assert (=> bm!71829 (= call!71831 ($colon$colon!986 e!868619 (ite c!144211 (h!37786 (t!51074 l!1292)) (tuple2!24997 newKey!135 newValue!135))))))

(declare-fun c!144209 () Bool)

(assert (=> bm!71829 (= c!144209 c!144211)))

(declare-fun b!1559105 () Bool)

(assert (=> b!1559105 (= e!868618 call!71830)))

(declare-fun b!1559106 () Bool)

(declare-fun c!144210 () Bool)

(assert (=> b!1559106 (= c!144210 (and (is-Cons!36340 (t!51074 l!1292)) (bvsgt (_1!12509 (h!37786 (t!51074 l!1292))) newKey!135)))))

(declare-fun e!868617 () List!36344)

(assert (=> b!1559106 (= e!868618 e!868617)))

(declare-fun b!1559107 () Bool)

(assert (=> b!1559107 (= e!868619 (insertStrictlySorted!575 (t!51074 (t!51074 l!1292)) newKey!135 newValue!135))))

(declare-fun b!1559108 () Bool)

(assert (=> b!1559108 (= e!868617 call!71832)))

(declare-fun b!1559104 () Bool)

(declare-fun res!1066243 () Bool)

(assert (=> b!1559104 (=> (not res!1066243) (not e!868620))))

(assert (=> b!1559104 (= res!1066243 (containsKey!847 lt!670847 newKey!135))))

(declare-fun d!162881 () Bool)

(assert (=> d!162881 e!868620))

(declare-fun res!1066242 () Bool)

(assert (=> d!162881 (=> (not res!1066242) (not e!868620))))

(assert (=> d!162881 (= res!1066242 (isStrictlySorted!984 lt!670847))))

(assert (=> d!162881 (= lt!670847 e!868621)))

(assert (=> d!162881 (= c!144211 (and (is-Cons!36340 (t!51074 l!1292)) (bvslt (_1!12509 (h!37786 (t!51074 l!1292))) newKey!135)))))

(assert (=> d!162881 (isStrictlySorted!984 (t!51074 l!1292))))

(assert (=> d!162881 (= (insertStrictlySorted!575 (t!51074 l!1292) newKey!135 newValue!135) lt!670847)))

(declare-fun b!1559109 () Bool)

(assert (=> b!1559109 (= e!868619 (ite c!144212 (t!51074 (t!51074 l!1292)) (ite c!144210 (Cons!36340 (h!37786 (t!51074 l!1292)) (t!51074 (t!51074 l!1292))) Nil!36341)))))

(declare-fun b!1559110 () Bool)

(assert (=> b!1559110 (= e!868617 call!71832)))

(assert (= (and d!162881 c!144211) b!1559102))

(assert (= (and d!162881 (not c!144211)) b!1559101))

(assert (= (and b!1559101 c!144212) b!1559105))

(assert (= (and b!1559101 (not c!144212)) b!1559106))

(assert (= (and b!1559106 c!144210) b!1559108))

(assert (= (and b!1559106 (not c!144210)) b!1559110))

(assert (= (or b!1559108 b!1559110) bm!71827))

(assert (= (or b!1559105 bm!71827) bm!71828))

(assert (= (or b!1559102 bm!71828) bm!71829))

(assert (= (and bm!71829 c!144209) b!1559107))

(assert (= (and bm!71829 (not c!144209)) b!1559109))

(assert (= (and d!162881 res!1066242) b!1559104))

(assert (= (and b!1559104 res!1066243) b!1559103))

(declare-fun m!1435475 () Bool)

(assert (=> bm!71829 m!1435475))

(declare-fun m!1435477 () Bool)

(assert (=> b!1559107 m!1435477))

(declare-fun m!1435479 () Bool)

(assert (=> b!1559103 m!1435479))

(declare-fun m!1435481 () Bool)

(assert (=> b!1559104 m!1435481))

(declare-fun m!1435483 () Bool)

(assert (=> d!162881 m!1435483))

(assert (=> d!162881 m!1435373))

(assert (=> b!1559017 d!162881))

(declare-fun d!162883 () Bool)

(declare-fun res!1066244 () Bool)

(declare-fun e!868622 () Bool)

(assert (=> d!162883 (=> res!1066244 e!868622)))

(assert (=> d!162883 (= res!1066244 (and (is-Cons!36340 (t!51074 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) (= (_1!12509 (h!37786 (t!51074 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162883 (= (containsKey!847 (t!51074 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) otherKey!62) e!868622)))

(declare-fun b!1559111 () Bool)

(declare-fun e!868623 () Bool)

(assert (=> b!1559111 (= e!868622 e!868623)))

(declare-fun res!1066245 () Bool)

(assert (=> b!1559111 (=> (not res!1066245) (not e!868623))))

(assert (=> b!1559111 (= res!1066245 (and (or (not (is-Cons!36340 (t!51074 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) (bvsle (_1!12509 (h!37786 (t!51074 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) otherKey!62)) (is-Cons!36340 (t!51074 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) (bvslt (_1!12509 (h!37786 (t!51074 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1559112 () Bool)

(assert (=> b!1559112 (= e!868623 (containsKey!847 (t!51074 (t!51074 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162883 (not res!1066244)) b!1559111))

(assert (= (and b!1559111 res!1066245) b!1559112))

(declare-fun m!1435485 () Bool)

(assert (=> b!1559112 m!1435485))

(assert (=> b!1558923 d!162883))

(declare-fun lt!670850 () Bool)

(declare-fun d!162885 () Bool)

(declare-fun content!807 (List!36344) (Set tuple2!24996))

(assert (=> d!162885 (= lt!670850 (member (tuple2!24997 newKey!135 newValue!135) (content!807 lt!670837)))))

(declare-fun e!868628 () Bool)

(assert (=> d!162885 (= lt!670850 e!868628)))

(declare-fun res!1066250 () Bool)

(assert (=> d!162885 (=> (not res!1066250) (not e!868628))))

(assert (=> d!162885 (= res!1066250 (is-Cons!36340 lt!670837))))

(assert (=> d!162885 (= (contains!10216 lt!670837 (tuple2!24997 newKey!135 newValue!135)) lt!670850)))

(declare-fun b!1559117 () Bool)

(declare-fun e!868629 () Bool)

(assert (=> b!1559117 (= e!868628 e!868629)))

(declare-fun res!1066251 () Bool)

(assert (=> b!1559117 (=> res!1066251 e!868629)))

