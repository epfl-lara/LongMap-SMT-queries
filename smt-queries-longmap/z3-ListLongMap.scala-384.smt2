; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7246 () Bool)

(assert start!7246)

(declare-fun res!27046 () Bool)

(declare-fun e!29493 () Bool)

(assert (=> start!7246 (=> (not res!27046) (not e!29493))))

(declare-datatypes ((B!884 0))(
  ( (B!885 (val!1029 Int)) )
))
(declare-datatypes ((tuple2!1688 0))(
  ( (tuple2!1689 (_1!855 (_ BitVec 64)) (_2!855 B!884)) )
))
(declare-datatypes ((List!1233 0))(
  ( (Nil!1230) (Cons!1229 (h!1809 tuple2!1688) (t!4258 List!1233)) )
))
(declare-fun l!812 () List!1233)

(declare-fun isStrictlySorted!226 (List!1233) Bool)

(assert (=> start!7246 (= res!27046 (isStrictlySorted!226 l!812))))

(assert (=> start!7246 e!29493))

(declare-fun e!29494 () Bool)

(assert (=> start!7246 e!29494))

(declare-fun b!46275 () Bool)

(declare-fun tp_is_empty!1981 () Bool)

(declare-fun tp!6119 () Bool)

(assert (=> b!46275 (= e!29494 (and tp_is_empty!1981 tp!6119))))

(declare-fun b!46274 () Bool)

(declare-fun ListPrimitiveSize!46 (List!1233) Int)

(assert (=> b!46274 (= e!29493 (>= (ListPrimitiveSize!46 (t!4258 l!812)) (ListPrimitiveSize!46 l!812)))))

(declare-fun b!46273 () Bool)

(declare-fun res!27045 () Bool)

(assert (=> b!46273 (=> (not res!27045) (not e!29493))))

(assert (=> b!46273 (= res!27045 (isStrictlySorted!226 (t!4258 l!812)))))

(declare-fun b!46272 () Bool)

(declare-fun res!27047 () Bool)

(assert (=> b!46272 (=> (not res!27047) (not e!29493))))

(get-info :version)

(assert (=> b!46272 (= res!27047 ((_ is Cons!1229) l!812))))

(assert (= (and start!7246 res!27046) b!46272))

(assert (= (and b!46272 res!27047) b!46273))

(assert (= (and b!46273 res!27045) b!46274))

(assert (= (and start!7246 ((_ is Cons!1229) l!812)) b!46275))

(declare-fun m!40553 () Bool)

(assert (=> start!7246 m!40553))

(declare-fun m!40555 () Bool)

(assert (=> b!46274 m!40555))

(declare-fun m!40557 () Bool)

(assert (=> b!46274 m!40557))

(declare-fun m!40559 () Bool)

(assert (=> b!46273 m!40559))

(check-sat (not b!46273) (not b!46275) (not start!7246) (not b!46274) tp_is_empty!1981)
(check-sat)
(get-model)

(declare-fun d!9055 () Bool)

(declare-fun lt!20248 () Int)

(assert (=> d!9055 (>= lt!20248 0)))

(declare-fun e!29513 () Int)

(assert (=> d!9055 (= lt!20248 e!29513)))

(declare-fun c!6243 () Bool)

(assert (=> d!9055 (= c!6243 ((_ is Nil!1230) (t!4258 l!812)))))

(assert (=> d!9055 (= (ListPrimitiveSize!46 (t!4258 l!812)) lt!20248)))

(declare-fun b!46312 () Bool)

(assert (=> b!46312 (= e!29513 0)))

(declare-fun b!46313 () Bool)

(assert (=> b!46313 (= e!29513 (+ 1 (ListPrimitiveSize!46 (t!4258 (t!4258 l!812)))))))

(assert (= (and d!9055 c!6243) b!46312))

(assert (= (and d!9055 (not c!6243)) b!46313))

(declare-fun m!40579 () Bool)

(assert (=> b!46313 m!40579))

(assert (=> b!46274 d!9055))

(declare-fun d!9059 () Bool)

