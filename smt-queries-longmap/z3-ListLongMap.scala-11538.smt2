; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134724 () Bool)

(assert start!134724)

(assert (=> start!134724 false))

(assert (=> start!134724 true))

(declare-fun e!875936 () Bool)

(assert (=> start!134724 e!875936))

(declare-fun b!1571004 () Bool)

(declare-fun tp_is_empty!39013 () Bool)

(declare-fun tp!114021 () Bool)

(assert (=> b!1571004 (= e!875936 (and tp_is_empty!39013 tp!114021))))

(declare-datatypes ((B!2462 0))(
  ( (B!2463 (val!19593 Int)) )
))
(declare-datatypes ((tuple2!25348 0))(
  ( (tuple2!25349 (_1!12685 (_ BitVec 64)) (_2!12685 B!2462)) )
))
(declare-datatypes ((List!36745 0))(
  ( (Nil!36742) (Cons!36741 (h!38206 tuple2!25348) (t!51645 List!36745)) )
))
(declare-fun l!750 () List!36745)

(get-info :version)

(assert (= (and start!134724 ((_ is Cons!36741) l!750)) b!1571004))

(check-sat (not b!1571004) tp_is_empty!39013)
(check-sat)
