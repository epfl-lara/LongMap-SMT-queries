; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134862 () Bool)

(assert start!134862)

(assert (=> start!134862 false))

(assert (=> start!134862 true))

(declare-fun e!876578 () Bool)

(assert (=> start!134862 e!876578))

(declare-fun b!1572138 () Bool)

(declare-fun tp_is_empty!39079 () Bool)

(declare-fun tp!114165 () Bool)

(assert (=> b!1572138 (= e!876578 (and tp_is_empty!39079 tp!114165))))

(declare-datatypes ((B!2528 0))(
  ( (B!2529 (val!19626 Int)) )
))
(declare-datatypes ((tuple2!25414 0))(
  ( (tuple2!25415 (_1!12718 (_ BitVec 64)) (_2!12718 B!2528)) )
))
(declare-datatypes ((List!36778 0))(
  ( (Nil!36775) (Cons!36774 (h!38239 tuple2!25414) (t!51678 List!36778)) )
))
(declare-fun l!750 () List!36778)

(get-info :version)

(assert (= (and start!134862 ((_ is Cons!36774) l!750)) b!1572138))

(check-sat (not b!1572138) tp_is_empty!39079)
(check-sat)
