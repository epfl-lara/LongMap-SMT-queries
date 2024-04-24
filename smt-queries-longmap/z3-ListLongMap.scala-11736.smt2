; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138038 () Bool)

(assert start!138038)

(declare-fun b!1584729 () Bool)

(declare-fun e!884534 () Bool)

(declare-fun tp_is_empty!39289 () Bool)

(declare-fun tp!114696 () Bool)

(assert (=> b!1584729 (= e!884534 (and tp_is_empty!39289 tp!114696))))

(declare-fun b!1584726 () Bool)

(declare-fun res!1081870 () Bool)

(declare-fun e!884533 () Bool)

(assert (=> b!1584726 (=> (not res!1081870) (not e!884533))))

(declare-datatypes ((B!2744 0))(
  ( (B!2745 (val!19734 Int)) )
))
(declare-datatypes ((tuple2!25696 0))(
  ( (tuple2!25697 (_1!12859 (_ BitVec 64)) (_2!12859 B!2744)) )
))
(declare-datatypes ((List!36886 0))(
  ( (Nil!36883) (Cons!36882 (h!38443 tuple2!25696) (t!51792 List!36886)) )
))
(declare-fun l!1356 () List!36886)

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!956 (List!36886 (_ BitVec 64)) Bool)

(assert (=> b!1584726 (= res!1081870 (not (containsKey!956 l!1356 key!387)))))

(declare-fun b!1584728 () Bool)

(declare-fun ListPrimitiveSize!202 (List!36886) Int)

(assert (=> b!1584728 (= e!884533 (>= (ListPrimitiveSize!202 (t!51792 l!1356)) (ListPrimitiveSize!202 l!1356)))))

(declare-fun res!1081871 () Bool)

(assert (=> start!138038 (=> (not res!1081871) (not e!884533))))

(declare-fun isStrictlySorted!1097 (List!36886) Bool)

(assert (=> start!138038 (= res!1081871 (isStrictlySorted!1097 l!1356))))

(assert (=> start!138038 e!884533))

(assert (=> start!138038 e!884534))

(assert (=> start!138038 true))

(declare-fun b!1584727 () Bool)

(declare-fun res!1081869 () Bool)

(assert (=> b!1584727 (=> (not res!1081869) (not e!884533))))

(get-info :version)

(assert (=> b!1584727 (= res!1081869 (not ((_ is Nil!36883) l!1356)))))

(assert (= (and start!138038 res!1081871) b!1584726))

(assert (= (and b!1584726 res!1081870) b!1584727))

(assert (= (and b!1584727 res!1081869) b!1584728))

(assert (= (and start!138038 ((_ is Cons!36882) l!1356)) b!1584729))

(declare-fun m!1455105 () Bool)

(assert (=> b!1584726 m!1455105))

(declare-fun m!1455107 () Bool)

(assert (=> b!1584728 m!1455107))

(declare-fun m!1455109 () Bool)

(assert (=> b!1584728 m!1455109))

(declare-fun m!1455111 () Bool)

(assert (=> start!138038 m!1455111))

(check-sat (not start!138038) tp_is_empty!39289 (not b!1584729) (not b!1584726) (not b!1584728))
(check-sat)
(get-model)

(declare-fun d!167663 () Bool)

(declare-fun res!1081900 () Bool)

(declare-fun e!884559 () Bool)

(assert (=> d!167663 (=> res!1081900 e!884559)))

(assert (=> d!167663 (= res!1081900 (and ((_ is Cons!36882) l!1356) (= (_1!12859 (h!38443 l!1356)) key!387)))))

(assert (=> d!167663 (= (containsKey!956 l!1356 key!387) e!884559)))

(declare-fun b!1584768 () Bool)

(declare-fun e!884560 () Bool)

(assert (=> b!1584768 (= e!884559 e!884560)))

(declare-fun res!1081901 () Bool)

(assert (=> b!1584768 (=> (not res!1081901) (not e!884560))))

(assert (=> b!1584768 (= res!1081901 (and (or (not ((_ is Cons!36882) l!1356)) (bvsle (_1!12859 (h!38443 l!1356)) key!387)) ((_ is Cons!36882) l!1356) (bvslt (_1!12859 (h!38443 l!1356)) key!387)))))

(declare-fun b!1584769 () Bool)

