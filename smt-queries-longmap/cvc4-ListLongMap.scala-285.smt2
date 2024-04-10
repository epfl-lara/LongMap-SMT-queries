; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4714 () Bool)

(assert start!4714)

(declare-fun b_free!1301 () Bool)

(declare-fun b_next!1301 () Bool)

(assert (=> start!4714 (= b_free!1301 (not b_next!1301))))

(declare-fun tp!5365 () Bool)

(declare-fun b_and!2147 () Bool)

(assert (=> start!4714 (= tp!5365 b_and!2147)))

(declare-fun res!22074 () Bool)

(declare-fun e!23067 () Bool)

(assert (=> start!4714 (=> (not res!22074) (not e!23067))))

(declare-datatypes ((B!708 0))(
  ( (B!709 (val!854 Int)) )
))
(declare-datatypes ((tuple2!1368 0))(
  ( (tuple2!1369 (_1!695 (_ BitVec 64)) (_2!695 B!708)) )
))
(declare-datatypes ((List!958 0))(
  ( (Nil!955) (Cons!954 (h!1522 tuple2!1368) (t!3683 List!958)) )
))
(declare-datatypes ((ListLongMap!945 0))(
  ( (ListLongMap!946 (toList!488 List!958)) )
))
(declare-fun lm!252 () ListLongMap!945)

(declare-fun p!304 () Int)

(declare-fun forall!154 (List!958 Int) Bool)

(assert (=> start!4714 (= res!22074 (forall!154 (toList!488 lm!252) p!304))))

(assert (=> start!4714 e!23067))

(declare-fun e!23068 () Bool)

(declare-fun inv!1584 (ListLongMap!945) Bool)

(assert (=> start!4714 (and (inv!1584 lm!252) e!23068)))

(assert (=> start!4714 tp!5365))

(assert (=> start!4714 true))

(declare-fun b!36492 () Bool)

(assert (=> b!36492 (= e!23067 false)))

(declare-fun lt!13500 () Bool)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!439 (ListLongMap!945 (_ BitVec 64)) Bool)

(assert (=> b!36492 (= lt!13500 (contains!439 lm!252 k!388))))

(declare-fun b!36493 () Bool)

(declare-fun tp!5366 () Bool)

(assert (=> b!36493 (= e!23068 tp!5366)))

(assert (= (and start!4714 res!22074) b!36492))

(assert (= start!4714 b!36493))

(declare-fun m!29391 () Bool)

(assert (=> start!4714 m!29391))

(declare-fun m!29393 () Bool)

(assert (=> start!4714 m!29393))

(declare-fun m!29395 () Bool)

(assert (=> b!36492 m!29395))

(push 1)

(assert (not b_next!1301))

(assert (not start!4714))

(assert (not b!36493))

(assert b_and!2147)

(assert (not b!36492))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2147)

