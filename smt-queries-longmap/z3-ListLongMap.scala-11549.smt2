; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134400 () Bool)

(assert start!134400)

(assert (=> start!134400 false))

(assert (=> start!134400 true))

(declare-fun e!874871 () Bool)

(assert (=> start!134400 e!874871))

(declare-fun b!1569389 () Bool)

(declare-fun tp_is_empty!39079 () Bool)

(declare-fun tp!114166 () Bool)

(assert (=> b!1569389 (= e!874871 (and tp_is_empty!39079 tp!114166))))

(declare-datatypes ((B!2528 0))(
  ( (B!2529 (val!19626 Int)) )
))
(declare-datatypes ((tuple2!25422 0))(
  ( (tuple2!25423 (_1!12722 (_ BitVec 64)) (_2!12722 B!2528)) )
))
(declare-datatypes ((List!36787 0))(
  ( (Nil!36784) (Cons!36783 (h!38231 tuple2!25422) (t!51687 List!36787)) )
))
(declare-fun l!750 () List!36787)

(get-info :version)

(assert (= (and start!134400 ((_ is Cons!36783) l!750)) b!1569389))

(check-sat (not b!1569389) tp_is_empty!39079)
(check-sat)
