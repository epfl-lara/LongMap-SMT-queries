; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134334 () Bool)

(assert start!134334)

(assert (=> start!134334 false))

(assert (=> start!134334 true))

(declare-fun e!874607 () Bool)

(assert (=> start!134334 e!874607))

(declare-fun b!1568963 () Bool)

(declare-fun tp_is_empty!39049 () Bool)

(declare-fun tp!114094 () Bool)

(assert (=> b!1568963 (= e!874607 (and tp_is_empty!39049 tp!114094))))

(declare-datatypes ((B!2498 0))(
  ( (B!2499 (val!19611 Int)) )
))
(declare-datatypes ((tuple2!25392 0))(
  ( (tuple2!25393 (_1!12707 (_ BitVec 64)) (_2!12707 B!2498)) )
))
(declare-datatypes ((List!36772 0))(
  ( (Nil!36769) (Cons!36768 (h!38216 tuple2!25392) (t!51672 List!36772)) )
))
(declare-fun l!750 () List!36772)

(get-info :version)

(assert (= (and start!134334 ((_ is Cons!36768) l!750)) b!1568963))

(check-sat (not b!1568963) tp_is_empty!39049)
(check-sat)
