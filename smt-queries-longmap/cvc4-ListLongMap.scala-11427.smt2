; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133658 () Bool)

(assert start!133658)

(declare-fun b!1560954 () Bool)

(declare-fun res!1066776 () Bool)

(declare-fun e!869728 () Bool)

(assert (=> b!1560954 (=> (not res!1066776) (not e!869728))))

(declare-datatypes ((B!2440 0))(
  ( (B!2441 (val!19306 Int)) )
))
(declare-datatypes ((tuple2!25042 0))(
  ( (tuple2!25043 (_1!12532 (_ BitVec 64)) (_2!12532 B!2440)) )
))
(declare-datatypes ((List!36369 0))(
  ( (Nil!36366) (Cons!36365 (h!37829 tuple2!25042) (t!51088 List!36369)) )
))
(declare-fun l!1292 () List!36369)

(declare-fun isStrictlySorted!967 (List!36369) Bool)

(assert (=> b!1560954 (= res!1066776 (isStrictlySorted!967 (t!51088 l!1292)))))

(declare-fun res!1066775 () Bool)

(assert (=> start!133658 (=> (not res!1066775) (not e!869728))))

(assert (=> start!133658 (= res!1066775 (isStrictlySorted!967 l!1292))))

(assert (=> start!133658 e!869728))

(declare-fun e!869729 () Bool)

(assert (=> start!133658 e!869729))

(assert (=> start!133658 true))

(declare-fun tp_is_empty!38445 () Bool)

(assert (=> start!133658 tp_is_empty!38445))

(declare-fun b!1560955 () Bool)

(declare-fun res!1066777 () Bool)

(assert (=> b!1560955 (=> (not res!1066777) (not e!869728))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!843 (List!36369 (_ BitVec 64)) Bool)

(assert (=> b!1560955 (= res!1066777 (containsKey!843 (t!51088 l!1292) otherKey!62))))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun b!1560956 () Bool)

(declare-fun newValue!135 () B!2440)

(declare-fun insertStrictlySorted!572 (List!36369 (_ BitVec 64) B!2440) List!36369)

(assert (=> b!1560956 (= e!869728 (not (containsKey!843 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135) otherKey!62)))))

(assert (=> b!1560956 (containsKey!843 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51801 0))(
  ( (Unit!51802) )
))
(declare-fun lt!671698 () Unit!51801)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!11 (List!36369 (_ BitVec 64) B!2440 (_ BitVec 64)) Unit!51801)

