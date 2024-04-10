; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137056 () Bool)

(assert start!137056)

(assert (=> start!137056 false))

(declare-fun e!881345 () Bool)

(assert (=> start!137056 e!881345))

(declare-fun b!1579890 () Bool)

(declare-fun tp_is_empty!39153 () Bool)

(declare-fun tp!114381 () Bool)

(assert (=> b!1579890 (= e!881345 (and tp_is_empty!39153 tp!114381))))

(declare-datatypes ((B!2608 0))(
  ( (B!2609 (val!19666 Int)) )
))
(declare-datatypes ((tuple2!25434 0))(
  ( (tuple2!25435 (_1!12728 (_ BitVec 64)) (_2!12728 B!2608)) )
))
(declare-datatypes ((List!36786 0))(
  ( (Nil!36783) (Cons!36782 (h!38325 tuple2!25434) (t!51700 List!36786)) )
))
(declare-fun l!1390 () List!36786)

(get-info :version)

(assert (= (and start!137056 ((_ is Cons!36782) l!1390)) b!1579890))

(check-sat (not b!1579890) tp_is_empty!39153)
(check-sat)
