; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87462 () Bool)

(assert start!87462)

(assert (=> start!87462 false))

(declare-fun e!569813 () Bool)

(assert (=> start!87462 e!569813))

(declare-fun b!1012984 () Bool)

(declare-fun tp_is_empty!23443 () Bool)

(declare-fun tp!70374 () Bool)

(assert (=> b!1012984 (= e!569813 (and tp_is_empty!23443 tp!70374))))

(declare-datatypes ((B!1376 0))(
  ( (B!1377 (val!11772 Int)) )
))
(declare-datatypes ((tuple2!15170 0))(
  ( (tuple2!15171 (_1!7596 (_ BitVec 64)) (_2!7596 B!1376)) )
))
(declare-datatypes ((List!21426 0))(
  ( (Nil!21423) (Cons!21422 (h!22620 tuple2!15170) (t!30418 List!21426)) )
))
(declare-fun l!412 () List!21426)

(get-info :version)

(assert (= (and start!87462 ((_ is Cons!21422) l!412)) b!1012984))

(check-sat (not b!1012984) tp_is_empty!23443)
(check-sat)
