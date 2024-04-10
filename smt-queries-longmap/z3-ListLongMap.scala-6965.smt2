; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87944 () Bool)

(assert start!87944)

(declare-fun b!1015668 () Bool)

(assert (=> b!1015668 true))

(assert (=> b!1015668 true))

(declare-fun res!681261 () Bool)

(declare-fun e!571377 () Bool)

(assert (=> start!87944 (=> (not res!681261) (not e!571377))))

(declare-datatypes ((B!1498 0))(
  ( (B!1499 (val!11833 Int)) )
))
(declare-datatypes ((tuple2!15212 0))(
  ( (tuple2!15213 (_1!7617 (_ BitVec 64)) (_2!7617 B!1498)) )
))
(declare-datatypes ((List!21489 0))(
  ( (Nil!21486) (Cons!21485 (h!22683 tuple2!15212) (t!30490 List!21489)) )
))
(declare-fun l!1114 () List!21489)

(declare-fun isStrictlySorted!601 (List!21489) Bool)

(assert (=> start!87944 (= res!681261 (isStrictlySorted!601 l!1114))))

(assert (=> start!87944 e!571377))

(declare-fun e!571378 () Bool)

(assert (=> start!87944 e!571378))

(assert (=> start!87944 true))

(declare-fun tp_is_empty!23565 () Bool)

(assert (=> start!87944 tp_is_empty!23565))

(declare-fun b!1015663 () Bool)

(declare-fun tp!70685 () Bool)

(assert (=> b!1015663 (= e!571378 (and tp_is_empty!23565 tp!70685))))

(declare-fun b!1015664 () Bool)

(declare-fun res!681260 () Bool)

(assert (=> b!1015664 (=> (not res!681260) (not e!571377))))

(declare-fun newHead!31 () tuple2!15212)

(declare-fun head!950 (List!21489) tuple2!15212)

(assert (=> b!1015664 (= res!681260 (bvslt (_1!7617 newHead!31) (_1!7617 (head!950 l!1114))))))

(declare-fun b!1015665 () Bool)

(declare-fun res!681263 () Bool)

(assert (=> b!1015665 (=> (not res!681263) (not e!571377))))

(declare-datatypes ((List!21490 0))(
  ( (Nil!21487) (Cons!21486 (h!22684 (_ BitVec 64)) (t!30491 List!21490)) )
))
(declare-fun keys!40 () List!21490)

(get-info :version)

(assert (=> b!1015665 (= res!681263 ((_ is Cons!21486) keys!40))))

(declare-fun b!1015666 () Bool)

(assert (=> b!1015666 (= e!571377 (not true))))

(declare-fun containsKey!482 (List!21489 (_ BitVec 64)) Bool)

(assert (=> b!1015666 (containsKey!482 l!1114 (h!22684 keys!40))))

(declare-datatypes ((Unit!33229 0))(
  ( (Unit!33230) )
))
(declare-fun lt!449154 () Unit!33229)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!2 (List!21489 (_ BitVec 64)) Unit!33229)

(assert (=> b!1015666 (= lt!449154 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!2 l!1114 (h!22684 keys!40)))))

(declare-fun b!1015667 () Bool)

(declare-fun res!681264 () Bool)

(assert (=> b!1015667 (=> (not res!681264) (not e!571377))))

(declare-fun isEmpty!860 (List!21489) Bool)

(assert (=> b!1015667 (= res!681264 (not (isEmpty!860 l!1114)))))

(declare-fun res!681262 () Bool)

(assert (=> b!1015668 (=> (not res!681262) (not e!571377))))

(declare-fun lambda!923 () Int)

(declare-fun forall!263 (List!21490 Int) Bool)

(assert (=> b!1015668 (= res!681262 (forall!263 keys!40 lambda!923))))

(assert (= (and start!87944 res!681261) b!1015667))

(assert (= (and b!1015667 res!681264) b!1015668))

(assert (= (and b!1015668 res!681262) b!1015664))

(assert (= (and b!1015664 res!681260) b!1015665))

(assert (= (and b!1015665 res!681263) b!1015666))

(assert (= (and start!87944 ((_ is Cons!21485) l!1114)) b!1015663))

(declare-fun m!937613 () Bool)

(assert (=> b!1015668 m!937613))

(declare-fun m!937615 () Bool)

(assert (=> start!87944 m!937615))

(declare-fun m!937617 () Bool)

(assert (=> b!1015666 m!937617))

(declare-fun m!937619 () Bool)

(assert (=> b!1015666 m!937619))

(declare-fun m!937621 () Bool)

(assert (=> b!1015664 m!937621))

(declare-fun m!937623 () Bool)

(assert (=> b!1015667 m!937623))

(check-sat (not b!1015664) (not b!1015663) (not b!1015667) (not b!1015668) tp_is_empty!23565 (not b!1015666) (not start!87944))
