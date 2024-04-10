; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5164 () Bool)

(assert start!5164)

(declare-fun res!22815 () Bool)

(declare-fun e!23970 () Bool)

(assert (=> start!5164 (=> (not res!22815) (not e!23970))))

(declare-datatypes ((B!770 0))(
  ( (B!771 (val!885 Int)) )
))
(declare-fun b!99 () B!770)

(declare-datatypes ((tuple2!1430 0))(
  ( (tuple2!1431 (_1!726 (_ BitVec 64)) (_2!726 B!770)) )
))
(declare-datatypes ((List!995 0))(
  ( (Nil!992) (Cons!991 (h!1559 tuple2!1430) (t!3828 List!995)) )
))
(declare-datatypes ((ListLongMap!1007 0))(
  ( (ListLongMap!1008 (toList!519 List!995)) )
))
(declare-fun lm!264 () ListLongMap!1007)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!470 (List!995 tuple2!1430) Bool)

(assert (=> start!5164 (= res!22815 (contains!470 (toList!519 lm!264) (tuple2!1431 a!526 b!99)))))

(assert (=> start!5164 e!23970))

(declare-fun e!23971 () Bool)

(declare-fun inv!1675 (ListLongMap!1007) Bool)

(assert (=> start!5164 (and (inv!1675 lm!264) e!23971)))

(assert (=> start!5164 true))

(declare-fun tp_is_empty!1693 () Bool)

(assert (=> start!5164 tp_is_empty!1693))

(declare-fun b!37812 () Bool)

(assert (=> b!37812 (= e!23970 (not true))))

(declare-fun containsKey!57 (List!995 (_ BitVec 64)) Bool)

(assert (=> b!37812 (containsKey!57 (toList!519 lm!264) a!526)))

(declare-datatypes ((Unit!869 0))(
  ( (Unit!870) )
))
(declare-fun lt!13919 () Unit!869)

(declare-fun lemmaContainsTupleThenContainsKey!1 (List!995 (_ BitVec 64) B!770) Unit!869)

(assert (=> b!37812 (= lt!13919 (lemmaContainsTupleThenContainsKey!1 (toList!519 lm!264) a!526 b!99))))

(declare-fun b!37813 () Bool)

(declare-fun tp!5597 () Bool)

(assert (=> b!37813 (= e!23971 tp!5597)))

(assert (= (and start!5164 res!22815) b!37812))

(assert (= start!5164 b!37813))

(declare-fun m!30535 () Bool)

(assert (=> start!5164 m!30535))

(declare-fun m!30537 () Bool)

(assert (=> start!5164 m!30537))

(declare-fun m!30539 () Bool)

(assert (=> b!37812 m!30539))

(declare-fun m!30541 () Bool)

(assert (=> b!37812 m!30541))

(push 1)

(assert (not b!37812))

(assert (not start!5164))

(assert (not b!37813))

(assert tp_is_empty!1693)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

