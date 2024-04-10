; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7776 () Bool)

(assert start!7776)

(assert (=> start!7776 false))

(declare-fun e!31741 () Bool)

(assert (=> start!7776 e!31741))

(assert (=> start!7776 true))

(declare-fun b!49409 () Bool)

(declare-fun tp_is_empty!2151 () Bool)

(declare-fun tp!6527 () Bool)

(assert (=> b!49409 (= e!31741 (and tp_is_empty!2151 tp!6527))))

(declare-datatypes ((B!1000 0))(
  ( (B!1001 (val!1120 Int)) )
))
(declare-datatypes ((tuple2!1822 0))(
  ( (tuple2!1823 (_1!922 (_ BitVec 64)) (_2!922 B!1000)) )
))
(declare-datatypes ((List!1317 0))(
  ( (Nil!1314) (Cons!1313 (h!1893 tuple2!1822) (t!4351 List!1317)) )
))
(declare-fun l!1333 () List!1317)

(get-info :version)

(assert (= (and start!7776 ((_ is Cons!1313) l!1333)) b!49409))

(check-sat (not b!49409) tp_is_empty!2151)
(check-sat)
