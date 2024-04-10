; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95248 () Bool)

(assert start!95248)

(assert (=> start!95248 false))

(assert (=> start!95248 true))

(declare-datatypes ((B!1754 0))(
  ( (B!1755 (val!13080 Int)) )
))
(declare-datatypes ((tuple2!16670 0))(
  ( (tuple2!16671 (_1!8346 (_ BitVec 64)) (_2!8346 B!1754)) )
))
(declare-datatypes ((List!23202 0))(
  ( (Nil!23199) (Cons!23198 (h!24407 tuple2!16670) (t!32561 List!23202)) )
))
(declare-datatypes ((ListLongMap!14639 0))(
  ( (ListLongMap!14640 (toList!7335 List!23202)) )
))
(declare-fun lm!214 () ListLongMap!14639)

(declare-fun e!615444 () Bool)

(declare-fun inv!37837 (ListLongMap!14639) Bool)

(assert (=> start!95248 (and (inv!37837 lm!214) e!615444)))

(declare-fun b!1076617 () Bool)

(declare-fun tp!78242 () Bool)

(assert (=> b!1076617 (= e!615444 tp!78242)))

(assert (= start!95248 b!1076617))

(declare-fun m!995623 () Bool)

(assert (=> start!95248 m!995623))

(push 1)

(assert (not start!95248))

(assert (not b!1076617))

(check-sat)

(pop 1)

