; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5162 () Bool)

(assert start!5162)

(declare-fun res!22812 () Bool)

(declare-fun e!23964 () Bool)

(assert (=> start!5162 (=> (not res!22812) (not e!23964))))

(declare-datatypes ((B!768 0))(
  ( (B!769 (val!884 Int)) )
))
(declare-fun b!99 () B!768)

(declare-datatypes ((tuple2!1428 0))(
  ( (tuple2!1429 (_1!725 (_ BitVec 64)) (_2!725 B!768)) )
))
(declare-datatypes ((List!994 0))(
  ( (Nil!991) (Cons!990 (h!1558 tuple2!1428) (t!3827 List!994)) )
))
(declare-datatypes ((ListLongMap!1005 0))(
  ( (ListLongMap!1006 (toList!518 List!994)) )
))
(declare-fun lm!264 () ListLongMap!1005)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!469 (List!994 tuple2!1428) Bool)

(assert (=> start!5162 (= res!22812 (contains!469 (toList!518 lm!264) (tuple2!1429 a!526 b!99)))))

(assert (=> start!5162 e!23964))

(declare-fun e!23965 () Bool)

(declare-fun inv!1669 (ListLongMap!1005) Bool)

(assert (=> start!5162 (and (inv!1669 lm!264) e!23965)))

(assert (=> start!5162 true))

(declare-fun tp_is_empty!1691 () Bool)

(assert (=> start!5162 tp_is_empty!1691))

(declare-fun b!37806 () Bool)

(assert (=> b!37806 (= e!23964 false)))

(declare-fun b!37807 () Bool)

(declare-fun tp!5594 () Bool)

(assert (=> b!37807 (= e!23965 tp!5594)))

(assert (= (and start!5162 res!22812) b!37806))

(assert (= start!5162 b!37807))

(declare-fun m!30531 () Bool)

(assert (=> start!5162 m!30531))

(declare-fun m!30533 () Bool)

(assert (=> start!5162 m!30533))

(push 1)

(assert (not start!5162))

(assert (not b!37807))

(assert tp_is_empty!1691)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

