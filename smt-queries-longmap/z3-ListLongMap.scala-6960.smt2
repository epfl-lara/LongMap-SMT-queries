; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87894 () Bool)

(assert start!87894)

(declare-fun res!681086 () Bool)

(declare-fun e!571177 () Bool)

(assert (=> start!87894 (=> (not res!681086) (not e!571177))))

(declare-datatypes ((B!1466 0))(
  ( (B!1467 (val!11817 Int)) )
))
(declare-datatypes ((tuple2!15260 0))(
  ( (tuple2!15261 (_1!7641 (_ BitVec 64)) (_2!7641 B!1466)) )
))
(declare-datatypes ((List!21501 0))(
  ( (Nil!21498) (Cons!21497 (h!22695 tuple2!15260) (t!30493 List!21501)) )
))
(declare-fun l!412 () List!21501)

(declare-fun isStrictlySorted!587 (List!21501) Bool)

(assert (=> start!87894 (= res!681086 (isStrictlySorted!587 l!412))))

(assert (=> start!87894 e!571177))

(declare-fun e!571178 () Bool)

(assert (=> start!87894 e!571178))

(declare-fun tp_is_empty!23533 () Bool)

(assert (=> start!87894 tp_is_empty!23533))

(declare-fun b!1015329 () Bool)

(declare-fun value!115 () B!1466)

(get-info :version)

(assert (=> b!1015329 (= e!571177 (and (or (not ((_ is Cons!21497) l!412)) (not (= (_2!7641 (h!22695 l!412)) value!115))) (or (not ((_ is Cons!21497) l!412)) (= (_2!7641 (h!22695 l!412)) value!115)) (not ((_ is Nil!21498) l!412))))))

(declare-fun b!1015330 () Bool)

(declare-fun tp!70629 () Bool)

(assert (=> b!1015330 (= e!571178 (and tp_is_empty!23533 tp!70629))))

(assert (= (and start!87894 res!681086) b!1015329))

(assert (= (and start!87894 ((_ is Cons!21497) l!412)) b!1015330))

(declare-fun m!936937 () Bool)

(assert (=> start!87894 m!936937))

(check-sat (not start!87894) (not b!1015330) tp_is_empty!23533)
(check-sat)