(assert (=> b!1584769 (= e!884560 (containsKey!956 (t!51792 l!1356) key!387))))

(assert (= (and d!167663 (not res!1081900)) b!1584768))

(assert (= (and b!1584768 res!1081901) b!1584769))

(declare-fun m!1455131 () Bool)

(assert (=> b!1584769 m!1455131))

(assert (=> b!1584726 d!167663))

(declare-fun d!167669 () Bool)

(declare-fun lt!677968 () Int)

(assert (=> d!167669 (>= lt!677968 0)))

(declare-fun e!884573 () Int)

(assert (=> d!167669 (= lt!677968 e!884573)))

(declare-fun c!147453 () Bool)

(assert (=> d!167669 (= c!147453 ((_ is Nil!36883) (t!51792 l!1356)))))

(assert (=> d!167669 (= (ListPrimitiveSize!202 (t!51792 l!1356)) lt!677968)))

(declare-fun b!1584786 () Bool)

(assert (=> b!1584786 (= e!884573 0)))

(declare-fun b!1584787 () Bool)

(assert (=> b!1584787 (= e!884573 (+ 1 (ListPrimitiveSize!202 (t!51792 (t!51792 l!1356)))))))

(assert (= (and d!167669 c!147453) b!1584786))

(assert (= (and d!167669 (not c!147453)) b!1584787))

(declare-fun m!1455135 () Bool)

(assert (=> b!1584787 m!1455135))

(assert (=> b!1584728 d!167669))

(declare-fun d!167675 () Bool)

(declare-fun lt!677969 () Int)

(assert (=> d!167675 (>= lt!677969 0)))

(declare-fun e!884574 () Int)

(assert (=> d!167675 (= lt!677969 e!884574)))

(declare-fun c!147454 () Bool)

(assert (=> d!167675 (= c!147454 ((_ is Nil!36883) l!1356))))

(assert (=> d!167675 (= (ListPrimitiveSize!202 l!1356) lt!677969)))

(declare-fun b!1584788 () Bool)

(assert (=> b!1584788 (= e!884574 0)))

(declare-fun b!1584789 () Bool)

(assert (=> b!1584789 (= e!884574 (+ 1 (ListPrimitiveSize!202 (t!51792 l!1356))))))

(assert (= (and d!167675 c!147454) b!1584788))

(assert (= (and d!167675 (not c!147454)) b!1584789))

(assert (=> b!1584789 m!1455107))

(assert (=> b!1584728 d!167675))

(declare-fun d!167677 () Bool)

(declare-fun res!1081922 () Bool)

(declare-fun e!884590 () Bool)

(assert (=> d!167677 (=> res!1081922 e!884590)))

(assert (=> d!167677 (= res!1081922 (or ((_ is Nil!36883) l!1356) ((_ is Nil!36883) (t!51792 l!1356))))))

(assert (=> d!167677 (= (isStrictlySorted!1097 l!1356) e!884590)))

(declare-fun b!1584806 () Bool)

(declare-fun e!884591 () Bool)

(assert (=> b!1584806 (= e!884590 e!884591)))

(declare-fun res!1081923 () Bool)

(assert (=> b!1584806 (=> (not res!1081923) (not e!884591))))

(assert (=> b!1584806 (= res!1081923 (bvslt (_1!12859 (h!38443 l!1356)) (_1!12859 (h!38443 (t!51792 l!1356)))))))

(declare-fun b!1584807 () Bool)

(assert (=> b!1584807 (= e!884591 (isStrictlySorted!1097 (t!51792 l!1356)))))

(assert (= (and d!167677 (not res!1081922)) b!1584806))

(assert (= (and b!1584806 res!1081923) b!1584807))

(declare-fun m!1455143 () Bool)

(assert (=> b!1584807 m!1455143))

(assert (=> start!138038 d!167677))

(declare-fun b!1584820 () Bool)

(declare-fun e!884597 () Bool)

(declare-fun tp!114707 () Bool)

(assert (=> b!1584820 (= e!884597 (and tp_is_empty!39289 tp!114707))))

(assert (=> b!1584729 (= tp!114696 e!884597)))

(assert (= (and b!1584729 ((_ is Cons!36882) (t!51792 l!1356))) b!1584820))

(check-sat (not b!1584820) tp_is_empty!39289 (not b!1584807) (not b!1584787) (not b!1584789) (not b!1584769))
(check-sat)
