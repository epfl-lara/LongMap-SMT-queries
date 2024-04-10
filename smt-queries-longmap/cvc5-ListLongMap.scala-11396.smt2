; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132680 () Bool)

(assert start!132680)

(assert (=> start!132680 false))

(declare-fun e!865787 () Bool)

(assert (=> start!132680 e!865787))

(assert (=> start!132680 true))

(declare-fun b!1554782 () Bool)

(declare-fun tp_is_empty!38263 () Bool)

(declare-fun tp!112218 () Bool)

(assert (=> b!1554782 (= e!865787 (and tp_is_empty!38263 tp!112218))))

(declare-datatypes ((B!2252 0))(
  ( (B!2253 (val!19212 Int)) )
))
(declare-datatypes ((tuple2!24800 0))(
  ( (tuple2!24801 (_1!12411 (_ BitVec 64)) (_2!12411 B!2252)) )
))
(declare-datatypes ((List!36246 0))(
  ( (Nil!36243) (Cons!36242 (h!37688 tuple2!24800) (t!50967 List!36246)) )
))
(declare-fun l!1177 () List!36246)

(assert (= (and start!132680 (is-Cons!36242 l!1177)) b!1554782))

(push 1)

(assert (not b!1554782))

(assert tp_is_empty!38263)

(check-sat)

(pop 1)

