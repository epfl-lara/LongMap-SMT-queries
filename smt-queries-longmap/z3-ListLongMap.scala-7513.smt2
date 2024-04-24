; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95490 () Bool)

(assert start!95490)

(assert (=> start!95490 false))

(assert (=> start!95490 true))

(declare-datatypes ((B!1760 0))(
  ( (B!1761 (val!13083 Int)) )
))
(declare-datatypes ((tuple2!16668 0))(
  ( (tuple2!16669 (_1!8345 (_ BitVec 64)) (_2!8345 B!1760)) )
))
(declare-datatypes ((List!23213 0))(
  ( (Nil!23210) (Cons!23209 (h!24427 tuple2!16668) (t!32564 List!23213)) )
))
(declare-datatypes ((ListLongMap!14645 0))(
  ( (ListLongMap!14646 (toList!7338 List!23213)) )
))
(declare-fun lm!214 () ListLongMap!14645)

(declare-fun e!616308 () Bool)

(declare-fun inv!37845 (ListLongMap!14645) Bool)

(assert (=> start!95490 (and (inv!37845 lm!214) e!616308)))

(declare-fun b!1077953 () Bool)

(declare-fun tp!78251 () Bool)

(assert (=> b!1077953 (= e!616308 tp!78251)))

(assert (= start!95490 b!1077953))

(declare-fun m!997301 () Bool)

(assert (=> start!95490 m!997301))

(check-sat (not start!95490) (not b!1077953))
(check-sat)
