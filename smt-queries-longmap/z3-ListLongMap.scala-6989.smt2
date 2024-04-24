; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88834 () Bool)

(assert start!88834)

(declare-fun b!1019626 () Bool)

(declare-fun e!573806 () Bool)

(assert (=> b!1019626 (= e!573806 (not true))))

(declare-datatypes ((B!1640 0))(
  ( (B!1641 (val!11904 Int)) )
))
(declare-datatypes ((tuple2!15358 0))(
  ( (tuple2!15359 (_1!7690 (_ BitVec 64)) (_2!7690 B!1640)) )
))
(declare-datatypes ((List!21581 0))(
  ( (Nil!21578) (Cons!21577 (h!22784 tuple2!15358) (t!30574 List!21581)) )
))
(declare-fun l!996 () List!21581)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun value!172 () B!1640)

(declare-fun length!41 (List!21581) Int)

(declare-fun insertStrictlySorted!339 (List!21581 (_ BitVec 64) B!1640) List!21581)

(assert (=> b!1019626 (= (length!41 (insertStrictlySorted!339 (t!30574 l!996) key!261 value!172)) (length!41 (t!30574 l!996)))))

(declare-datatypes ((Unit!33282 0))(
  ( (Unit!33283) )
))
(declare-fun lt!450035 () Unit!33282)

(declare-fun lemmaAddExistingKeyPreservesSize!1 (List!21581 (_ BitVec 64) B!1640) Unit!33282)

(assert (=> b!1019626 (= lt!450035 (lemmaAddExistingKeyPreservesSize!1 (t!30574 l!996) key!261 value!172))))

(declare-fun res!683341 () Bool)

(declare-fun e!573807 () Bool)

(assert (=> start!88834 (=> (not res!683341) (not e!573807))))

(declare-fun isStrictlySorted!645 (List!21581) Bool)

(assert (=> start!88834 (= res!683341 (isStrictlySorted!645 l!996))))

(assert (=> start!88834 e!573807))

(declare-fun e!573805 () Bool)

(assert (=> start!88834 e!573805))

(assert (=> start!88834 true))

(declare-fun tp_is_empty!23707 () Bool)

(assert (=> start!88834 tp_is_empty!23707))

(declare-fun b!1019627 () Bool)

(declare-fun res!683342 () Bool)

(assert (=> b!1019627 (=> (not res!683342) (not e!573806))))

(declare-fun containsKey!519 (List!21581 (_ BitVec 64)) Bool)

(assert (=> b!1019627 (= res!683342 (containsKey!519 (t!30574 l!996) key!261))))

(declare-fun b!1019628 () Bool)

(assert (=> b!1019628 (= e!573807 e!573806)))

(declare-fun res!683338 () Bool)

(assert (=> b!1019628 (=> (not res!683338) (not e!573806))))

(get-info :version)

(assert (=> b!1019628 (= res!683338 (and ((_ is Cons!21577) l!996) (bvslt (_1!7690 (h!22784 l!996)) key!261)))))

(declare-fun lt!450034 () List!21581)

(assert (=> b!1019628 (= lt!450034 (insertStrictlySorted!339 l!996 key!261 value!172))))

(declare-fun b!1019629 () Bool)

(declare-fun res!683340 () Bool)

(assert (=> b!1019629 (=> (not res!683340) (not e!573807))))

(assert (=> b!1019629 (= res!683340 (containsKey!519 l!996 key!261))))

(declare-fun b!1019630 () Bool)

(declare-fun tp!71029 () Bool)

(assert (=> b!1019630 (= e!573805 (and tp_is_empty!23707 tp!71029))))

(declare-fun b!1019631 () Bool)

(declare-fun res!683339 () Bool)

(assert (=> b!1019631 (=> (not res!683339) (not e!573806))))

(assert (=> b!1019631 (= res!683339 (isStrictlySorted!645 (t!30574 l!996)))))

(assert (= (and start!88834 res!683341) b!1019629))

(assert (= (and b!1019629 res!683340) b!1019628))

(assert (= (and b!1019628 res!683338) b!1019631))

(assert (= (and b!1019631 res!683339) b!1019627))

(assert (= (and b!1019627 res!683342) b!1019626))

(assert (= (and start!88834 ((_ is Cons!21577) l!996)) b!1019630))

(declare-fun m!940875 () Bool)

(assert (=> b!1019629 m!940875))

(declare-fun m!940877 () Bool)

(assert (=> b!1019626 m!940877))

(assert (=> b!1019626 m!940877))

(declare-fun m!940879 () Bool)

(assert (=> b!1019626 m!940879))

(declare-fun m!940881 () Bool)

(assert (=> b!1019626 m!940881))

(declare-fun m!940883 () Bool)

(assert (=> b!1019626 m!940883))

(declare-fun m!940885 () Bool)

(assert (=> start!88834 m!940885))

(declare-fun m!940887 () Bool)

(assert (=> b!1019631 m!940887))

(declare-fun m!940889 () Bool)

(assert (=> b!1019627 m!940889))

(declare-fun m!940891 () Bool)

(assert (=> b!1019628 m!940891))

(check-sat (not b!1019628) (not b!1019627) (not start!88834) (not b!1019629) (not b!1019626) (not b!1019631) tp_is_empty!23707 (not b!1019630))
(check-sat)
