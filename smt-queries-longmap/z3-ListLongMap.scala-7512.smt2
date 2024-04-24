; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95484 () Bool)

(assert start!95484)

(assert (=> start!95484 false))

(assert (=> start!95484 true))

(declare-datatypes ((B!1754 0))(
  ( (B!1755 (val!13080 Int)) )
))
(declare-datatypes ((tuple2!16662 0))(
  ( (tuple2!16663 (_1!8342 (_ BitVec 64)) (_2!8342 B!1754)) )
))
(declare-datatypes ((List!23210 0))(
  ( (Nil!23207) (Cons!23206 (h!24424 tuple2!16662) (t!32561 List!23210)) )
))
(declare-datatypes ((ListLongMap!14639 0))(
  ( (ListLongMap!14640 (toList!7335 List!23210)) )
))
(declare-fun lm!214 () ListLongMap!14639)

(declare-fun e!616299 () Bool)

(declare-fun inv!37837 (ListLongMap!14639) Bool)

(assert (=> start!95484 (and (inv!37837 lm!214) e!616299)))

(declare-fun b!1077944 () Bool)

(declare-fun tp!78242 () Bool)

(assert (=> b!1077944 (= e!616299 tp!78242)))

(assert (= start!95484 b!1077944))

(declare-fun m!997295 () Bool)

(assert (=> start!95484 m!997295))

(check-sat (not start!95484) (not b!1077944))
(check-sat)
