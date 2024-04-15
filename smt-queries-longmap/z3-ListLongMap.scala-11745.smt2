; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137702 () Bool)

(assert start!137702)

(assert (=> start!137702 false))

(declare-fun e!883130 () Bool)

(assert (=> start!137702 e!883130))

(assert (=> start!137702 true))

(declare-fun b!1582371 () Bool)

(declare-fun tp_is_empty!39343 () Bool)

(declare-fun tp!114831 () Bool)

(assert (=> b!1582371 (= e!883130 (and tp_is_empty!39343 tp!114831))))

(declare-datatypes ((B!2810 0))(
  ( (B!2811 (val!19767 Int)) )
))
(declare-datatypes ((tuple2!25770 0))(
  ( (tuple2!25771 (_1!12896 (_ BitVec 64)) (_2!12896 B!2810)) )
))
(declare-datatypes ((List!36928 0))(
  ( (Nil!36925) (Cons!36924 (h!38468 tuple2!25770) (t!51834 List!36928)) )
))
(declare-fun l!1065 () List!36928)

(get-info :version)

(assert (= (and start!137702 ((_ is Cons!36924) l!1065)) b!1582371))

(check-sat (not b!1582371) tp_is_empty!39343)
(check-sat)
