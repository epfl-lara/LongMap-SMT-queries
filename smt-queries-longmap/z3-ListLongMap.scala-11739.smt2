; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137684 () Bool)

(assert start!137684)

(assert (=> start!137684 false))

(declare-datatypes ((B!2776 0))(
  ( (B!2777 (val!19750 Int)) )
))
(declare-datatypes ((tuple2!25668 0))(
  ( (tuple2!25669 (_1!12845 (_ BitVec 64)) (_2!12845 B!2776)) )
))
(declare-datatypes ((List!36870 0))(
  ( (Nil!36867) (Cons!36866 (h!38409 tuple2!25668) (t!51784 List!36870)) )
))
(declare-datatypes ((ListLongMap!22779 0))(
  ( (ListLongMap!22780 (toList!11405 List!36870)) )
))
(declare-fun thiss!185 () ListLongMap!22779)

(declare-fun e!883196 () Bool)

(declare-fun inv!59120 (ListLongMap!22779) Bool)

(assert (=> start!137684 (and (inv!59120 thiss!185) e!883196)))

(assert (=> start!137684 true))

(declare-fun b!1582501 () Bool)

(declare-fun tp!114770 () Bool)

(assert (=> b!1582501 (= e!883196 tp!114770)))

(assert (= start!137684 b!1582501))

(declare-fun m!1452901 () Bool)

(assert (=> start!137684 m!1452901))

(check-sat (not start!137684) (not b!1582501))
(check-sat)
