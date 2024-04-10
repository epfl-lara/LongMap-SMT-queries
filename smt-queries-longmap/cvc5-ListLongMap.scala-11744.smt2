; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137730 () Bool)

(assert start!137730)

(declare-fun res!1081180 () Bool)

(declare-fun e!883312 () Bool)

(assert (=> start!137730 (=> (not res!1081180) (not e!883312))))

(declare-datatypes ((B!2804 0))(
  ( (B!2805 (val!19764 Int)) )
))
(declare-datatypes ((tuple2!25696 0))(
  ( (tuple2!25697 (_1!12859 (_ BitVec 64)) (_2!12859 B!2804)) )
))
(declare-datatypes ((List!36884 0))(
  ( (Nil!36881) (Cons!36880 (h!38423 tuple2!25696) (t!51798 List!36884)) )
))
(declare-fun l!1065 () List!36884)

(declare-fun isStrictlySorted!1121 (List!36884) Bool)

(assert (=> start!137730 (= res!1081180 (isStrictlySorted!1121 l!1065))))

(assert (=> start!137730 e!883312))

(declare-fun e!883313 () Bool)

(assert (=> start!137730 e!883313))

(assert (=> start!137730 true))

(declare-fun b!1582640 () Bool)

(declare-fun res!1081182 () Bool)

(assert (=> b!1582640 (=> (not res!1081182) (not e!883312))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!967 (List!36884 (_ BitVec 64)) Bool)

(assert (=> b!1582640 (= res!1081182 (containsKey!967 l!1065 key!287))))

(declare-fun b!1582641 () Bool)

(declare-fun res!1081178 () Bool)

(assert (=> b!1582641 (=> (not res!1081178) (not e!883312))))

(assert (=> b!1582641 (= res!1081178 (and (is-Cons!36880 l!1065) (not (= (_1!12859 (h!38423 l!1065)) key!287))))))

(declare-fun b!1582642 () Bool)

(declare-fun res!1081179 () Bool)

(assert (=> b!1582642 (=> (not res!1081179) (not e!883312))))

(assert (=> b!1582642 (= res!1081179 (isStrictlySorted!1121 (t!51798 l!1065)))))

(declare-fun b!1582643 () Bool)

(assert (=> b!1582643 (= e!883312 (not true))))

(declare-datatypes ((Option!938 0))(
  ( (Some!937 (v!22465 B!2804)) (None!936) )
))
(declare-fun isDefined!603 (Option!938) Bool)

(declare-fun getValueByKey!829 (List!36884 (_ BitVec 64)) Option!938)

(assert (=> b!1582643 (isDefined!603 (getValueByKey!829 (t!51798 l!1065) key!287))))

(declare-datatypes ((Unit!52273 0))(
  ( (Unit!52274) )
))
(declare-fun lt!677121 () Unit!52273)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!552 (List!36884 (_ BitVec 64)) Unit!52273)

(assert (=> b!1582643 (= lt!677121 (lemmaContainsKeyImpliesGetValueByKeyDefined!552 (t!51798 l!1065) key!287))))

(declare-fun b!1582644 () Bool)

(declare-fun res!1081181 () Bool)

(assert (=> b!1582644 (=> (not res!1081181) (not e!883312))))

(assert (=> b!1582644 (= res!1081181 (containsKey!967 (t!51798 l!1065) key!287))))

(declare-fun b!1582645 () Bool)

(declare-fun tp_is_empty!39337 () Bool)

(declare-fun tp!114821 () Bool)

(assert (=> b!1582645 (= e!883313 (and tp_is_empty!39337 tp!114821))))

(assert (= (and start!137730 res!1081180) b!1582640))

(assert (= (and b!1582640 res!1081182) b!1582641))

(assert (= (and b!1582641 res!1081178) b!1582642))

(assert (= (and b!1582642 res!1081179) b!1582644))

(assert (= (and b!1582644 res!1081181) b!1582643))

(assert (= (and start!137730 (is-Cons!36880 l!1065)) b!1582645))

(declare-fun m!1452965 () Bool)

(assert (=> b!1582643 m!1452965))

(assert (=> b!1582643 m!1452965))

(declare-fun m!1452967 () Bool)

(assert (=> b!1582643 m!1452967))

(declare-fun m!1452969 () Bool)

(assert (=> b!1582643 m!1452969))

(declare-fun m!1452971 () Bool)

(assert (=> b!1582644 m!1452971))

(declare-fun m!1452973 () Bool)

(assert (=> start!137730 m!1452973))

(declare-fun m!1452975 () Bool)

(assert (=> b!1582642 m!1452975))

(declare-fun m!1452977 () Bool)

(assert (=> b!1582640 m!1452977))

(push 1)

(assert tp_is_empty!39337)

(assert (not b!1582642))

(assert (not b!1582645))

(assert (not b!1582643))

(assert (not b!1582640))

(assert (not start!137730))

(assert (not b!1582644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

