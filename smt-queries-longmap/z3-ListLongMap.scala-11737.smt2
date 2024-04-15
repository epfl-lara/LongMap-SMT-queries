; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137624 () Bool)

(assert start!137624)

(assert (=> start!137624 false))

(declare-fun e!882950 () Bool)

(assert (=> start!137624 e!882950))

(assert (=> start!137624 true))

(declare-fun b!1582134 () Bool)

(declare-fun tp_is_empty!39307 () Bool)

(declare-fun tp!114741 () Bool)

(assert (=> b!1582134 (= e!882950 (and tp_is_empty!39307 tp!114741))))

(declare-datatypes ((B!2762 0))(
  ( (B!2763 (val!19743 Int)) )
))
(declare-datatypes ((tuple2!25722 0))(
  ( (tuple2!25723 (_1!12872 (_ BitVec 64)) (_2!12872 B!2762)) )
))
(declare-datatypes ((List!36904 0))(
  ( (Nil!36901) (Cons!36900 (h!38444 tuple2!25722) (t!51810 List!36904)) )
))
(declare-fun l!1356 () List!36904)

(get-info :version)

(assert (= (and start!137624 ((_ is Cons!36900) l!1356)) b!1582134))

(check-sat (not b!1582134) tp_is_empty!39307)
(check-sat)
