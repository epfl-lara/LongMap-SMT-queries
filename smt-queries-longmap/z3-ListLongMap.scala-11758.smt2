; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138378 () Bool)

(assert start!138378)

(assert (=> start!138378 false))

(declare-fun e!885529 () Bool)

(assert (=> start!138378 e!885529))

(assert (=> start!138378 true))

(declare-fun b!1586106 () Bool)

(declare-fun tp_is_empty!39409 () Bool)

(declare-fun tp!115004 () Bool)

(assert (=> b!1586106 (= e!885529 (and tp_is_empty!39409 tp!115004))))

(declare-datatypes ((B!2876 0))(
  ( (B!2877 (val!19800 Int)) )
))
(declare-datatypes ((tuple2!25828 0))(
  ( (tuple2!25829 (_1!12925 (_ BitVec 64)) (_2!12925 B!2876)) )
))
(declare-datatypes ((List!36952 0))(
  ( (Nil!36949) (Cons!36948 (h!38509 tuple2!25828) (t!51858 List!36952)) )
))
(declare-fun l!1251 () List!36952)

(get-info :version)

(assert (= (and start!138378 ((_ is Cons!36948) l!1251)) b!1586106))

(check-sat (not b!1586106) tp_is_empty!39409)
(check-sat)
