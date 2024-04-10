; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95254 () Bool)

(assert start!95254)

(assert (=> start!95254 false))

(assert (=> start!95254 true))

(declare-datatypes ((B!1760 0))(
  ( (B!1761 (val!13083 Int)) )
))
(declare-datatypes ((tuple2!16676 0))(
  ( (tuple2!16677 (_1!8349 (_ BitVec 64)) (_2!8349 B!1760)) )
))
(declare-datatypes ((List!23205 0))(
  ( (Nil!23202) (Cons!23201 (h!24410 tuple2!16676) (t!32564 List!23205)) )
))
(declare-datatypes ((ListLongMap!14645 0))(
  ( (ListLongMap!14646 (toList!7338 List!23205)) )
))
(declare-fun lm!214 () ListLongMap!14645)

(declare-fun e!615453 () Bool)

(declare-fun inv!37845 (ListLongMap!14645) Bool)

(assert (=> start!95254 (and (inv!37845 lm!214) e!615453)))

(declare-fun b!1076626 () Bool)

(declare-fun tp!78251 () Bool)

(assert (=> b!1076626 (= e!615453 tp!78251)))

(assert (= start!95254 b!1076626))

(declare-fun m!995629 () Bool)

(assert (=> start!95254 m!995629))

(push 1)

(assert (not start!95254))

(assert (not b!1076626))

(check-sat)

(pop 1)

