; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133128 () Bool)

(assert start!133128)

(declare-fun b!1557832 () Bool)

(declare-fun e!867772 () Bool)

(declare-fun tp_is_empty!38425 () Bool)

(declare-fun tp!112603 () Bool)

(assert (=> b!1557832 (= e!867772 (and tp_is_empty!38425 tp!112603))))

(declare-fun b!1557830 () Bool)

(declare-fun res!1065528 () Bool)

(declare-fun e!867773 () Bool)

(assert (=> b!1557830 (=> (not res!1065528) (not e!867773))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1557830 (= res!1065528 (not (= otherKey!62 newKey!135)))))

(declare-fun b!1557831 () Bool)

(declare-datatypes ((B!2420 0))(
  ( (B!2421 (val!19296 Int)) )
))
(declare-datatypes ((tuple2!25040 0))(
  ( (tuple2!25041 (_1!12531 (_ BitVec 64)) (_2!12531 B!2420)) )
))
(declare-datatypes ((List!36375 0))(
  ( (Nil!36372) (Cons!36371 (h!37818 tuple2!25040) (t!51094 List!36375)) )
))
(declare-fun l!1292 () List!36375)

(declare-fun ListPrimitiveSize!181 (List!36375) Int)

(assert (=> b!1557831 (= e!867773 (< (ListPrimitiveSize!181 l!1292) 0))))

(declare-fun b!1557829 () Bool)

(declare-fun res!1065527 () Bool)

(assert (=> b!1557829 (=> (not res!1065527) (not e!867773))))

(declare-fun containsKey!831 (List!36375 (_ BitVec 64)) Bool)

(assert (=> b!1557829 (= res!1065527 (containsKey!831 l!1292 otherKey!62))))

(declare-fun res!1065529 () Bool)

(assert (=> start!133128 (=> (not res!1065529) (not e!867773))))

(declare-fun isStrictlySorted!969 (List!36375) Bool)

(assert (=> start!133128 (= res!1065529 (isStrictlySorted!969 l!1292))))

(assert (=> start!133128 e!867773))

(assert (=> start!133128 e!867772))

(assert (=> start!133128 true))

(assert (= (and start!133128 res!1065529) b!1557829))

(assert (= (and b!1557829 res!1065527) b!1557830))

(assert (= (and b!1557830 res!1065528) b!1557831))

(get-info :version)

(assert (= (and start!133128 ((_ is Cons!36371) l!1292)) b!1557832))

(declare-fun m!1434077 () Bool)

(assert (=> b!1557831 m!1434077))

(declare-fun m!1434079 () Bool)

(assert (=> b!1557829 m!1434079))

(declare-fun m!1434081 () Bool)

(assert (=> start!133128 m!1434081))

(check-sat (not start!133128) (not b!1557831) tp_is_empty!38425 (not b!1557832) (not b!1557829))
(check-sat)
(get-model)

(declare-fun d!162341 () Bool)

(declare-fun lt!670480 () Int)

(assert (=> d!162341 (>= lt!670480 0)))

(declare-fun e!867792 () Int)

(assert (=> d!162341 (= lt!670480 e!867792)))

(declare-fun c!143997 () Bool)

(assert (=> d!162341 (= c!143997 ((_ is Nil!36372) l!1292))))

(assert (=> d!162341 (= (ListPrimitiveSize!181 l!1292) lt!670480)))

(declare-fun b!1557865 () Bool)

(assert (=> b!1557865 (= e!867792 0)))

(declare-fun b!1557866 () Bool)

(assert (=> b!1557866 (= e!867792 (+ 1 (ListPrimitiveSize!181 (t!51094 l!1292))))))

(assert (= (and d!162341 c!143997) b!1557865))

(assert (= (and d!162341 (not c!143997)) b!1557866))

(declare-fun m!1434095 () Bool)

(assert (=> b!1557866 m!1434095))

(assert (=> b!1557831 d!162341))

(declare-fun d!162347 () Bool)

(declare-fun res!1065563 () Bool)

(declare-fun e!867806 () Bool)

(assert (=> d!162347 (=> res!1065563 e!867806)))

(assert (=> d!162347 (= res!1065563 (or ((_ is Nil!36372) l!1292) ((_ is Nil!36372) (t!51094 l!1292))))))

(assert (=> d!162347 (= (isStrictlySorted!969 l!1292) e!867806)))

(declare-fun b!1557882 () Bool)

(declare-fun e!867808 () Bool)

(assert (=> b!1557882 (= e!867806 e!867808)))

(declare-fun res!1065565 () Bool)

(assert (=> b!1557882 (=> (not res!1065565) (not e!867808))))

(assert (=> b!1557882 (= res!1065565 (bvslt (_1!12531 (h!37818 l!1292)) (_1!12531 (h!37818 (t!51094 l!1292)))))))

(declare-fun b!1557884 () Bool)

(assert (=> b!1557884 (= e!867808 (isStrictlySorted!969 (t!51094 l!1292)))))

(assert (= (and d!162347 (not res!1065563)) b!1557882))

(assert (= (and b!1557882 res!1065565) b!1557884))

(declare-fun m!1434099 () Bool)

(assert (=> b!1557884 m!1434099))

(assert (=> start!133128 d!162347))

(declare-fun d!162351 () Bool)

(declare-fun res!1065578 () Bool)

(declare-fun e!867822 () Bool)

(assert (=> d!162351 (=> res!1065578 e!867822)))

(assert (=> d!162351 (= res!1065578 (and ((_ is Cons!36371) l!1292) (= (_1!12531 (h!37818 l!1292)) otherKey!62)))))

(assert (=> d!162351 (= (containsKey!831 l!1292 otherKey!62) e!867822)))

(declare-fun b!1557899 () Bool)

(declare-fun e!867823 () Bool)

(assert (=> b!1557899 (= e!867822 e!867823)))

(declare-fun res!1065579 () Bool)

(assert (=> b!1557899 (=> (not res!1065579) (not e!867823))))

(assert (=> b!1557899 (= res!1065579 (and (or (not ((_ is Cons!36371) l!1292)) (bvsle (_1!12531 (h!37818 l!1292)) otherKey!62)) ((_ is Cons!36371) l!1292) (bvslt (_1!12531 (h!37818 l!1292)) otherKey!62)))))

(declare-fun b!1557900 () Bool)

(assert (=> b!1557900 (= e!867823 (containsKey!831 (t!51094 l!1292) otherKey!62))))

(assert (= (and d!162351 (not res!1065578)) b!1557899))

(assert (= (and b!1557899 res!1065579) b!1557900))

(declare-fun m!1434107 () Bool)

(assert (=> b!1557900 m!1434107))

(assert (=> b!1557829 d!162351))

(declare-fun b!1557914 () Bool)

(declare-fun e!867833 () Bool)

(declare-fun tp!112615 () Bool)

(assert (=> b!1557914 (= e!867833 (and tp_is_empty!38425 tp!112615))))

(assert (=> b!1557832 (= tp!112603 e!867833)))

(assert (= (and b!1557832 ((_ is Cons!36371) (t!51094 l!1292))) b!1557914))

(check-sat (not b!1557914) (not b!1557900) (not b!1557866) tp_is_empty!38425 (not b!1557884))
(check-sat)
