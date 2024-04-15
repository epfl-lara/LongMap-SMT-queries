; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87414 () Bool)

(assert start!87414)

(declare-fun b!1012640 () Bool)

(assert (=> b!1012640 true))

(assert (=> b!1012640 true))

(declare-fun b!1012638 () Bool)

(declare-fun e!569642 () Bool)

(declare-fun tp_is_empty!23425 () Bool)

(declare-fun tp!70338 () Bool)

(assert (=> b!1012638 (= e!569642 (and tp_is_empty!23425 tp!70338))))

(declare-fun b!1012639 () Bool)

(declare-fun res!680074 () Bool)

(declare-fun e!569641 () Bool)

(assert (=> b!1012639 (=> (not res!680074) (not e!569641))))

(declare-datatypes ((B!1358 0))(
  ( (B!1359 (val!11763 Int)) )
))
(declare-datatypes ((tuple2!15152 0))(
  ( (tuple2!15153 (_1!7587 (_ BitVec 64)) (_2!7587 B!1358)) )
))
(declare-datatypes ((List!21408 0))(
  ( (Nil!21405) (Cons!21404 (h!22602 tuple2!15152) (t!30400 List!21408)) )
))
(declare-fun l!412 () List!21408)

(declare-fun isEmpty!803 (List!21408) Bool)

(assert (=> b!1012639 (= res!680074 (not (isEmpty!803 (t!30400 l!412))))))

(declare-fun res!680076 () Bool)

(assert (=> b!1012640 (=> (not res!680076) (not e!569641))))

(declare-datatypes ((List!21409 0))(
  ( (Nil!21406) (Cons!21405 (h!22603 (_ BitVec 64)) (t!30401 List!21409)) )
))
(declare-fun lt!447496 () List!21409)

(declare-fun lambda!406 () Int)

(declare-fun forall!221 (List!21409 Int) Bool)

(assert (=> b!1012640 (= res!680076 (forall!221 lt!447496 lambda!406))))

(declare-fun b!1012641 () Bool)

(declare-fun e!569640 () Bool)

(assert (=> b!1012641 (= e!569640 e!569641)))

(declare-fun res!680073 () Bool)

(assert (=> b!1012641 (=> (not res!680073) (not e!569641))))

(declare-fun isEmpty!804 (List!21409) Bool)

(assert (=> b!1012641 (= res!680073 (not (isEmpty!804 lt!447496)))))

(declare-fun value!115 () B!1358)

(declare-fun getKeysOf!25 (List!21408 B!1358) List!21409)

(assert (=> b!1012641 (= lt!447496 (getKeysOf!25 (t!30400 l!412) value!115))))

(declare-fun b!1012642 () Bool)

(declare-fun res!680077 () Bool)

(assert (=> b!1012642 (=> (not res!680077) (not e!569640))))

(get-info :version)

(assert (=> b!1012642 (= res!680077 (and (not (= (_2!7587 (h!22602 l!412)) value!115)) ((_ is Cons!21404) l!412)))))

(declare-fun b!1012643 () Bool)

(declare-fun res!680072 () Bool)

(assert (=> b!1012643 (=> (not res!680072) (not e!569641))))

(declare-fun head!926 (List!21408) tuple2!15152)

(assert (=> b!1012643 (= res!680072 (bvslt (_1!7587 (h!22602 l!412)) (_1!7587 (head!926 (t!30400 l!412)))))))

(declare-fun res!680075 () Bool)

(assert (=> start!87414 (=> (not res!680075) (not e!569640))))

(declare-fun isStrictlySorted!539 (List!21408) Bool)

(assert (=> start!87414 (= res!680075 (isStrictlySorted!539 l!412))))

(assert (=> start!87414 e!569640))

(assert (=> start!87414 e!569642))

(assert (=> start!87414 tp_is_empty!23425))

(declare-fun b!1012644 () Bool)

(declare-fun res!680078 () Bool)

(assert (=> b!1012644 (=> (not res!680078) (not e!569641))))

(assert (=> b!1012644 (= res!680078 (isStrictlySorted!539 (t!30400 l!412)))))

(declare-fun b!1012645 () Bool)

(assert (=> b!1012645 (= e!569641 (not (forall!221 lt!447496 lambda!406)))))

(assert (= (and start!87414 res!680075) b!1012642))

(assert (= (and b!1012642 res!680077) b!1012641))

(assert (= (and b!1012641 res!680073) b!1012644))

(assert (= (and b!1012644 res!680078) b!1012639))

(assert (= (and b!1012639 res!680074) b!1012640))

(assert (= (and b!1012640 res!680076) b!1012643))

(assert (= (and b!1012643 res!680072) b!1012645))

(assert (= (and start!87414 ((_ is Cons!21404) l!412)) b!1012638))

(declare-fun m!935503 () Bool)

(assert (=> b!1012644 m!935503))

(declare-fun m!935505 () Bool)

(assert (=> b!1012639 m!935505))

(declare-fun m!935507 () Bool)

(assert (=> b!1012643 m!935507))

(declare-fun m!935509 () Bool)

(assert (=> b!1012640 m!935509))

(declare-fun m!935511 () Bool)

(assert (=> start!87414 m!935511))

(declare-fun m!935513 () Bool)

(assert (=> b!1012641 m!935513))

(declare-fun m!935515 () Bool)

(assert (=> b!1012641 m!935515))

(assert (=> b!1012645 m!935509))

(check-sat tp_is_empty!23425 (not b!1012645) (not start!87414) (not b!1012639) (not b!1012638) (not b!1012641) (not b!1012644) (not b!1012640) (not b!1012643))
(check-sat)
