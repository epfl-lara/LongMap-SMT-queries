; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5162 () Bool)

(assert start!5162)

(declare-fun res!22781 () Bool)

(declare-fun e!23915 () Bool)

(assert (=> start!5162 (=> (not res!22781) (not e!23915))))

(declare-datatypes ((B!764 0))(
  ( (B!765 (val!882 Int)) )
))
(declare-fun b!99 () B!764)

(declare-datatypes ((tuple2!1406 0))(
  ( (tuple2!1407 (_1!714 (_ BitVec 64)) (_2!714 B!764)) )
))
(declare-datatypes ((List!978 0))(
  ( (Nil!975) (Cons!974 (h!1542 tuple2!1406) (t!3811 List!978)) )
))
(declare-datatypes ((ListLongMap!977 0))(
  ( (ListLongMap!978 (toList!504 List!978)) )
))
(declare-fun lm!264 () ListLongMap!977)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!457 (List!978 tuple2!1406) Bool)

(assert (=> start!5162 (= res!22781 (contains!457 (toList!504 lm!264) (tuple2!1407 a!526 b!99)))))

(assert (=> start!5162 e!23915))

(declare-fun e!23916 () Bool)

(declare-fun inv!1667 (ListLongMap!977) Bool)

(assert (=> start!5162 (and (inv!1667 lm!264) e!23916)))

(assert (=> start!5162 true))

(declare-fun tp_is_empty!1687 () Bool)

(assert (=> start!5162 tp_is_empty!1687))

(declare-fun b!37737 () Bool)

(assert (=> b!37737 (= e!23915 false)))

(declare-fun b!37738 () Bool)

(declare-fun tp!5588 () Bool)

(assert (=> b!37738 (= e!23916 tp!5588)))

(assert (= (and start!5162 res!22781) b!37737))

(assert (= start!5162 b!37738))

(declare-fun m!30397 () Bool)

(assert (=> start!5162 m!30397))

(declare-fun m!30399 () Bool)

(assert (=> start!5162 m!30399))

(check-sat (not start!5162) (not b!37738) tp_is_empty!1687)
(check-sat)
