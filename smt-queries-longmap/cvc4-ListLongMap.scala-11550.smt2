; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134460 () Bool)

(assert start!134460)

(declare-fun b!1569741 () Bool)

(declare-fun res!1072740 () Bool)

(declare-fun e!875092 () Bool)

(assert (=> b!1569741 (=> (not res!1072740) (not e!875092))))

(declare-datatypes ((B!2538 0))(
  ( (B!2539 (val!19631 Int)) )
))
(declare-datatypes ((tuple2!25364 0))(
  ( (tuple2!25365 (_1!12693 (_ BitVec 64)) (_2!12693 B!2538)) )
))
(declare-datatypes ((List!36751 0))(
  ( (Nil!36748) (Cons!36747 (h!38194 tuple2!25364) (t!51659 List!36751)) )
))
(declare-fun l!750 () List!36751)

(declare-fun isStrictlySorted!1015 (List!36751) Bool)

(assert (=> b!1569741 (= res!1072740 (isStrictlySorted!1015 l!750))))

(declare-fun b!1569744 () Bool)

(declare-fun e!875093 () Bool)

(declare-fun tp_is_empty!39089 () Bool)

(declare-fun tp!114180 () Bool)

(assert (=> b!1569744 (= e!875093 (and tp_is_empty!39089 tp!114180))))

(declare-fun res!1072738 () Bool)

(assert (=> start!134460 (=> (not res!1072738) (not e!875092))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134460 (= res!1072738 (not (= key1!37 key2!21)))))

(assert (=> start!134460 e!875092))

(assert (=> start!134460 true))

(assert (=> start!134460 e!875093))

(declare-fun b!1569743 () Bool)

(assert (=> b!1569743 (= e!875092 (not (isStrictlySorted!1015 (t!51659 l!750))))))

(declare-fun b!1569742 () Bool)

(declare-fun res!1072739 () Bool)

(assert (=> b!1569742 (=> (not res!1072739) (not e!875092))))

(assert (=> b!1569742 (= res!1072739 (and (is-Cons!36747 l!750) (bvslt (_1!12693 (h!38194 l!750)) key1!37) (bvslt (_1!12693 (h!38194 l!750)) key2!21)))))

(assert (= (and start!134460 res!1072738) b!1569741))

(assert (= (and b!1569741 res!1072740) b!1569742))

(assert (= (and b!1569742 res!1072739) b!1569743))

(assert (= (and start!134460 (is-Cons!36747 l!750)) b!1569744))

(declare-fun m!1443891 () Bool)

(assert (=> b!1569741 m!1443891))

(declare-fun m!1443893 () Bool)

(assert (=> b!1569743 m!1443893))

(push 1)

(assert (not b!1569743))

(assert (not b!1569741))

(assert (not b!1569744))

(assert tp_is_empty!39089)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163941 () Bool)

(declare-fun res!1072761 () Bool)

(declare-fun e!875120 () Bool)

(assert (=> d!163941 (=> res!1072761 e!875120)))

(assert (=> d!163941 (= res!1072761 (or (is-Nil!36748 (t!51659 l!750)) (is-Nil!36748 (t!51659 (t!51659 l!750)))))))

(assert (=> d!163941 (= (isStrictlySorted!1015 (t!51659 l!750)) e!875120)))

(declare-fun b!1569775 () Bool)

(declare-fun e!875121 () Bool)

(assert (=> b!1569775 (= e!875120 e!875121)))

