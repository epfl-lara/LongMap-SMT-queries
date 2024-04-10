; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95250 () Bool)

(assert start!95250)

(assert (=> start!95250 false))

(assert (=> start!95250 true))

(declare-datatypes ((B!1756 0))(
  ( (B!1757 (val!13081 Int)) )
))
(declare-datatypes ((tuple2!16672 0))(
  ( (tuple2!16673 (_1!8347 (_ BitVec 64)) (_2!8347 B!1756)) )
))
(declare-datatypes ((List!23203 0))(
  ( (Nil!23200) (Cons!23199 (h!24408 tuple2!16672) (t!32562 List!23203)) )
))
(declare-datatypes ((ListLongMap!14641 0))(
  ( (ListLongMap!14642 (toList!7336 List!23203)) )
))
(declare-fun lm!214 () ListLongMap!14641)

(declare-fun e!615447 () Bool)

(declare-fun inv!37838 (ListLongMap!14641) Bool)

(assert (=> start!95250 (and (inv!37838 lm!214) e!615447)))

(declare-fun b!1076620 () Bool)

(declare-fun tp!78245 () Bool)

(assert (=> b!1076620 (= e!615447 tp!78245)))

(assert (= start!95250 b!1076620))

(declare-fun m!995625 () Bool)

(assert (=> start!95250 m!995625))

(check-sat (not start!95250) (not b!1076620))
(check-sat)
