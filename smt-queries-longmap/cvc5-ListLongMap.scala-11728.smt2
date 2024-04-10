; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137514 () Bool)

(assert start!137514)

(declare-fun res!1080692 () Bool)

(declare-fun e!882695 () Bool)

(assert (=> start!137514 (=> (not res!1080692) (not e!882695))))

(declare-datatypes ((B!2708 0))(
  ( (B!2709 (val!19716 Int)) )
))
(declare-datatypes ((tuple2!25600 0))(
  ( (tuple2!25601 (_1!12811 (_ BitVec 64)) (_2!12811 B!2708)) )
))
(declare-datatypes ((List!36836 0))(
  ( (Nil!36833) (Cons!36832 (h!38375 tuple2!25600) (t!51750 List!36836)) )
))
(declare-fun l!1390 () List!36836)

(declare-fun isStrictlySorted!1094 (List!36836) Bool)

(assert (=> start!137514 (= res!1080692 (isStrictlySorted!1094 l!1390))))

(assert (=> start!137514 e!882695))

(declare-fun e!882694 () Bool)

(assert (=> start!137514 e!882694))

(assert (=> start!137514 true))

(declare-fun tp_is_empty!39253 () Bool)

(assert (=> start!137514 tp_is_empty!39253))

(declare-fun b!1581845 () Bool)

(declare-fun res!1080693 () Bool)

(assert (=> b!1581845 (=> (not res!1080693) (not e!882695))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!940 (List!36836 (_ BitVec 64)) Bool)

(assert (=> b!1581845 (= res!1080693 (containsKey!940 l!1390 key!405))))

(declare-fun b!1581846 () Bool)

(assert (=> b!1581846 (= e!882695 false)))

(declare-fun lt!677019 () Bool)

(declare-fun value!194 () B!2708)

(declare-fun contains!10508 (List!36836 tuple2!25600) Bool)

(assert (=> b!1581846 (= lt!677019 (contains!10508 l!1390 (tuple2!25601 key!405 value!194)))))

(declare-fun b!1581847 () Bool)

(declare-fun tp!114614 () Bool)

(assert (=> b!1581847 (= e!882694 (and tp_is_empty!39253 tp!114614))))

(assert (= (and start!137514 res!1080692) b!1581845))

(assert (= (and b!1581845 res!1080693) b!1581846))

(assert (= (and start!137514 (is-Cons!36832 l!1390)) b!1581847))

(declare-fun m!1452623 () Bool)

(assert (=> start!137514 m!1452623))

(declare-fun m!1452625 () Bool)

(assert (=> b!1581845 m!1452625))

(declare-fun m!1452627 () Bool)

(assert (=> b!1581846 m!1452627))

(push 1)

(assert (not b!1581845))

(assert tp_is_empty!39253)

(assert (not b!1581847))

(assert (not b!1581846))

(assert (not start!137514))

(check-sat)

