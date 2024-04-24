; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134820 () Bool)

(assert start!134820)

(assert (=> start!134820 false))

(assert (=> start!134820 true))

(declare-fun e!876419 () Bool)

(assert (=> start!134820 e!876419))

(declare-fun b!1571886 () Bool)

(declare-fun tp_is_empty!39061 () Bool)

(declare-fun tp!114120 () Bool)

(assert (=> b!1571886 (= e!876419 (and tp_is_empty!39061 tp!114120))))

(declare-datatypes ((B!2510 0))(
  ( (B!2511 (val!19617 Int)) )
))
(declare-datatypes ((tuple2!25396 0))(
  ( (tuple2!25397 (_1!12709 (_ BitVec 64)) (_2!12709 B!2510)) )
))
(declare-datatypes ((List!36769 0))(
  ( (Nil!36766) (Cons!36765 (h!38230 tuple2!25396) (t!51669 List!36769)) )
))
(declare-fun l!750 () List!36769)

(get-info :version)

(assert (= (and start!134820 ((_ is Cons!36765) l!750)) b!1571886))

(check-sat (not b!1571886) tp_is_empty!39061)
(check-sat)
