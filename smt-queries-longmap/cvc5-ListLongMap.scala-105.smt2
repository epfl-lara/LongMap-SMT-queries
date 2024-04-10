; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1698 () Bool)

(assert start!1698)

(declare-fun res!9823 () Bool)

(declare-fun e!7145 () Bool)

(assert (=> start!1698 (=> (not res!9823) (not e!7145))))

(declare-datatypes ((B!434 0))(
  ( (B!435 (val!312 Int)) )
))
(declare-datatypes ((tuple2!424 0))(
  ( (tuple2!425 (_1!212 (_ BitVec 64)) (_2!212 B!434)) )
))
(declare-datatypes ((List!364 0))(
  ( (Nil!361) (Cons!360 (h!926 tuple2!424) (t!2751 List!364)) )
))
(declare-fun l!1094 () List!364)

(declare-fun isStrictlySorted!57 (List!364) Bool)

(assert (=> start!1698 (= res!9823 (isStrictlySorted!57 l!1094))))

(assert (=> start!1698 e!7145))

(declare-fun e!7144 () Bool)

(assert (=> start!1698 e!7144))

(assert (=> start!1698 true))

(declare-fun tp_is_empty!607 () Bool)

(assert (=> start!1698 tp_is_empty!607))

(declare-fun b!11985 () Bool)

(declare-fun res!9822 () Bool)

(assert (=> b!11985 (=> (not res!9822) (not e!7145))))

(declare-fun key!303 () (_ BitVec 64))

(declare-fun v!194 () B!434)

(declare-datatypes ((Option!44 0))(
  ( (Some!43 (v!1358 B!434)) (None!42) )
))
(declare-fun getValueByKey!38 (List!364 (_ BitVec 64)) Option!44)

(assert (=> b!11985 (= res!9822 (= (getValueByKey!38 l!1094 key!303) (Some!43 v!194)))))

(declare-fun b!11986 () Bool)

(declare-fun ListPrimitiveSize!13 (List!364) Int)

(assert (=> b!11986 (= e!7145 (< (ListPrimitiveSize!13 l!1094) 0))))

(declare-fun b!11987 () Bool)

(declare-fun tp!2024 () Bool)

(assert (=> b!11987 (= e!7144 (and tp_is_empty!607 tp!2024))))

(assert (= (and start!1698 res!9823) b!11985))

(assert (= (and b!11985 res!9822) b!11986))

(assert (= (and start!1698 (is-Cons!360 l!1094)) b!11987))

(declare-fun m!8327 () Bool)

(assert (=> start!1698 m!8327))

(declare-fun m!8329 () Bool)

(assert (=> b!11985 m!8329))

(declare-fun m!8331 () Bool)

(assert (=> b!11986 m!8331))

(push 1)

(assert (not b!11987))

(assert (not b!11986))

(assert (not start!1698))

(assert tp_is_empty!607)

(assert (not b!11985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1673 () Bool)

(declare-fun lt!3093 () Int)

(assert (=> d!1673 (>= lt!3093 0)))

(declare-fun e!7169 () Int)

(assert (=> d!1673 (= lt!3093 e!7169)))

(declare-fun c!1019 () Bool)

(assert (=> d!1673 (= c!1019 (is-Nil!361 l!1094))))

(assert (=> d!1673 (= (ListPrimitiveSize!13 l!1094) lt!3093)))

(declare-fun b!12022 () Bool)

(assert (=> b!12022 (= e!7169 0)))

(declare-fun b!12023 () Bool)

(assert (=> b!12023 (= e!7169 (+ 1 (ListPrimitiveSize!13 (t!2751 l!1094))))))

(assert (= (and d!1673 c!1019) b!12022))

(assert (= (and d!1673 (not c!1019)) b!12023))

(declare-fun m!8349 () Bool)

(assert (=> b!12023 m!8349))

(assert (=> b!11986 d!1673))

(declare-fun d!1679 () Bool)

(declare-fun res!9852 () Bool)

(declare-fun e!7186 () Bool)

(assert (=> d!1679 (=> res!9852 e!7186)))

(assert (=> d!1679 (= res!9852 (or (is-Nil!361 l!1094) (is-Nil!361 (t!2751 l!1094))))))

(assert (=> d!1679 (= (isStrictlySorted!57 l!1094) e!7186)))

(declare-fun b!12048 () Bool)

(declare-fun e!7187 () Bool)

(assert (=> b!12048 (= e!7186 e!7187)))

(declare-fun res!9853 () Bool)

(assert (=> b!12048 (=> (not res!9853) (not e!7187))))

(assert (=> b!12048 (= res!9853 (bvslt (_1!212 (h!926 l!1094)) (_1!212 (h!926 (t!2751 l!1094)))))))

(declare-fun b!12049 () Bool)

(assert (=> b!12049 (= e!7187 (isStrictlySorted!57 (t!2751 l!1094)))))

(assert (= (and d!1679 (not res!9852)) b!12048))

(assert (= (and b!12048 res!9853) b!12049))

(declare-fun m!8355 () Bool)

(assert (=> b!12049 m!8355))

(assert (=> start!1698 d!1679))

(declare-fun b!12079 () Bool)

(declare-fun e!7204 () Option!44)

(assert (=> b!12079 (= e!7204 (Some!43 (_2!212 (h!926 l!1094))))))

(declare-fun b!12081 () Bool)

(declare-fun e!7205 () Option!44)

(assert (=> b!12081 (= e!7205 (getValueByKey!38 (t!2751 l!1094) key!303))))

(declare-fun d!1685 () Bool)

(declare-fun c!1039 () Bool)

(assert (=> d!1685 (= c!1039 (and (is-Cons!360 l!1094) (= (_1!212 (h!926 l!1094)) key!303)))))

(assert (=> d!1685 (= (getValueByKey!38 l!1094 key!303) e!7204)))

(declare-fun b!12080 () Bool)

(assert (=> b!12080 (= e!7204 e!7205)))

(declare-fun c!1040 () Bool)

(assert (=> b!12080 (= c!1040 (and (is-Cons!360 l!1094) (not (= (_1!212 (h!926 l!1094)) key!303))))))

(declare-fun b!12082 () Bool)

(assert (=> b!12082 (= e!7205 None!42)))

(assert (= (and d!1685 c!1039) b!12079))

(assert (= (and d!1685 (not c!1039)) b!12080))

(assert (= (and b!12080 c!1040) b!12081))

(assert (= (and b!12080 (not c!1040)) b!12082))

(declare-fun m!8361 () Bool)

(assert (=> b!12081 m!8361))

(assert (=> b!11985 d!1685))

(declare-fun b!12092 () Bool)

(declare-fun e!7211 () Bool)

(declare-fun tp!2039 () Bool)

(assert (=> b!12092 (= e!7211 (and tp_is_empty!607 tp!2039))))

(assert (=> b!11987 (= tp!2024 e!7211)))

(assert (= (and b!11987 (is-Cons!360 (t!2751 l!1094))) b!12092))

(push 1)