(declare-fun lt!20252 () Int)

(assert (=> d!9059 (>= lt!20252 0)))

(declare-fun e!29517 () Int)

(assert (=> d!9059 (= lt!20252 e!29517)))

(declare-fun c!6247 () Bool)

(assert (=> d!9059 (= c!6247 ((_ is Nil!1230) l!812))))

(assert (=> d!9059 (= (ListPrimitiveSize!46 l!812) lt!20252)))

(declare-fun b!46320 () Bool)

(assert (=> b!46320 (= e!29517 0)))

(declare-fun b!46321 () Bool)

(assert (=> b!46321 (= e!29517 (+ 1 (ListPrimitiveSize!46 (t!4258 l!812))))))

(assert (= (and d!9059 c!6247) b!46320))

(assert (= (and d!9059 (not c!6247)) b!46321))

(assert (=> b!46321 m!40555))

(assert (=> b!46274 d!9059))

(declare-fun d!9066 () Bool)

(declare-fun res!27078 () Bool)

(declare-fun e!29531 () Bool)

(assert (=> d!9066 (=> res!27078 e!29531)))

(assert (=> d!9066 (= res!27078 (or ((_ is Nil!1230) (t!4258 l!812)) ((_ is Nil!1230) (t!4258 (t!4258 l!812)))))))

(assert (=> d!9066 (= (isStrictlySorted!226 (t!4258 l!812)) e!29531)))

(declare-fun b!46336 () Bool)

(declare-fun e!29533 () Bool)

(assert (=> b!46336 (= e!29531 e!29533)))

(declare-fun res!27080 () Bool)

(assert (=> b!46336 (=> (not res!27080) (not e!29533))))

(assert (=> b!46336 (= res!27080 (bvslt (_1!855 (h!1809 (t!4258 l!812))) (_1!855 (h!1809 (t!4258 (t!4258 l!812))))))))

(declare-fun b!46337 () Bool)

(assert (=> b!46337 (= e!29533 (isStrictlySorted!226 (t!4258 (t!4258 l!812))))))

(assert (= (and d!9066 (not res!27078)) b!46336))

(assert (= (and b!46336 res!27080) b!46337))

(declare-fun m!40583 () Bool)

(assert (=> b!46337 m!40583))

(assert (=> b!46273 d!9066))

(declare-fun d!9069 () Bool)

(declare-fun res!27084 () Bool)

(declare-fun e!29537 () Bool)

(assert (=> d!9069 (=> res!27084 e!29537)))

(assert (=> d!9069 (= res!27084 (or ((_ is Nil!1230) l!812) ((_ is Nil!1230) (t!4258 l!812))))))

(assert (=> d!9069 (= (isStrictlySorted!226 l!812) e!29537)))

(declare-fun b!46342 () Bool)

(declare-fun e!29538 () Bool)

(assert (=> b!46342 (= e!29537 e!29538)))

(declare-fun res!27085 () Bool)

(assert (=> b!46342 (=> (not res!27085) (not e!29538))))

(assert (=> b!46342 (= res!27085 (bvslt (_1!855 (h!1809 l!812)) (_1!855 (h!1809 (t!4258 l!812)))))))

(declare-fun b!46343 () Bool)

(assert (=> b!46343 (= e!29538 (isStrictlySorted!226 (t!4258 l!812)))))

(assert (= (and d!9069 (not res!27084)) b!46342))

(assert (= (and b!46342 res!27085) b!46343))

(assert (=> b!46343 m!40559))

(assert (=> start!7246 d!9069))

(declare-fun b!46361 () Bool)

(declare-fun e!29550 () Bool)

(declare-fun tp!6133 () Bool)

(assert (=> b!46361 (= e!29550 (and tp_is_empty!1981 tp!6133))))

(assert (=> b!46275 (= tp!6119 e!29550)))

(assert (= (and b!46275 ((_ is Cons!1229) (t!4258 l!812))) b!46361))

(check-sat (not b!46343) (not b!46361) (not b!46313) (not b!46337) tp_is_empty!1981 (not b!46321))
(check-sat)
