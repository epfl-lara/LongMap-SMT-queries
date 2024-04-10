; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134320 () Bool)

(assert start!134320)

(assert (=> start!134320 false))

(assert (=> start!134320 true))

(declare-fun e!874439 () Bool)

(assert (=> start!134320 e!874439))

(declare-fun b!1568580 () Bool)

(declare-fun tp_is_empty!39021 () Bool)

(declare-fun tp!114033 () Bool)

(assert (=> b!1568580 (= e!874439 (and tp_is_empty!39021 tp!114033))))

(declare-datatypes ((B!2470 0))(
  ( (B!2471 (val!19597 Int)) )
))
(declare-datatypes ((tuple2!25296 0))(
  ( (tuple2!25297 (_1!12659 (_ BitVec 64)) (_2!12659 B!2470)) )
))
(declare-datatypes ((List!36717 0))(
  ( (Nil!36714) (Cons!36713 (h!38160 tuple2!25296) (t!51625 List!36717)) )
))
(declare-fun l!750 () List!36717)

(get-info :version)

(assert (= (and start!134320 ((_ is Cons!36713) l!750)) b!1568580))

(check-sat (not b!1568580) tp_is_empty!39021)
(check-sat)
