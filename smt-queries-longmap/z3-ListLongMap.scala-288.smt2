; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4718 () Bool)

(assert start!4718)

(declare-fun b_free!1315 () Bool)

(declare-fun b_next!1315 () Bool)

(assert (=> start!4718 (= b_free!1315 (not b_next!1315))))

(declare-fun tp!5408 () Bool)

(declare-fun b_and!2161 () Bool)

(assert (=> start!4718 (= tp!5408 b_and!2161)))

(declare-fun res!22144 () Bool)

(declare-fun e!23085 () Bool)

(assert (=> start!4718 (=> (not res!22144) (not e!23085))))

(declare-datatypes ((B!722 0))(
  ( (B!723 (val!861 Int)) )
))
(declare-datatypes ((tuple2!1386 0))(
  ( (tuple2!1387 (_1!704 (_ BitVec 64)) (_2!704 B!722)) )
))
(declare-datatypes ((List!958 0))(
  ( (Nil!955) (Cons!954 (h!1522 tuple2!1386) (t!3682 List!958)) )
))
(declare-datatypes ((ListLongMap!951 0))(
  ( (ListLongMap!952 (toList!491 List!958)) )
))
(declare-fun lm!252 () ListLongMap!951)

(declare-fun p!304 () Int)

(declare-fun forall!161 (List!958 Int) Bool)

(assert (=> start!4718 (= res!22144 (forall!161 (toList!491 lm!252) p!304))))

(assert (=> start!4718 e!23085))

(declare-fun e!23084 () Bool)

(declare-fun inv!1606 (ListLongMap!951) Bool)

(assert (=> start!4718 (and (inv!1606 lm!252) e!23084)))

(assert (=> start!4718 tp!5408))

(assert (=> start!4718 true))

(declare-fun b!36561 () Bool)

(assert (=> b!36561 (= e!23085 false)))

(declare-fun lt!13535 () Bool)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!443 (ListLongMap!951 (_ BitVec 64)) Bool)

(assert (=> b!36561 (= lt!13535 (contains!443 lm!252 k0!388))))

(declare-fun b!36562 () Bool)

(declare-fun tp!5407 () Bool)

(assert (=> b!36562 (= e!23084 tp!5407)))

(assert (= (and start!4718 res!22144) b!36561))

(assert (= start!4718 b!36562))

(declare-fun m!29441 () Bool)

(assert (=> start!4718 m!29441))

(declare-fun m!29443 () Bool)

(assert (=> start!4718 m!29443))

(declare-fun m!29445 () Bool)

(assert (=> b!36561 m!29445))

(check-sat b_and!2161 (not start!4718) (not b!36561) (not b!36562) (not b_next!1315))
(check-sat b_and!2161 (not b_next!1315))
