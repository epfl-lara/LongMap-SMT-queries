; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88402 () Bool)

(assert start!88402)

(assert (=> start!88402 false))

(declare-fun e!572331 () Bool)

(assert (=> start!88402 e!572331))

(assert (=> start!88402 true))

(declare-fun b!1017280 () Bool)

(declare-fun tp_is_empty!23635 () Bool)

(declare-fun tp!70874 () Bool)

(assert (=> b!1017280 (= e!572331 (and tp_is_empty!23635 tp!70874))))

(declare-datatypes ((B!1568 0))(
  ( (B!1569 (val!11868 Int)) )
))
(declare-datatypes ((tuple2!15362 0))(
  ( (tuple2!15363 (_1!7692 (_ BitVec 64)) (_2!7692 B!1568)) )
))
(declare-datatypes ((List!21591 0))(
  ( (Nil!21588) (Cons!21587 (h!22785 tuple2!15362) (t!30583 List!21591)) )
))
(declare-fun l!1036 () List!21591)

(get-info :version)

(assert (= (and start!88402 ((_ is Cons!21587) l!1036)) b!1017280))

(check-sat (not b!1017280) tp_is_empty!23635)
(check-sat)
