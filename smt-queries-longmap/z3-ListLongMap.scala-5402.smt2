; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72102 () Bool)

(assert start!72102)

(assert (=> start!72102 false))

(declare-fun e!466754 () Bool)

(assert (=> start!72102 e!466754))

(declare-fun b!836526 () Bool)

(declare-fun tp_is_empty!15283 () Bool)

(declare-fun tp!47510 () Bool)

(assert (=> b!836526 (= e!466754 (and tp_is_empty!15283 tp!47510))))

(declare-datatypes ((B!1214 0))(
  ( (B!1215 (val!7689 Int)) )
))
(declare-datatypes ((tuple2!10246 0))(
  ( (tuple2!10247 (_1!5134 (_ BitVec 64)) (_2!5134 B!1214)) )
))
(declare-datatypes ((List!15999 0))(
  ( (Nil!15996) (Cons!15995 (h!17126 tuple2!10246) (t!22361 List!15999)) )
))
(declare-fun l!390 () List!15999)

(get-info :version)

(assert (= (and start!72102 ((_ is Cons!15995) l!390)) b!836526))

(check-sat (not b!836526) tp_is_empty!15283)
(check-sat)
