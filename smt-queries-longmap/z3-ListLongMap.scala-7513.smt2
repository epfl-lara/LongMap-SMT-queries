; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95256 () Bool)

(assert start!95256)

(assert (=> start!95256 false))

(assert (=> start!95256 true))

(declare-datatypes ((B!1762 0))(
  ( (B!1763 (val!13084 Int)) )
))
(declare-datatypes ((tuple2!16678 0))(
  ( (tuple2!16679 (_1!8350 (_ BitVec 64)) (_2!8350 B!1762)) )
))
(declare-datatypes ((List!23206 0))(
  ( (Nil!23203) (Cons!23202 (h!24411 tuple2!16678) (t!32565 List!23206)) )
))
(declare-datatypes ((ListLongMap!14647 0))(
  ( (ListLongMap!14648 (toList!7339 List!23206)) )
))
(declare-fun lm!214 () ListLongMap!14647)

(declare-fun e!615456 () Bool)

(declare-fun inv!37846 (ListLongMap!14647) Bool)

(assert (=> start!95256 (and (inv!37846 lm!214) e!615456)))

(declare-fun b!1076629 () Bool)

(declare-fun tp!78254 () Bool)

(assert (=> b!1076629 (= e!615456 tp!78254)))

(assert (= start!95256 b!1076629))

(declare-fun m!995631 () Bool)

(assert (=> start!95256 m!995631))

(check-sat (not start!95256) (not b!1076629))
(check-sat)
