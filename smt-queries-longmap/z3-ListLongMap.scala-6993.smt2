; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88888 () Bool)

(assert start!88888)

(declare-fun res!683533 () Bool)

(declare-fun e!574034 () Bool)

(assert (=> start!88888 (=> (not res!683533) (not e!574034))))

(declare-datatypes ((B!1664 0))(
  ( (B!1665 (val!11916 Int)) )
))
(declare-datatypes ((tuple2!15382 0))(
  ( (tuple2!15383 (_1!7702 (_ BitVec 64)) (_2!7702 B!1664)) )
))
(declare-datatypes ((List!21593 0))(
  ( (Nil!21590) (Cons!21589 (h!22796 tuple2!15382) (t!30589 List!21593)) )
))
(declare-fun l!996 () List!21593)

(declare-fun isStrictlySorted!657 (List!21593) Bool)

(assert (=> start!88888 (= res!683533 (isStrictlySorted!657 l!996))))

(assert (=> start!88888 e!574034))

(declare-fun e!574035 () Bool)

(assert (=> start!88888 e!574035))

(assert (=> start!88888 true))

(declare-fun b!1019971 () Bool)

(declare-fun res!683534 () Bool)

(assert (=> b!1019971 (=> (not res!683534) (not e!574034))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!531 (List!21593 (_ BitVec 64)) Bool)

(assert (=> b!1019971 (= res!683534 (containsKey!531 l!996 key!261))))

(declare-fun b!1019972 () Bool)

(declare-fun ListPrimitiveSize!133 (List!21593) Int)

(assert (=> b!1019972 (= e!574034 (< (ListPrimitiveSize!133 l!996) 0))))

(declare-fun b!1019973 () Bool)

(declare-fun tp_is_empty!23731 () Bool)

(declare-fun tp!71077 () Bool)

(assert (=> b!1019973 (= e!574035 (and tp_is_empty!23731 tp!71077))))

(assert (= (and start!88888 res!683533) b!1019971))

(assert (= (and b!1019971 res!683534) b!1019972))

(get-info :version)

(assert (= (and start!88888 ((_ is Cons!21589) l!996)) b!1019973))

(declare-fun m!941097 () Bool)

(assert (=> start!88888 m!941097))

(declare-fun m!941099 () Bool)

(assert (=> b!1019971 m!941099))

(declare-fun m!941101 () Bool)

(assert (=> b!1019972 m!941101))

(check-sat (not start!88888) (not b!1019972) (not b!1019973) tp_is_empty!23731 (not b!1019971))
(check-sat)
(get-model)

(declare-fun d!122381 () Bool)

(declare-fun lt!450100 () Int)

(assert (=> d!122381 (>= lt!450100 0)))

(declare-fun e!574056 () Int)

(assert (=> d!122381 (= lt!450100 e!574056)))

(declare-fun c!103607 () Bool)

(assert (=> d!122381 (= c!103607 ((_ is Nil!21590) l!996))))

(assert (=> d!122381 (= (ListPrimitiveSize!133 l!996) lt!450100)))

(declare-fun b!1020002 () Bool)

(assert (=> b!1020002 (= e!574056 0)))

(declare-fun b!1020003 () Bool)

(assert (=> b!1020003 (= e!574056 (+ 1 (ListPrimitiveSize!133 (t!30589 l!996))))))

(assert (= (and d!122381 c!103607) b!1020002))

(assert (= (and d!122381 (not c!103607)) b!1020003))

(declare-fun m!941115 () Bool)

(assert (=> b!1020003 m!941115))

(assert (=> b!1019972 d!122381))

(declare-fun d!122387 () Bool)

(declare-fun res!683565 () Bool)

(declare-fun e!574072 () Bool)

(assert (=> d!122387 (=> res!683565 e!574072)))

(assert (=> d!122387 (= res!683565 (and ((_ is Cons!21589) l!996) (= (_1!7702 (h!22796 l!996)) key!261)))))

(assert (=> d!122387 (= (containsKey!531 l!996 key!261) e!574072)))

(declare-fun b!1020022 () Bool)

(declare-fun e!574073 () Bool)

(assert (=> b!1020022 (= e!574072 e!574073)))

(declare-fun res!683566 () Bool)

(assert (=> b!1020022 (=> (not res!683566) (not e!574073))))

(assert (=> b!1020022 (= res!683566 (and (or (not ((_ is Cons!21589) l!996)) (bvsle (_1!7702 (h!22796 l!996)) key!261)) ((_ is Cons!21589) l!996) (bvslt (_1!7702 (h!22796 l!996)) key!261)))))

(declare-fun b!1020023 () Bool)

(assert (=> b!1020023 (= e!574073 (containsKey!531 (t!30589 l!996) key!261))))

(assert (= (and d!122387 (not res!683565)) b!1020022))

(assert (= (and b!1020022 res!683566) b!1020023))

(declare-fun m!941121 () Bool)

(assert (=> b!1020023 m!941121))

(assert (=> b!1019971 d!122387))

(declare-fun d!122393 () Bool)

(declare-fun res!683579 () Bool)

(declare-fun e!574088 () Bool)

(assert (=> d!122393 (=> res!683579 e!574088)))

(assert (=> d!122393 (= res!683579 (or ((_ is Nil!21590) l!996) ((_ is Nil!21590) (t!30589 l!996))))))

(assert (=> d!122393 (= (isStrictlySorted!657 l!996) e!574088)))

(declare-fun b!1020040 () Bool)

(declare-fun e!574089 () Bool)

(assert (=> b!1020040 (= e!574088 e!574089)))

(declare-fun res!683580 () Bool)

(assert (=> b!1020040 (=> (not res!683580) (not e!574089))))

(assert (=> b!1020040 (= res!683580 (bvslt (_1!7702 (h!22796 l!996)) (_1!7702 (h!22796 (t!30589 l!996)))))))

(declare-fun b!1020041 () Bool)

(assert (=> b!1020041 (= e!574089 (isStrictlySorted!657 (t!30589 l!996)))))

(assert (= (and d!122393 (not res!683579)) b!1020040))

(assert (= (and b!1020040 res!683580) b!1020041))

(declare-fun m!941127 () Bool)

(assert (=> b!1020041 m!941127))

(assert (=> start!88888 d!122393))

(declare-fun b!1020054 () Bool)

(declare-fun e!574097 () Bool)

(declare-fun tp!71088 () Bool)

(assert (=> b!1020054 (= e!574097 (and tp_is_empty!23731 tp!71088))))

(assert (=> b!1019973 (= tp!71077 e!574097)))

(assert (= (and b!1019973 ((_ is Cons!21589) (t!30589 l!996))) b!1020054))

(check-sat tp_is_empty!23731 (not b!1020054) (not b!1020003) (not b!1020023) (not b!1020041))
(check-sat)
