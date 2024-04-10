; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137148 () Bool)

(assert start!137148)

(declare-fun b!1580411 () Bool)

(declare-fun e!881663 () Bool)

(declare-datatypes ((B!2664 0))(
  ( (B!2665 (val!19694 Int)) )
))
(declare-datatypes ((tuple2!25514 0))(
  ( (tuple2!25515 (_1!12768 (_ BitVec 64)) (_2!12768 B!2664)) )
))
(declare-datatypes ((List!36814 0))(
  ( (Nil!36811) (Cons!36810 (h!38353 tuple2!25514) (t!51728 List!36814)) )
))
(declare-fun l!1390 () List!36814)

(declare-fun ListPrimitiveSize!195 (List!36814) Int)

(assert (=> b!1580411 (= e!881663 (< (ListPrimitiveSize!195 l!1390) 0))))

(declare-fun b!1580409 () Bool)

(declare-fun res!1079663 () Bool)

(assert (=> b!1580409 (=> (not res!1079663) (not e!881663))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!918 (List!36814 (_ BitVec 64)) Bool)

(assert (=> b!1580409 (= res!1079663 (containsKey!918 l!1390 key!405))))

(declare-fun b!1580412 () Bool)

(declare-fun e!881662 () Bool)

(declare-fun tp_is_empty!39209 () Bool)

(declare-fun tp!114474 () Bool)

(assert (=> b!1580412 (= e!881662 (and tp_is_empty!39209 tp!114474))))

(declare-fun b!1580410 () Bool)

(declare-fun res!1079662 () Bool)

(assert (=> b!1580410 (=> (not res!1079662) (not e!881663))))

(declare-fun value!194 () B!2664)

(declare-fun contains!10486 (List!36814 tuple2!25514) Bool)

(assert (=> b!1580410 (= res!1079662 (contains!10486 l!1390 (tuple2!25515 key!405 value!194)))))

(declare-fun res!1079664 () Bool)

(assert (=> start!137148 (=> (not res!1079664) (not e!881663))))

(declare-fun isStrictlySorted!1072 (List!36814) Bool)

(assert (=> start!137148 (= res!1079664 (isStrictlySorted!1072 l!1390))))

(assert (=> start!137148 e!881663))

(assert (=> start!137148 e!881662))

(assert (=> start!137148 true))

(assert (=> start!137148 tp_is_empty!39209))

(assert (= (and start!137148 res!1079664) b!1580409))

(assert (= (and b!1580409 res!1079663) b!1580410))

(assert (= (and b!1580410 res!1079662) b!1580411))

(assert (= (and start!137148 (is-Cons!36810 l!1390)) b!1580412))

(declare-fun m!1451849 () Bool)

(assert (=> b!1580411 m!1451849))

(declare-fun m!1451851 () Bool)

(assert (=> b!1580409 m!1451851))

(declare-fun m!1451853 () Bool)

(assert (=> b!1580410 m!1451853))

(declare-fun m!1451855 () Bool)

(assert (=> start!137148 m!1451855))

(push 1)

(assert tp_is_empty!39209)

(assert (not b!1580410))

(assert (not b!1580412))

(assert (not start!137148))

(assert (not b!1580409))

(assert (not b!1580411))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166413 () Bool)

(declare-fun lt!676768 () Bool)

(declare-fun content!831 (List!36814) (Set tuple2!25514))

(assert (=> d!166413 (= lt!676768 (member (tuple2!25515 key!405 value!194) (content!831 l!1390)))))

(declare-fun e!881681 () Bool)

(assert (=> d!166413 (= lt!676768 e!881681)))

(declare-fun res!1079682 () Bool)

(assert (=> d!166413 (=> (not res!1079682) (not e!881681))))

(assert (=> d!166413 (= res!1079682 (is-Cons!36810 l!1390))))

(assert (=> d!166413 (= (contains!10486 l!1390 (tuple2!25515 key!405 value!194)) lt!676768)))

(declare-fun b!1580429 () Bool)