(assert (=> b!1560956 (= lt!671698 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!11 (t!51088 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1560957 () Bool)

(declare-fun res!1066778 () Bool)

(assert (=> b!1560957 (=> (not res!1066778) (not e!869728))))

(assert (=> b!1560957 (= res!1066778 (and (not (= otherKey!62 newKey!135)) (is-Cons!36365 l!1292) (not (= (_1!12532 (h!37829 l!1292)) otherKey!62))))))

(declare-fun b!1560958 () Bool)

(declare-fun tp!112659 () Bool)

(assert (=> b!1560958 (= e!869729 (and tp_is_empty!38445 tp!112659))))

(declare-fun b!1560959 () Bool)

(declare-fun res!1066779 () Bool)

(assert (=> b!1560959 (=> (not res!1066779) (not e!869728))))

(assert (=> b!1560959 (= res!1066779 (containsKey!843 l!1292 otherKey!62))))

(assert (= (and start!133658 res!1066775) b!1560959))

(assert (= (and b!1560959 res!1066779) b!1560957))

(assert (= (and b!1560957 res!1066778) b!1560954))

(assert (= (and b!1560954 res!1066776) b!1560955))

(assert (= (and b!1560955 res!1066777) b!1560956))

(assert (= (and start!133658 (is-Cons!36365 l!1292)) b!1560958))

(declare-fun m!1437371 () Bool)

(assert (=> start!133658 m!1437371))

(declare-fun m!1437373 () Bool)

(assert (=> b!1560955 m!1437373))

(declare-fun m!1437375 () Bool)

(assert (=> b!1560954 m!1437375))

(declare-fun m!1437377 () Bool)

(assert (=> b!1560956 m!1437377))

(declare-fun m!1437379 () Bool)

(assert (=> b!1560956 m!1437379))

(assert (=> b!1560956 m!1437377))

(declare-fun m!1437381 () Bool)

(assert (=> b!1560956 m!1437381))

(declare-fun m!1437383 () Bool)

(assert (=> b!1560956 m!1437383))

(assert (=> b!1560956 m!1437381))

(declare-fun m!1437385 () Bool)

(assert (=> b!1560956 m!1437385))

(declare-fun m!1437387 () Bool)

(assert (=> b!1560959 m!1437387))

(push 1)

(assert tp_is_empty!38445)

(assert (not b!1560959))

(assert (not b!1560956))

(assert (not start!133658))

(assert (not b!1560958))

(assert (not b!1560954))

(assert (not b!1560955))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163381 () Bool)

(declare-fun res!1066807 () Bool)

(declare-fun e!869748 () Bool)

(assert (=> d!163381 (=> res!1066807 e!869748)))

(assert (=> d!163381 (= res!1066807 (and (is-Cons!36365 l!1292) (= (_1!12532 (h!37829 l!1292)) otherKey!62)))))

(assert (=> d!163381 (= (containsKey!843 l!1292 otherKey!62) e!869748)))

(declare-fun b!1560990 () Bool)

(declare-fun e!869749 () Bool)

(assert (=> b!1560990 (= e!869748 e!869749)))

(declare-fun res!1066808 () Bool)

(assert (=> b!1560990 (=> (not res!1066808) (not e!869749))))

(assert (=> b!1560990 (= res!1066808 (and (or (not (is-Cons!36365 l!1292)) (bvsle (_1!12532 (h!37829 l!1292)) otherKey!62)) (is-Cons!36365 l!1292) (bvslt (_1!12532 (h!37829 l!1292)) otherKey!62)))))

(declare-fun b!1560991 () Bool)

(assert (=> b!1560991 (= e!869749 (containsKey!843 (t!51088 l!1292) otherKey!62))))

(assert (= (and d!163381 (not res!1066807)) b!1560990))

(assert (= (and b!1560990 res!1066808) b!1560991))

(assert (=> b!1560991 m!1437373))

(assert (=> b!1560959 d!163381))

(declare-fun d!163389 () Bool)

(declare-fun res!1066813 () Bool)

(declare-fun e!869754 () Bool)

(assert (=> d!163389 (=> res!1066813 e!869754)))

(assert (=> d!163389 (= res!1066813 (and (is-Cons!36365 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135)) (= (_1!12532 (h!37829 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!163389 (= (containsKey!843 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135) otherKey!62) e!869754)))

(declare-fun b!1560994 () Bool)

(declare-fun e!869755 () Bool)

(assert (=> b!1560994 (= e!869754 e!869755)))

(declare-fun res!1066814 () Bool)

(assert (=> b!1560994 (=> (not res!1066814) (not e!869755))))

(assert (=> b!1560994 (= res!1066814 (and (or (not (is-Cons!36365 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135))) (bvsle (_1!12532 (h!37829 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135))) otherKey!62)) (is-Cons!36365 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135)) (bvslt (_1!12532 (h!37829 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1560995 () Bool)

(assert (=> b!1560995 (= e!869755 (containsKey!843 (t!51088 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!163389 (not res!1066813)) b!1560994))

(assert (= (and b!1560994 res!1066814) b!1560995))

(declare-fun m!1437411 () Bool)

(assert (=> b!1560995 m!1437411))

(assert (=> b!1560956 d!163389))

(declare-fun d!163391 () Bool)

(declare-fun res!1066815 () Bool)

(declare-fun e!869756 () Bool)

(assert (=> d!163391 (=> res!1066815 e!869756)))

(assert (=> d!163391 (= res!1066815 (and (is-Cons!36365 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)) (= (_1!12532 (h!37829 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!163391 (= (containsKey!843 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135) otherKey!62) e!869756)))

(declare-fun b!1560998 () Bool)

(declare-fun e!869757 () Bool)

(assert (=> b!1560998 (= e!869756 e!869757)))

(declare-fun res!1066816 () Bool)

(assert (=> b!1560998 (=> (not res!1066816) (not e!869757))))

(assert (=> b!1560998 (= res!1066816 (and (or (not (is-Cons!36365 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) (bvsle (_1!12532 (h!37829 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) otherKey!62)) (is-Cons!36365 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)) (bvslt (_1!12532 (h!37829 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1560999 () Bool)

(assert (=> b!1560999 (= e!869757 (containsKey!843 (t!51088 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!163391 (not res!1066815)) b!1560998))

(assert (= (and b!1560998 res!1066816) b!1560999))

(declare-fun m!1437413 () Bool)

(assert (=> b!1560999 m!1437413))

(assert (=> b!1560956 d!163391))

(declare-fun bm!71918 () Bool)

(declare-fun call!71921 () List!36369)

(declare-fun call!71923 () List!36369)

(assert (=> bm!71918 (= call!71921 call!71923)))

(declare-fun b!1561077 () Bool)

(declare-fun e!869806 () List!36369)

(declare-fun call!71922 () List!36369)

(assert (=> b!1561077 (= e!869806 call!71922)))

(declare-fun e!869807 () List!36369)

(declare-fun c!144934 () Bool)

(declare-fun bm!71919 () Bool)

(declare-fun $colon$colon!979 (List!36369 tuple2!25042) List!36369)

(assert (=> bm!71919 (= call!71923 ($colon$colon!979 e!869807 (ite c!144934 (h!37829 l!1292) (tuple2!25043 newKey!135 newValue!135))))))

(declare-fun c!144933 () Bool)

(assert (=> bm!71919 (= c!144933 c!144934)))

(declare-fun b!1561078 () Bool)

(declare-fun res!1066841 () Bool)

(declare-fun e!869805 () Bool)

(assert (=> b!1561078 (=> (not res!1066841) (not e!869805))))

(declare-fun lt!671709 () List!36369)

(assert (=> b!1561078 (= res!1066841 (containsKey!843 lt!671709 newKey!135))))

(declare-fun b!1561079 () Bool)

(declare-fun e!869803 () List!36369)

(assert (=> b!1561079 (= e!869803 call!71921)))

(declare-fun b!1561080 () Bool)

(declare-fun e!869804 () List!36369)

(assert (=> b!1561080 (= e!869804 call!71923)))

(declare-fun bm!71920 () Bool)

(assert (=> bm!71920 (= call!71922 call!71921)))

(declare-fun c!144931 () Bool)

(declare-fun c!144932 () Bool)

(declare-fun b!1561081 () Bool)

(assert (=> b!1561081 (= e!869807 (ite c!144932 (t!51088 l!1292) (ite c!144931 (Cons!36365 (h!37829 l!1292) (t!51088 l!1292)) Nil!36366)))))

(declare-fun b!1561082 () Bool)

(assert (=> b!1561082 (= c!144931 (and (is-Cons!36365 l!1292) (bvsgt (_1!12532 (h!37829 l!1292)) newKey!135)))))

(assert (=> b!1561082 (= e!869803 e!869806)))

(declare-fun b!1561083 () Bool)

(assert (=> b!1561083 (= e!869804 e!869803)))

(assert (=> b!1561083 (= c!144932 (and (is-Cons!36365 l!1292) (= (_1!12532 (h!37829 l!1292)) newKey!135)))))

(declare-fun b!1561084 () Bool)

(assert (=> b!1561084 (= e!869806 call!71922)))

(declare-fun b!1561085 () Bool)

(assert (=> b!1561085 (= e!869807 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135))))

(declare-fun d!163393 () Bool)

(assert (=> d!163393 e!869805))

(declare-fun res!1066842 () Bool)

(assert (=> d!163393 (=> (not res!1066842) (not e!869805))))

(assert (=> d!163393 (= res!1066842 (isStrictlySorted!967 lt!671709))))

(assert (=> d!163393 (= lt!671709 e!869804)))

(assert (=> d!163393 (= c!144934 (and (is-Cons!36365 l!1292) (bvslt (_1!12532 (h!37829 l!1292)) newKey!135)))))

(assert (=> d!163393 (isStrictlySorted!967 l!1292)))

(assert (=> d!163393 (= (insertStrictlySorted!572 l!1292 newKey!135 newValue!135) lt!671709)))

(declare-fun b!1561076 () Bool)

(declare-fun contains!10256 (List!36369 tuple2!25042) Bool)

(assert (=> b!1561076 (= e!869805 (contains!10256 lt!671709 (tuple2!25043 newKey!135 newValue!135)))))

(assert (= (and d!163393 c!144934) b!1561080))

(assert (= (and d!163393 (not c!144934)) b!1561083))

(assert (= (and b!1561083 c!144932) b!1561079))

(assert (= (and b!1561083 (not c!144932)) b!1561082))

(assert (= (and b!1561082 c!144931) b!1561077))

(assert (= (and b!1561082 (not c!144931)) b!1561084))

(assert (= (or b!1561077 b!1561084) bm!71920))

(assert (= (or b!1561079 bm!71920) bm!71918))

(assert (= (or b!1561080 bm!71918) bm!71919))

(assert (= (and bm!71919 c!144933) b!1561085))

(assert (= (and bm!71919 (not c!144933)) b!1561081))

(assert (= (and d!163393 res!1066842) b!1561078))

(assert (= (and b!1561078 res!1066841) b!1561076))

(assert (=> b!1561085 m!1437377))

(declare-fun m!1437431 () Bool)

(assert (=> b!1561076 m!1437431))

(declare-fun m!1437433 () Bool)

(assert (=> b!1561078 m!1437433))

(declare-fun m!1437435 () Bool)

(assert (=> bm!71919 m!1437435))

(declare-fun m!1437437 () Bool)

(assert (=> d!163393 m!1437437))

(assert (=> d!163393 m!1437371))

(assert (=> b!1560956 d!163393))

(declare-fun d!163407 () Bool)

(assert (=> d!163407 (containsKey!843 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-fun lt!671717 () Unit!51801)

(declare-fun choose!2064 (List!36369 (_ BitVec 64) B!2440 (_ BitVec 64)) Unit!51801)

(assert (=> d!163407 (= lt!671717 (choose!2064 (t!51088 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun e!869827 () Bool)

(assert (=> d!163407 e!869827))

(declare-fun res!1066861 () Bool)

(assert (=> d!163407 (=> (not res!1066861) (not e!869827))))

(assert (=> d!163407 (= res!1066861 (isStrictlySorted!967 (t!51088 l!1292)))))

(assert (=> d!163407 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!11 (t!51088 l!1292) newKey!135 newValue!135 otherKey!62) lt!671717)))

(declare-fun b!1561124 () Bool)

(declare-fun res!1066862 () Bool)

(assert (=> b!1561124 (=> (not res!1066862) (not e!869827))))

(assert (=> b!1561124 (= res!1066862 (containsKey!843 (t!51088 l!1292) otherKey!62))))

(declare-fun b!1561125 () Bool)

(assert (=> b!1561125 (= e!869827 (not (= otherKey!62 newKey!135)))))

(assert (= (and d!163407 res!1066861) b!1561124))

(assert (= (and b!1561124 res!1066862) b!1561125))

(assert (=> d!163407 m!1437377))

(assert (=> d!163407 m!1437377))

(assert (=> d!163407 m!1437379))

(declare-fun m!1437451 () Bool)

(assert (=> d!163407 m!1437451))

(assert (=> d!163407 m!1437375))

(assert (=> b!1561124 m!1437373))

(assert (=> b!1560956 d!163407))

(declare-fun bm!71929 () Bool)

(declare-fun call!71932 () List!36369)

(declare-fun call!71934 () List!36369)

(assert (=> bm!71929 (= call!71932 call!71934)))

(declare-fun b!1561129 () Bool)

(declare-fun e!869833 () List!36369)

(declare-fun call!71933 () List!36369)

(assert (=> b!1561129 (= e!869833 call!71933)))

(declare-fun e!869834 () List!36369)

(declare-fun bm!71930 () Bool)

(declare-fun c!144948 () Bool)

(assert (=> bm!71930 (= call!71934 ($colon$colon!979 e!869834 (ite c!144948 (h!37829 (t!51088 l!1292)) (tuple2!25043 newKey!135 newValue!135))))))

(declare-fun c!144947 () Bool)

(assert (=> bm!71930 (= c!144947 c!144948)))

(declare-fun b!1561130 () Bool)

(declare-fun res!1066865 () Bool)

(declare-fun e!869832 () Bool)

(assert (=> b!1561130 (=> (not res!1066865) (not e!869832))))

(declare-fun lt!671718 () List!36369)

(assert (=> b!1561130 (= res!1066865 (containsKey!843 lt!671718 newKey!135))))

(declare-fun b!1561131 () Bool)

(declare-fun e!869830 () List!36369)

(assert (=> b!1561131 (= e!869830 call!71932)))

(declare-fun b!1561132 () Bool)

(declare-fun e!869831 () List!36369)

(assert (=> b!1561132 (= e!869831 call!71934)))

(declare-fun bm!71931 () Bool)

(assert (=> bm!71931 (= call!71933 call!71932)))

(declare-fun c!144946 () Bool)

(declare-fun b!1561133 () Bool)

(declare-fun c!144945 () Bool)

(assert (=> b!1561133 (= e!869834 (ite c!144946 (t!51088 (t!51088 l!1292)) (ite c!144945 (Cons!36365 (h!37829 (t!51088 l!1292)) (t!51088 (t!51088 l!1292))) Nil!36366)))))

(declare-fun b!1561134 () Bool)

(assert (=> b!1561134 (= c!144945 (and (is-Cons!36365 (t!51088 l!1292)) (bvsgt (_1!12532 (h!37829 (t!51088 l!1292))) newKey!135)))))

(assert (=> b!1561134 (= e!869830 e!869833)))

(declare-fun b!1561135 () Bool)

(assert (=> b!1561135 (= e!869831 e!869830)))

(assert (=> b!1561135 (= c!144946 (and (is-Cons!36365 (t!51088 l!1292)) (= (_1!12532 (h!37829 (t!51088 l!1292))) newKey!135)))))

(declare-fun b!1561136 () Bool)

(assert (=> b!1561136 (= e!869833 call!71933)))

(declare-fun b!1561137 () Bool)

(assert (=> b!1561137 (= e!869834 (insertStrictlySorted!572 (t!51088 (t!51088 l!1292)) newKey!135 newValue!135))))

(declare-fun d!163413 () Bool)

(assert (=> d!163413 e!869832))

(declare-fun res!1066866 () Bool)

(assert (=> d!163413 (=> (not res!1066866) (not e!869832))))

(assert (=> d!163413 (= res!1066866 (isStrictlySorted!967 lt!671718))))

(assert (=> d!163413 (= lt!671718 e!869831)))

(assert (=> d!163413 (= c!144948 (and (is-Cons!36365 (t!51088 l!1292)) (bvslt (_1!12532 (h!37829 (t!51088 l!1292))) newKey!135)))))

(assert (=> d!163413 (isStrictlySorted!967 (t!51088 l!1292))))

(assert (=> d!163413 (= (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135) lt!671718)))

(declare-fun b!1561128 () Bool)

(assert (=> b!1561128 (= e!869832 (contains!10256 lt!671718 (tuple2!25043 newKey!135 newValue!135)))))

(assert (= (and d!163413 c!144948) b!1561132))

(assert (= (and d!163413 (not c!144948)) b!1561135))

(assert (= (and b!1561135 c!144946) b!1561131))

(assert (= (and b!1561135 (not c!144946)) b!1561134))

(assert (= (and b!1561134 c!144945) b!1561129))

(assert (= (and b!1561134 (not c!144945)) b!1561136))

(assert (= (or b!1561129 b!1561136) bm!71931))

(assert (= (or b!1561131 bm!71931) bm!71929))

(assert (= (or b!1561132 bm!71929) bm!71930))

(assert (= (and bm!71930 c!144947) b!1561137))

(assert (= (and bm!71930 (not c!144947)) b!1561133))

(assert (= (and d!163413 res!1066866) b!1561130))

(assert (= (and b!1561130 res!1066865) b!1561128))

(declare-fun m!1437463 () Bool)

(assert (=> b!1561137 m!1437463))

(declare-fun m!1437465 () Bool)

(assert (=> b!1561128 m!1437465))

(declare-fun m!1437467 () Bool)

(assert (=> b!1561130 m!1437467))

(declare-fun m!1437469 () Bool)

(assert (=> bm!71930 m!1437469))

(declare-fun m!1437471 () Bool)

(assert (=> d!163413 m!1437471))

(assert (=> d!163413 m!1437375))

(assert (=> b!1560956 d!163413))

(declare-fun d!163421 () Bool)

(declare-fun res!1066885 () Bool)

(declare-fun e!869851 () Bool)

(assert (=> d!163421 (=> res!1066885 e!869851)))

(assert (=> d!163421 (= res!1066885 (or (is-Nil!36366 (t!51088 l!1292)) (is-Nil!36366 (t!51088 (t!51088 l!1292)))))))

(assert (=> d!163421 (= (isStrictlySorted!967 (t!51088 l!1292)) e!869851)))

(declare-fun b!1561156 () Bool)

(declare-fun e!869852 () Bool)

(assert (=> b!1561156 (= e!869851 e!869852)))

(declare-fun res!1066886 () Bool)

(assert (=> b!1561156 (=> (not res!1066886) (not e!869852))))

(assert (=> b!1561156 (= res!1066886 (bvslt (_1!12532 (h!37829 (t!51088 l!1292))) (_1!12532 (h!37829 (t!51088 (t!51088 l!1292))))))))

(declare-fun b!1561157 () Bool)

(assert (=> b!1561157 (= e!869852 (isStrictlySorted!967 (t!51088 (t!51088 l!1292))))))

(assert (= (and d!163421 (not res!1066885)) b!1561156))

(assert (= (and b!1561156 res!1066886) b!1561157))

(declare-fun m!1437475 () Bool)

(assert (=> b!1561157 m!1437475))

(assert (=> b!1560954 d!163421))

(declare-fun d!163425 () Bool)

(declare-fun res!1066887 () Bool)

(declare-fun e!869855 () Bool)

(assert (=> d!163425 (=> res!1066887 e!869855)))

(assert (=> d!163425 (= res!1066887 (or (is-Nil!36366 l!1292) (is-Nil!36366 (t!51088 l!1292))))))

(assert (=> d!163425 (= (isStrictlySorted!967 l!1292) e!869855)))

(declare-fun b!1561162 () Bool)

(declare-fun e!869856 () Bool)

(assert (=> b!1561162 (= e!869855 e!869856)))

(declare-fun res!1066888 () Bool)

(assert (=> b!1561162 (=> (not res!1066888) (not e!869856))))

(assert (=> b!1561162 (= res!1066888 (bvslt (_1!12532 (h!37829 l!1292)) (_1!12532 (h!37829 (t!51088 l!1292)))))))

(declare-fun b!1561163 () Bool)

(assert (=> b!1561163 (= e!869856 (isStrictlySorted!967 (t!51088 l!1292)))))

(assert (= (and d!163425 (not res!1066887)) b!1561162))

(assert (= (and b!1561162 res!1066888) b!1561163))

(assert (=> b!1561163 m!1437375))

(assert (=> start!133658 d!163425))

(declare-fun d!163427 () Bool)

(declare-fun res!1066891 () Bool)

(declare-fun e!869859 () Bool)

(assert (=> d!163427 (=> res!1066891 e!869859)))

(assert (=> d!163427 (= res!1066891 (and (is-Cons!36365 (t!51088 l!1292)) (= (_1!12532 (h!37829 (t!51088 l!1292))) otherKey!62)))))

(assert (=> d!163427 (= (containsKey!843 (t!51088 l!1292) otherKey!62) e!869859)))

(declare-fun b!1561167 () Bool)

(declare-fun e!869860 () Bool)

(assert (=> b!1561167 (= e!869859 e!869860)))

(declare-fun res!1066892 () Bool)

(assert (=> b!1561167 (=> (not res!1066892) (not e!869860))))

(assert (=> b!1561167 (= res!1066892 (and (or (not (is-Cons!36365 (t!51088 l!1292))) (bvsle (_1!12532 (h!37829 (t!51088 l!1292))) otherKey!62)) (is-Cons!36365 (t!51088 l!1292)) (bvslt (_1!12532 (h!37829 (t!51088 l!1292))) otherKey!62)))))

(declare-fun b!1561168 () Bool)

(assert (=> b!1561168 (= e!869860 (containsKey!843 (t!51088 (t!51088 l!1292)) otherKey!62))))

(assert (= (and d!163427 (not res!1066891)) b!1561167))

(assert (= (and b!1561167 res!1066892) b!1561168))

(declare-fun m!1437477 () Bool)

(assert (=> b!1561168 m!1437477))

(assert (=> b!1560955 d!163427))

(declare-fun b!1561183 () Bool)

(declare-fun e!869868 () Bool)

(declare-fun tp!112668 () Bool)

(assert (=> b!1561183 (= e!869868 (and tp_is_empty!38445 tp!112668))))

(assert (=> b!1560958 (= tp!112659 e!869868)))

(assert (= (and b!1560958 (is-Cons!36365 (t!51088 l!1292))) b!1561183))

(push 1)

(assert (not b!1561168))

(assert (not b!1561078))

(assert tp_is_empty!38445)

(assert (not b!1561157))

(assert (not b!1561128))

(assert (not b!1561076))

(assert (not b!1560991))

(assert (not bm!71919))

(assert (not d!163407))

(assert (not b!1560995))

(assert (not b!1560999))

(assert (not b!1561163))

(assert (not d!163413))

(assert (not b!1561130))

(assert (not d!163393))

(assert (not bm!71930))

(assert (not b!1561085))

(assert (not b!1561183))

(assert (not b!1561124))

(assert (not b!1561137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163489 () Bool)

(declare-fun res!1066949 () Bool)

(declare-fun e!869934 () Bool)

(assert (=> d!163489 (=> res!1066949 e!869934)))

(assert (=> d!163489 (= res!1066949 (or (is-Nil!36366 lt!671709) (is-Nil!36366 (t!51088 lt!671709))))))

(assert (=> d!163489 (= (isStrictlySorted!967 lt!671709) e!869934)))

(declare-fun b!1561261 () Bool)

(declare-fun e!869935 () Bool)

(assert (=> b!1561261 (= e!869934 e!869935)))

(declare-fun res!1066950 () Bool)

(assert (=> b!1561261 (=> (not res!1066950) (not e!869935))))

(assert (=> b!1561261 (= res!1066950 (bvslt (_1!12532 (h!37829 lt!671709)) (_1!12532 (h!37829 (t!51088 lt!671709)))))))

(declare-fun b!1561262 () Bool)

(assert (=> b!1561262 (= e!869935 (isStrictlySorted!967 (t!51088 lt!671709)))))

(assert (= (and d!163489 (not res!1066949)) b!1561261))

(assert (= (and b!1561261 res!1066950) b!1561262))

(declare-fun m!1437567 () Bool)

(assert (=> b!1561262 m!1437567))

(assert (=> d!163393 d!163489))

(assert (=> d!163393 d!163425))

(declare-fun d!163491 () Bool)

(declare-fun res!1066951 () Bool)

(declare-fun e!869936 () Bool)

(assert (=> d!163491 (=> res!1066951 e!869936)))

(assert (=> d!163491 (= res!1066951 (or (is-Nil!36366 (t!51088 (t!51088 l!1292))) (is-Nil!36366 (t!51088 (t!51088 (t!51088 l!1292))))))))

(assert (=> d!163491 (= (isStrictlySorted!967 (t!51088 (t!51088 l!1292))) e!869936)))

(declare-fun b!1561263 () Bool)

(declare-fun e!869937 () Bool)

(assert (=> b!1561263 (= e!869936 e!869937)))

(declare-fun res!1066952 () Bool)

(assert (=> b!1561263 (=> (not res!1066952) (not e!869937))))

(assert (=> b!1561263 (= res!1066952 (bvslt (_1!12532 (h!37829 (t!51088 (t!51088 l!1292)))) (_1!12532 (h!37829 (t!51088 (t!51088 (t!51088 l!1292)))))))))

(declare-fun b!1561264 () Bool)

(assert (=> b!1561264 (= e!869937 (isStrictlySorted!967 (t!51088 (t!51088 (t!51088 l!1292)))))))

(assert (= (and d!163491 (not res!1066951)) b!1561263))

(assert (= (and b!1561263 res!1066952) b!1561264))

(declare-fun m!1437569 () Bool)

(assert (=> b!1561264 m!1437569))

(assert (=> b!1561157 d!163491))

(declare-fun d!163493 () Bool)

(declare-fun res!1066953 () Bool)

(declare-fun e!869938 () Bool)

(assert (=> d!163493 (=> res!1066953 e!869938)))

(assert (=> d!163493 (= res!1066953 (and (is-Cons!36365 lt!671718) (= (_1!12532 (h!37829 lt!671718)) newKey!135)))))

(assert (=> d!163493 (= (containsKey!843 lt!671718 newKey!135) e!869938)))

(declare-fun b!1561265 () Bool)

(declare-fun e!869939 () Bool)

(assert (=> b!1561265 (= e!869938 e!869939)))

(declare-fun res!1066954 () Bool)

(assert (=> b!1561265 (=> (not res!1066954) (not e!869939))))

(assert (=> b!1561265 (= res!1066954 (and (or (not (is-Cons!36365 lt!671718)) (bvsle (_1!12532 (h!37829 lt!671718)) newKey!135)) (is-Cons!36365 lt!671718) (bvslt (_1!12532 (h!37829 lt!671718)) newKey!135)))))

(declare-fun b!1561266 () Bool)

(assert (=> b!1561266 (= e!869939 (containsKey!843 (t!51088 lt!671718) newKey!135))))

(assert (= (and d!163493 (not res!1066953)) b!1561265))

(assert (= (and b!1561265 res!1066954) b!1561266))

(declare-fun m!1437571 () Bool)

(assert (=> b!1561266 m!1437571))

(assert (=> b!1561130 d!163493))

(assert (=> b!1561163 d!163421))

(declare-fun d!163495 () Bool)

(assert (=> d!163495 (= ($colon$colon!979 e!869834 (ite c!144948 (h!37829 (t!51088 l!1292)) (tuple2!25043 newKey!135 newValue!135))) (Cons!36365 (ite c!144948 (h!37829 (t!51088 l!1292)) (tuple2!25043 newKey!135 newValue!135)) e!869834))))

(assert (=> bm!71930 d!163495))

(declare-fun d!163497 () Bool)

(declare-fun res!1066955 () Bool)

(declare-fun e!869940 () Bool)

(assert (=> d!163497 (=> res!1066955 e!869940)))

(assert (=> d!163497 (= res!1066955 (and (is-Cons!36365 (t!51088 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) (= (_1!12532 (h!37829 (t!51088 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!163497 (= (containsKey!843 (t!51088 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)) otherKey!62) e!869940)))

(declare-fun b!1561267 () Bool)

(declare-fun e!869941 () Bool)

(assert (=> b!1561267 (= e!869940 e!869941)))

(declare-fun res!1066956 () Bool)

(assert (=> b!1561267 (=> (not res!1066956) (not e!869941))))

(assert (=> b!1561267 (= res!1066956 (and (or (not (is-Cons!36365 (t!51088 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)))) (bvsle (_1!12532 (h!37829 (t!51088 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)))) otherKey!62)) (is-Cons!36365 (t!51088 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) (bvslt (_1!12532 (h!37829 (t!51088 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1561268 () Bool)

(assert (=> b!1561268 (= e!869941 (containsKey!843 (t!51088 (t!51088 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!163497 (not res!1066955)) b!1561267))

(assert (= (and b!1561267 res!1066956) b!1561268))

(declare-fun m!1437573 () Bool)

(assert (=> b!1561268 m!1437573))

(assert (=> b!1560999 d!163497))

(declare-fun d!163499 () Bool)

(declare-fun lt!671735 () Bool)

(declare-fun content!793 (List!36369) (Set tuple2!25042))

(assert (=> d!163499 (= lt!671735 (member (tuple2!25043 newKey!135 newValue!135) (content!793 lt!671718)))))

(declare-fun e!869946 () Bool)

(assert (=> d!163499 (= lt!671735 e!869946)))

(declare-fun res!1066962 () Bool)

(assert (=> d!163499 (=> (not res!1066962) (not e!869946))))

(assert (=> d!163499 (= res!1066962 (is-Cons!36365 lt!671718))))

(assert (=> d!163499 (= (contains!10256 lt!671718 (tuple2!25043 newKey!135 newValue!135)) lt!671735)))

(declare-fun b!1561273 () Bool)

(declare-fun e!869947 () Bool)

(assert (=> b!1561273 (= e!869946 e!869947)))

(declare-fun res!1066961 () Bool)

(assert (=> b!1561273 (=> res!1066961 e!869947)))

(assert (=> b!1561273 (= res!1066961 (= (h!37829 lt!671718) (tuple2!25043 newKey!135 newValue!135)))))

(declare-fun b!1561274 () Bool)

(assert (=> b!1561274 (= e!869947 (contains!10256 (t!51088 lt!671718) (tuple2!25043 newKey!135 newValue!135)))))

(assert (= (and d!163499 res!1066962) b!1561273))

(assert (= (and b!1561273 (not res!1066961)) b!1561274))

(declare-fun m!1437575 () Bool)

(assert (=> d!163499 m!1437575))

(declare-fun m!1437577 () Bool)

(assert (=> d!163499 m!1437577))

(declare-fun m!1437579 () Bool)

(assert (=> b!1561274 m!1437579))

(assert (=> b!1561128 d!163499))

(declare-fun bm!71941 () Bool)

(declare-fun call!71944 () List!36369)

(declare-fun call!71946 () List!36369)

(assert (=> bm!71941 (= call!71944 call!71946)))

(declare-fun b!1561276 () Bool)

(declare-fun e!869951 () List!36369)

(declare-fun call!71945 () List!36369)

(assert (=> b!1561276 (= e!869951 call!71945)))

(declare-fun bm!71942 () Bool)

(declare-fun c!144964 () Bool)

(declare-fun e!869952 () List!36369)

(assert (=> bm!71942 (= call!71946 ($colon$colon!979 e!869952 (ite c!144964 (h!37829 (t!51088 (t!51088 l!1292))) (tuple2!25043 newKey!135 newValue!135))))))

(declare-fun c!144963 () Bool)

(assert (=> bm!71942 (= c!144963 c!144964)))

(declare-fun b!1561277 () Bool)

(declare-fun res!1066963 () Bool)

(declare-fun e!869950 () Bool)

(assert (=> b!1561277 (=> (not res!1066963) (not e!869950))))

(declare-fun lt!671736 () List!36369)

(assert (=> b!1561277 (= res!1066963 (containsKey!843 lt!671736 newKey!135))))

(declare-fun b!1561278 () Bool)

(declare-fun e!869948 () List!36369)

(assert (=> b!1561278 (= e!869948 call!71944)))

(declare-fun b!1561279 () Bool)

(declare-fun e!869949 () List!36369)

(assert (=> b!1561279 (= e!869949 call!71946)))

(declare-fun bm!71943 () Bool)

(assert (=> bm!71943 (= call!71945 call!71944)))

(declare-fun b!1561280 () Bool)

(declare-fun c!144962 () Bool)

(declare-fun c!144961 () Bool)

(assert (=> b!1561280 (= e!869952 (ite c!144962 (t!51088 (t!51088 (t!51088 l!1292))) (ite c!144961 (Cons!36365 (h!37829 (t!51088 (t!51088 l!1292))) (t!51088 (t!51088 (t!51088 l!1292)))) Nil!36366)))))

(declare-fun b!1561281 () Bool)

(assert (=> b!1561281 (= c!144961 (and (is-Cons!36365 (t!51088 (t!51088 l!1292))) (bvsgt (_1!12532 (h!37829 (t!51088 (t!51088 l!1292)))) newKey!135)))))

(assert (=> b!1561281 (= e!869948 e!869951)))

(declare-fun b!1561282 () Bool)

(assert (=> b!1561282 (= e!869949 e!869948)))

(assert (=> b!1561282 (= c!144962 (and (is-Cons!36365 (t!51088 (t!51088 l!1292))) (= (_1!12532 (h!37829 (t!51088 (t!51088 l!1292)))) newKey!135)))))

(declare-fun b!1561283 () Bool)

(assert (=> b!1561283 (= e!869951 call!71945)))

(declare-fun b!1561284 () Bool)

(assert (=> b!1561284 (= e!869952 (insertStrictlySorted!572 (t!51088 (t!51088 (t!51088 l!1292))) newKey!135 newValue!135))))

(declare-fun d!163501 () Bool)

(assert (=> d!163501 e!869950))

(declare-fun res!1066964 () Bool)

(assert (=> d!163501 (=> (not res!1066964) (not e!869950))))

(assert (=> d!163501 (= res!1066964 (isStrictlySorted!967 lt!671736))))

(assert (=> d!163501 (= lt!671736 e!869949)))

(assert (=> d!163501 (= c!144964 (and (is-Cons!36365 (t!51088 (t!51088 l!1292))) (bvslt (_1!12532 (h!37829 (t!51088 (t!51088 l!1292)))) newKey!135)))))

(assert (=> d!163501 (isStrictlySorted!967 (t!51088 (t!51088 l!1292)))))

(assert (=> d!163501 (= (insertStrictlySorted!572 (t!51088 (t!51088 l!1292)) newKey!135 newValue!135) lt!671736)))

(declare-fun b!1561275 () Bool)

(assert (=> b!1561275 (= e!869950 (contains!10256 lt!671736 (tuple2!25043 newKey!135 newValue!135)))))

(assert (= (and d!163501 c!144964) b!1561279))

(assert (= (and d!163501 (not c!144964)) b!1561282))

(assert (= (and b!1561282 c!144962) b!1561278))

(assert (= (and b!1561282 (not c!144962)) b!1561281))

(assert (= (and b!1561281 c!144961) b!1561276))

(assert (= (and b!1561281 (not c!144961)) b!1561283))

(assert (= (or b!1561276 b!1561283) bm!71943))

(assert (= (or b!1561278 bm!71943) bm!71941))

(assert (= (or b!1561279 bm!71941) bm!71942))

(assert (= (and bm!71942 c!144963) b!1561284))

(assert (= (and bm!71942 (not c!144963)) b!1561280))

(assert (= (and d!163501 res!1066964) b!1561277))

(assert (= (and b!1561277 res!1066963) b!1561275))

(declare-fun m!1437581 () Bool)

(assert (=> b!1561284 m!1437581))

(declare-fun m!1437583 () Bool)

(assert (=> b!1561275 m!1437583))

(declare-fun m!1437585 () Bool)

(assert (=> b!1561277 m!1437585))

(declare-fun m!1437587 () Bool)

(assert (=> bm!71942 m!1437587))

(declare-fun m!1437589 () Bool)

(assert (=> d!163501 m!1437589))

(assert (=> d!163501 m!1437475))

(assert (=> b!1561137 d!163501))

(declare-fun d!163503 () Bool)

(declare-fun res!1066965 () Bool)

(declare-fun e!869953 () Bool)

(assert (=> d!163503 (=> res!1066965 e!869953)))

(assert (=> d!163503 (= res!1066965 (or (is-Nil!36366 lt!671718) (is-Nil!36366 (t!51088 lt!671718))))))

(assert (=> d!163503 (= (isStrictlySorted!967 lt!671718) e!869953)))

(declare-fun b!1561285 () Bool)

(declare-fun e!869954 () Bool)

(assert (=> b!1561285 (= e!869953 e!869954)))

(declare-fun res!1066966 () Bool)

(assert (=> b!1561285 (=> (not res!1066966) (not e!869954))))

(assert (=> b!1561285 (= res!1066966 (bvslt (_1!12532 (h!37829 lt!671718)) (_1!12532 (h!37829 (t!51088 lt!671718)))))))

(declare-fun b!1561286 () Bool)

(assert (=> b!1561286 (= e!869954 (isStrictlySorted!967 (t!51088 lt!671718)))))

(assert (= (and d!163503 (not res!1066965)) b!1561285))

(assert (= (and b!1561285 res!1066966) b!1561286))

(declare-fun m!1437591 () Bool)

(assert (=> b!1561286 m!1437591))

(assert (=> d!163413 d!163503))

(assert (=> d!163413 d!163421))

(declare-fun d!163505 () Bool)

(declare-fun res!1066967 () Bool)

(declare-fun e!869955 () Bool)

(assert (=> d!163505 (=> res!1066967 e!869955)))

(assert (=> d!163505 (= res!1066967 (and (is-Cons!36365 (t!51088 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135))) (= (_1!12532 (h!37829 (t!51088 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!163505 (= (containsKey!843 (t!51088 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135)) otherKey!62) e!869955)))

(declare-fun b!1561287 () Bool)

(declare-fun e!869956 () Bool)

(assert (=> b!1561287 (= e!869955 e!869956)))

(declare-fun res!1066968 () Bool)

(assert (=> b!1561287 (=> (not res!1066968) (not e!869956))))

(assert (=> b!1561287 (= res!1066968 (and (or (not (is-Cons!36365 (t!51088 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135)))) (bvsle (_1!12532 (h!37829 (t!51088 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135)))) otherKey!62)) (is-Cons!36365 (t!51088 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135))) (bvslt (_1!12532 (h!37829 (t!51088 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1561288 () Bool)

(assert (=> b!1561288 (= e!869956 (containsKey!843 (t!51088 (t!51088 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!163505 (not res!1066967)) b!1561287))

(assert (= (and b!1561287 res!1066968) b!1561288))

(declare-fun m!1437593 () Bool)

(assert (=> b!1561288 m!1437593))

(assert (=> b!1560995 d!163505))

(declare-fun d!163507 () Bool)

(declare-fun res!1066969 () Bool)

(declare-fun e!869957 () Bool)

(assert (=> d!163507 (=> res!1066969 e!869957)))

(assert (=> d!163507 (= res!1066969 (and (is-Cons!36365 (t!51088 (t!51088 l!1292))) (= (_1!12532 (h!37829 (t!51088 (t!51088 l!1292)))) otherKey!62)))))

(assert (=> d!163507 (= (containsKey!843 (t!51088 (t!51088 l!1292)) otherKey!62) e!869957)))

(declare-fun b!1561289 () Bool)

(declare-fun e!869958 () Bool)

(assert (=> b!1561289 (= e!869957 e!869958)))

(declare-fun res!1066970 () Bool)

(assert (=> b!1561289 (=> (not res!1066970) (not e!869958))))

(assert (=> b!1561289 (= res!1066970 (and (or (not (is-Cons!36365 (t!51088 (t!51088 l!1292)))) (bvsle (_1!12532 (h!37829 (t!51088 (t!51088 l!1292)))) otherKey!62)) (is-Cons!36365 (t!51088 (t!51088 l!1292))) (bvslt (_1!12532 (h!37829 (t!51088 (t!51088 l!1292)))) otherKey!62)))))

(declare-fun b!1561290 () Bool)

(assert (=> b!1561290 (= e!869958 (containsKey!843 (t!51088 (t!51088 (t!51088 l!1292))) otherKey!62))))

(assert (= (and d!163507 (not res!1066969)) b!1561289))

(assert (= (and b!1561289 res!1066970) b!1561290))

(declare-fun m!1437595 () Bool)

(assert (=> b!1561290 m!1437595))

(assert (=> b!1561168 d!163507))

(assert (=> b!1560991 d!163427))

(declare-fun d!163509 () Bool)

(declare-fun res!1066971 () Bool)

(declare-fun e!869959 () Bool)

(assert (=> d!163509 (=> res!1066971 e!869959)))

(assert (=> d!163509 (= res!1066971 (and (is-Cons!36365 lt!671709) (= (_1!12532 (h!37829 lt!671709)) newKey!135)))))

(assert (=> d!163509 (= (containsKey!843 lt!671709 newKey!135) e!869959)))

(declare-fun b!1561291 () Bool)

(declare-fun e!869960 () Bool)

(assert (=> b!1561291 (= e!869959 e!869960)))

(declare-fun res!1066972 () Bool)

(assert (=> b!1561291 (=> (not res!1066972) (not e!869960))))

(assert (=> b!1561291 (= res!1066972 (and (or (not (is-Cons!36365 lt!671709)) (bvsle (_1!12532 (h!37829 lt!671709)) newKey!135)) (is-Cons!36365 lt!671709) (bvslt (_1!12532 (h!37829 lt!671709)) newKey!135)))))

(declare-fun b!1561292 () Bool)

(assert (=> b!1561292 (= e!869960 (containsKey!843 (t!51088 lt!671709) newKey!135))))

(assert (= (and d!163509 (not res!1066971)) b!1561291))

(assert (= (and b!1561291 res!1066972) b!1561292))

(declare-fun m!1437597 () Bool)

(assert (=> b!1561292 m!1437597))

(assert (=> b!1561078 d!163509))

(assert (=> d!163407 d!163389))

(assert (=> d!163407 d!163413))

(declare-fun d!163511 () Bool)

(assert (=> d!163511 (containsKey!843 (insertStrictlySorted!572 (t!51088 l!1292) newKey!135 newValue!135) otherKey!62)))

(assert (=> d!163511 true))

(declare-fun _$18!47 () Unit!51801)

(assert (=> d!163511 (= (choose!2064 (t!51088 l!1292) newKey!135 newValue!135 otherKey!62) _$18!47)))

(declare-fun bs!44824 () Bool)

(assert (= bs!44824 d!163511))

(assert (=> bs!44824 m!1437377))

(assert (=> bs!44824 m!1437377))

(assert (=> bs!44824 m!1437379))

(assert (=> d!163407 d!163511))

(assert (=> d!163407 d!163421))

(declare-fun d!163513 () Bool)

(assert (=> d!163513 (= ($colon$colon!979 e!869807 (ite c!144934 (h!37829 l!1292) (tuple2!25043 newKey!135 newValue!135))) (Cons!36365 (ite c!144934 (h!37829 l!1292) (tuple2!25043 newKey!135 newValue!135)) e!869807))))

(assert (=> bm!71919 d!163513))

(declare-fun lt!671737 () Bool)

(declare-fun d!163515 () Bool)

(assert (=> d!163515 (= lt!671737 (member (tuple2!25043 newKey!135 newValue!135) (content!793 lt!671709)))))

(declare-fun e!869961 () Bool)

(assert (=> d!163515 (= lt!671737 e!869961)))

(declare-fun res!1066974 () Bool)

(assert (=> d!163515 (=> (not res!1066974) (not e!869961))))

(assert (=> d!163515 (= res!1066974 (is-Cons!36365 lt!671709))))

(assert (=> d!163515 (= (contains!10256 lt!671709 (tuple2!25043 newKey!135 newValue!135)) lt!671737)))

(declare-fun b!1561293 () Bool)

(declare-fun e!869962 () Bool)

(assert (=> b!1561293 (= e!869961 e!869962)))

(declare-fun res!1066973 () Bool)

(assert (=> b!1561293 (=> res!1066973 e!869962)))

(assert (=> b!1561293 (= res!1066973 (= (h!37829 lt!671709) (tuple2!25043 newKey!135 newValue!135)))))

(declare-fun b!1561294 () Bool)

(assert (=> b!1561294 (= e!869962 (contains!10256 (t!51088 lt!671709) (tuple2!25043 newKey!135 newValue!135)))))

(assert (= (and d!163515 res!1066974) b!1561293))

(assert (= (and b!1561293 (not res!1066973)) b!1561294))

(declare-fun m!1437599 () Bool)

(assert (=> d!163515 m!1437599))

(declare-fun m!1437601 () Bool)

(assert (=> d!163515 m!1437601))

(declare-fun m!1437603 () Bool)

(assert (=> b!1561294 m!1437603))

(assert (=> b!1561076 d!163515))

(assert (=> b!1561085 d!163413))

(assert (=> b!1561124 d!163427))

(declare-fun b!1561295 () Bool)

(declare-fun e!869963 () Bool)

(declare-fun tp!112674 () Bool)

(assert (=> b!1561295 (= e!869963 (and tp_is_empty!38445 tp!112674))))

(assert (=> b!1561183 (= tp!112668 e!869963)))

(assert (= (and b!1561183 (is-Cons!36365 (t!51088 (t!51088 l!1292)))) b!1561295))

(push 1)

(assert (not d!163499))

(assert (not b!1561288))

(assert (not b!1561262))

(assert (not b!1561292))

(assert (not b!1561277))

(assert (not d!163515))

(assert (not b!1561274))

(assert (not b!1561275))

(assert (not b!1561290))

(assert (not b!1561268))

(assert (not b!1561284))

(assert (not b!1561266))

(assert (not d!163511))

(assert tp_is_empty!38445)

(assert (not b!1561295))

(assert (not b!1561294))

(assert (not b!1561264))

(assert (not d!163501))

(assert (not b!1561286))

(assert (not bm!71942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

