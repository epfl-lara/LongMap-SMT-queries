; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72282 () Bool)

(assert start!72282)

(assert (=> start!72282 false))

(declare-fun e!467475 () Bool)

(assert (=> start!72282 e!467475))

(declare-fun b!837659 () Bool)

(declare-fun tp_is_empty!15277 () Bool)

(declare-fun tp!47501 () Bool)

(assert (=> b!837659 (= e!467475 (and tp_is_empty!15277 tp!47501))))

(declare-datatypes ((B!1208 0))(
  ( (B!1209 (val!7686 Int)) )
))
(declare-datatypes ((tuple2!10156 0))(
  ( (tuple2!10157 (_1!5089 (_ BitVec 64)) (_2!5089 B!1208)) )
))
(declare-datatypes ((List!15901 0))(
  ( (Nil!15898) (Cons!15897 (h!17034 tuple2!10156) (t!22264 List!15901)) )
))
(declare-fun l!390 () List!15901)

(get-info :version)

(assert (= (and start!72282 ((_ is Cons!15897) l!390)) b!837659))

(check-sat (not b!837659) tp_is_empty!15277)
(check-sat)
