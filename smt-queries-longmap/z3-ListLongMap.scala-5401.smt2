; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72096 () Bool)

(assert start!72096)

(assert (=> start!72096 false))

(declare-fun e!466745 () Bool)

(assert (=> start!72096 e!466745))

(declare-fun b!836517 () Bool)

(declare-fun tp_is_empty!15277 () Bool)

(declare-fun tp!47501 () Bool)

(assert (=> b!836517 (= e!466745 (and tp_is_empty!15277 tp!47501))))

(declare-datatypes ((B!1208 0))(
  ( (B!1209 (val!7686 Int)) )
))
(declare-datatypes ((tuple2!10240 0))(
  ( (tuple2!10241 (_1!5131 (_ BitVec 64)) (_2!5131 B!1208)) )
))
(declare-datatypes ((List!15996 0))(
  ( (Nil!15993) (Cons!15992 (h!17123 tuple2!10240) (t!22358 List!15996)) )
))
(declare-fun l!390 () List!15996)

(get-info :version)

(assert (= (and start!72096 ((_ is Cons!15992) l!390)) b!836517))

(check-sat (not b!836517) tp_is_empty!15277)
(check-sat)
