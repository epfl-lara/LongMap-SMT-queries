; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138372 () Bool)

(assert start!138372)

(assert (=> start!138372 false))

(declare-fun e!885520 () Bool)

(assert (=> start!138372 e!885520))

(declare-fun b!1586097 () Bool)

(declare-fun tp_is_empty!39403 () Bool)

(declare-fun tp!114995 () Bool)

(assert (=> b!1586097 (= e!885520 (and tp_is_empty!39403 tp!114995))))

(declare-datatypes ((B!2870 0))(
  ( (B!2871 (val!19797 Int)) )
))
(declare-datatypes ((tuple2!25822 0))(
  ( (tuple2!25823 (_1!12922 (_ BitVec 64)) (_2!12922 B!2870)) )
))
(declare-datatypes ((List!36949 0))(
  ( (Nil!36946) (Cons!36945 (h!38506 tuple2!25822) (t!51855 List!36949)) )
))
(declare-fun l!1251 () List!36949)

(get-info :version)

(assert (= (and start!138372 ((_ is Cons!36945) l!1251)) b!1586097))

(check-sat (not b!1586097) tp_is_empty!39403)
(check-sat)
