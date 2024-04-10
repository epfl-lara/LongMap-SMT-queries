; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7230 () Bool)

(assert start!7230)

(declare-fun res!27032 () Bool)

(declare-fun e!29485 () Bool)

(assert (=> start!7230 (=> (not res!27032) (not e!29485))))

(declare-datatypes ((B!880 0))(
  ( (B!881 (val!1027 Int)) )
))
(declare-datatypes ((tuple2!1702 0))(
  ( (tuple2!1703 (_1!862 (_ BitVec 64)) (_2!862 B!880)) )
))
(declare-datatypes ((List!1245 0))(
  ( (Nil!1242) (Cons!1241 (h!1821 tuple2!1702) (t!4270 List!1245)) )
))
(declare-fun l!812 () List!1245)

(declare-fun isStrictlySorted!236 (List!1245) Bool)

(assert (=> start!7230 (= res!27032 (isStrictlySorted!236 l!812))))

(assert (=> start!7230 e!29485))

(declare-fun e!29486 () Bool)

(assert (=> start!7230 e!29486))

(declare-fun b!46270 () Bool)

(declare-fun res!27033 () Bool)

(assert (=> b!46270 (=> (not res!27033) (not e!29485))))

(get-info :version)

(assert (=> b!46270 (= res!27033 ((_ is Cons!1241) l!812))))

(declare-fun b!46271 () Bool)

(assert (=> b!46271 (= e!29485 (not (isStrictlySorted!236 (t!4270 l!812))))))

(declare-fun b!46272 () Bool)

(declare-fun tp_is_empty!1977 () Bool)

(declare-fun tp!6104 () Bool)

(assert (=> b!46272 (= e!29486 (and tp_is_empty!1977 tp!6104))))

(assert (= (and start!7230 res!27032) b!46270))

(assert (= (and b!46270 res!27033) b!46271))

(assert (= (and start!7230 ((_ is Cons!1241) l!812)) b!46272))

(declare-fun m!40663 () Bool)

(assert (=> start!7230 m!40663))

(declare-fun m!40665 () Bool)

(assert (=> b!46271 m!40665))

(check-sat (not b!46271) (not start!7230) (not b!46272) tp_is_empty!1977)
(check-sat)
(get-model)

(declare-fun d!9053 () Bool)

(declare-fun res!27056 () Bool)

(declare-fun e!29512 () Bool)

(assert (=> d!9053 (=> res!27056 e!29512)))

(assert (=> d!9053 (= res!27056 (or ((_ is Nil!1242) (t!4270 l!812)) ((_ is Nil!1242) (t!4270 (t!4270 l!812)))))))

(assert (=> d!9053 (= (isStrictlySorted!236 (t!4270 l!812)) e!29512)))

(declare-fun b!46303 () Bool)

(declare-fun e!29514 () Bool)

(assert (=> b!46303 (= e!29512 e!29514)))

(declare-fun res!27058 () Bool)

(assert (=> b!46303 (=> (not res!27058) (not e!29514))))

(assert (=> b!46303 (= res!27058 (bvslt (_1!862 (h!1821 (t!4270 l!812))) (_1!862 (h!1821 (t!4270 (t!4270 l!812))))))))

(declare-fun b!46306 () Bool)

(assert (=> b!46306 (= e!29514 (isStrictlySorted!236 (t!4270 (t!4270 l!812))))))

(assert (= (and d!9053 (not res!27056)) b!46303))

(assert (= (and b!46303 res!27058) b!46306))

(declare-fun m!40673 () Bool)

(assert (=> b!46306 m!40673))

(assert (=> b!46271 d!9053))

(declare-fun d!9059 () Bool)

(declare-fun res!27060 () Bool)

(declare-fun e!29516 () Bool)

(assert (=> d!9059 (=> res!27060 e!29516)))

(assert (=> d!9059 (= res!27060 (or ((_ is Nil!1242) l!812) ((_ is Nil!1242) (t!4270 l!812))))))

(assert (=> d!9059 (= (isStrictlySorted!236 l!812) e!29516)))

(declare-fun b!46307 () Bool)

(declare-fun e!29517 () Bool)

(assert (=> b!46307 (= e!29516 e!29517)))

(declare-fun res!27061 () Bool)

(assert (=> b!46307 (=> (not res!27061) (not e!29517))))

(assert (=> b!46307 (= res!27061 (bvslt (_1!862 (h!1821 l!812)) (_1!862 (h!1821 (t!4270 l!812)))))))

(declare-fun b!46308 () Bool)

(assert (=> b!46308 (= e!29517 (isStrictlySorted!236 (t!4270 l!812)))))

(assert (= (and d!9059 (not res!27060)) b!46307))

