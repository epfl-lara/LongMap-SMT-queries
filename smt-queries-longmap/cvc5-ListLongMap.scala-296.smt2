; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5158 () Bool)

(assert start!5158)

(declare-fun res!22806 () Bool)

(declare-fun e!23952 () Bool)

(assert (=> start!5158 (=> (not res!22806) (not e!23952))))

(declare-datatypes ((B!764 0))(
  ( (B!765 (val!882 Int)) )
))
(declare-fun b!99 () B!764)

(declare-datatypes ((tuple2!1424 0))(
  ( (tuple2!1425 (_1!723 (_ BitVec 64)) (_2!723 B!764)) )
))
(declare-datatypes ((List!992 0))(
  ( (Nil!989) (Cons!988 (h!1556 tuple2!1424) (t!3825 List!992)) )
))
(declare-datatypes ((ListLongMap!1001 0))(
  ( (ListLongMap!1002 (toList!516 List!992)) )
))
(declare-fun lm!264 () ListLongMap!1001)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!467 (List!992 tuple2!1424) Bool)

(assert (=> start!5158 (= res!22806 (contains!467 (toList!516 lm!264) (tuple2!1425 a!526 b!99)))))

(assert (=> start!5158 e!23952))

(declare-fun e!23953 () Bool)

(declare-fun inv!1667 (ListLongMap!1001) Bool)

(assert (=> start!5158 (and (inv!1667 lm!264) e!23953)))

(assert (=> start!5158 true))

(declare-fun tp_is_empty!1687 () Bool)

(assert (=> start!5158 tp_is_empty!1687))

(declare-fun b!37794 () Bool)

(assert (=> b!37794 (= e!23952 false)))

(declare-fun b!37795 () Bool)

(declare-fun tp!5588 () Bool)

(assert (=> b!37795 (= e!23953 tp!5588)))

(assert (= (and start!5158 res!22806) b!37794))

(assert (= start!5158 b!37795))

(declare-fun m!30523 () Bool)

(assert (=> start!5158 m!30523))

(declare-fun m!30525 () Bool)

(assert (=> start!5158 m!30525))

(push 1)

(assert (not start!5158))

(assert (not b!37795))

(assert tp_is_empty!1687)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

