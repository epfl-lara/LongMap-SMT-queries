; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5156 () Bool)

(assert start!5156)

(declare-fun res!22789 () Bool)

(declare-fun e!23924 () Bool)

(assert (=> start!5156 (=> (not res!22789) (not e!23924))))

(declare-datatypes ((B!764 0))(
  ( (B!765 (val!882 Int)) )
))
(declare-fun b!99 () B!764)

(declare-datatypes ((tuple2!1428 0))(
  ( (tuple2!1429 (_1!725 (_ BitVec 64)) (_2!725 B!764)) )
))
(declare-datatypes ((List!985 0))(
  ( (Nil!982) (Cons!981 (h!1549 tuple2!1428) (t!3817 List!985)) )
))
(declare-datatypes ((ListLongMap!993 0))(
  ( (ListLongMap!994 (toList!512 List!985)) )
))
(declare-fun lm!264 () ListLongMap!993)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!464 (List!985 tuple2!1428) Bool)

(assert (=> start!5156 (= res!22789 (contains!464 (toList!512 lm!264) (tuple2!1429 a!526 b!99)))))

(assert (=> start!5156 e!23924))

(declare-fun e!23925 () Bool)

(declare-fun inv!1667 (ListLongMap!993) Bool)

(assert (=> start!5156 (and (inv!1667 lm!264) e!23925)))

(assert (=> start!5156 true))

(declare-fun tp_is_empty!1687 () Bool)

(assert (=> start!5156 tp_is_empty!1687))

(declare-fun b!37755 () Bool)

(assert (=> b!37755 (= e!23924 false)))

(declare-fun b!37756 () Bool)

(declare-fun tp!5588 () Bool)

(assert (=> b!37756 (= e!23925 tp!5588)))

(assert (= (and start!5156 res!22789) b!37755))

(assert (= start!5156 b!37756))

(declare-fun m!30479 () Bool)

(assert (=> start!5156 m!30479))

(declare-fun m!30481 () Bool)

(assert (=> start!5156 m!30481))

(check-sat (not start!5156) (not b!37756) tp_is_empty!1687)
(check-sat)
