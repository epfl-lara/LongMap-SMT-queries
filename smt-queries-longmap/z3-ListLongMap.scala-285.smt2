; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4712 () Bool)

(assert start!4712)

(declare-fun b_free!1299 () Bool)

(declare-fun b_next!1299 () Bool)

(assert (=> start!4712 (= b_free!1299 (not b_next!1299))))

(declare-fun tp!5359 () Bool)

(declare-fun b_and!2145 () Bool)

(assert (=> start!4712 (= tp!5359 b_and!2145)))

(declare-fun res!22071 () Bool)

(declare-fun e!23061 () Bool)

(assert (=> start!4712 (=> (not res!22071) (not e!23061))))

(declare-datatypes ((B!706 0))(
  ( (B!707 (val!853 Int)) )
))
(declare-datatypes ((tuple2!1366 0))(
  ( (tuple2!1367 (_1!694 (_ BitVec 64)) (_2!694 B!706)) )
))
(declare-datatypes ((List!957 0))(
  ( (Nil!954) (Cons!953 (h!1521 tuple2!1366) (t!3682 List!957)) )
))
(declare-datatypes ((ListLongMap!943 0))(
  ( (ListLongMap!944 (toList!487 List!957)) )
))
(declare-fun lm!252 () ListLongMap!943)

(declare-fun p!304 () Int)

(declare-fun forall!153 (List!957 Int) Bool)

(assert (=> start!4712 (= res!22071 (forall!153 (toList!487 lm!252) p!304))))

(assert (=> start!4712 e!23061))

(declare-fun e!23062 () Bool)

(declare-fun inv!1583 (ListLongMap!943) Bool)

(assert (=> start!4712 (and (inv!1583 lm!252) e!23062)))

(assert (=> start!4712 tp!5359))

(assert (=> start!4712 true))

(declare-fun b!36486 () Bool)

(assert (=> b!36486 (= e!23061 false)))

(declare-fun lt!13497 () Bool)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!438 (ListLongMap!943 (_ BitVec 64)) Bool)

(assert (=> b!36486 (= lt!13497 (contains!438 lm!252 k0!388))))

(declare-fun b!36487 () Bool)

(declare-fun tp!5360 () Bool)

(assert (=> b!36487 (= e!23062 tp!5360)))

(assert (= (and start!4712 res!22071) b!36486))

(assert (= start!4712 b!36487))

(declare-fun m!29385 () Bool)

(assert (=> start!4712 m!29385))

(declare-fun m!29387 () Bool)

(assert (=> start!4712 m!29387))

(declare-fun m!29389 () Bool)

(assert (=> b!36486 m!29389))

(check-sat (not start!4712) b_and!2145 (not b_next!1299) (not b!36486) (not b!36487))
(check-sat b_and!2145 (not b_next!1299))
