; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5160 () Bool)

(assert start!5160)

(declare-fun res!22809 () Bool)

(declare-fun e!23958 () Bool)

(assert (=> start!5160 (=> (not res!22809) (not e!23958))))

(declare-datatypes ((B!766 0))(
  ( (B!767 (val!883 Int)) )
))
(declare-fun b!99 () B!766)

(declare-fun a!526 () (_ BitVec 64))

(declare-datatypes ((tuple2!1426 0))(
  ( (tuple2!1427 (_1!724 (_ BitVec 64)) (_2!724 B!766)) )
))
(declare-datatypes ((List!993 0))(
  ( (Nil!990) (Cons!989 (h!1557 tuple2!1426) (t!3826 List!993)) )
))
(declare-datatypes ((ListLongMap!1003 0))(
  ( (ListLongMap!1004 (toList!517 List!993)) )
))
(declare-fun lm!264 () ListLongMap!1003)

(declare-fun contains!468 (List!993 tuple2!1426) Bool)

(assert (=> start!5160 (= res!22809 (contains!468 (toList!517 lm!264) (tuple2!1427 a!526 b!99)))))

(assert (=> start!5160 e!23958))

(declare-fun e!23959 () Bool)

(declare-fun inv!1668 (ListLongMap!1003) Bool)

(assert (=> start!5160 (and (inv!1668 lm!264) e!23959)))

(assert (=> start!5160 true))

(declare-fun tp_is_empty!1689 () Bool)

(assert (=> start!5160 tp_is_empty!1689))

(declare-fun b!37800 () Bool)

(assert (=> b!37800 (= e!23958 false)))

(declare-fun b!37801 () Bool)

(declare-fun tp!5591 () Bool)

(assert (=> b!37801 (= e!23959 tp!5591)))

(assert (= (and start!5160 res!22809) b!37800))

(assert (= start!5160 b!37801))

(declare-fun m!30527 () Bool)

(assert (=> start!5160 m!30527))

(declare-fun m!30529 () Bool)

(assert (=> start!5160 m!30529))

(check-sat (not start!5160) (not b!37801) tp_is_empty!1689)
(check-sat)
