; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88132 () Bool)

(assert start!88132)

(declare-fun res!681665 () Bool)

(declare-fun e!572111 () Bool)

(assert (=> start!88132 (=> (not res!681665) (not e!572111))))

(declare-datatypes ((B!1466 0))(
  ( (B!1467 (val!11817 Int)) )
))
(declare-datatypes ((tuple2!15184 0))(
  ( (tuple2!15185 (_1!7603 (_ BitVec 64)) (_2!7603 B!1466)) )
))
(declare-datatypes ((List!21455 0))(
  ( (Nil!21452) (Cons!21451 (h!22658 tuple2!15184) (t!30448 List!21455)) )
))
(declare-fun l!412 () List!21455)

(declare-fun isStrictlySorted!579 (List!21455) Bool)

(assert (=> start!88132 (= res!681665 (isStrictlySorted!579 l!412))))

(assert (=> start!88132 e!572111))

(declare-fun e!572112 () Bool)

(assert (=> start!88132 e!572112))

(declare-fun tp_is_empty!23533 () Bool)

(assert (=> start!88132 tp_is_empty!23533))

(declare-fun b!1016793 () Bool)

(declare-fun value!115 () B!1466)

(get-info :version)

(assert (=> b!1016793 (= e!572111 (and (or (not ((_ is Cons!21451) l!412)) (not (= (_2!7603 (h!22658 l!412)) value!115))) (or (not ((_ is Cons!21451) l!412)) (= (_2!7603 (h!22658 l!412)) value!115)) (not ((_ is Nil!21452) l!412))))))

(declare-fun b!1016794 () Bool)

(declare-fun tp!70629 () Bool)

(assert (=> b!1016794 (= e!572112 (and tp_is_empty!23533 tp!70629))))

(assert (= (and start!88132 res!681665) b!1016793))

(assert (= (and start!88132 ((_ is Cons!21451) l!412)) b!1016794))

(declare-fun m!939221 () Bool)

(assert (=> start!88132 m!939221))

(check-sat (not start!88132) (not b!1016794) tp_is_empty!23533)
(check-sat)
