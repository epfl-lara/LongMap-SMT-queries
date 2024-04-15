; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137732 () Bool)

(assert start!137732)

(declare-fun b!1582484 () Bool)

(declare-fun res!1081146 () Bool)

(declare-fun e!883215 () Bool)

(assert (=> b!1582484 (=> (not res!1081146) (not e!883215))))

(declare-datatypes ((B!2822 0))(
  ( (B!2823 (val!19773 Int)) )
))
(declare-datatypes ((tuple2!25782 0))(
  ( (tuple2!25783 (_1!12902 (_ BitVec 64)) (_2!12902 B!2822)) )
))
(declare-datatypes ((List!36934 0))(
  ( (Nil!36931) (Cons!36930 (h!38474 tuple2!25782) (t!51840 List!36934)) )
))
(declare-fun l!1065 () List!36934)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!971 (List!36934 (_ BitVec 64)) Bool)

(assert (=> b!1582484 (= res!1081146 (containsKey!971 l!1065 key!287))))

(declare-fun b!1582485 () Bool)

(declare-fun e!883217 () Bool)

(declare-fun tp_is_empty!39355 () Bool)

(declare-fun tp!114858 () Bool)

(assert (=> b!1582485 (= e!883217 (and tp_is_empty!39355 tp!114858))))

(declare-fun b!1582486 () Bool)

(declare-fun res!1081147 () Bool)

(assert (=> b!1582486 (=> (not res!1081147) (not e!883215))))

(get-info :version)

(assert (=> b!1582486 (= res!1081147 (and ((_ is Cons!36930) l!1065) (not (= (_1!12902 (h!38474 l!1065)) key!287))))))

(declare-fun res!1081149 () Bool)

(assert (=> start!137732 (=> (not res!1081149) (not e!883215))))

(declare-fun isStrictlySorted!1125 (List!36934) Bool)

(assert (=> start!137732 (= res!1081149 (isStrictlySorted!1125 l!1065))))

(assert (=> start!137732 e!883215))

(assert (=> start!137732 e!883217))

(assert (=> start!137732 true))

(declare-fun b!1582487 () Bool)

(declare-fun e!883216 () Bool)

(assert (=> b!1582487 (= e!883215 e!883216)))

(declare-fun res!1081148 () Bool)

(assert (=> b!1582487 (=> res!1081148 e!883216)))

(assert (=> b!1582487 (= res!1081148 (not (isStrictlySorted!1125 (t!51840 l!1065))))))

(declare-fun b!1582488 () Bool)

(assert (=> b!1582488 (= e!883216 (not (containsKey!971 (t!51840 l!1065) key!287)))))

(assert (= (and start!137732 res!1081149) b!1582484))

(assert (= (and b!1582484 res!1081146) b!1582486))

(assert (= (and b!1582486 res!1081147) b!1582487))

(assert (= (and b!1582487 (not res!1081148)) b!1582488))

(assert (= (and start!137732 ((_ is Cons!36930) l!1065)) b!1582485))

(declare-fun m!1452163 () Bool)

(assert (=> b!1582484 m!1452163))

(declare-fun m!1452165 () Bool)

(assert (=> start!137732 m!1452165))

(declare-fun m!1452167 () Bool)

(assert (=> b!1582487 m!1452167))

(declare-fun m!1452169 () Bool)

(assert (=> b!1582488 m!1452169))

(check-sat (not b!1582485) tp_is_empty!39355 (not b!1582484) (not b!1582487) (not start!137732) (not b!1582488))
(check-sat)
(get-model)

(declare-fun d!166815 () Bool)

(declare-fun res!1081178 () Bool)

(declare-fun e!883240 () Bool)

(assert (=> d!166815 (=> res!1081178 e!883240)))

(assert (=> d!166815 (= res!1081178 (or ((_ is Nil!36931) (t!51840 l!1065)) ((_ is Nil!36931) (t!51840 (t!51840 l!1065)))))))

(assert (=> d!166815 (= (isStrictlySorted!1125 (t!51840 l!1065)) e!883240)))

(declare-fun b!1582523 () Bool)

(declare-fun e!883241 () Bool)

(assert (=> b!1582523 (= e!883240 e!883241)))

(declare-fun res!1081179 () Bool)

(assert (=> b!1582523 (=> (not res!1081179) (not e!883241))))

(assert (=> b!1582523 (= res!1081179 (bvslt (_1!12902 (h!38474 (t!51840 l!1065))) (_1!12902 (h!38474 (t!51840 (t!51840 l!1065))))))))

(declare-fun b!1582524 () Bool)

(assert (=> b!1582524 (= e!883241 (isStrictlySorted!1125 (t!51840 (t!51840 l!1065))))))

(assert (= (and d!166815 (not res!1081178)) b!1582523))

(assert (= (and b!1582523 res!1081179) b!1582524))

(declare-fun m!1452187 () Bool)

(assert (=> b!1582524 m!1452187))

