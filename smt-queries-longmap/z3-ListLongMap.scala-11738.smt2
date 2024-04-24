; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138092 () Bool)

(assert start!138092)

(assert (=> start!138092 false))

(declare-fun e!884696 () Bool)

(assert (=> start!138092 e!884696))

(assert (=> start!138092 true))

(declare-fun b!1584945 () Bool)

(declare-fun tp_is_empty!39301 () Bool)

(declare-fun tp!114732 () Bool)

(assert (=> b!1584945 (= e!884696 (and tp_is_empty!39301 tp!114732))))

(declare-datatypes ((B!2756 0))(
  ( (B!2757 (val!19740 Int)) )
))
(declare-datatypes ((tuple2!25708 0))(
  ( (tuple2!25709 (_1!12865 (_ BitVec 64)) (_2!12865 B!2756)) )
))
(declare-datatypes ((List!36892 0))(
  ( (Nil!36889) (Cons!36888 (h!38449 tuple2!25708) (t!51798 List!36892)) )
))
(declare-fun l!1356 () List!36892)

(get-info :version)

(assert (= (and start!138092 ((_ is Cons!36888) l!1356)) b!1584945))

(check-sat (not b!1584945) tp_is_empty!39301)
(check-sat)
