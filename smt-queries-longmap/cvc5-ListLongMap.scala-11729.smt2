; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137520 () Bool)

(assert start!137520)

(declare-fun res!1080710 () Bool)

(declare-fun e!882712 () Bool)

(assert (=> start!137520 (=> (not res!1080710) (not e!882712))))

(declare-datatypes ((B!2714 0))(
  ( (B!2715 (val!19719 Int)) )
))
(declare-datatypes ((tuple2!25606 0))(
  ( (tuple2!25607 (_1!12814 (_ BitVec 64)) (_2!12814 B!2714)) )
))
(declare-datatypes ((List!36839 0))(
  ( (Nil!36836) (Cons!36835 (h!38378 tuple2!25606) (t!51753 List!36839)) )
))
(declare-fun l!1390 () List!36839)

(declare-fun isStrictlySorted!1097 (List!36839) Bool)

(assert (=> start!137520 (= res!1080710 (isStrictlySorted!1097 l!1390))))

(assert (=> start!137520 e!882712))

(declare-fun e!882713 () Bool)

(assert (=> start!137520 e!882713))

(assert (=> start!137520 true))

(declare-fun tp_is_empty!39259 () Bool)

(assert (=> start!137520 tp_is_empty!39259))

(declare-fun b!1581872 () Bool)

(declare-fun res!1080711 () Bool)

(assert (=> b!1581872 (=> (not res!1080711) (not e!882712))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!943 (List!36839 (_ BitVec 64)) Bool)

(assert (=> b!1581872 (= res!1080711 (containsKey!943 l!1390 key!405))))

(declare-fun b!1581873 () Bool)

(assert (=> b!1581873 (= e!882712 false)))

(declare-fun lt!677028 () Bool)

(declare-fun value!194 () B!2714)

(declare-fun contains!10511 (List!36839 tuple2!25606) Bool)

(assert (=> b!1581873 (= lt!677028 (contains!10511 l!1390 (tuple2!25607 key!405 value!194)))))

(declare-fun b!1581874 () Bool)

(declare-fun tp!114623 () Bool)

(assert (=> b!1581874 (= e!882713 (and tp_is_empty!39259 tp!114623))))

(assert (= (and start!137520 res!1080710) b!1581872))

(assert (= (and b!1581872 res!1080711) b!1581873))

(assert (= (and start!137520 (is-Cons!36835 l!1390)) b!1581874))

(declare-fun m!1452641 () Bool)

(assert (=> start!137520 m!1452641))

(declare-fun m!1452643 () Bool)

(assert (=> b!1581872 m!1452643))

(declare-fun m!1452645 () Bool)

(assert (=> b!1581873 m!1452645))

(push 1)

(assert (not b!1581872))

(assert (not b!1581873))

(assert (not start!137520))

(assert tp_is_empty!39259)

(assert (not b!1581874))

(check-sat)

