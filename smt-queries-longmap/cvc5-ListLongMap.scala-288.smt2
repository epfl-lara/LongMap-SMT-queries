; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4728 () Bool)

(assert start!4728)

(declare-fun b_free!1315 () Bool)

(declare-fun b_next!1315 () Bool)

(assert (=> start!4728 (= b_free!1315 (not b_next!1315))))

(declare-fun tp!5407 () Bool)

(declare-fun b_and!2167 () Bool)

(assert (=> start!4728 (= tp!5407 b_and!2167)))

(declare-fun res!22176 () Bool)

(declare-fun e!23127 () Bool)

(assert (=> start!4728 (=> (not res!22176) (not e!23127))))

(declare-datatypes ((B!722 0))(
  ( (B!723 (val!861 Int)) )
))
(declare-datatypes ((tuple2!1382 0))(
  ( (tuple2!1383 (_1!702 (_ BitVec 64)) (_2!702 B!722)) )
))
(declare-datatypes ((List!965 0))(
  ( (Nil!962) (Cons!961 (h!1529 tuple2!1382) (t!3696 List!965)) )
))
(declare-datatypes ((ListLongMap!959 0))(
  ( (ListLongMap!960 (toList!495 List!965)) )
))
(declare-fun lm!252 () ListLongMap!959)

(declare-fun p!304 () Int)

(declare-fun forall!161 (List!965 Int) Bool)

(assert (=> start!4728 (= res!22176 (forall!161 (toList!495 lm!252) p!304))))

(assert (=> start!4728 e!23127))

(declare-fun e!23128 () Bool)

(declare-fun inv!1606 (ListLongMap!959) Bool)

(assert (=> start!4728 (and (inv!1606 lm!252) e!23128)))

(assert (=> start!4728 tp!5407))

(assert (=> start!4728 true))

(declare-fun b!36615 () Bool)

(assert (=> b!36615 (= e!23127 false)))

(declare-fun lt!13539 () Bool)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!446 (ListLongMap!959 (_ BitVec 64)) Bool)

(assert (=> b!36615 (= lt!13539 (contains!446 lm!252 k!388))))

(declare-fun b!36616 () Bool)

(declare-fun tp!5408 () Bool)

(assert (=> b!36616 (= e!23128 tp!5408)))

(assert (= (and start!4728 res!22176) b!36615))

(assert (= start!4728 b!36616))

(declare-fun m!29511 () Bool)

(assert (=> start!4728 m!29511))

(declare-fun m!29513 () Bool)

(assert (=> start!4728 m!29513))

(declare-fun m!29515 () Bool)

(assert (=> b!36615 m!29515))

(push 1)

(assert b_and!2167)

(assert (not b_next!1315))

(assert (not start!4728))

(assert (not b!36615))

(assert (not b!36616))

(check-sat)

