; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134796 () Bool)

(assert start!134796)

(assert (=> start!134796 false))

(assert (=> start!134796 true))

(declare-fun e!876314 () Bool)

(assert (=> start!134796 e!876314))

(declare-fun b!1571712 () Bool)

(declare-fun tp_is_empty!39049 () Bool)

(declare-fun tp!114093 () Bool)

(assert (=> b!1571712 (= e!876314 (and tp_is_empty!39049 tp!114093))))

(declare-datatypes ((B!2498 0))(
  ( (B!2499 (val!19611 Int)) )
))
(declare-datatypes ((tuple2!25384 0))(
  ( (tuple2!25385 (_1!12703 (_ BitVec 64)) (_2!12703 B!2498)) )
))
(declare-datatypes ((List!36763 0))(
  ( (Nil!36760) (Cons!36759 (h!38224 tuple2!25384) (t!51663 List!36763)) )
))
(declare-fun l!750 () List!36763)

(get-info :version)

(assert (= (and start!134796 ((_ is Cons!36759) l!750)) b!1571712))

(check-sat (not b!1571712) tp_is_empty!39049)
(check-sat)
