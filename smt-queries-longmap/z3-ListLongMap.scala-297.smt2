; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5168 () Bool)

(assert start!5168)

(declare-fun res!22790 () Bool)

(declare-fun e!23933 () Bool)

(assert (=> start!5168 (=> (not res!22790) (not e!23933))))

(declare-datatypes ((B!770 0))(
  ( (B!771 (val!885 Int)) )
))
(declare-fun b!99 () B!770)

(declare-datatypes ((tuple2!1412 0))(
  ( (tuple2!1413 (_1!717 (_ BitVec 64)) (_2!717 B!770)) )
))
(declare-datatypes ((List!981 0))(
  ( (Nil!978) (Cons!977 (h!1545 tuple2!1412) (t!3814 List!981)) )
))
(declare-datatypes ((ListLongMap!983 0))(
  ( (ListLongMap!984 (toList!507 List!981)) )
))
(declare-fun lm!264 () ListLongMap!983)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!460 (List!981 tuple2!1412) Bool)

(assert (=> start!5168 (= res!22790 (contains!460 (toList!507 lm!264) (tuple2!1413 a!526 b!99)))))

(assert (=> start!5168 e!23933))

(declare-fun e!23934 () Bool)

(declare-fun inv!1675 (ListLongMap!983) Bool)

(assert (=> start!5168 (and (inv!1675 lm!264) e!23934)))

(assert (=> start!5168 true))

(declare-fun tp_is_empty!1693 () Bool)

(assert (=> start!5168 tp_is_empty!1693))

(declare-fun b!37755 () Bool)

(assert (=> b!37755 (= e!23933 (not true))))

(declare-fun containsKey!57 (List!981 (_ BitVec 64)) Bool)

(assert (=> b!37755 (containsKey!57 (toList!507 lm!264) a!526)))

(declare-datatypes ((Unit!875 0))(
  ( (Unit!876) )
))
(declare-fun lt!13876 () Unit!875)

(declare-fun lemmaContainsTupleThenContainsKey!1 (List!981 (_ BitVec 64) B!770) Unit!875)

(assert (=> b!37755 (= lt!13876 (lemmaContainsTupleThenContainsKey!1 (toList!507 lm!264) a!526 b!99))))

(declare-fun b!37756 () Bool)

(declare-fun tp!5597 () Bool)

(assert (=> b!37756 (= e!23934 tp!5597)))

(assert (= (and start!5168 res!22790) b!37755))

(assert (= start!5168 b!37756))

(declare-fun m!30409 () Bool)

(assert (=> start!5168 m!30409))

(declare-fun m!30411 () Bool)

(assert (=> start!5168 m!30411))

(declare-fun m!30413 () Bool)

(assert (=> b!37755 m!30413))

(declare-fun m!30415 () Bool)

(assert (=> b!37755 m!30415))

(check-sat (not start!5168) (not b!37755) (not b!37756) tp_is_empty!1693)
(check-sat)
