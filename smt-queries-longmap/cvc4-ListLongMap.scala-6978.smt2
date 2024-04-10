; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88412 () Bool)

(assert start!88412)

(declare-fun b!1017471 () Bool)

(declare-fun res!682438 () Bool)

(declare-fun e!572436 () Bool)

(assert (=> b!1017471 (=> (not res!682438) (not e!572436))))

(declare-datatypes ((B!1578 0))(
  ( (B!1579 (val!11873 Int)) )
))
(declare-datatypes ((tuple2!15292 0))(
  ( (tuple2!15293 (_1!7657 (_ BitVec 64)) (_2!7657 B!1578)) )
))
(declare-datatypes ((List!21561 0))(
  ( (Nil!21558) (Cons!21557 (h!22755 tuple2!15292) (t!30562 List!21561)) )
))
(declare-fun l!1036 () List!21561)

(declare-fun key!271 () (_ BitVec 64))

(assert (=> b!1017471 (= res!682438 (and (is-Cons!21557 l!1036) (not (= (_1!7657 (h!22755 l!1036)) key!271))))))

(declare-fun b!1017472 () Bool)

(declare-fun e!572435 () Bool)

(declare-fun tp_is_empty!23645 () Bool)

(declare-fun tp!70888 () Bool)

(assert (=> b!1017472 (= e!572435 (and tp_is_empty!23645 tp!70888))))

(declare-fun b!1017473 () Bool)

(declare-fun res!682437 () Bool)

(assert (=> b!1017473 (=> (not res!682437) (not e!572436))))

(declare-fun isStrictlySorted!635 (List!21561) Bool)

(assert (=> b!1017473 (= res!682437 (isStrictlySorted!635 (t!30562 l!1036)))))

(declare-fun b!1017475 () Bool)

(declare-fun res!682436 () Bool)

(assert (=> b!1017475 (=> (not res!682436) (not e!572436))))

(declare-datatypes ((Option!619 0))(
  ( (Some!618 (v!14469 B!1578)) (None!617) )
))
(declare-fun isDefined!415 (Option!619) Bool)

(declare-fun getValueByKey!568 (List!21561 (_ BitVec 64)) Option!619)

(assert (=> b!1017475 (= res!682436 (isDefined!415 (getValueByKey!568 (t!30562 l!1036) key!271)))))

(declare-fun b!1017476 () Bool)

(declare-fun res!682439 () Bool)

(assert (=> b!1017476 (=> (not res!682439) (not e!572436))))

(assert (=> b!1017476 (= res!682439 (isDefined!415 (getValueByKey!568 l!1036 key!271)))))

(declare-fun res!682435 () Bool)

(assert (=> start!88412 (=> (not res!682435) (not e!572436))))

(assert (=> start!88412 (= res!682435 (isStrictlySorted!635 l!1036))))

(assert (=> start!88412 e!572436))

(assert (=> start!88412 e!572435))

(assert (=> start!88412 true))

(declare-fun b!1017474 () Bool)

(assert (=> b!1017474 (= e!572436 (not true))))

(declare-fun containsKey!504 (List!21561 (_ BitVec 64)) Bool)

(assert (=> b!1017474 (containsKey!504 (t!30562 l!1036) key!271)))

(declare-datatypes ((Unit!33273 0))(
  ( (Unit!33274) )
))
(declare-fun lt!449457 () Unit!33273)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!24 (List!21561 (_ BitVec 64)) Unit!33273)

(assert (=> b!1017474 (= lt!449457 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!24 (t!30562 l!1036) key!271))))

(assert (= (and start!88412 res!682435) b!1017476))

(assert (= (and b!1017476 res!682439) b!1017471))

(assert (= (and b!1017471 res!682438) b!1017473))

(assert (= (and b!1017473 res!682437) b!1017475))

(assert (= (and b!1017475 res!682436) b!1017474))

(assert (= (and start!88412 (is-Cons!21557 l!1036)) b!1017472))

(declare-fun m!938817 () Bool)

(assert (=> start!88412 m!938817))

(declare-fun m!938819 () Bool)

(assert (=> b!1017473 m!938819))

(declare-fun m!938821 () Bool)

(assert (=> b!1017476 m!938821))

(assert (=> b!1017476 m!938821))

(declare-fun m!938823 () Bool)

(assert (=> b!1017476 m!938823))

(declare-fun m!938825 () Bool)

(assert (=> b!1017475 m!938825))

(assert (=> b!1017475 m!938825))

(declare-fun m!938827 () Bool)

(assert (=> b!1017475 m!938827))

(declare-fun m!938829 () Bool)

(assert (=> b!1017474 m!938829))

(declare-fun m!938831 () Bool)

(assert (=> b!1017474 m!938831))

(push 1)

(assert (not b!1017475))

(assert (not b!1017476))

(assert (not start!88412))

(assert (not b!1017474))

(assert (not b!1017472))

(assert tp_is_empty!23645)

(assert (not b!1017473))

(check-sat)

(pop 1)

(push 1)

