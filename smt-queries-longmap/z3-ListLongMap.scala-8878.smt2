; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107794 () Bool)

(assert start!107794)

(assert (=> start!107794 false))

(declare-fun e!727435 () Bool)

(assert (=> start!107794 e!727435))

(assert (=> start!107794 true))

(declare-fun b!1274637 () Bool)

(declare-fun tp_is_empty!33183 () Bool)

(declare-fun tp!97988 () Bool)

(assert (=> b!1274637 (= e!727435 (and tp_is_empty!33183 tp!97988))))

(declare-datatypes ((B!2140 0))(
  ( (B!2141 (val!16666 Int)) )
))
(declare-datatypes ((tuple2!21414 0))(
  ( (tuple2!21415 (_1!10718 (_ BitVec 64)) (_2!10718 B!2140)) )
))
(declare-datatypes ((List!28592 0))(
  ( (Nil!28589) (Cons!28588 (h!29797 tuple2!21414) (t!42125 List!28592)) )
))
(declare-fun l!595 () List!28592)

(get-info :version)

(assert (= (and start!107794 ((_ is Cons!28588) l!595)) b!1274637))

(check-sat (not b!1274637) tp_is_empty!33183)
(check-sat)
