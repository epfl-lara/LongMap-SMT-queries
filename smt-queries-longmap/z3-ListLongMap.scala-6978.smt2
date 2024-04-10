; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88410 () Bool)

(assert start!88410)

(declare-fun b!1017453 () Bool)

(declare-fun e!572430 () Bool)

(assert (=> b!1017453 (= e!572430 (not true))))

(declare-datatypes ((B!1576 0))(
  ( (B!1577 (val!11872 Int)) )
))
(declare-datatypes ((tuple2!15290 0))(
  ( (tuple2!15291 (_1!7656 (_ BitVec 64)) (_2!7656 B!1576)) )
))
(declare-datatypes ((List!21560 0))(
  ( (Nil!21557) (Cons!21556 (h!22754 tuple2!15290) (t!30561 List!21560)) )
))
(declare-fun l!1036 () List!21560)

(declare-fun key!271 () (_ BitVec 64))

(declare-fun containsKey!503 (List!21560 (_ BitVec 64)) Bool)

(assert (=> b!1017453 (containsKey!503 (t!30561 l!1036) key!271)))

(declare-datatypes ((Unit!33271 0))(
  ( (Unit!33272) )
))
(declare-fun lt!449454 () Unit!33271)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!23 (List!21560 (_ BitVec 64)) Unit!33271)

(assert (=> b!1017453 (= lt!449454 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!23 (t!30561 l!1036) key!271))))

(declare-fun b!1017454 () Bool)

(declare-fun e!572429 () Bool)

(declare-fun tp_is_empty!23643 () Bool)

(declare-fun tp!70885 () Bool)

(assert (=> b!1017454 (= e!572429 (and tp_is_empty!23643 tp!70885))))

(declare-fun b!1017456 () Bool)

(declare-fun res!682420 () Bool)

(assert (=> b!1017456 (=> (not res!682420) (not e!572430))))

(declare-fun isStrictlySorted!634 (List!21560) Bool)

(assert (=> b!1017456 (= res!682420 (isStrictlySorted!634 (t!30561 l!1036)))))

(declare-fun b!1017457 () Bool)

(declare-fun res!682421 () Bool)

(assert (=> b!1017457 (=> (not res!682421) (not e!572430))))

(get-info :version)

(assert (=> b!1017457 (= res!682421 (and ((_ is Cons!21556) l!1036) (not (= (_1!7656 (h!22754 l!1036)) key!271))))))

(declare-fun b!1017458 () Bool)

(declare-fun res!682422 () Bool)

(assert (=> b!1017458 (=> (not res!682422) (not e!572430))))

(declare-datatypes ((Option!618 0))(
  ( (Some!617 (v!14468 B!1576)) (None!616) )
))
(declare-fun isDefined!414 (Option!618) Bool)

(declare-fun getValueByKey!567 (List!21560 (_ BitVec 64)) Option!618)

(assert (=> b!1017458 (= res!682422 (isDefined!414 (getValueByKey!567 (t!30561 l!1036) key!271)))))

(declare-fun res!682423 () Bool)

(assert (=> start!88410 (=> (not res!682423) (not e!572430))))

(assert (=> start!88410 (= res!682423 (isStrictlySorted!634 l!1036))))

(assert (=> start!88410 e!572430))

(assert (=> start!88410 e!572429))

(assert (=> start!88410 true))

(declare-fun b!1017455 () Bool)

(declare-fun res!682424 () Bool)

(assert (=> b!1017455 (=> (not res!682424) (not e!572430))))

(assert (=> b!1017455 (= res!682424 (isDefined!414 (getValueByKey!567 l!1036 key!271)))))

(assert (= (and start!88410 res!682423) b!1017455))

(assert (= (and b!1017455 res!682424) b!1017457))

(assert (= (and b!1017457 res!682421) b!1017456))

(assert (= (and b!1017456 res!682420) b!1017458))

(assert (= (and b!1017458 res!682422) b!1017453))

(assert (= (and start!88410 ((_ is Cons!21556) l!1036)) b!1017454))

(declare-fun m!938801 () Bool)

(assert (=> b!1017458 m!938801))

(assert (=> b!1017458 m!938801))

(declare-fun m!938803 () Bool)

(assert (=> b!1017458 m!938803))

(declare-fun m!938805 () Bool)

(assert (=> b!1017456 m!938805))

(declare-fun m!938807 () Bool)

(assert (=> start!88410 m!938807))

(declare-fun m!938809 () Bool)

(assert (=> b!1017455 m!938809))

(assert (=> b!1017455 m!938809))

(declare-fun m!938811 () Bool)

(assert (=> b!1017455 m!938811))

(declare-fun m!938813 () Bool)

(assert (=> b!1017453 m!938813))

(declare-fun m!938815 () Bool)

(assert (=> b!1017453 m!938815))

(check-sat tp_is_empty!23643 (not b!1017458) (not b!1017453) (not b!1017454) (not start!88410) (not b!1017456) (not b!1017455))
(check-sat)
