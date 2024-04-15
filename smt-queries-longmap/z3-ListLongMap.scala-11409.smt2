; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132798 () Bool)

(assert start!132798)

(declare-fun res!1064446 () Bool)

(declare-fun e!866392 () Bool)

(assert (=> start!132798 (=> (not res!1064446) (not e!866392))))

(declare-datatypes ((B!2330 0))(
  ( (B!2331 (val!19251 Int)) )
))
(declare-datatypes ((tuple2!24950 0))(
  ( (tuple2!24951 (_1!12486 (_ BitVec 64)) (_2!12486 B!2330)) )
))
(declare-datatypes ((List!36330 0))(
  ( (Nil!36327) (Cons!36326 (h!37773 tuple2!24950) (t!51043 List!36330)) )
))
(declare-fun l!1177 () List!36330)

(declare-fun isStrictlySorted!936 (List!36330) Bool)

(assert (=> start!132798 (= res!1064446 (isStrictlySorted!936 l!1177))))

(assert (=> start!132798 e!866392))

(declare-fun e!866393 () Bool)

(assert (=> start!132798 e!866393))

(assert (=> start!132798 true))

(declare-fun b!1555700 () Bool)

(declare-fun res!1064445 () Bool)

(assert (=> b!1555700 (=> (not res!1064445) (not e!866392))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1555700 (= res!1064445 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1555701 () Bool)

(declare-fun ListPrimitiveSize!175 (List!36330) Int)

(assert (=> b!1555701 (= e!866392 (< (ListPrimitiveSize!175 l!1177) 0))))

(declare-fun b!1555702 () Bool)

(declare-fun tp_is_empty!38341 () Bool)

(declare-fun tp!112372 () Bool)

(assert (=> b!1555702 (= e!866393 (and tp_is_empty!38341 tp!112372))))

(assert (= (and start!132798 res!1064446) b!1555700))

(assert (= (and b!1555700 res!1064445) b!1555701))

(get-info :version)

(assert (= (and start!132798 ((_ is Cons!36326) l!1177)) b!1555702))

(declare-fun m!1432859 () Bool)

(assert (=> start!132798 m!1432859))

(declare-fun m!1432861 () Bool)

(assert (=> b!1555701 m!1432861))

(check-sat (not b!1555701) (not start!132798) (not b!1555702) tp_is_empty!38341)
(check-sat)
(get-model)

(declare-fun d!161795 () Bool)

(declare-fun lt!670087 () Int)

(assert (=> d!161795 (>= lt!670087 0)))

(declare-fun e!866408 () Int)

(assert (=> d!161795 (= lt!670087 e!866408)))

(declare-fun c!143619 () Bool)

(assert (=> d!161795 (= c!143619 ((_ is Nil!36327) l!1177))))

(assert (=> d!161795 (= (ListPrimitiveSize!175 l!1177) lt!670087)))

(declare-fun b!1555725 () Bool)

(assert (=> b!1555725 (= e!866408 0)))

(declare-fun b!1555726 () Bool)

(assert (=> b!1555726 (= e!866408 (+ 1 (ListPrimitiveSize!175 (t!51043 l!1177))))))

(assert (= (and d!161795 c!143619) b!1555725))

(assert (= (and d!161795 (not c!143619)) b!1555726))

(declare-fun m!1432871 () Bool)

(assert (=> b!1555726 m!1432871))

(assert (=> b!1555701 d!161795))

(declare-fun d!161801 () Bool)

(declare-fun res!1064469 () Bool)

(declare-fun e!866424 () Bool)

(assert (=> d!161801 (=> res!1064469 e!866424)))

(assert (=> d!161801 (= res!1064469 (or ((_ is Nil!36327) l!1177) ((_ is Nil!36327) (t!51043 l!1177))))))

(assert (=> d!161801 (= (isStrictlySorted!936 l!1177) e!866424)))

(declare-fun b!1555747 () Bool)

(declare-fun e!866425 () Bool)

(assert (=> b!1555747 (= e!866424 e!866425)))

(declare-fun res!1064470 () Bool)

(assert (=> b!1555747 (=> (not res!1064470) (not e!866425))))

(assert (=> b!1555747 (= res!1064470 (bvslt (_1!12486 (h!37773 l!1177)) (_1!12486 (h!37773 (t!51043 l!1177)))))))

(declare-fun b!1555748 () Bool)

(assert (=> b!1555748 (= e!866425 (isStrictlySorted!936 (t!51043 l!1177)))))

(assert (= (and d!161801 (not res!1064469)) b!1555747))

(assert (= (and b!1555747 res!1064470) b!1555748))

(declare-fun m!1432877 () Bool)

(assert (=> b!1555748 m!1432877))

(assert (=> start!132798 d!161801))

(declare-fun b!1555757 () Bool)

(declare-fun e!866432 () Bool)

(declare-fun tp!112381 () Bool)

(assert (=> b!1555757 (= e!866432 (and tp_is_empty!38341 tp!112381))))

(assert (=> b!1555702 (= tp!112372 e!866432)))

(assert (= (and b!1555702 ((_ is Cons!36326) (t!51043 l!1177))) b!1555757))

(check-sat (not b!1555748) (not b!1555726) (not b!1555757) tp_is_empty!38341)
(check-sat)
