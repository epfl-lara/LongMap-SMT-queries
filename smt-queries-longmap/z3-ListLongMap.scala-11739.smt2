; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138098 () Bool)

(assert start!138098)

(assert (=> start!138098 false))

(declare-fun e!884705 () Bool)

(assert (=> start!138098 e!884705))

(assert (=> start!138098 true))

(declare-fun b!1584954 () Bool)

(declare-fun tp_is_empty!39307 () Bool)

(declare-fun tp!114741 () Bool)

(assert (=> b!1584954 (= e!884705 (and tp_is_empty!39307 tp!114741))))

(declare-datatypes ((B!2762 0))(
  ( (B!2763 (val!19743 Int)) )
))
(declare-datatypes ((tuple2!25714 0))(
  ( (tuple2!25715 (_1!12868 (_ BitVec 64)) (_2!12868 B!2762)) )
))
(declare-datatypes ((List!36895 0))(
  ( (Nil!36892) (Cons!36891 (h!38452 tuple2!25714) (t!51801 List!36895)) )
))
(declare-fun l!1356 () List!36895)

(get-info :version)

(assert (= (and start!138098 ((_ is Cons!36891) l!1356)) b!1584954))

(check-sat (not b!1584954) tp_is_empty!39307)
(check-sat)
