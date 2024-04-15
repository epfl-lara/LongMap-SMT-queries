; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95248 () Bool)

(assert start!95248)

(assert (=> start!95248 false))

(assert (=> start!95248 true))

(declare-datatypes ((B!1760 0))(
  ( (B!1761 (val!13083 Int)) )
))
(declare-datatypes ((tuple2!16744 0))(
  ( (tuple2!16745 (_1!8383 (_ BitVec 64)) (_2!8383 B!1760)) )
))
(declare-datatypes ((List!23256 0))(
  ( (Nil!23253) (Cons!23252 (h!24461 tuple2!16744) (t!32606 List!23256)) )
))
(declare-datatypes ((ListLongMap!14713 0))(
  ( (ListLongMap!14714 (toList!7372 List!23256)) )
))
(declare-fun lm!214 () ListLongMap!14713)

(declare-fun e!615360 () Bool)

(declare-fun inv!37845 (ListLongMap!14713) Bool)

(assert (=> start!95248 (and (inv!37845 lm!214) e!615360)))

(declare-fun b!1076473 () Bool)

(declare-fun tp!78251 () Bool)

(assert (=> b!1076473 (= e!615360 tp!78251)))

(assert (= start!95248 b!1076473))

(declare-fun m!995003 () Bool)

(assert (=> start!95248 m!995003))

(check-sat (not start!95248) (not b!1076473))
(check-sat)
