; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87700 () Bool)

(assert start!87700)

(assert (=> start!87700 false))

(declare-fun e!570747 () Bool)

(assert (=> start!87700 e!570747))

(declare-fun b!1014448 () Bool)

(declare-fun tp_is_empty!23443 () Bool)

(declare-fun tp!70374 () Bool)

(assert (=> b!1014448 (= e!570747 (and tp_is_empty!23443 tp!70374))))

(declare-datatypes ((B!1376 0))(
  ( (B!1377 (val!11772 Int)) )
))
(declare-datatypes ((tuple2!15094 0))(
  ( (tuple2!15095 (_1!7558 (_ BitVec 64)) (_2!7558 B!1376)) )
))
(declare-datatypes ((List!21380 0))(
  ( (Nil!21377) (Cons!21376 (h!22583 tuple2!15094) (t!30373 List!21380)) )
))
(declare-fun l!412 () List!21380)

(get-info :version)

(assert (= (and start!87700 ((_ is Cons!21376) l!412)) b!1014448))

(check-sat (not b!1014448) tp_is_empty!23443)
(check-sat)
