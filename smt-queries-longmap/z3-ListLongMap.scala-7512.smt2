; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95242 () Bool)

(assert start!95242)

(assert (=> start!95242 false))

(assert (=> start!95242 true))

(declare-datatypes ((B!1754 0))(
  ( (B!1755 (val!13080 Int)) )
))
(declare-datatypes ((tuple2!16738 0))(
  ( (tuple2!16739 (_1!8380 (_ BitVec 64)) (_2!8380 B!1754)) )
))
(declare-datatypes ((List!23253 0))(
  ( (Nil!23250) (Cons!23249 (h!24458 tuple2!16738) (t!32603 List!23253)) )
))
(declare-datatypes ((ListLongMap!14707 0))(
  ( (ListLongMap!14708 (toList!7369 List!23253)) )
))
(declare-fun lm!214 () ListLongMap!14707)

(declare-fun e!615351 () Bool)

(declare-fun inv!37837 (ListLongMap!14707) Bool)

(assert (=> start!95242 (and (inv!37837 lm!214) e!615351)))

(declare-fun b!1076464 () Bool)

(declare-fun tp!78242 () Bool)

(assert (=> b!1076464 (= e!615351 tp!78242)))

(assert (= start!95242 b!1076464))

(declare-fun m!994997 () Bool)

(assert (=> start!95242 m!994997))

(check-sat (not start!95242) (not b!1076464))
(check-sat)
