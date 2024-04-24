; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134730 () Bool)

(assert start!134730)

(assert (=> start!134730 false))

(assert (=> start!134730 true))

(declare-fun e!875945 () Bool)

(assert (=> start!134730 e!875945))

(declare-fun b!1571013 () Bool)

(declare-fun tp_is_empty!39019 () Bool)

(declare-fun tp!114030 () Bool)

(assert (=> b!1571013 (= e!875945 (and tp_is_empty!39019 tp!114030))))

(declare-datatypes ((B!2468 0))(
  ( (B!2469 (val!19596 Int)) )
))
(declare-datatypes ((tuple2!25354 0))(
  ( (tuple2!25355 (_1!12688 (_ BitVec 64)) (_2!12688 B!2468)) )
))
(declare-datatypes ((List!36748 0))(
  ( (Nil!36745) (Cons!36744 (h!38209 tuple2!25354) (t!51648 List!36748)) )
))
(declare-fun l!750 () List!36748)

(get-info :version)

(assert (= (and start!134730 ((_ is Cons!36744) l!750)) b!1571013))

(check-sat (not b!1571013) tp_is_empty!39019)
(check-sat)
