; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95258 () Bool)

(assert start!95258)

(assert (=> start!95258 false))

(assert (=> start!95258 true))

(declare-datatypes ((B!1764 0))(
  ( (B!1765 (val!13085 Int)) )
))
(declare-datatypes ((tuple2!16680 0))(
  ( (tuple2!16681 (_1!8351 (_ BitVec 64)) (_2!8351 B!1764)) )
))
(declare-datatypes ((List!23207 0))(
  ( (Nil!23204) (Cons!23203 (h!24412 tuple2!16680) (t!32566 List!23207)) )
))
(declare-datatypes ((ListLongMap!14649 0))(
  ( (ListLongMap!14650 (toList!7340 List!23207)) )
))
(declare-fun lm!214 () ListLongMap!14649)

(declare-fun e!615459 () Bool)

(declare-fun inv!37847 (ListLongMap!14649) Bool)

(assert (=> start!95258 (and (inv!37847 lm!214) e!615459)))

(declare-fun b!1076632 () Bool)

(declare-fun tp!78257 () Bool)

(assert (=> b!1076632 (= e!615459 tp!78257)))

(assert (= start!95258 b!1076632))

(declare-fun m!995633 () Bool)

(assert (=> start!95258 m!995633))

(push 1)

(assert (not start!95258))

(assert (not b!1076632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

