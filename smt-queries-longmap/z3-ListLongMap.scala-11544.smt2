; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134386 () Bool)

(assert start!134386)

(assert (=> start!134386 false))

(assert (=> start!134386 true))

(declare-fun e!874808 () Bool)

(assert (=> start!134386 e!874808))

(declare-fun b!1569279 () Bool)

(declare-fun tp_is_empty!39051 () Bool)

(declare-fun tp!114096 () Bool)

(assert (=> b!1569279 (= e!874808 (and tp_is_empty!39051 tp!114096))))

(declare-datatypes ((B!2500 0))(
  ( (B!2501 (val!19612 Int)) )
))
(declare-datatypes ((tuple2!25326 0))(
  ( (tuple2!25327 (_1!12674 (_ BitVec 64)) (_2!12674 B!2500)) )
))
(declare-datatypes ((List!36732 0))(
  ( (Nil!36729) (Cons!36728 (h!38175 tuple2!25326) (t!51640 List!36732)) )
))
(declare-fun l!750 () List!36732)

(get-info :version)

(assert (= (and start!134386 ((_ is Cons!36728) l!750)) b!1569279))

(check-sat (not b!1569279) tp_is_empty!39051)
(check-sat)
