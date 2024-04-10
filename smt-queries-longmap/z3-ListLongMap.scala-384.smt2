; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7242 () Bool)

(assert start!7242)

(declare-fun res!27079 () Bool)

(declare-fun e!29536 () Bool)

(assert (=> start!7242 (=> (not res!27079) (not e!29536))))

(declare-datatypes ((B!886 0))(
  ( (B!887 (val!1030 Int)) )
))
(declare-datatypes ((tuple2!1708 0))(
  ( (tuple2!1709 (_1!865 (_ BitVec 64)) (_2!865 B!886)) )
))
(declare-datatypes ((List!1248 0))(
  ( (Nil!1245) (Cons!1244 (h!1824 tuple2!1708) (t!4273 List!1248)) )
))
(declare-fun l!812 () List!1248)

(declare-fun isStrictlySorted!239 (List!1248) Bool)

(assert (=> start!7242 (= res!27079 (isStrictlySorted!239 l!812))))

(assert (=> start!7242 e!29536))

(declare-fun e!29537 () Bool)

(assert (=> start!7242 e!29537))

(declare-fun b!46341 () Bool)

(declare-fun res!27081 () Bool)

(assert (=> b!46341 (=> (not res!27081) (not e!29536))))

(get-info :version)

(assert (=> b!46341 (= res!27081 ((_ is Cons!1244) l!812))))

(declare-fun b!46344 () Bool)

(declare-fun tp_is_empty!1983 () Bool)

(declare-fun tp!6122 () Bool)

(assert (=> b!46344 (= e!29537 (and tp_is_empty!1983 tp!6122))))

(declare-fun b!46342 () Bool)

(declare-fun res!27080 () Bool)

(assert (=> b!46342 (=> (not res!27080) (not e!29536))))

(assert (=> b!46342 (= res!27080 (isStrictlySorted!239 (t!4273 l!812)))))

(declare-fun b!46343 () Bool)

(declare-fun ListPrimitiveSize!47 (List!1248) Int)

(assert (=> b!46343 (= e!29536 (>= (ListPrimitiveSize!47 (t!4273 l!812)) (ListPrimitiveSize!47 l!812)))))

(assert (= (and start!7242 res!27079) b!46341))

(assert (= (and b!46341 res!27081) b!46342))

(assert (= (and b!46342 res!27080) b!46343))

(assert (= (and start!7242 ((_ is Cons!1244) l!812)) b!46344))

(declare-fun m!40685 () Bool)

(assert (=> start!7242 m!40685))

(declare-fun m!40687 () Bool)

(assert (=> b!46342 m!40687))

(declare-fun m!40689 () Bool)

(assert (=> b!46343 m!40689))

(declare-fun m!40691 () Bool)

(assert (=> b!46343 m!40691))

(check-sat tp_is_empty!1983 (not b!46344) (not b!46342) (not start!7242) (not b!46343))
(check-sat)
(get-model)

(declare-fun d!9063 () Bool)

(declare-fun res!27099 () Bool)

(declare-fun e!29552 () Bool)

(assert (=> d!9063 (=> res!27099 e!29552)))

(assert (=> d!9063 (= res!27099 (or ((_ is Nil!1245) l!812) ((_ is Nil!1245) (t!4273 l!812))))))

(assert (=> d!9063 (= (isStrictlySorted!239 l!812) e!29552)))

(declare-fun b!46365 () Bool)

(declare-fun e!29554 () Bool)

(assert (=> b!46365 (= e!29552 e!29554)))

(declare-fun res!27101 () Bool)

(assert (=> b!46365 (=> (not res!27101) (not e!29554))))

(assert (=> b!46365 (= res!27101 (bvslt (_1!865 (h!1824 l!812)) (_1!865 (h!1824 (t!4273 l!812)))))))

(declare-fun b!46367 () Bool)

(assert (=> b!46367 (= e!29554 (isStrictlySorted!239 (t!4273 l!812)))))

(assert (= (and d!9063 (not res!27099)) b!46365))

(assert (= (and b!46365 res!27101) b!46367))

