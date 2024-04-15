; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138152 () Bool)

(assert start!138152)

(assert (=> start!138152 false))

(declare-fun e!884820 () Bool)

(assert (=> start!138152 e!884820))

(assert (=> start!138152 true))

(declare-fun b!1584910 () Bool)

(declare-fun tp_is_empty!39499 () Bool)

(declare-fun tp!115215 () Bool)

(assert (=> b!1584910 (= e!884820 (and tp_is_empty!39499 tp!115215))))

(declare-datatypes ((B!2966 0))(
  ( (B!2967 (val!19845 Int)) )
))
(declare-datatypes ((tuple2!25926 0))(
  ( (tuple2!25927 (_1!12974 (_ BitVec 64)) (_2!12974 B!2966)) )
))
(declare-datatypes ((List!37006 0))(
  ( (Nil!37003) (Cons!37002 (h!38546 tuple2!25926) (t!51916 List!37006)) )
))
(declare-fun l!556 () List!37006)

(get-info :version)

(assert (= (and start!138152 ((_ is Cons!37002) l!556)) b!1584910))

(check-sat (not b!1584910) tp_is_empty!39499)
(check-sat)
