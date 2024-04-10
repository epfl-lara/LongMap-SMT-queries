; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137682 () Bool)

(assert start!137682)

(assert (=> start!137682 false))

(declare-datatypes ((B!2774 0))(
  ( (B!2775 (val!19749 Int)) )
))
(declare-datatypes ((tuple2!25666 0))(
  ( (tuple2!25667 (_1!12844 (_ BitVec 64)) (_2!12844 B!2774)) )
))
(declare-datatypes ((List!36869 0))(
  ( (Nil!36866) (Cons!36865 (h!38408 tuple2!25666) (t!51783 List!36869)) )
))
(declare-datatypes ((ListLongMap!22777 0))(
  ( (ListLongMap!22778 (toList!11404 List!36869)) )
))
(declare-fun thiss!185 () ListLongMap!22777)

(declare-fun e!883193 () Bool)

(declare-fun inv!59119 (ListLongMap!22777) Bool)

(assert (=> start!137682 (and (inv!59119 thiss!185) e!883193)))

(assert (=> start!137682 true))

(declare-fun b!1582498 () Bool)

(declare-fun tp!114767 () Bool)

(assert (=> b!1582498 (= e!883193 tp!114767)))

(assert (= start!137682 b!1582498))

(declare-fun m!1452899 () Bool)

(assert (=> start!137682 m!1452899))

(push 1)

(assert (not start!137682))

(assert (not b!1582498))

(check-sat)

