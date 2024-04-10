; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95252 () Bool)

(assert start!95252)

(assert (=> start!95252 false))

(assert (=> start!95252 true))

(declare-datatypes ((B!1758 0))(
  ( (B!1759 (val!13082 Int)) )
))
(declare-datatypes ((tuple2!16674 0))(
  ( (tuple2!16675 (_1!8348 (_ BitVec 64)) (_2!8348 B!1758)) )
))
(declare-datatypes ((List!23204 0))(
  ( (Nil!23201) (Cons!23200 (h!24409 tuple2!16674) (t!32563 List!23204)) )
))
(declare-datatypes ((ListLongMap!14643 0))(
  ( (ListLongMap!14644 (toList!7337 List!23204)) )
))
(declare-fun lm!214 () ListLongMap!14643)

(declare-fun e!615450 () Bool)

(declare-fun inv!37839 (ListLongMap!14643) Bool)

(assert (=> start!95252 (and (inv!37839 lm!214) e!615450)))

(declare-fun b!1076623 () Bool)

(declare-fun tp!78248 () Bool)

(assert (=> b!1076623 (= e!615450 tp!78248)))

(assert (= start!95252 b!1076623))

(declare-fun m!995627 () Bool)

(assert (=> start!95252 m!995627))

(push 1)

(assert (not start!95252))

(assert (not b!1076623))

(check-sat)

(pop 1)