(declare-fun e!881680 () Bool)

(assert (=> b!1580429 (= e!881681 e!881680)))

(declare-fun res!1079681 () Bool)

(assert (=> b!1580429 (=> res!1079681 e!881680)))

(assert (=> b!1580429 (= res!1079681 (= (h!38353 l!1390) (tuple2!25515 key!405 value!194)))))

(declare-fun b!1580430 () Bool)

(assert (=> b!1580430 (= e!881680 (contains!10486 (t!51728 l!1390) (tuple2!25515 key!405 value!194)))))

(assert (= (and d!166413 res!1079682) b!1580429))

(assert (= (and b!1580429 (not res!1079681)) b!1580430))

(declare-fun m!1451861 () Bool)

(assert (=> d!166413 m!1451861))

(declare-fun m!1451863 () Bool)

(assert (=> d!166413 m!1451863))

(declare-fun m!1451865 () Bool)

(assert (=> b!1580430 m!1451865))

(assert (=> b!1580410 d!166413))

(declare-fun d!166419 () Bool)

(declare-fun res!1079693 () Bool)

(declare-fun e!881697 () Bool)

(assert (=> d!166419 (=> res!1079693 e!881697)))

(assert (=> d!166419 (= res!1079693 (and (is-Cons!36810 l!1390) (= (_1!12768 (h!38353 l!1390)) key!405)))))

(assert (=> d!166419 (= (containsKey!918 l!1390 key!405) e!881697)))

(declare-fun b!1580451 () Bool)

(declare-fun e!881698 () Bool)

(assert (=> b!1580451 (= e!881697 e!881698)))

(declare-fun res!1079694 () Bool)

(assert (=> b!1580451 (=> (not res!1079694) (not e!881698))))

(assert (=> b!1580451 (= res!1079694 (and (or (not (is-Cons!36810 l!1390)) (bvsle (_1!12768 (h!38353 l!1390)) key!405)) (is-Cons!36810 l!1390) (bvslt (_1!12768 (h!38353 l!1390)) key!405)))))

(declare-fun b!1580452 () Bool)

(assert (=> b!1580452 (= e!881698 (containsKey!918 (t!51728 l!1390) key!405))))

(assert (= (and d!166419 (not res!1079693)) b!1580451))

(assert (= (and b!1580451 res!1079694) b!1580452))

(declare-fun m!1451871 () Bool)

(assert (=> b!1580452 m!1451871))

(assert (=> b!1580409 d!166419))

(declare-fun d!166425 () Bool)

(declare-fun res!1079705 () Bool)

(declare-fun e!881710 () Bool)

(assert (=> d!166425 (=> res!1079705 e!881710)))

(assert (=> d!166425 (= res!1079705 (or (is-Nil!36811 l!1390) (is-Nil!36811 (t!51728 l!1390))))))

(assert (=> d!166425 (= (isStrictlySorted!1072 l!1390) e!881710)))

(declare-fun b!1580465 () Bool)

(declare-fun e!881711 () Bool)

(assert (=> b!1580465 (= e!881710 e!881711)))

(declare-fun res!1079706 () Bool)

(assert (=> b!1580465 (=> (not res!1079706) (not e!881711))))

(assert (=> b!1580465 (= res!1079706 (bvslt (_1!12768 (h!38353 l!1390)) (_1!12768 (h!38353 (t!51728 l!1390)))))))

(declare-fun b!1580466 () Bool)

(assert (=> b!1580466 (= e!881711 (isStrictlySorted!1072 (t!51728 l!1390)))))

(assert (= (and d!166425 (not res!1079705)) b!1580465))

(assert (= (and b!1580465 res!1079706) b!1580466))

(declare-fun m!1451881 () Bool)

(assert (=> b!1580466 m!1451881))

(assert (=> start!137148 d!166425))

(declare-fun d!166431 () Bool)

(declare-fun lt!676783 () Int)

(assert (=> d!166431 (>= lt!676783 0)))

(declare-fun e!881728 () Int)

