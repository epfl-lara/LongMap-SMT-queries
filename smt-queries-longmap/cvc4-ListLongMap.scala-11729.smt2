; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137524 () Bool)

(assert start!137524)

(declare-fun res!1080723 () Bool)

(declare-fun e!882724 () Bool)

(assert (=> start!137524 (=> (not res!1080723) (not e!882724))))

(declare-datatypes ((B!2718 0))(
  ( (B!2719 (val!19721 Int)) )
))
(declare-datatypes ((tuple2!25610 0))(
  ( (tuple2!25611 (_1!12816 (_ BitVec 64)) (_2!12816 B!2718)) )
))
(declare-datatypes ((List!36841 0))(
  ( (Nil!36838) (Cons!36837 (h!38380 tuple2!25610) (t!51755 List!36841)) )
))
(declare-fun l!1390 () List!36841)

(declare-fun isStrictlySorted!1099 (List!36841) Bool)

(assert (=> start!137524 (= res!1080723 (isStrictlySorted!1099 l!1390))))

(assert (=> start!137524 e!882724))

(declare-fun e!882725 () Bool)

(assert (=> start!137524 e!882725))

(assert (=> start!137524 true))

(declare-fun tp_is_empty!39263 () Bool)

(assert (=> start!137524 tp_is_empty!39263))

(declare-fun b!1581890 () Bool)

(declare-fun res!1080722 () Bool)

(assert (=> b!1581890 (=> (not res!1080722) (not e!882724))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!945 (List!36841 (_ BitVec 64)) Bool)

(assert (=> b!1581890 (= res!1080722 (containsKey!945 l!1390 key!405))))

(declare-fun b!1581891 () Bool)

(assert (=> b!1581891 (= e!882724 false)))

(declare-fun lt!677034 () Bool)

(declare-fun value!194 () B!2718)

(declare-fun contains!10513 (List!36841 tuple2!25610) Bool)

(assert (=> b!1581891 (= lt!677034 (contains!10513 l!1390 (tuple2!25611 key!405 value!194)))))

(declare-fun b!1581892 () Bool)

(declare-fun tp!114629 () Bool)

(assert (=> b!1581892 (= e!882725 (and tp_is_empty!39263 tp!114629))))

(assert (= (and start!137524 res!1080723) b!1581890))

(assert (= (and b!1581890 res!1080722) b!1581891))

(assert (= (and start!137524 (is-Cons!36837 l!1390)) b!1581892))

(declare-fun m!1452653 () Bool)

(assert (=> start!137524 m!1452653))

(declare-fun m!1452655 () Bool)

(assert (=> b!1581890 m!1452655))

(declare-fun m!1452657 () Bool)

(assert (=> b!1581891 m!1452657))

(push 1)

(assert (not b!1581892))

(assert (not start!137524))

(assert (not b!1581890))

(assert tp_is_empty!39263)

(assert (not b!1581891))

(check-sat)

