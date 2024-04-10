; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133180 () Bool)

(assert start!133180)

(declare-fun b!1558155 () Bool)

(declare-fun res!1065665 () Bool)

(declare-fun e!867976 () Bool)

(assert (=> b!1558155 (=> (not res!1065665) (not e!867976))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1558155 (= res!1065665 (not (= otherKey!62 newKey!135)))))

(declare-fun b!1558156 () Bool)

(declare-datatypes ((B!2422 0))(
  ( (B!2423 (val!19297 Int)) )
))
(declare-datatypes ((tuple2!24970 0))(
  ( (tuple2!24971 (_1!12496 (_ BitVec 64)) (_2!12496 B!2422)) )
))
(declare-datatypes ((List!36331 0))(
  ( (Nil!36328) (Cons!36327 (h!37773 tuple2!24970) (t!51058 List!36331)) )
))
(declare-fun l!1292 () List!36331)

(declare-fun ListPrimitiveSize!182 (List!36331) Int)

(assert (=> b!1558156 (= e!867976 (< (ListPrimitiveSize!182 l!1292) 0))))

(declare-fun b!1558157 () Bool)

(declare-fun e!867977 () Bool)

(declare-fun tp_is_empty!38427 () Bool)

(declare-fun tp!112605 () Bool)

(assert (=> b!1558157 (= e!867977 (and tp_is_empty!38427 tp!112605))))

(declare-fun b!1558154 () Bool)

(declare-fun res!1065667 () Bool)

(assert (=> b!1558154 (=> (not res!1065667) (not e!867976))))

(declare-fun containsKey!834 (List!36331 (_ BitVec 64)) Bool)

(assert (=> b!1558154 (= res!1065667 (containsKey!834 l!1292 otherKey!62))))

(declare-fun res!1065666 () Bool)

(assert (=> start!133180 (=> (not res!1065666) (not e!867976))))

(declare-fun isStrictlySorted!971 (List!36331) Bool)

(assert (=> start!133180 (= res!1065666 (isStrictlySorted!971 l!1292))))

(assert (=> start!133180 e!867976))

(assert (=> start!133180 e!867977))

(assert (=> start!133180 true))

(assert (= (and start!133180 res!1065666) b!1558154))

(assert (= (and b!1558154 res!1065667) b!1558155))

(assert (= (and b!1558155 res!1065665) b!1558156))

(get-info :version)

(assert (= (and start!133180 ((_ is Cons!36327) l!1292)) b!1558157))

(declare-fun m!1434975 () Bool)

(assert (=> b!1558156 m!1434975))

(declare-fun m!1434977 () Bool)

(assert (=> b!1558154 m!1434977))

(declare-fun m!1434979 () Bool)

(assert (=> start!133180 m!1434979))

(check-sat (not start!133180) (not b!1558157) (not b!1558156) (not b!1558154) tp_is_empty!38427)
(check-sat)
(get-model)

(declare-fun d!162597 () Bool)

(declare-fun res!1065685 () Bool)

(declare-fun e!867992 () Bool)

(assert (=> d!162597 (=> res!1065685 e!867992)))

(assert (=> d!162597 (= res!1065685 (and ((_ is Cons!36327) l!1292) (= (_1!12496 (h!37773 l!1292)) otherKey!62)))))

(assert (=> d!162597 (= (containsKey!834 l!1292 otherKey!62) e!867992)))

(declare-fun b!1558178 () Bool)

(declare-fun e!867993 () Bool)

(assert (=> b!1558178 (= e!867992 e!867993)))

(declare-fun res!1065686 () Bool)

(assert (=> b!1558178 (=> (not res!1065686) (not e!867993))))

(assert (=> b!1558178 (= res!1065686 (and (or (not ((_ is Cons!36327) l!1292)) (bvsle (_1!12496 (h!37773 l!1292)) otherKey!62)) ((_ is Cons!36327) l!1292) (bvslt (_1!12496 (h!37773 l!1292)) otherKey!62)))))

(declare-fun b!1558179 () Bool)

(assert (=> b!1558179 (= e!867993 (containsKey!834 (t!51058 l!1292) otherKey!62))))

(assert (= (and d!162597 (not res!1065685)) b!1558178))

(assert (= (and b!1558178 res!1065686) b!1558179))

(declare-fun m!1434987 () Bool)

(assert (=> b!1558179 m!1434987))

(assert (=> b!1558154 d!162597))

(declare-fun d!162601 () Bool)

(declare-fun lt!670768 () Int)

(assert (=> d!162601 (>= lt!670768 0)))

(declare-fun e!868000 () Int)

(assert (=> d!162601 (= lt!670768 e!868000)))

(declare-fun c!144088 () Bool)

(assert (=> d!162601 (= c!144088 ((_ is Nil!36328) l!1292))))

(assert (=> d!162601 (= (ListPrimitiveSize!182 l!1292) lt!670768)))

(declare-fun b!1558190 () Bool)

(assert (=> b!1558190 (= e!868000 0)))

(declare-fun b!1558191 () Bool)

(assert (=> b!1558191 (= e!868000 (+ 1 (ListPrimitiveSize!182 (t!51058 l!1292))))))

(assert (= (and d!162601 c!144088) b!1558190))

(assert (= (and d!162601 (not c!144088)) b!1558191))

(declare-fun m!1434991 () Bool)

(assert (=> b!1558191 m!1434991))

(assert (=> b!1558156 d!162601))

(declare-fun d!162605 () Bool)

(declare-fun res!1065695 () Bool)

(declare-fun e!868011 () Bool)

(assert (=> d!162605 (=> res!1065695 e!868011)))

(assert (=> d!162605 (= res!1065695 (or ((_ is Nil!36328) l!1292) ((_ is Nil!36328) (t!51058 l!1292))))))

(assert (=> d!162605 (= (isStrictlySorted!971 l!1292) e!868011)))

(declare-fun b!1558206 () Bool)

(declare-fun e!868012 () Bool)

(assert (=> b!1558206 (= e!868011 e!868012)))

(declare-fun res!1065696 () Bool)

(assert (=> b!1558206 (=> (not res!1065696) (not e!868012))))

(assert (=> b!1558206 (= res!1065696 (bvslt (_1!12496 (h!37773 l!1292)) (_1!12496 (h!37773 (t!51058 l!1292)))))))

(declare-fun b!1558207 () Bool)

(assert (=> b!1558207 (= e!868012 (isStrictlySorted!971 (t!51058 l!1292)))))

(assert (= (and d!162605 (not res!1065695)) b!1558206))

(assert (= (and b!1558206 res!1065696) b!1558207))

(declare-fun m!1434997 () Bool)

(assert (=> b!1558207 m!1434997))

(assert (=> start!133180 d!162605))

(declare-fun b!1558214 () Bool)

(declare-fun e!868017 () Bool)

(declare-fun tp!112611 () Bool)

(assert (=> b!1558214 (= e!868017 (and tp_is_empty!38427 tp!112611))))

(assert (=> b!1558157 (= tp!112605 e!868017)))

(assert (= (and b!1558157 ((_ is Cons!36327) (t!51058 l!1292))) b!1558214))

(check-sat (not b!1558191) (not b!1558179) tp_is_empty!38427 (not b!1558207) (not b!1558214))
(check-sat)