(assert (=> b!1582487 d!166815))

(declare-fun d!166819 () Bool)

(declare-fun res!1081188 () Bool)

(declare-fun e!883250 () Bool)

(assert (=> d!166819 (=> res!1081188 e!883250)))

(assert (=> d!166819 (= res!1081188 (and ((_ is Cons!36930) (t!51840 l!1065)) (= (_1!12902 (h!38474 (t!51840 l!1065))) key!287)))))

(assert (=> d!166819 (= (containsKey!971 (t!51840 l!1065) key!287) e!883250)))

(declare-fun b!1582533 () Bool)

(declare-fun e!883251 () Bool)

(assert (=> b!1582533 (= e!883250 e!883251)))

(declare-fun res!1081189 () Bool)

(assert (=> b!1582533 (=> (not res!1081189) (not e!883251))))

(assert (=> b!1582533 (= res!1081189 (and (or (not ((_ is Cons!36930) (t!51840 l!1065))) (bvsle (_1!12902 (h!38474 (t!51840 l!1065))) key!287)) ((_ is Cons!36930) (t!51840 l!1065)) (bvslt (_1!12902 (h!38474 (t!51840 l!1065))) key!287)))))

(declare-fun b!1582534 () Bool)

(assert (=> b!1582534 (= e!883251 (containsKey!971 (t!51840 (t!51840 l!1065)) key!287))))

(assert (= (and d!166819 (not res!1081188)) b!1582533))

(assert (= (and b!1582533 res!1081189) b!1582534))

(declare-fun m!1452189 () Bool)

(assert (=> b!1582534 m!1452189))

(assert (=> b!1582488 d!166819))

(declare-fun d!166823 () Bool)

(declare-fun res!1081190 () Bool)

(declare-fun e!883252 () Bool)

(assert (=> d!166823 (=> res!1081190 e!883252)))

(assert (=> d!166823 (= res!1081190 (or ((_ is Nil!36931) l!1065) ((_ is Nil!36931) (t!51840 l!1065))))))

(assert (=> d!166823 (= (isStrictlySorted!1125 l!1065) e!883252)))

(declare-fun b!1582535 () Bool)

(declare-fun e!883253 () Bool)

(assert (=> b!1582535 (= e!883252 e!883253)))

(declare-fun res!1081191 () Bool)

(assert (=> b!1582535 (=> (not res!1081191) (not e!883253))))

(assert (=> b!1582535 (= res!1081191 (bvslt (_1!12902 (h!38474 l!1065)) (_1!12902 (h!38474 (t!51840 l!1065)))))))

(declare-fun b!1582536 () Bool)

(assert (=> b!1582536 (= e!883253 (isStrictlySorted!1125 (t!51840 l!1065)))))

(assert (= (and d!166823 (not res!1081190)) b!1582535))

(assert (= (and b!1582535 res!1081191) b!1582536))

(assert (=> b!1582536 m!1452167))

(assert (=> start!137732 d!166823))

(declare-fun d!166825 () Bool)

(declare-fun res!1081196 () Bool)

(declare-fun e!883258 () Bool)

(assert (=> d!166825 (=> res!1081196 e!883258)))

(assert (=> d!166825 (= res!1081196 (and ((_ is Cons!36930) l!1065) (= (_1!12902 (h!38474 l!1065)) key!287)))))

(assert (=> d!166825 (= (containsKey!971 l!1065 key!287) e!883258)))

(declare-fun b!1582541 () Bool)

(declare-fun e!883259 () Bool)

(assert (=> b!1582541 (= e!883258 e!883259)))

(declare-fun res!1081197 () Bool)

(assert (=> b!1582541 (=> (not res!1081197) (not e!883259))))

(assert (=> b!1582541 (= res!1081197 (and (or (not ((_ is Cons!36930) l!1065)) (bvsle (_1!12902 (h!38474 l!1065)) key!287)) ((_ is Cons!36930) l!1065) (bvslt (_1!12902 (h!38474 l!1065)) key!287)))))

(declare-fun b!1582542 () Bool)

(assert (=> b!1582542 (= e!883259 (containsKey!971 (t!51840 l!1065) key!287))))

(assert (= (and d!166825 (not res!1081196)) b!1582541))

(assert (= (and b!1582541 res!1081197) b!1582542))

(assert (=> b!1582542 m!1452169))

(assert (=> b!1582484 d!166825))

(declare-fun b!1582549 () Bool)

(declare-fun e!883264 () Bool)

(declare-fun tp!114867 () Bool)

(assert (=> b!1582549 (= e!883264 (and tp_is_empty!39355 tp!114867))))

(assert (=> b!1582485 (= tp!114858 e!883264)))

(assert (= (and b!1582485 ((_ is Cons!36930) (t!51840 l!1065))) b!1582549))

(check-sat (not b!1582536) (not b!1582524) tp_is_empty!39355 (not b!1582534) (not b!1582542) (not b!1582549))
(check-sat)
