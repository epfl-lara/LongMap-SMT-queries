; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87470 () Bool)

(assert start!87470)

(assert (=> start!87470 false))

(declare-fun e!569902 () Bool)

(assert (=> start!87470 e!569902))

(declare-fun b!1013126 () Bool)

(declare-fun tp_is_empty!23451 () Bool)

(declare-fun tp!70385 () Bool)

(assert (=> b!1013126 (= e!569902 (and tp_is_empty!23451 tp!70385))))

(declare-datatypes ((B!1384 0))(
  ( (B!1385 (val!11776 Int)) )
))
(declare-datatypes ((tuple2!15098 0))(
  ( (tuple2!15099 (_1!7560 (_ BitVec 64)) (_2!7560 B!1384)) )
))
(declare-datatypes ((List!21395 0))(
  ( (Nil!21392) (Cons!21391 (h!22589 tuple2!15098) (t!30396 List!21395)) )
))
(declare-fun l!412 () List!21395)

(get-info :version)

(assert (= (and start!87470 ((_ is Cons!21391) l!412)) b!1013126))

(check-sat (not b!1013126) tp_is_empty!23451)
(check-sat)
