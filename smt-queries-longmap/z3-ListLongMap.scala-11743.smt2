; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137726 () Bool)

(assert start!137726)

(assert (=> start!137726 false))

(declare-fun e!883304 () Bool)

(assert (=> start!137726 e!883304))

(assert (=> start!137726 true))

(declare-fun b!1582624 () Bool)

(declare-fun tp_is_empty!39333 () Bool)

(declare-fun tp!114815 () Bool)

(assert (=> b!1582624 (= e!883304 (and tp_is_empty!39333 tp!114815))))

(declare-datatypes ((B!2800 0))(
  ( (B!2801 (val!19762 Int)) )
))
(declare-datatypes ((tuple2!25692 0))(
  ( (tuple2!25693 (_1!12857 (_ BitVec 64)) (_2!12857 B!2800)) )
))
(declare-datatypes ((List!36882 0))(
  ( (Nil!36879) (Cons!36878 (h!38421 tuple2!25692) (t!51796 List!36882)) )
))
(declare-fun l!1065 () List!36882)

(get-info :version)

(assert (= (and start!137726 ((_ is Cons!36878) l!1065)) b!1582624))

(check-sat (not b!1582624) tp_is_empty!39333)
(check-sat)
