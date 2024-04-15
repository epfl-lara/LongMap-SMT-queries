; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87900 () Bool)

(assert start!87900)

(declare-fun b!1015350 () Bool)

(assert (=> b!1015350 true))

(assert (=> b!1015350 true))

(declare-fun res!681098 () Bool)

(declare-fun e!571195 () Bool)

(assert (=> start!87900 (=> (not res!681098) (not e!571195))))

(declare-datatypes ((B!1472 0))(
  ( (B!1473 (val!11820 Int)) )
))
(declare-datatypes ((tuple2!15266 0))(
  ( (tuple2!15267 (_1!7644 (_ BitVec 64)) (_2!7644 B!1472)) )
))
(declare-datatypes ((List!21504 0))(
  ( (Nil!21501) (Cons!21500 (h!22698 tuple2!15266) (t!30496 List!21504)) )
))
(declare-fun l!412 () List!21504)

(declare-fun isStrictlySorted!590 (List!21504) Bool)

(assert (=> start!87900 (= res!681098 (isStrictlySorted!590 l!412))))

(assert (=> start!87900 e!571195))

(declare-fun e!571196 () Bool)

(assert (=> start!87900 e!571196))

(declare-fun tp_is_empty!23539 () Bool)

(assert (=> start!87900 tp_is_empty!23539))

(declare-fun b!1015349 () Bool)

(declare-fun res!681097 () Bool)

(assert (=> b!1015349 (=> (not res!681097) (not e!571195))))

(declare-fun value!115 () B!1472)

(get-info :version)

(assert (=> b!1015349 (= res!681097 (and (or (not ((_ is Cons!21500) l!412)) (not (= (_2!7644 (h!22698 l!412)) value!115))) (or (not ((_ is Cons!21500) l!412)) (= (_2!7644 (h!22698 l!412)) value!115)) (not ((_ is Nil!21501) l!412))))))

(declare-datatypes ((List!21505 0))(
  ( (Nil!21502) (Cons!21501 (h!22699 (_ BitVec 64)) (t!30497 List!21505)) )
))
(declare-fun err!111 () List!21505)

(declare-fun lambda!902 () Int)

(declare-fun forall!260 (List!21505 Int) Bool)

(assert (=> b!1015350 (= e!571195 (not (forall!260 err!111 lambda!902)))))

(assert (=> b!1015350 true))

(declare-fun b!1015351 () Bool)

(declare-fun tp!70638 () Bool)

(assert (=> b!1015351 (= e!571196 (and tp_is_empty!23539 tp!70638))))

(assert (= (and start!87900 res!681098) b!1015349))

(assert (= (and b!1015349 res!681097) b!1015350))

(assert (= (and start!87900 ((_ is Cons!21500) l!412)) b!1015351))

(declare-fun m!936943 () Bool)

(assert (=> start!87900 m!936943))

(declare-fun m!936945 () Bool)

(assert (=> b!1015350 m!936945))

(check-sat (not start!87900) (not b!1015350) (not b!1015351) tp_is_empty!23539)
(check-sat)
