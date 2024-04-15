; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134268 () Bool)

(assert start!134268)

(assert (=> start!134268 false))

(assert (=> start!134268 true))

(declare-fun e!874238 () Bool)

(assert (=> start!134268 e!874238))

(declare-fun b!1568264 () Bool)

(declare-fun tp_is_empty!39019 () Bool)

(declare-fun tp!114031 () Bool)

(assert (=> b!1568264 (= e!874238 (and tp_is_empty!39019 tp!114031))))

(declare-datatypes ((B!2468 0))(
  ( (B!2469 (val!19596 Int)) )
))
(declare-datatypes ((tuple2!25362 0))(
  ( (tuple2!25363 (_1!12692 (_ BitVec 64)) (_2!12692 B!2468)) )
))
(declare-datatypes ((List!36757 0))(
  ( (Nil!36754) (Cons!36753 (h!38201 tuple2!25362) (t!51657 List!36757)) )
))
(declare-fun l!750 () List!36757)

(get-info :version)

(assert (= (and start!134268 ((_ is Cons!36753) l!750)) b!1568264))

(check-sat (not b!1568264) tp_is_empty!39019)
(check-sat)