(assert (=> b!46367 m!40687))

(assert (=> start!7242 d!9063))

(declare-fun d!9070 () Bool)

(declare-fun res!27103 () Bool)

(declare-fun e!29556 () Bool)

(assert (=> d!9070 (=> res!27103 e!29556)))

(assert (=> d!9070 (= res!27103 (or ((_ is Nil!1245) (t!4273 l!812)) ((_ is Nil!1245) (t!4273 (t!4273 l!812)))))))

(assert (=> d!9070 (= (isStrictlySorted!239 (t!4273 l!812)) e!29556)))

(declare-fun b!46369 () Bool)

(declare-fun e!29557 () Bool)

(assert (=> b!46369 (= e!29556 e!29557)))

(declare-fun res!27104 () Bool)

(assert (=> b!46369 (=> (not res!27104) (not e!29557))))

(assert (=> b!46369 (= res!27104 (bvslt (_1!865 (h!1824 (t!4273 l!812))) (_1!865 (h!1824 (t!4273 (t!4273 l!812))))))))

(declare-fun b!46370 () Bool)

(assert (=> b!46370 (= e!29557 (isStrictlySorted!239 (t!4273 (t!4273 l!812))))))

(assert (= (and d!9070 (not res!27103)) b!46369))

(assert (= (and b!46369 res!27104) b!46370))

(declare-fun m!40703 () Bool)

(assert (=> b!46370 m!40703))

(assert (=> b!46342 d!9070))

(declare-fun d!9073 () Bool)

(declare-fun lt!20290 () Int)

(assert (=> d!9073 (>= lt!20290 0)))

(declare-fun e!29569 () Int)

(assert (=> d!9073 (= lt!20290 e!29569)))

(declare-fun c!6258 () Bool)

(assert (=> d!9073 (= c!6258 ((_ is Nil!1245) (t!4273 l!812)))))

(assert (=> d!9073 (= (ListPrimitiveSize!47 (t!4273 l!812)) lt!20290)))

(declare-fun b!46387 () Bool)

(assert (=> b!46387 (= e!29569 0)))

(declare-fun b!46388 () Bool)

(assert (=> b!46388 (= e!29569 (+ 1 (ListPrimitiveSize!47 (t!4273 (t!4273 l!812)))))))

(assert (= (and d!9073 c!6258) b!46387))

(assert (= (and d!9073 (not c!6258)) b!46388))

(declare-fun m!40709 () Bool)

(assert (=> b!46388 m!40709))

(assert (=> b!46343 d!9073))

(declare-fun d!9079 () Bool)

(declare-fun lt!20292 () Int)

(assert (=> d!9079 (>= lt!20292 0)))

(declare-fun e!29571 () Int)

(assert (=> d!9079 (= lt!20292 e!29571)))

(declare-fun c!6260 () Bool)

(assert (=> d!9079 (= c!6260 ((_ is Nil!1245) l!812))))

(assert (=> d!9079 (= (ListPrimitiveSize!47 l!812) lt!20292)))

(declare-fun b!46391 () Bool)

(assert (=> b!46391 (= e!29571 0)))

(declare-fun b!46392 () Bool)

(assert (=> b!46392 (= e!29571 (+ 1 (ListPrimitiveSize!47 (t!4273 l!812))))))

(assert (= (and d!9079 c!6260) b!46391))

(assert (= (and d!9079 (not c!6260)) b!46392))

(assert (=> b!46392 m!40689))

(assert (=> b!46343 d!9079))

(declare-fun b!46401 () Bool)

(declare-fun e!29576 () Bool)

(declare-fun tp!6128 () Bool)

(assert (=> b!46401 (= e!29576 (and tp_is_empty!1983 tp!6128))))

(assert (=> b!46344 (= tp!6122 e!29576)))

(assert (= (and b!46344 ((_ is Cons!1244) (t!4273 l!812))) b!46401))

(check-sat tp_is_empty!1983 (not b!46370) (not b!46367) (not b!46392) (not b!46401) (not b!46388))
(check-sat)
