; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138606 () Bool)

(assert start!138606)

(declare-fun res!1083548 () Bool)

(declare-fun e!886516 () Bool)

(assert (=> start!138606 (=> (not res!1083548) (not e!886516))))

(declare-datatypes ((B!2942 0))(
  ( (B!2943 (val!19833 Int)) )
))
(declare-datatypes ((tuple2!25894 0))(
  ( (tuple2!25895 (_1!12958 (_ BitVec 64)) (_2!12958 B!2942)) )
))
(declare-datatypes ((List!36985 0))(
  ( (Nil!36982) (Cons!36981 (h!38542 tuple2!25894) (t!51896 List!36985)) )
))
(declare-fun l!556 () List!36985)

(declare-fun isStrictlySorted!1166 (List!36985) Bool)

(assert (=> start!138606 (= res!1083548 (isStrictlySorted!1166 l!556))))

(assert (=> start!138606 e!886516))

(declare-fun e!886517 () Bool)

(assert (=> start!138606 e!886517))

(assert (=> start!138606 true))

(declare-fun tp_is_empty!39475 () Bool)

(assert (=> start!138606 tp_is_empty!39475))

(declare-fun b!1587637 () Bool)

(declare-fun res!1083549 () Bool)

(assert (=> b!1587637 (=> (not res!1083549) (not e!886516))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1587637 (= res!1083549 (and ((_ is Cons!36981) l!556) (bvslt (_1!12958 (h!38542 l!556)) newKey!21)))))

(declare-fun b!1587638 () Bool)

(assert (=> b!1587638 (= e!886516 false)))

(declare-fun newValue!21 () B!2942)

(declare-fun lt!678228 () Bool)

(declare-fun $colon$colon!1022 (List!36985 tuple2!25894) List!36985)

(declare-fun insertStrictlySorted!633 (List!36985 (_ BitVec 64) B!2942) List!36985)

(assert (=> b!1587638 (= lt!678228 (isStrictlySorted!1166 ($colon$colon!1022 (insertStrictlySorted!633 (t!51896 l!556) newKey!21 newValue!21) (h!38542 l!556))))))

(declare-fun b!1587639 () Bool)

(declare-fun tp!115180 () Bool)

(assert (=> b!1587639 (= e!886517 (and tp_is_empty!39475 tp!115180))))

(assert (= (and start!138606 res!1083548) b!1587637))

(assert (= (and b!1587637 res!1083549) b!1587638))

(assert (= (and start!138606 ((_ is Cons!36981) l!556)) b!1587639))

(declare-fun m!1456425 () Bool)

(assert (=> start!138606 m!1456425))

(declare-fun m!1456427 () Bool)

(assert (=> b!1587638 m!1456427))

(assert (=> b!1587638 m!1456427))

(declare-fun m!1456429 () Bool)

(assert (=> b!1587638 m!1456429))

(assert (=> b!1587638 m!1456429))

(declare-fun m!1456431 () Bool)

(assert (=> b!1587638 m!1456431))

(check-sat (not b!1587638) (not start!138606) (not b!1587639) tp_is_empty!39475)
(check-sat)
