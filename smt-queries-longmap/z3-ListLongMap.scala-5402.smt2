; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72288 () Bool)

(assert start!72288)

(assert (=> start!72288 false))

(declare-fun e!467484 () Bool)

(assert (=> start!72288 e!467484))

(declare-fun b!837668 () Bool)

(declare-fun tp_is_empty!15283 () Bool)

(declare-fun tp!47510 () Bool)

(assert (=> b!837668 (= e!467484 (and tp_is_empty!15283 tp!47510))))

(declare-datatypes ((B!1214 0))(
  ( (B!1215 (val!7689 Int)) )
))
(declare-datatypes ((tuple2!10162 0))(
  ( (tuple2!10163 (_1!5092 (_ BitVec 64)) (_2!5092 B!1214)) )
))
(declare-datatypes ((List!15904 0))(
  ( (Nil!15901) (Cons!15900 (h!17037 tuple2!10162) (t!22267 List!15904)) )
))
(declare-fun l!390 () List!15904)

(get-info :version)

(assert (= (and start!72288 ((_ is Cons!15900) l!390)) b!837668))

(check-sat (not b!837668) tp_is_empty!15283)
(check-sat)
