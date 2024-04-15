; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5162 () Bool)

(assert start!5162)

(declare-fun res!22798 () Bool)

(declare-fun e!23943 () Bool)

(assert (=> start!5162 (=> (not res!22798) (not e!23943))))

(declare-datatypes ((B!770 0))(
  ( (B!771 (val!885 Int)) )
))
(declare-fun b!99 () B!770)

(declare-datatypes ((tuple2!1434 0))(
  ( (tuple2!1435 (_1!728 (_ BitVec 64)) (_2!728 B!770)) )
))
(declare-datatypes ((List!988 0))(
  ( (Nil!985) (Cons!984 (h!1552 tuple2!1434) (t!3820 List!988)) )
))
(declare-datatypes ((ListLongMap!999 0))(
  ( (ListLongMap!1000 (toList!515 List!988)) )
))
(declare-fun lm!264 () ListLongMap!999)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!467 (List!988 tuple2!1434) Bool)

(assert (=> start!5162 (= res!22798 (contains!467 (toList!515 lm!264) (tuple2!1435 a!526 b!99)))))

(assert (=> start!5162 e!23943))

(declare-fun e!23942 () Bool)

(declare-fun inv!1675 (ListLongMap!999) Bool)

(assert (=> start!5162 (and (inv!1675 lm!264) e!23942)))

(assert (=> start!5162 true))

(declare-fun tp_is_empty!1693 () Bool)

(assert (=> start!5162 tp_is_empty!1693))

(declare-fun b!37773 () Bool)

(assert (=> b!37773 (= e!23943 (not true))))

(declare-fun containsKey!56 (List!988 (_ BitVec 64)) Bool)

(assert (=> b!37773 (containsKey!56 (toList!515 lm!264) a!526)))

(declare-datatypes ((Unit!872 0))(
  ( (Unit!873) )
))
(declare-fun lt!13916 () Unit!872)

(declare-fun lemmaContainsTupleThenContainsKey!1 (List!988 (_ BitVec 64) B!770) Unit!872)

(assert (=> b!37773 (= lt!13916 (lemmaContainsTupleThenContainsKey!1 (toList!515 lm!264) a!526 b!99))))

(declare-fun b!37774 () Bool)

(declare-fun tp!5597 () Bool)

(assert (=> b!37774 (= e!23942 tp!5597)))

(assert (= (and start!5162 res!22798) b!37773))

(assert (= start!5162 b!37774))

(declare-fun m!30491 () Bool)

(assert (=> start!5162 m!30491))

(declare-fun m!30493 () Bool)

(assert (=> start!5162 m!30493))

(declare-fun m!30495 () Bool)

(assert (=> b!37773 m!30495))

(declare-fun m!30497 () Bool)

(assert (=> b!37773 m!30497))

(check-sat (not start!5162) (not b!37773) (not b!37774) tp_is_empty!1693)
(check-sat)
