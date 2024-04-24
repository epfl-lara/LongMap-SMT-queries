; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7264 () Bool)

(assert start!7264)

(declare-fun b!46374 () Bool)

(declare-fun e!29556 () Bool)

(declare-fun tp_is_empty!1987 () Bool)

(declare-fun tp!6137 () Bool)

(assert (=> b!46374 (= e!29556 (and tp_is_empty!1987 tp!6137))))

(declare-fun b!46372 () Bool)

(declare-fun res!27098 () Bool)

(declare-fun e!29557 () Bool)

(assert (=> b!46372 (=> (not res!27098) (not e!29557))))

(declare-datatypes ((B!890 0))(
  ( (B!891 (val!1032 Int)) )
))
(declare-datatypes ((tuple2!1694 0))(
  ( (tuple2!1695 (_1!858 (_ BitVec 64)) (_2!858 B!890)) )
))
(declare-datatypes ((List!1236 0))(
  ( (Nil!1233) (Cons!1232 (h!1812 tuple2!1694) (t!4261 List!1236)) )
))
(declare-fun l!812 () List!1236)

(declare-fun isStrictlySorted!229 (List!1236) Bool)

(assert (=> b!46372 (= res!27098 (isStrictlySorted!229 (t!4261 l!812)))))

(declare-fun b!46371 () Bool)

(declare-fun res!27097 () Bool)

(assert (=> b!46371 (=> (not res!27097) (not e!29557))))

(get-info :version)

(assert (=> b!46371 (= res!27097 ((_ is Cons!1232) l!812))))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun b!46373 () Bool)

(declare-fun removeStrictlySorted!41 (List!1236 (_ BitVec 64)) List!1236)

(assert (=> b!46373 (= e!29557 (not (= (removeStrictlySorted!41 (removeStrictlySorted!41 l!812 key1!43) key2!27) (removeStrictlySorted!41 (removeStrictlySorted!41 l!812 key2!27) key1!43))))))

(assert (=> b!46373 (= (removeStrictlySorted!41 (removeStrictlySorted!41 (t!4261 l!812) key1!43) key2!27) (removeStrictlySorted!41 (removeStrictlySorted!41 (t!4261 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1332 0))(
  ( (Unit!1333) )
))
(declare-fun lt!20256 () Unit!1332)

(declare-fun lemmaRemoveStrictlySortedCommutative!16 (List!1236 (_ BitVec 64) (_ BitVec 64)) Unit!1332)

(assert (=> b!46373 (= lt!20256 (lemmaRemoveStrictlySortedCommutative!16 (t!4261 l!812) key1!43 key2!27))))

(declare-fun res!27096 () Bool)

(assert (=> start!7264 (=> (not res!27096) (not e!29557))))

(assert (=> start!7264 (= res!27096 (isStrictlySorted!229 l!812))))

(assert (=> start!7264 e!29557))

(assert (=> start!7264 e!29556))

(assert (=> start!7264 true))

(assert (= (and start!7264 res!27096) b!46371))

(assert (= (and b!46371 res!27097) b!46372))

(assert (= (and b!46372 res!27098) b!46373))

(assert (= (and start!7264 ((_ is Cons!1232) l!812)) b!46374))

(declare-fun m!40589 () Bool)

(assert (=> b!46372 m!40589))

(declare-fun m!40591 () Bool)

(assert (=> b!46373 m!40591))

(declare-fun m!40593 () Bool)

(assert (=> b!46373 m!40593))

(declare-fun m!40595 () Bool)

(assert (=> b!46373 m!40595))

(assert (=> b!46373 m!40593))

(declare-fun m!40597 () Bool)

(assert (=> b!46373 m!40597))

(declare-fun m!40599 () Bool)

(assert (=> b!46373 m!40599))

(declare-fun m!40601 () Bool)

(assert (=> b!46373 m!40601))

(assert (=> b!46373 m!40591))

(declare-fun m!40603 () Bool)

(assert (=> b!46373 m!40603))

(declare-fun m!40605 () Bool)

(assert (=> b!46373 m!40605))

(assert (=> b!46373 m!40601))

(declare-fun m!40607 () Bool)

(assert (=> b!46373 m!40607))

(assert (=> b!46373 m!40597))

(declare-fun m!40609 () Bool)

(assert (=> start!7264 m!40609))

(check-sat tp_is_empty!1987 (not b!46373) (not b!46372) (not start!7264) (not b!46374))
(check-sat)
(get-model)

(declare-fun d!9079 () Bool)

(declare-fun res!27121 () Bool)

(declare-fun e!29574 () Bool)

(assert (=> d!9079 (=> res!27121 e!29574)))

(assert (=> d!9079 (= res!27121 (or ((_ is Nil!1233) (t!4261 l!812)) ((_ is Nil!1233) (t!4261 (t!4261 l!812)))))))

(assert (=> d!9079 (= (isStrictlySorted!229 (t!4261 l!812)) e!29574)))

(declare-fun b!46403 () Bool)

(declare-fun e!29575 () Bool)

(assert (=> b!46403 (= e!29574 e!29575)))

(declare-fun res!27122 () Bool)

(assert (=> b!46403 (=> (not res!27122) (not e!29575))))

(assert (=> b!46403 (= res!27122 (bvslt (_1!858 (h!1812 (t!4261 l!812))) (_1!858 (h!1812 (t!4261 (t!4261 l!812))))))))

(declare-fun b!46404 () Bool)

(assert (=> b!46404 (= e!29575 (isStrictlySorted!229 (t!4261 (t!4261 l!812))))))

(assert (= (and d!9079 (not res!27121)) b!46403))

(assert (= (and b!46403 res!27122) b!46404))

(declare-fun m!40655 () Bool)

(assert (=> b!46404 m!40655))

(assert (=> b!46372 d!9079))

(declare-fun d!9081 () Bool)

(declare-fun res!27123 () Bool)

(declare-fun e!29576 () Bool)

(assert (=> d!9081 (=> res!27123 e!29576)))

(assert (=> d!9081 (= res!27123 (or ((_ is Nil!1233) l!812) ((_ is Nil!1233) (t!4261 l!812))))))

(assert (=> d!9081 (= (isStrictlySorted!229 l!812) e!29576)))

(declare-fun b!46405 () Bool)

(declare-fun e!29577 () Bool)

(assert (=> b!46405 (= e!29576 e!29577)))

(declare-fun res!27124 () Bool)

(assert (=> b!46405 (=> (not res!27124) (not e!29577))))

(assert (=> b!46405 (= res!27124 (bvslt (_1!858 (h!1812 l!812)) (_1!858 (h!1812 (t!4261 l!812)))))))

(declare-fun b!46406 () Bool)

(assert (=> b!46406 (= e!29577 (isStrictlySorted!229 (t!4261 l!812)))))

(assert (= (and d!9081 (not res!27123)) b!46405))

(assert (= (and b!46405 res!27124) b!46406))

(assert (=> b!46406 m!40589))

(assert (=> start!7264 d!9081))

(declare-fun b!46442 () Bool)

(declare-fun e!29601 () List!1236)

(assert (=> b!46442 (= e!29601 Nil!1233)))

(declare-fun b!46443 () Bool)

(declare-fun e!29599 () List!1236)

(assert (=> b!46443 (= e!29599 e!29601)))

(declare-fun c!6263 () Bool)

(assert (=> b!46443 (= c!6263 (and ((_ is Cons!1232) (removeStrictlySorted!41 l!812 key2!27)) (not (= (_1!858 (h!1812 (removeStrictlySorted!41 l!812 key2!27))) key1!43))))))

(declare-fun b!46444 () Bool)

(declare-fun $colon$colon!44 (List!1236 tuple2!1694) List!1236)

(assert (=> b!46444 (= e!29601 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 l!812 key2!27)) key1!43) (h!1812 (removeStrictlySorted!41 l!812 key2!27))))))

(declare-fun d!9083 () Bool)

(declare-fun e!29600 () Bool)

(assert (=> d!9083 e!29600))

(declare-fun res!27132 () Bool)

(assert (=> d!9083 (=> (not res!27132) (not e!29600))))

(declare-fun lt!20270 () List!1236)

(assert (=> d!9083 (= res!27132 (isStrictlySorted!229 lt!20270))))

(assert (=> d!9083 (= lt!20270 e!29599)))

(declare-fun c!6264 () Bool)

(assert (=> d!9083 (= c!6264 (and ((_ is Cons!1232) (removeStrictlySorted!41 l!812 key2!27)) (= (_1!858 (h!1812 (removeStrictlySorted!41 l!812 key2!27))) key1!43)))))

(assert (=> d!9083 (isStrictlySorted!229 (removeStrictlySorted!41 l!812 key2!27))))

(assert (=> d!9083 (= (removeStrictlySorted!41 (removeStrictlySorted!41 l!812 key2!27) key1!43) lt!20270)))

(declare-fun b!46445 () Bool)

(assert (=> b!46445 (= e!29599 (t!4261 (removeStrictlySorted!41 l!812 key2!27)))))

(declare-fun b!46446 () Bool)

(declare-fun containsKey!91 (List!1236 (_ BitVec 64)) Bool)

(assert (=> b!46446 (= e!29600 (not (containsKey!91 lt!20270 key1!43)))))

(assert (= (and d!9083 c!6264) b!46445))

(assert (= (and d!9083 (not c!6264)) b!46443))

(assert (= (and b!46443 c!6263) b!46444))

(assert (= (and b!46443 (not c!6263)) b!46442))

(assert (= (and d!9083 res!27132) b!46446))

(declare-fun m!40679 () Bool)

(assert (=> b!46444 m!40679))

(assert (=> b!46444 m!40679))

(declare-fun m!40681 () Bool)

(assert (=> b!46444 m!40681))

(declare-fun m!40683 () Bool)

(assert (=> d!9083 m!40683))

(assert (=> d!9083 m!40593))

(declare-fun m!40685 () Bool)

(assert (=> d!9083 m!40685))

(declare-fun m!40687 () Bool)

(assert (=> b!46446 m!40687))

(assert (=> b!46373 d!9083))

(declare-fun b!46447 () Bool)

(declare-fun e!29604 () List!1236)

(assert (=> b!46447 (= e!29604 Nil!1233)))

(declare-fun b!46448 () Bool)

(declare-fun e!29602 () List!1236)

(assert (=> b!46448 (= e!29602 e!29604)))

(declare-fun c!6265 () Bool)

(assert (=> b!46448 (= c!6265 (and ((_ is Cons!1232) l!812) (not (= (_1!858 (h!1812 l!812)) key1!43))))))

(declare-fun b!46449 () Bool)

(assert (=> b!46449 (= e!29604 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 l!812) key1!43) (h!1812 l!812)))))

(declare-fun d!9093 () Bool)

(declare-fun e!29603 () Bool)

(assert (=> d!9093 e!29603))

(declare-fun res!27133 () Bool)

(assert (=> d!9093 (=> (not res!27133) (not e!29603))))

(declare-fun lt!20271 () List!1236)

(assert (=> d!9093 (= res!27133 (isStrictlySorted!229 lt!20271))))

(assert (=> d!9093 (= lt!20271 e!29602)))

(declare-fun c!6266 () Bool)

(assert (=> d!9093 (= c!6266 (and ((_ is Cons!1232) l!812) (= (_1!858 (h!1812 l!812)) key1!43)))))

(assert (=> d!9093 (isStrictlySorted!229 l!812)))

(assert (=> d!9093 (= (removeStrictlySorted!41 l!812 key1!43) lt!20271)))

(declare-fun b!46450 () Bool)

(assert (=> b!46450 (= e!29602 (t!4261 l!812))))

(declare-fun b!46451 () Bool)

(assert (=> b!46451 (= e!29603 (not (containsKey!91 lt!20271 key1!43)))))

(assert (= (and d!9093 c!6266) b!46450))

(assert (= (and d!9093 (not c!6266)) b!46448))

(assert (= (and b!46448 c!6265) b!46449))

(assert (= (and b!46448 (not c!6265)) b!46447))

(assert (= (and d!9093 res!27133) b!46451))

(assert (=> b!46449 m!40597))

(assert (=> b!46449 m!40597))

(declare-fun m!40689 () Bool)

(assert (=> b!46449 m!40689))

(declare-fun m!40691 () Bool)

(assert (=> d!9093 m!40691))

(assert (=> d!9093 m!40609))

(declare-fun m!40693 () Bool)

(assert (=> b!46451 m!40693))

(assert (=> b!46373 d!9093))

(declare-fun b!46452 () Bool)

(declare-fun e!29609 () List!1236)

(assert (=> b!46452 (= e!29609 Nil!1233)))

(declare-fun b!46453 () Bool)

(declare-fun e!29605 () List!1236)

(assert (=> b!46453 (= e!29605 e!29609)))

(declare-fun c!6267 () Bool)

(assert (=> b!46453 (= c!6267 (and ((_ is Cons!1232) l!812) (not (= (_1!858 (h!1812 l!812)) key2!27))))))

(declare-fun b!46454 () Bool)

(assert (=> b!46454 (= e!29609 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 l!812) key2!27) (h!1812 l!812)))))

(declare-fun d!9095 () Bool)

(declare-fun e!29607 () Bool)

(assert (=> d!9095 e!29607))

(declare-fun res!27134 () Bool)

(assert (=> d!9095 (=> (not res!27134) (not e!29607))))

(declare-fun lt!20274 () List!1236)

(assert (=> d!9095 (= res!27134 (isStrictlySorted!229 lt!20274))))

(assert (=> d!9095 (= lt!20274 e!29605)))

(declare-fun c!6268 () Bool)

(assert (=> d!9095 (= c!6268 (and ((_ is Cons!1232) l!812) (= (_1!858 (h!1812 l!812)) key2!27)))))

(assert (=> d!9095 (isStrictlySorted!229 l!812)))

(assert (=> d!9095 (= (removeStrictlySorted!41 l!812 key2!27) lt!20274)))

(declare-fun b!46455 () Bool)

(assert (=> b!46455 (= e!29605 (t!4261 l!812))))

(declare-fun b!46456 () Bool)

(assert (=> b!46456 (= e!29607 (not (containsKey!91 lt!20274 key2!27)))))

(assert (= (and d!9095 c!6268) b!46455))

(assert (= (and d!9095 (not c!6268)) b!46453))

(assert (= (and b!46453 c!6267) b!46454))

(assert (= (and b!46453 (not c!6267)) b!46452))

(assert (= (and d!9095 res!27134) b!46456))

(assert (=> b!46454 m!40591))

(assert (=> b!46454 m!40591))

(declare-fun m!40695 () Bool)

(assert (=> b!46454 m!40695))

(declare-fun m!40697 () Bool)

(assert (=> d!9095 m!40697))

(assert (=> d!9095 m!40609))

(declare-fun m!40699 () Bool)

(assert (=> b!46456 m!40699))

(assert (=> b!46373 d!9095))

(declare-fun d!9097 () Bool)

(assert (=> d!9097 (= (removeStrictlySorted!41 (removeStrictlySorted!41 (t!4261 l!812) key1!43) key2!27) (removeStrictlySorted!41 (removeStrictlySorted!41 (t!4261 l!812) key2!27) key1!43))))

(declare-fun lt!20282 () Unit!1332)

(declare-fun choose!285 (List!1236 (_ BitVec 64) (_ BitVec 64)) Unit!1332)

(assert (=> d!9097 (= lt!20282 (choose!285 (t!4261 l!812) key1!43 key2!27))))

(assert (=> d!9097 (isStrictlySorted!229 (t!4261 l!812))))

(assert (=> d!9097 (= (lemmaRemoveStrictlySortedCommutative!16 (t!4261 l!812) key1!43 key2!27) lt!20282)))

(declare-fun bs!2183 () Bool)

(assert (= bs!2183 d!9097))

(assert (=> bs!2183 m!40597))

(assert (=> bs!2183 m!40591))

(assert (=> bs!2183 m!40591))

(assert (=> bs!2183 m!40603))

(assert (=> bs!2183 m!40589))

(declare-fun m!40741 () Bool)

(assert (=> bs!2183 m!40741))

(assert (=> bs!2183 m!40597))

(assert (=> bs!2183 m!40599))

(assert (=> b!46373 d!9097))

(declare-fun b!46490 () Bool)

(declare-fun e!29633 () List!1236)

(assert (=> b!46490 (= e!29633 Nil!1233)))

(declare-fun b!46491 () Bool)

(declare-fun e!29631 () List!1236)

(assert (=> b!46491 (= e!29631 e!29633)))

(declare-fun c!6279 () Bool)

(assert (=> b!46491 (= c!6279 (and ((_ is Cons!1232) (removeStrictlySorted!41 (t!4261 l!812) key1!43)) (not (= (_1!858 (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key1!43))) key2!27))))))

(declare-fun b!46492 () Bool)

(assert (=> b!46492 (= e!29633 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43)) key2!27) (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key1!43))))))

(declare-fun d!9113 () Bool)

(declare-fun e!29632 () Bool)

(assert (=> d!9113 e!29632))

(declare-fun res!27148 () Bool)

(assert (=> d!9113 (=> (not res!27148) (not e!29632))))

(declare-fun lt!20284 () List!1236)

(assert (=> d!9113 (= res!27148 (isStrictlySorted!229 lt!20284))))

(assert (=> d!9113 (= lt!20284 e!29631)))

(declare-fun c!6280 () Bool)

(assert (=> d!9113 (= c!6280 (and ((_ is Cons!1232) (removeStrictlySorted!41 (t!4261 l!812) key1!43)) (= (_1!858 (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key1!43))) key2!27)))))

(assert (=> d!9113 (isStrictlySorted!229 (removeStrictlySorted!41 (t!4261 l!812) key1!43))))

(assert (=> d!9113 (= (removeStrictlySorted!41 (removeStrictlySorted!41 (t!4261 l!812) key1!43) key2!27) lt!20284)))

(declare-fun b!46493 () Bool)

(assert (=> b!46493 (= e!29631 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43)))))

(declare-fun b!46494 () Bool)

(assert (=> b!46494 (= e!29632 (not (containsKey!91 lt!20284 key2!27)))))

(assert (= (and d!9113 c!6280) b!46493))

(assert (= (and d!9113 (not c!6280)) b!46491))

(assert (= (and b!46491 c!6279) b!46492))

(assert (= (and b!46491 (not c!6279)) b!46490))

(assert (= (and d!9113 res!27148) b!46494))

(declare-fun m!40753 () Bool)

(assert (=> b!46492 m!40753))

(assert (=> b!46492 m!40753))

(declare-fun m!40755 () Bool)

(assert (=> b!46492 m!40755))

(declare-fun m!40757 () Bool)

(assert (=> d!9113 m!40757))

(assert (=> d!9113 m!40597))

(declare-fun m!40759 () Bool)

(assert (=> d!9113 m!40759))

(declare-fun m!40761 () Bool)

(assert (=> b!46494 m!40761))

(assert (=> b!46373 d!9113))

(declare-fun b!46495 () Bool)

(declare-fun e!29636 () List!1236)

(assert (=> b!46495 (= e!29636 Nil!1233)))

(declare-fun b!46496 () Bool)

(declare-fun e!29634 () List!1236)

(assert (=> b!46496 (= e!29634 e!29636)))

(declare-fun c!6281 () Bool)

(assert (=> b!46496 (= c!6281 (and ((_ is Cons!1232) (t!4261 l!812)) (not (= (_1!858 (h!1812 (t!4261 l!812))) key1!43))))))

(declare-fun b!46497 () Bool)

(assert (=> b!46497 (= e!29636 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (t!4261 l!812)) key1!43) (h!1812 (t!4261 l!812))))))

(declare-fun d!9117 () Bool)

(declare-fun e!29635 () Bool)

(assert (=> d!9117 e!29635))

(declare-fun res!27149 () Bool)

(assert (=> d!9117 (=> (not res!27149) (not e!29635))))

(declare-fun lt!20285 () List!1236)

(assert (=> d!9117 (= res!27149 (isStrictlySorted!229 lt!20285))))

(assert (=> d!9117 (= lt!20285 e!29634)))

(declare-fun c!6282 () Bool)

(assert (=> d!9117 (= c!6282 (and ((_ is Cons!1232) (t!4261 l!812)) (= (_1!858 (h!1812 (t!4261 l!812))) key1!43)))))

(assert (=> d!9117 (isStrictlySorted!229 (t!4261 l!812))))

(assert (=> d!9117 (= (removeStrictlySorted!41 (t!4261 l!812) key1!43) lt!20285)))

(declare-fun b!46498 () Bool)

(assert (=> b!46498 (= e!29634 (t!4261 (t!4261 l!812)))))

(declare-fun b!46499 () Bool)

(assert (=> b!46499 (= e!29635 (not (containsKey!91 lt!20285 key1!43)))))

(assert (= (and d!9117 c!6282) b!46498))

(assert (= (and d!9117 (not c!6282)) b!46496))

(assert (= (and b!46496 c!6281) b!46497))

(assert (= (and b!46496 (not c!6281)) b!46495))

(assert (= (and d!9117 res!27149) b!46499))

(declare-fun m!40763 () Bool)

(assert (=> b!46497 m!40763))

(assert (=> b!46497 m!40763))

(declare-fun m!40765 () Bool)

(assert (=> b!46497 m!40765))

(declare-fun m!40767 () Bool)

(assert (=> d!9117 m!40767))

(assert (=> d!9117 m!40589))

(declare-fun m!40769 () Bool)

(assert (=> b!46499 m!40769))

(assert (=> b!46373 d!9117))

(declare-fun b!46500 () Bool)

(declare-fun e!29639 () List!1236)

(assert (=> b!46500 (= e!29639 Nil!1233)))

(declare-fun b!46501 () Bool)

(declare-fun e!29637 () List!1236)

(assert (=> b!46501 (= e!29637 e!29639)))

(declare-fun c!6283 () Bool)

(assert (=> b!46501 (= c!6283 (and ((_ is Cons!1232) (removeStrictlySorted!41 (t!4261 l!812) key2!27)) (not (= (_1!858 (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key2!27))) key1!43))))))

(declare-fun b!46502 () Bool)

(assert (=> b!46502 (= e!29639 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27)) key1!43) (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key2!27))))))

(declare-fun d!9119 () Bool)

(declare-fun e!29638 () Bool)

(assert (=> d!9119 e!29638))

(declare-fun res!27150 () Bool)

(assert (=> d!9119 (=> (not res!27150) (not e!29638))))

(declare-fun lt!20286 () List!1236)

(assert (=> d!9119 (= res!27150 (isStrictlySorted!229 lt!20286))))

(assert (=> d!9119 (= lt!20286 e!29637)))

(declare-fun c!6284 () Bool)

(assert (=> d!9119 (= c!6284 (and ((_ is Cons!1232) (removeStrictlySorted!41 (t!4261 l!812) key2!27)) (= (_1!858 (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key2!27))) key1!43)))))

(assert (=> d!9119 (isStrictlySorted!229 (removeStrictlySorted!41 (t!4261 l!812) key2!27))))

(assert (=> d!9119 (= (removeStrictlySorted!41 (removeStrictlySorted!41 (t!4261 l!812) key2!27) key1!43) lt!20286)))

(declare-fun b!46503 () Bool)

(assert (=> b!46503 (= e!29637 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27)))))

(declare-fun b!46504 () Bool)

(assert (=> b!46504 (= e!29638 (not (containsKey!91 lt!20286 key1!43)))))

(assert (= (and d!9119 c!6284) b!46503))

(assert (= (and d!9119 (not c!6284)) b!46501))

(assert (= (and b!46501 c!6283) b!46502))

(assert (= (and b!46501 (not c!6283)) b!46500))

(assert (= (and d!9119 res!27150) b!46504))

(declare-fun m!40771 () Bool)

(assert (=> b!46502 m!40771))

(assert (=> b!46502 m!40771))

(declare-fun m!40773 () Bool)

(assert (=> b!46502 m!40773))

(declare-fun m!40775 () Bool)

(assert (=> d!9119 m!40775))

(assert (=> d!9119 m!40591))

(declare-fun m!40777 () Bool)

(assert (=> d!9119 m!40777))

(declare-fun m!40779 () Bool)

(assert (=> b!46504 m!40779))

(assert (=> b!46373 d!9119))

(declare-fun b!46509 () Bool)

(declare-fun e!29646 () List!1236)

(assert (=> b!46509 (= e!29646 Nil!1233)))

(declare-fun b!46510 () Bool)

(declare-fun e!29644 () List!1236)

(assert (=> b!46510 (= e!29644 e!29646)))

(declare-fun c!6285 () Bool)

(assert (=> b!46510 (= c!6285 (and ((_ is Cons!1232) (t!4261 l!812)) (not (= (_1!858 (h!1812 (t!4261 l!812))) key2!27))))))

(declare-fun b!46511 () Bool)

(assert (=> b!46511 (= e!29646 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (t!4261 l!812)) key2!27) (h!1812 (t!4261 l!812))))))

(declare-fun d!9121 () Bool)

(declare-fun e!29645 () Bool)

(assert (=> d!9121 e!29645))

(declare-fun res!27155 () Bool)

(assert (=> d!9121 (=> (not res!27155) (not e!29645))))

(declare-fun lt!20287 () List!1236)

(assert (=> d!9121 (= res!27155 (isStrictlySorted!229 lt!20287))))

(assert (=> d!9121 (= lt!20287 e!29644)))

(declare-fun c!6286 () Bool)

(assert (=> d!9121 (= c!6286 (and ((_ is Cons!1232) (t!4261 l!812)) (= (_1!858 (h!1812 (t!4261 l!812))) key2!27)))))

(assert (=> d!9121 (isStrictlySorted!229 (t!4261 l!812))))

(assert (=> d!9121 (= (removeStrictlySorted!41 (t!4261 l!812) key2!27) lt!20287)))

(declare-fun b!46512 () Bool)

(assert (=> b!46512 (= e!29644 (t!4261 (t!4261 l!812)))))

(declare-fun b!46513 () Bool)

(assert (=> b!46513 (= e!29645 (not (containsKey!91 lt!20287 key2!27)))))

(assert (= (and d!9121 c!6286) b!46512))

(assert (= (and d!9121 (not c!6286)) b!46510))

(assert (= (and b!46510 c!6285) b!46511))

(assert (= (and b!46510 (not c!6285)) b!46509))

(assert (= (and d!9121 res!27155) b!46513))

(declare-fun m!40781 () Bool)

(assert (=> b!46511 m!40781))

(assert (=> b!46511 m!40781))

(declare-fun m!40783 () Bool)

(assert (=> b!46511 m!40783))

(declare-fun m!40785 () Bool)

(assert (=> d!9121 m!40785))

(assert (=> d!9121 m!40589))

(declare-fun m!40787 () Bool)

(assert (=> b!46513 m!40787))

(assert (=> b!46373 d!9121))

(declare-fun b!46516 () Bool)

(declare-fun e!29651 () List!1236)

(assert (=> b!46516 (= e!29651 Nil!1233)))

(declare-fun b!46517 () Bool)

(declare-fun e!29649 () List!1236)

(assert (=> b!46517 (= e!29649 e!29651)))

(declare-fun c!6287 () Bool)

(assert (=> b!46517 (= c!6287 (and ((_ is Cons!1232) (removeStrictlySorted!41 l!812 key1!43)) (not (= (_1!858 (h!1812 (removeStrictlySorted!41 l!812 key1!43))) key2!27))))))

(declare-fun b!46518 () Bool)

(assert (=> b!46518 (= e!29651 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 l!812 key1!43)) key2!27) (h!1812 (removeStrictlySorted!41 l!812 key1!43))))))

(declare-fun d!9123 () Bool)

(declare-fun e!29650 () Bool)

(assert (=> d!9123 e!29650))

(declare-fun res!27158 () Bool)

(assert (=> d!9123 (=> (not res!27158) (not e!29650))))

(declare-fun lt!20288 () List!1236)

(assert (=> d!9123 (= res!27158 (isStrictlySorted!229 lt!20288))))

(assert (=> d!9123 (= lt!20288 e!29649)))

(declare-fun c!6288 () Bool)

(assert (=> d!9123 (= c!6288 (and ((_ is Cons!1232) (removeStrictlySorted!41 l!812 key1!43)) (= (_1!858 (h!1812 (removeStrictlySorted!41 l!812 key1!43))) key2!27)))))

(assert (=> d!9123 (isStrictlySorted!229 (removeStrictlySorted!41 l!812 key1!43))))

(assert (=> d!9123 (= (removeStrictlySorted!41 (removeStrictlySorted!41 l!812 key1!43) key2!27) lt!20288)))

(declare-fun b!46519 () Bool)

(assert (=> b!46519 (= e!29649 (t!4261 (removeStrictlySorted!41 l!812 key1!43)))))

(declare-fun b!46520 () Bool)

(assert (=> b!46520 (= e!29650 (not (containsKey!91 lt!20288 key2!27)))))

(assert (= (and d!9123 c!6288) b!46519))

(assert (= (and d!9123 (not c!6288)) b!46517))

(assert (= (and b!46517 c!6287) b!46518))

(assert (= (and b!46517 (not c!6287)) b!46516))

(assert (= (and d!9123 res!27158) b!46520))

(declare-fun m!40791 () Bool)

(assert (=> b!46518 m!40791))

(assert (=> b!46518 m!40791))

(declare-fun m!40793 () Bool)

(assert (=> b!46518 m!40793))

(declare-fun m!40795 () Bool)

(assert (=> d!9123 m!40795))

(assert (=> d!9123 m!40601))

(declare-fun m!40797 () Bool)

(assert (=> d!9123 m!40797))

(declare-fun m!40799 () Bool)

(assert (=> b!46520 m!40799))

(assert (=> b!46373 d!9123))

(declare-fun b!46532 () Bool)

(declare-fun e!29659 () Bool)

(declare-fun tp!6149 () Bool)

(assert (=> b!46532 (= e!29659 (and tp_is_empty!1987 tp!6149))))

(assert (=> b!46374 (= tp!6137 e!29659)))

(assert (= (and b!46374 ((_ is Cons!1232) (t!4261 l!812))) b!46532))

(check-sat (not b!46456) (not d!9093) (not b!46518) (not b!46532) (not d!9123) (not b!46497) (not d!9097) (not d!9113) (not b!46406) (not b!46513) (not b!46494) (not d!9119) (not d!9117) (not b!46511) tp_is_empty!1987 (not b!46454) (not b!46504) (not b!46446) (not d!9083) (not b!46520) (not b!46449) (not b!46502) (not b!46492) (not d!9121) (not b!46444) (not b!46404) (not b!46499) (not b!46451) (not d!9095))
(check-sat)
(get-model)

(declare-fun d!9143 () Bool)

(declare-fun res!27171 () Bool)

(declare-fun e!29693 () Bool)

(assert (=> d!9143 (=> res!27171 e!29693)))

(assert (=> d!9143 (= res!27171 (or ((_ is Nil!1233) lt!20288) ((_ is Nil!1233) (t!4261 lt!20288))))))

(assert (=> d!9143 (= (isStrictlySorted!229 lt!20288) e!29693)))

(declare-fun b!46588 () Bool)

(declare-fun e!29694 () Bool)

(assert (=> b!46588 (= e!29693 e!29694)))

(declare-fun res!27172 () Bool)

(assert (=> b!46588 (=> (not res!27172) (not e!29694))))

(assert (=> b!46588 (= res!27172 (bvslt (_1!858 (h!1812 lt!20288)) (_1!858 (h!1812 (t!4261 lt!20288)))))))

(declare-fun b!46589 () Bool)

(assert (=> b!46589 (= e!29694 (isStrictlySorted!229 (t!4261 lt!20288)))))

(assert (= (and d!9143 (not res!27171)) b!46588))

(assert (= (and b!46588 res!27172) b!46589))

(declare-fun m!40871 () Bool)

(assert (=> b!46589 m!40871))

(assert (=> d!9123 d!9143))

(declare-fun d!9145 () Bool)

(declare-fun res!27173 () Bool)

(declare-fun e!29695 () Bool)

(assert (=> d!9145 (=> res!27173 e!29695)))

(assert (=> d!9145 (= res!27173 (or ((_ is Nil!1233) (removeStrictlySorted!41 l!812 key1!43)) ((_ is Nil!1233) (t!4261 (removeStrictlySorted!41 l!812 key1!43)))))))

(assert (=> d!9145 (= (isStrictlySorted!229 (removeStrictlySorted!41 l!812 key1!43)) e!29695)))

(declare-fun b!46590 () Bool)

(declare-fun e!29696 () Bool)

(assert (=> b!46590 (= e!29695 e!29696)))

(declare-fun res!27174 () Bool)

(assert (=> b!46590 (=> (not res!27174) (not e!29696))))

(assert (=> b!46590 (= res!27174 (bvslt (_1!858 (h!1812 (removeStrictlySorted!41 l!812 key1!43))) (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 l!812 key1!43))))))))

(declare-fun b!46591 () Bool)

(assert (=> b!46591 (= e!29696 (isStrictlySorted!229 (t!4261 (removeStrictlySorted!41 l!812 key1!43))))))

(assert (= (and d!9145 (not res!27173)) b!46590))

(assert (= (and b!46590 res!27174) b!46591))

(declare-fun m!40873 () Bool)

(assert (=> b!46591 m!40873))

(assert (=> d!9123 d!9145))

(declare-fun d!9147 () Bool)

(assert (=> d!9147 (= ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 l!812 key2!27)) key1!43) (h!1812 (removeStrictlySorted!41 l!812 key2!27))) (Cons!1232 (h!1812 (removeStrictlySorted!41 l!812 key2!27)) (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 l!812 key2!27)) key1!43)))))

(assert (=> b!46444 d!9147))

(declare-fun b!46592 () Bool)

(declare-fun e!29699 () List!1236)

(assert (=> b!46592 (= e!29699 Nil!1233)))

(declare-fun b!46593 () Bool)

(declare-fun e!29697 () List!1236)

(assert (=> b!46593 (= e!29697 e!29699)))

(declare-fun c!6309 () Bool)

(assert (=> b!46593 (= c!6309 (and ((_ is Cons!1232) (t!4261 (removeStrictlySorted!41 l!812 key2!27))) (not (= (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 l!812 key2!27)))) key1!43))))))

(declare-fun b!46594 () Bool)

(assert (=> b!46594 (= e!29699 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (t!4261 (removeStrictlySorted!41 l!812 key2!27))) key1!43) (h!1812 (t!4261 (removeStrictlySorted!41 l!812 key2!27)))))))

(declare-fun d!9149 () Bool)

(declare-fun e!29698 () Bool)

(assert (=> d!9149 e!29698))

(declare-fun res!27175 () Bool)

(assert (=> d!9149 (=> (not res!27175) (not e!29698))))

(declare-fun lt!20302 () List!1236)

(assert (=> d!9149 (= res!27175 (isStrictlySorted!229 lt!20302))))

(assert (=> d!9149 (= lt!20302 e!29697)))

(declare-fun c!6310 () Bool)

(assert (=> d!9149 (= c!6310 (and ((_ is Cons!1232) (t!4261 (removeStrictlySorted!41 l!812 key2!27))) (= (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 l!812 key2!27)))) key1!43)))))

(assert (=> d!9149 (isStrictlySorted!229 (t!4261 (removeStrictlySorted!41 l!812 key2!27)))))

(assert (=> d!9149 (= (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 l!812 key2!27)) key1!43) lt!20302)))

(declare-fun b!46595 () Bool)

(assert (=> b!46595 (= e!29697 (t!4261 (t!4261 (removeStrictlySorted!41 l!812 key2!27))))))

(declare-fun b!46596 () Bool)

(assert (=> b!46596 (= e!29698 (not (containsKey!91 lt!20302 key1!43)))))

(assert (= (and d!9149 c!6310) b!46595))

(assert (= (and d!9149 (not c!6310)) b!46593))

(assert (= (and b!46593 c!6309) b!46594))

(assert (= (and b!46593 (not c!6309)) b!46592))

(assert (= (and d!9149 res!27175) b!46596))

(declare-fun m!40875 () Bool)

(assert (=> b!46594 m!40875))

(assert (=> b!46594 m!40875))

(declare-fun m!40877 () Bool)

(assert (=> b!46594 m!40877))

(declare-fun m!40879 () Bool)

(assert (=> d!9149 m!40879))

(declare-fun m!40881 () Bool)

(assert (=> d!9149 m!40881))

(declare-fun m!40883 () Bool)

(assert (=> b!46596 m!40883))

(assert (=> b!46444 d!9149))

(declare-fun d!9151 () Bool)

(declare-fun res!27180 () Bool)

(declare-fun e!29704 () Bool)

(assert (=> d!9151 (=> res!27180 e!29704)))

(assert (=> d!9151 (= res!27180 (and ((_ is Cons!1232) lt!20274) (= (_1!858 (h!1812 lt!20274)) key2!27)))))

(assert (=> d!9151 (= (containsKey!91 lt!20274 key2!27) e!29704)))

(declare-fun b!46601 () Bool)

(declare-fun e!29705 () Bool)

(assert (=> b!46601 (= e!29704 e!29705)))

(declare-fun res!27181 () Bool)

(assert (=> b!46601 (=> (not res!27181) (not e!29705))))

(assert (=> b!46601 (= res!27181 (and (or (not ((_ is Cons!1232) lt!20274)) (bvsle (_1!858 (h!1812 lt!20274)) key2!27)) ((_ is Cons!1232) lt!20274) (bvslt (_1!858 (h!1812 lt!20274)) key2!27)))))

(declare-fun b!46602 () Bool)

(assert (=> b!46602 (= e!29705 (containsKey!91 (t!4261 lt!20274) key2!27))))

(assert (= (and d!9151 (not res!27180)) b!46601))

(assert (= (and b!46601 res!27181) b!46602))

(declare-fun m!40885 () Bool)

(assert (=> b!46602 m!40885))

(assert (=> b!46456 d!9151))

(declare-fun d!9153 () Bool)

(declare-fun res!27182 () Bool)

(declare-fun e!29706 () Bool)

(assert (=> d!9153 (=> res!27182 e!29706)))

(assert (=> d!9153 (= res!27182 (or ((_ is Nil!1233) lt!20270) ((_ is Nil!1233) (t!4261 lt!20270))))))

(assert (=> d!9153 (= (isStrictlySorted!229 lt!20270) e!29706)))

(declare-fun b!46603 () Bool)

(declare-fun e!29707 () Bool)

(assert (=> b!46603 (= e!29706 e!29707)))

(declare-fun res!27183 () Bool)

(assert (=> b!46603 (=> (not res!27183) (not e!29707))))

(assert (=> b!46603 (= res!27183 (bvslt (_1!858 (h!1812 lt!20270)) (_1!858 (h!1812 (t!4261 lt!20270)))))))

(declare-fun b!46604 () Bool)

(assert (=> b!46604 (= e!29707 (isStrictlySorted!229 (t!4261 lt!20270)))))

(assert (= (and d!9153 (not res!27182)) b!46603))

(assert (= (and b!46603 res!27183) b!46604))

(declare-fun m!40887 () Bool)

(assert (=> b!46604 m!40887))

(assert (=> d!9083 d!9153))

(declare-fun d!9155 () Bool)

(declare-fun res!27184 () Bool)

(declare-fun e!29708 () Bool)

(assert (=> d!9155 (=> res!27184 e!29708)))

(assert (=> d!9155 (= res!27184 (or ((_ is Nil!1233) (removeStrictlySorted!41 l!812 key2!27)) ((_ is Nil!1233) (t!4261 (removeStrictlySorted!41 l!812 key2!27)))))))

(assert (=> d!9155 (= (isStrictlySorted!229 (removeStrictlySorted!41 l!812 key2!27)) e!29708)))

(declare-fun b!46605 () Bool)

(declare-fun e!29709 () Bool)

(assert (=> b!46605 (= e!29708 e!29709)))

(declare-fun res!27185 () Bool)

(assert (=> b!46605 (=> (not res!27185) (not e!29709))))

(assert (=> b!46605 (= res!27185 (bvslt (_1!858 (h!1812 (removeStrictlySorted!41 l!812 key2!27))) (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 l!812 key2!27))))))))

(declare-fun b!46606 () Bool)

(assert (=> b!46606 (= e!29709 (isStrictlySorted!229 (t!4261 (removeStrictlySorted!41 l!812 key2!27))))))

(assert (= (and d!9155 (not res!27184)) b!46605))

(assert (= (and b!46605 res!27185) b!46606))

(assert (=> b!46606 m!40881))

(assert (=> d!9083 d!9155))

(declare-fun d!9157 () Bool)

(declare-fun res!27186 () Bool)

(declare-fun e!29710 () Bool)

(assert (=> d!9157 (=> res!27186 e!29710)))

(assert (=> d!9157 (= res!27186 (or ((_ is Nil!1233) lt!20286) ((_ is Nil!1233) (t!4261 lt!20286))))))

(assert (=> d!9157 (= (isStrictlySorted!229 lt!20286) e!29710)))

(declare-fun b!46607 () Bool)

(declare-fun e!29711 () Bool)

(assert (=> b!46607 (= e!29710 e!29711)))

(declare-fun res!27187 () Bool)

(assert (=> b!46607 (=> (not res!27187) (not e!29711))))

(assert (=> b!46607 (= res!27187 (bvslt (_1!858 (h!1812 lt!20286)) (_1!858 (h!1812 (t!4261 lt!20286)))))))

(declare-fun b!46608 () Bool)

(assert (=> b!46608 (= e!29711 (isStrictlySorted!229 (t!4261 lt!20286)))))

(assert (= (and d!9157 (not res!27186)) b!46607))

(assert (= (and b!46607 res!27187) b!46608))

(declare-fun m!40889 () Bool)

(assert (=> b!46608 m!40889))

(assert (=> d!9119 d!9157))

(declare-fun d!9159 () Bool)

(declare-fun res!27188 () Bool)

(declare-fun e!29712 () Bool)

(assert (=> d!9159 (=> res!27188 e!29712)))

(assert (=> d!9159 (= res!27188 (or ((_ is Nil!1233) (removeStrictlySorted!41 (t!4261 l!812) key2!27)) ((_ is Nil!1233) (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27)))))))

(assert (=> d!9159 (= (isStrictlySorted!229 (removeStrictlySorted!41 (t!4261 l!812) key2!27)) e!29712)))

(declare-fun b!46609 () Bool)

(declare-fun e!29713 () Bool)

(assert (=> b!46609 (= e!29712 e!29713)))

(declare-fun res!27189 () Bool)

(assert (=> b!46609 (=> (not res!27189) (not e!29713))))

(assert (=> b!46609 (= res!27189 (bvslt (_1!858 (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key2!27))) (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27))))))))

(declare-fun b!46610 () Bool)

(assert (=> b!46610 (= e!29713 (isStrictlySorted!229 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27))))))

(assert (= (and d!9159 (not res!27188)) b!46609))

(assert (= (and b!46609 res!27189) b!46610))

(declare-fun m!40891 () Bool)

(assert (=> b!46610 m!40891))

(assert (=> d!9119 d!9159))

(declare-fun d!9161 () Bool)

(declare-fun res!27190 () Bool)

(declare-fun e!29714 () Bool)

(assert (=> d!9161 (=> res!27190 e!29714)))

(assert (=> d!9161 (= res!27190 (or ((_ is Nil!1233) lt!20285) ((_ is Nil!1233) (t!4261 lt!20285))))))

(assert (=> d!9161 (= (isStrictlySorted!229 lt!20285) e!29714)))

(declare-fun b!46611 () Bool)

(declare-fun e!29715 () Bool)

(assert (=> b!46611 (= e!29714 e!29715)))

(declare-fun res!27191 () Bool)

(assert (=> b!46611 (=> (not res!27191) (not e!29715))))

(assert (=> b!46611 (= res!27191 (bvslt (_1!858 (h!1812 lt!20285)) (_1!858 (h!1812 (t!4261 lt!20285)))))))

(declare-fun b!46612 () Bool)

(assert (=> b!46612 (= e!29715 (isStrictlySorted!229 (t!4261 lt!20285)))))

(assert (= (and d!9161 (not res!27190)) b!46611))

(assert (= (and b!46611 res!27191) b!46612))

(declare-fun m!40893 () Bool)

(assert (=> b!46612 m!40893))

(assert (=> d!9117 d!9161))

(assert (=> d!9117 d!9079))

(declare-fun d!9163 () Bool)

(declare-fun res!27192 () Bool)

(declare-fun e!29716 () Bool)

(assert (=> d!9163 (=> res!27192 e!29716)))

(assert (=> d!9163 (= res!27192 (and ((_ is Cons!1232) lt!20271) (= (_1!858 (h!1812 lt!20271)) key1!43)))))

(assert (=> d!9163 (= (containsKey!91 lt!20271 key1!43) e!29716)))

(declare-fun b!46613 () Bool)

(declare-fun e!29717 () Bool)

(assert (=> b!46613 (= e!29716 e!29717)))

(declare-fun res!27193 () Bool)

(assert (=> b!46613 (=> (not res!27193) (not e!29717))))

(assert (=> b!46613 (= res!27193 (and (or (not ((_ is Cons!1232) lt!20271)) (bvsle (_1!858 (h!1812 lt!20271)) key1!43)) ((_ is Cons!1232) lt!20271) (bvslt (_1!858 (h!1812 lt!20271)) key1!43)))))

(declare-fun b!46614 () Bool)

(assert (=> b!46614 (= e!29717 (containsKey!91 (t!4261 lt!20271) key1!43))))

(assert (= (and d!9163 (not res!27192)) b!46613))

(assert (= (and b!46613 res!27193) b!46614))

(declare-fun m!40895 () Bool)

(assert (=> b!46614 m!40895))

(assert (=> b!46451 d!9163))

(declare-fun d!9165 () Bool)

(declare-fun res!27194 () Bool)

(declare-fun e!29718 () Bool)

(assert (=> d!9165 (=> res!27194 e!29718)))

(assert (=> d!9165 (= res!27194 (or ((_ is Nil!1233) lt!20284) ((_ is Nil!1233) (t!4261 lt!20284))))))

(assert (=> d!9165 (= (isStrictlySorted!229 lt!20284) e!29718)))

(declare-fun b!46615 () Bool)

(declare-fun e!29719 () Bool)

(assert (=> b!46615 (= e!29718 e!29719)))

(declare-fun res!27195 () Bool)

(assert (=> b!46615 (=> (not res!27195) (not e!29719))))

(assert (=> b!46615 (= res!27195 (bvslt (_1!858 (h!1812 lt!20284)) (_1!858 (h!1812 (t!4261 lt!20284)))))))

(declare-fun b!46616 () Bool)

(assert (=> b!46616 (= e!29719 (isStrictlySorted!229 (t!4261 lt!20284)))))

(assert (= (and d!9165 (not res!27194)) b!46615))

(assert (= (and b!46615 res!27195) b!46616))

(declare-fun m!40897 () Bool)

(assert (=> b!46616 m!40897))

(assert (=> d!9113 d!9165))

(declare-fun d!9167 () Bool)

(declare-fun res!27196 () Bool)

(declare-fun e!29720 () Bool)

(assert (=> d!9167 (=> res!27196 e!29720)))

(assert (=> d!9167 (= res!27196 (or ((_ is Nil!1233) (removeStrictlySorted!41 (t!4261 l!812) key1!43)) ((_ is Nil!1233) (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43)))))))

(assert (=> d!9167 (= (isStrictlySorted!229 (removeStrictlySorted!41 (t!4261 l!812) key1!43)) e!29720)))

(declare-fun b!46617 () Bool)

(declare-fun e!29721 () Bool)

(assert (=> b!46617 (= e!29720 e!29721)))

(declare-fun res!27197 () Bool)

(assert (=> b!46617 (=> (not res!27197) (not e!29721))))

(assert (=> b!46617 (= res!27197 (bvslt (_1!858 (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key1!43))) (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43))))))))

(declare-fun b!46618 () Bool)

(assert (=> b!46618 (= e!29721 (isStrictlySorted!229 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43))))))

(assert (= (and d!9167 (not res!27196)) b!46617))

(assert (= (and b!46617 res!27197) b!46618))

(declare-fun m!40899 () Bool)

(assert (=> b!46618 m!40899))

(assert (=> d!9113 d!9167))

(declare-fun d!9169 () Bool)

(assert (=> d!9169 (= ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (t!4261 l!812)) key2!27) (h!1812 (t!4261 l!812))) (Cons!1232 (h!1812 (t!4261 l!812)) (removeStrictlySorted!41 (t!4261 (t!4261 l!812)) key2!27)))))

(assert (=> b!46511 d!9169))

(declare-fun b!46619 () Bool)

(declare-fun e!29724 () List!1236)

(assert (=> b!46619 (= e!29724 Nil!1233)))

(declare-fun b!46620 () Bool)

(declare-fun e!29722 () List!1236)

(assert (=> b!46620 (= e!29722 e!29724)))

(declare-fun c!6311 () Bool)

(assert (=> b!46620 (= c!6311 (and ((_ is Cons!1232) (t!4261 (t!4261 l!812))) (not (= (_1!858 (h!1812 (t!4261 (t!4261 l!812)))) key2!27))))))

(declare-fun b!46621 () Bool)

(assert (=> b!46621 (= e!29724 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (t!4261 (t!4261 l!812))) key2!27) (h!1812 (t!4261 (t!4261 l!812)))))))

(declare-fun d!9171 () Bool)

(declare-fun e!29723 () Bool)

(assert (=> d!9171 e!29723))

(declare-fun res!27198 () Bool)

(assert (=> d!9171 (=> (not res!27198) (not e!29723))))

(declare-fun lt!20303 () List!1236)

(assert (=> d!9171 (= res!27198 (isStrictlySorted!229 lt!20303))))

(assert (=> d!9171 (= lt!20303 e!29722)))

(declare-fun c!6312 () Bool)

(assert (=> d!9171 (= c!6312 (and ((_ is Cons!1232) (t!4261 (t!4261 l!812))) (= (_1!858 (h!1812 (t!4261 (t!4261 l!812)))) key2!27)))))

(assert (=> d!9171 (isStrictlySorted!229 (t!4261 (t!4261 l!812)))))

(assert (=> d!9171 (= (removeStrictlySorted!41 (t!4261 (t!4261 l!812)) key2!27) lt!20303)))

(declare-fun b!46622 () Bool)

(assert (=> b!46622 (= e!29722 (t!4261 (t!4261 (t!4261 l!812))))))

(declare-fun b!46623 () Bool)

(assert (=> b!46623 (= e!29723 (not (containsKey!91 lt!20303 key2!27)))))

(assert (= (and d!9171 c!6312) b!46622))

(assert (= (and d!9171 (not c!6312)) b!46620))

(assert (= (and b!46620 c!6311) b!46621))

(assert (= (and b!46620 (not c!6311)) b!46619))

(assert (= (and d!9171 res!27198) b!46623))

(declare-fun m!40901 () Bool)

(assert (=> b!46621 m!40901))

(assert (=> b!46621 m!40901))

(declare-fun m!40903 () Bool)

(assert (=> b!46621 m!40903))

(declare-fun m!40905 () Bool)

(assert (=> d!9171 m!40905))

(assert (=> d!9171 m!40655))

(declare-fun m!40907 () Bool)

(assert (=> b!46623 m!40907))

(assert (=> b!46511 d!9171))

(declare-fun d!9173 () Bool)

(declare-fun res!27199 () Bool)

(declare-fun e!29725 () Bool)

(assert (=> d!9173 (=> res!27199 e!29725)))

(assert (=> d!9173 (= res!27199 (and ((_ is Cons!1232) lt!20287) (= (_1!858 (h!1812 lt!20287)) key2!27)))))

(assert (=> d!9173 (= (containsKey!91 lt!20287 key2!27) e!29725)))

(declare-fun b!46624 () Bool)

(declare-fun e!29726 () Bool)

(assert (=> b!46624 (= e!29725 e!29726)))

(declare-fun res!27200 () Bool)

(assert (=> b!46624 (=> (not res!27200) (not e!29726))))

(assert (=> b!46624 (= res!27200 (and (or (not ((_ is Cons!1232) lt!20287)) (bvsle (_1!858 (h!1812 lt!20287)) key2!27)) ((_ is Cons!1232) lt!20287) (bvslt (_1!858 (h!1812 lt!20287)) key2!27)))))

(declare-fun b!46625 () Bool)

(assert (=> b!46625 (= e!29726 (containsKey!91 (t!4261 lt!20287) key2!27))))

(assert (= (and d!9173 (not res!27199)) b!46624))

(assert (= (and b!46624 res!27200) b!46625))

(declare-fun m!40909 () Bool)

(assert (=> b!46625 m!40909))

(assert (=> b!46513 d!9173))

(declare-fun d!9175 () Bool)

(declare-fun res!27201 () Bool)

(declare-fun e!29727 () Bool)

(assert (=> d!9175 (=> res!27201 e!29727)))

(assert (=> d!9175 (= res!27201 (or ((_ is Nil!1233) (t!4261 (t!4261 l!812))) ((_ is Nil!1233) (t!4261 (t!4261 (t!4261 l!812))))))))

(assert (=> d!9175 (= (isStrictlySorted!229 (t!4261 (t!4261 l!812))) e!29727)))

(declare-fun b!46626 () Bool)

(declare-fun e!29728 () Bool)

(assert (=> b!46626 (= e!29727 e!29728)))

(declare-fun res!27202 () Bool)

(assert (=> b!46626 (=> (not res!27202) (not e!29728))))

(assert (=> b!46626 (= res!27202 (bvslt (_1!858 (h!1812 (t!4261 (t!4261 l!812)))) (_1!858 (h!1812 (t!4261 (t!4261 (t!4261 l!812)))))))))

(declare-fun b!46627 () Bool)

(assert (=> b!46627 (= e!29728 (isStrictlySorted!229 (t!4261 (t!4261 (t!4261 l!812)))))))

(assert (= (and d!9175 (not res!27201)) b!46626))

(assert (= (and b!46626 res!27202) b!46627))

(declare-fun m!40911 () Bool)

(assert (=> b!46627 m!40911))

(assert (=> b!46404 d!9175))

(declare-fun d!9177 () Bool)

(declare-fun res!27203 () Bool)

(declare-fun e!29729 () Bool)

(assert (=> d!9177 (=> res!27203 e!29729)))

(assert (=> d!9177 (= res!27203 (and ((_ is Cons!1232) lt!20270) (= (_1!858 (h!1812 lt!20270)) key1!43)))))

(assert (=> d!9177 (= (containsKey!91 lt!20270 key1!43) e!29729)))

(declare-fun b!46628 () Bool)

(declare-fun e!29730 () Bool)

(assert (=> b!46628 (= e!29729 e!29730)))

(declare-fun res!27204 () Bool)

(assert (=> b!46628 (=> (not res!27204) (not e!29730))))

(assert (=> b!46628 (= res!27204 (and (or (not ((_ is Cons!1232) lt!20270)) (bvsle (_1!858 (h!1812 lt!20270)) key1!43)) ((_ is Cons!1232) lt!20270) (bvslt (_1!858 (h!1812 lt!20270)) key1!43)))))

(declare-fun b!46629 () Bool)

(assert (=> b!46629 (= e!29730 (containsKey!91 (t!4261 lt!20270) key1!43))))

(assert (= (and d!9177 (not res!27203)) b!46628))

(assert (= (and b!46628 res!27204) b!46629))

(declare-fun m!40913 () Bool)

(assert (=> b!46629 m!40913))

(assert (=> b!46446 d!9177))

(declare-fun d!9179 () Bool)

(declare-fun res!27205 () Bool)

(declare-fun e!29731 () Bool)

(assert (=> d!9179 (=> res!27205 e!29731)))

(assert (=> d!9179 (= res!27205 (or ((_ is Nil!1233) lt!20274) ((_ is Nil!1233) (t!4261 lt!20274))))))

(assert (=> d!9179 (= (isStrictlySorted!229 lt!20274) e!29731)))

(declare-fun b!46630 () Bool)

(declare-fun e!29732 () Bool)

(assert (=> b!46630 (= e!29731 e!29732)))

(declare-fun res!27206 () Bool)

(assert (=> b!46630 (=> (not res!27206) (not e!29732))))

(assert (=> b!46630 (= res!27206 (bvslt (_1!858 (h!1812 lt!20274)) (_1!858 (h!1812 (t!4261 lt!20274)))))))

(declare-fun b!46631 () Bool)

(assert (=> b!46631 (= e!29732 (isStrictlySorted!229 (t!4261 lt!20274)))))

(assert (= (and d!9179 (not res!27205)) b!46630))

(assert (= (and b!46630 res!27206) b!46631))

(declare-fun m!40915 () Bool)

(assert (=> b!46631 m!40915))

(assert (=> d!9095 d!9179))

(assert (=> d!9095 d!9081))

(declare-fun d!9181 () Bool)

(assert (=> d!9181 (= ($colon$colon!44 (removeStrictlySorted!41 (t!4261 l!812) key1!43) (h!1812 l!812)) (Cons!1232 (h!1812 l!812) (removeStrictlySorted!41 (t!4261 l!812) key1!43)))))

(assert (=> b!46449 d!9181))

(assert (=> b!46449 d!9117))

(declare-fun d!9183 () Bool)

(declare-fun res!27207 () Bool)

(declare-fun e!29733 () Bool)

(assert (=> d!9183 (=> res!27207 e!29733)))

(assert (=> d!9183 (= res!27207 (and ((_ is Cons!1232) lt!20286) (= (_1!858 (h!1812 lt!20286)) key1!43)))))

(assert (=> d!9183 (= (containsKey!91 lt!20286 key1!43) e!29733)))

(declare-fun b!46632 () Bool)

(declare-fun e!29734 () Bool)

(assert (=> b!46632 (= e!29733 e!29734)))

(declare-fun res!27208 () Bool)

(assert (=> b!46632 (=> (not res!27208) (not e!29734))))

(assert (=> b!46632 (= res!27208 (and (or (not ((_ is Cons!1232) lt!20286)) (bvsle (_1!858 (h!1812 lt!20286)) key1!43)) ((_ is Cons!1232) lt!20286) (bvslt (_1!858 (h!1812 lt!20286)) key1!43)))))

(declare-fun b!46633 () Bool)

(assert (=> b!46633 (= e!29734 (containsKey!91 (t!4261 lt!20286) key1!43))))

(assert (= (and d!9183 (not res!27207)) b!46632))

(assert (= (and b!46632 res!27208) b!46633))

(declare-fun m!40917 () Bool)

(assert (=> b!46633 m!40917))

(assert (=> b!46504 d!9183))

(declare-fun d!9185 () Bool)

(declare-fun res!27209 () Bool)

(declare-fun e!29735 () Bool)

(assert (=> d!9185 (=> res!27209 e!29735)))

(assert (=> d!9185 (= res!27209 (and ((_ is Cons!1232) lt!20285) (= (_1!858 (h!1812 lt!20285)) key1!43)))))

(assert (=> d!9185 (= (containsKey!91 lt!20285 key1!43) e!29735)))

(declare-fun b!46634 () Bool)

(declare-fun e!29736 () Bool)

(assert (=> b!46634 (= e!29735 e!29736)))

(declare-fun res!27210 () Bool)

(assert (=> b!46634 (=> (not res!27210) (not e!29736))))

(assert (=> b!46634 (= res!27210 (and (or (not ((_ is Cons!1232) lt!20285)) (bvsle (_1!858 (h!1812 lt!20285)) key1!43)) ((_ is Cons!1232) lt!20285) (bvslt (_1!858 (h!1812 lt!20285)) key1!43)))))

(declare-fun b!46635 () Bool)

(assert (=> b!46635 (= e!29736 (containsKey!91 (t!4261 lt!20285) key1!43))))

(assert (= (and d!9185 (not res!27209)) b!46634))

(assert (= (and b!46634 res!27210) b!46635))

(declare-fun m!40919 () Bool)

(assert (=> b!46635 m!40919))

(assert (=> b!46499 d!9185))

(declare-fun d!9187 () Bool)

(assert (=> d!9187 (= ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 l!812 key1!43)) key2!27) (h!1812 (removeStrictlySorted!41 l!812 key1!43))) (Cons!1232 (h!1812 (removeStrictlySorted!41 l!812 key1!43)) (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 l!812 key1!43)) key2!27)))))

(assert (=> b!46518 d!9187))

(declare-fun b!46636 () Bool)

(declare-fun e!29739 () List!1236)

(assert (=> b!46636 (= e!29739 Nil!1233)))

(declare-fun b!46637 () Bool)

(declare-fun e!29737 () List!1236)

(assert (=> b!46637 (= e!29737 e!29739)))

(declare-fun c!6313 () Bool)

(assert (=> b!46637 (= c!6313 (and ((_ is Cons!1232) (t!4261 (removeStrictlySorted!41 l!812 key1!43))) (not (= (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 l!812 key1!43)))) key2!27))))))

(declare-fun b!46638 () Bool)

(assert (=> b!46638 (= e!29739 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (t!4261 (removeStrictlySorted!41 l!812 key1!43))) key2!27) (h!1812 (t!4261 (removeStrictlySorted!41 l!812 key1!43)))))))

(declare-fun d!9189 () Bool)

(declare-fun e!29738 () Bool)

(assert (=> d!9189 e!29738))

(declare-fun res!27211 () Bool)

(assert (=> d!9189 (=> (not res!27211) (not e!29738))))

(declare-fun lt!20304 () List!1236)

(assert (=> d!9189 (= res!27211 (isStrictlySorted!229 lt!20304))))

(assert (=> d!9189 (= lt!20304 e!29737)))

(declare-fun c!6314 () Bool)

(assert (=> d!9189 (= c!6314 (and ((_ is Cons!1232) (t!4261 (removeStrictlySorted!41 l!812 key1!43))) (= (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 l!812 key1!43)))) key2!27)))))

(assert (=> d!9189 (isStrictlySorted!229 (t!4261 (removeStrictlySorted!41 l!812 key1!43)))))

(assert (=> d!9189 (= (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 l!812 key1!43)) key2!27) lt!20304)))

(declare-fun b!46639 () Bool)

(assert (=> b!46639 (= e!29737 (t!4261 (t!4261 (removeStrictlySorted!41 l!812 key1!43))))))

(declare-fun b!46640 () Bool)

(assert (=> b!46640 (= e!29738 (not (containsKey!91 lt!20304 key2!27)))))

(assert (= (and d!9189 c!6314) b!46639))

(assert (= (and d!9189 (not c!6314)) b!46637))

(assert (= (and b!46637 c!6313) b!46638))

(assert (= (and b!46637 (not c!6313)) b!46636))

(assert (= (and d!9189 res!27211) b!46640))

(declare-fun m!40921 () Bool)

(assert (=> b!46638 m!40921))

(assert (=> b!46638 m!40921))

(declare-fun m!40923 () Bool)

(assert (=> b!46638 m!40923))

(declare-fun m!40925 () Bool)

(assert (=> d!9189 m!40925))

(assert (=> d!9189 m!40873))

(declare-fun m!40927 () Bool)

(assert (=> b!46640 m!40927))

(assert (=> b!46518 d!9189))

(declare-fun d!9191 () Bool)

(assert (=> d!9191 (= ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (t!4261 l!812)) key1!43) (h!1812 (t!4261 l!812))) (Cons!1232 (h!1812 (t!4261 l!812)) (removeStrictlySorted!41 (t!4261 (t!4261 l!812)) key1!43)))))

(assert (=> b!46497 d!9191))

(declare-fun b!46641 () Bool)

(declare-fun e!29742 () List!1236)

(assert (=> b!46641 (= e!29742 Nil!1233)))

(declare-fun b!46642 () Bool)

(declare-fun e!29740 () List!1236)

(assert (=> b!46642 (= e!29740 e!29742)))

(declare-fun c!6315 () Bool)

(assert (=> b!46642 (= c!6315 (and ((_ is Cons!1232) (t!4261 (t!4261 l!812))) (not (= (_1!858 (h!1812 (t!4261 (t!4261 l!812)))) key1!43))))))

(declare-fun b!46643 () Bool)

(assert (=> b!46643 (= e!29742 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (t!4261 (t!4261 l!812))) key1!43) (h!1812 (t!4261 (t!4261 l!812)))))))

(declare-fun d!9193 () Bool)

(declare-fun e!29741 () Bool)

(assert (=> d!9193 e!29741))

(declare-fun res!27212 () Bool)

(assert (=> d!9193 (=> (not res!27212) (not e!29741))))

(declare-fun lt!20305 () List!1236)

(assert (=> d!9193 (= res!27212 (isStrictlySorted!229 lt!20305))))

(assert (=> d!9193 (= lt!20305 e!29740)))

(declare-fun c!6316 () Bool)

(assert (=> d!9193 (= c!6316 (and ((_ is Cons!1232) (t!4261 (t!4261 l!812))) (= (_1!858 (h!1812 (t!4261 (t!4261 l!812)))) key1!43)))))

(assert (=> d!9193 (isStrictlySorted!229 (t!4261 (t!4261 l!812)))))

(assert (=> d!9193 (= (removeStrictlySorted!41 (t!4261 (t!4261 l!812)) key1!43) lt!20305)))

(declare-fun b!46644 () Bool)

(assert (=> b!46644 (= e!29740 (t!4261 (t!4261 (t!4261 l!812))))))

(declare-fun b!46645 () Bool)

(assert (=> b!46645 (= e!29741 (not (containsKey!91 lt!20305 key1!43)))))

(assert (= (and d!9193 c!6316) b!46644))

(assert (= (and d!9193 (not c!6316)) b!46642))

(assert (= (and b!46642 c!6315) b!46643))

(assert (= (and b!46642 (not c!6315)) b!46641))

(assert (= (and d!9193 res!27212) b!46645))

(declare-fun m!40929 () Bool)

(assert (=> b!46643 m!40929))

(assert (=> b!46643 m!40929))

(declare-fun m!40931 () Bool)

(assert (=> b!46643 m!40931))

(declare-fun m!40933 () Bool)

(assert (=> d!9193 m!40933))

(assert (=> d!9193 m!40655))

(declare-fun m!40935 () Bool)

(assert (=> b!46645 m!40935))

(assert (=> b!46497 d!9193))

(declare-fun d!9195 () Bool)

(assert (=> d!9195 (= ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27)) key1!43) (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key2!27))) (Cons!1232 (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key2!27)) (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27)) key1!43)))))

(assert (=> b!46502 d!9195))

(declare-fun b!46646 () Bool)

(declare-fun e!29745 () List!1236)

(assert (=> b!46646 (= e!29745 Nil!1233)))

(declare-fun b!46647 () Bool)

(declare-fun e!29743 () List!1236)

(assert (=> b!46647 (= e!29743 e!29745)))

(declare-fun c!6317 () Bool)

(assert (=> b!46647 (= c!6317 (and ((_ is Cons!1232) (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27))) (not (= (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27)))) key1!43))))))

(declare-fun b!46648 () Bool)

(assert (=> b!46648 (= e!29745 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27))) key1!43) (h!1812 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27)))))))

(declare-fun d!9197 () Bool)

(declare-fun e!29744 () Bool)

(assert (=> d!9197 e!29744))

(declare-fun res!27213 () Bool)

(assert (=> d!9197 (=> (not res!27213) (not e!29744))))

(declare-fun lt!20306 () List!1236)

(assert (=> d!9197 (= res!27213 (isStrictlySorted!229 lt!20306))))

(assert (=> d!9197 (= lt!20306 e!29743)))

(declare-fun c!6318 () Bool)

(assert (=> d!9197 (= c!6318 (and ((_ is Cons!1232) (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27))) (= (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27)))) key1!43)))))

(assert (=> d!9197 (isStrictlySorted!229 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27)))))

(assert (=> d!9197 (= (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27)) key1!43) lt!20306)))

(declare-fun b!46649 () Bool)

(assert (=> b!46649 (= e!29743 (t!4261 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key2!27))))))

(declare-fun b!46650 () Bool)

(assert (=> b!46650 (= e!29744 (not (containsKey!91 lt!20306 key1!43)))))

(assert (= (and d!9197 c!6318) b!46649))

(assert (= (and d!9197 (not c!6318)) b!46647))

(assert (= (and b!46647 c!6317) b!46648))

(assert (= (and b!46647 (not c!6317)) b!46646))

(assert (= (and d!9197 res!27213) b!46650))

(declare-fun m!40937 () Bool)

(assert (=> b!46648 m!40937))

(assert (=> b!46648 m!40937))

(declare-fun m!40939 () Bool)

(assert (=> b!46648 m!40939))

(declare-fun m!40941 () Bool)

(assert (=> d!9197 m!40941))

(assert (=> d!9197 m!40891))

(declare-fun m!40943 () Bool)

(assert (=> b!46650 m!40943))

(assert (=> b!46502 d!9197))

(declare-fun d!9199 () Bool)

(declare-fun res!27214 () Bool)

(declare-fun e!29746 () Bool)

(assert (=> d!9199 (=> res!27214 e!29746)))

(assert (=> d!9199 (= res!27214 (or ((_ is Nil!1233) lt!20287) ((_ is Nil!1233) (t!4261 lt!20287))))))

(assert (=> d!9199 (= (isStrictlySorted!229 lt!20287) e!29746)))

(declare-fun b!46651 () Bool)

(declare-fun e!29747 () Bool)

(assert (=> b!46651 (= e!29746 e!29747)))

(declare-fun res!27215 () Bool)

(assert (=> b!46651 (=> (not res!27215) (not e!29747))))

(assert (=> b!46651 (= res!27215 (bvslt (_1!858 (h!1812 lt!20287)) (_1!858 (h!1812 (t!4261 lt!20287)))))))

(declare-fun b!46652 () Bool)

(assert (=> b!46652 (= e!29747 (isStrictlySorted!229 (t!4261 lt!20287)))))

(assert (= (and d!9199 (not res!27214)) b!46651))

(assert (= (and b!46651 res!27215) b!46652))

(declare-fun m!40945 () Bool)

(assert (=> b!46652 m!40945))

(assert (=> d!9121 d!9199))

(assert (=> d!9121 d!9079))

(assert (=> b!46406 d!9079))

(declare-fun d!9201 () Bool)

(assert (=> d!9201 (= ($colon$colon!44 (removeStrictlySorted!41 (t!4261 l!812) key2!27) (h!1812 l!812)) (Cons!1232 (h!1812 l!812) (removeStrictlySorted!41 (t!4261 l!812) key2!27)))))

(assert (=> b!46454 d!9201))

(assert (=> b!46454 d!9121))

(declare-fun d!9203 () Bool)

(declare-fun res!27216 () Bool)

(declare-fun e!29748 () Bool)

(assert (=> d!9203 (=> res!27216 e!29748)))

(assert (=> d!9203 (= res!27216 (and ((_ is Cons!1232) lt!20284) (= (_1!858 (h!1812 lt!20284)) key2!27)))))

(assert (=> d!9203 (= (containsKey!91 lt!20284 key2!27) e!29748)))

(declare-fun b!46653 () Bool)

(declare-fun e!29749 () Bool)

(assert (=> b!46653 (= e!29748 e!29749)))

(declare-fun res!27217 () Bool)

(assert (=> b!46653 (=> (not res!27217) (not e!29749))))

(assert (=> b!46653 (= res!27217 (and (or (not ((_ is Cons!1232) lt!20284)) (bvsle (_1!858 (h!1812 lt!20284)) key2!27)) ((_ is Cons!1232) lt!20284) (bvslt (_1!858 (h!1812 lt!20284)) key2!27)))))

(declare-fun b!46654 () Bool)

(assert (=> b!46654 (= e!29749 (containsKey!91 (t!4261 lt!20284) key2!27))))

(assert (= (and d!9203 (not res!27216)) b!46653))

(assert (= (and b!46653 res!27217) b!46654))

(declare-fun m!40947 () Bool)

(assert (=> b!46654 m!40947))

(assert (=> b!46494 d!9203))

(declare-fun d!9205 () Bool)

(declare-fun res!27218 () Bool)

(declare-fun e!29750 () Bool)

(assert (=> d!9205 (=> res!27218 e!29750)))

(assert (=> d!9205 (= res!27218 (and ((_ is Cons!1232) lt!20288) (= (_1!858 (h!1812 lt!20288)) key2!27)))))

(assert (=> d!9205 (= (containsKey!91 lt!20288 key2!27) e!29750)))

(declare-fun b!46655 () Bool)

(declare-fun e!29751 () Bool)

(assert (=> b!46655 (= e!29750 e!29751)))

(declare-fun res!27219 () Bool)

(assert (=> b!46655 (=> (not res!27219) (not e!29751))))

(assert (=> b!46655 (= res!27219 (and (or (not ((_ is Cons!1232) lt!20288)) (bvsle (_1!858 (h!1812 lt!20288)) key2!27)) ((_ is Cons!1232) lt!20288) (bvslt (_1!858 (h!1812 lt!20288)) key2!27)))))

(declare-fun b!46656 () Bool)

(assert (=> b!46656 (= e!29751 (containsKey!91 (t!4261 lt!20288) key2!27))))

(assert (= (and d!9205 (not res!27218)) b!46655))

(assert (= (and b!46655 res!27219) b!46656))

(declare-fun m!40949 () Bool)

(assert (=> b!46656 m!40949))

(assert (=> b!46520 d!9205))

(declare-fun d!9207 () Bool)

(assert (=> d!9207 (= ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43)) key2!27) (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key1!43))) (Cons!1232 (h!1812 (removeStrictlySorted!41 (t!4261 l!812) key1!43)) (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43)) key2!27)))))

(assert (=> b!46492 d!9207))

(declare-fun b!46657 () Bool)

(declare-fun e!29754 () List!1236)

(assert (=> b!46657 (= e!29754 Nil!1233)))

(declare-fun b!46658 () Bool)

(declare-fun e!29752 () List!1236)

(assert (=> b!46658 (= e!29752 e!29754)))

(declare-fun c!6319 () Bool)

(assert (=> b!46658 (= c!6319 (and ((_ is Cons!1232) (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43))) (not (= (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43)))) key2!27))))))

(declare-fun b!46659 () Bool)

(assert (=> b!46659 (= e!29754 ($colon$colon!44 (removeStrictlySorted!41 (t!4261 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43))) key2!27) (h!1812 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43)))))))

(declare-fun d!9209 () Bool)

(declare-fun e!29753 () Bool)

(assert (=> d!9209 e!29753))

(declare-fun res!27220 () Bool)

(assert (=> d!9209 (=> (not res!27220) (not e!29753))))

(declare-fun lt!20307 () List!1236)

(assert (=> d!9209 (= res!27220 (isStrictlySorted!229 lt!20307))))

(assert (=> d!9209 (= lt!20307 e!29752)))

(declare-fun c!6320 () Bool)

(assert (=> d!9209 (= c!6320 (and ((_ is Cons!1232) (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43))) (= (_1!858 (h!1812 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43)))) key2!27)))))

(assert (=> d!9209 (isStrictlySorted!229 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43)))))

(assert (=> d!9209 (= (removeStrictlySorted!41 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43)) key2!27) lt!20307)))

(declare-fun b!46660 () Bool)

(assert (=> b!46660 (= e!29752 (t!4261 (t!4261 (removeStrictlySorted!41 (t!4261 l!812) key1!43))))))

(declare-fun b!46661 () Bool)

(assert (=> b!46661 (= e!29753 (not (containsKey!91 lt!20307 key2!27)))))

(assert (= (and d!9209 c!6320) b!46660))

(assert (= (and d!9209 (not c!6320)) b!46658))

(assert (= (and b!46658 c!6319) b!46659))

(assert (= (and b!46658 (not c!6319)) b!46657))

(assert (= (and d!9209 res!27220) b!46661))

(declare-fun m!40951 () Bool)

(assert (=> b!46659 m!40951))

(assert (=> b!46659 m!40951))

(declare-fun m!40953 () Bool)

(assert (=> b!46659 m!40953))

(declare-fun m!40955 () Bool)

(assert (=> d!9209 m!40955))

(assert (=> d!9209 m!40899))

(declare-fun m!40957 () Bool)

(assert (=> b!46661 m!40957))

(assert (=> b!46492 d!9209))

(declare-fun d!9211 () Bool)

(declare-fun res!27221 () Bool)

(declare-fun e!29755 () Bool)

(assert (=> d!9211 (=> res!27221 e!29755)))

(assert (=> d!9211 (= res!27221 (or ((_ is Nil!1233) lt!20271) ((_ is Nil!1233) (t!4261 lt!20271))))))

(assert (=> d!9211 (= (isStrictlySorted!229 lt!20271) e!29755)))

(declare-fun b!46662 () Bool)

(declare-fun e!29756 () Bool)

(assert (=> b!46662 (= e!29755 e!29756)))

(declare-fun res!27222 () Bool)

(assert (=> b!46662 (=> (not res!27222) (not e!29756))))

(assert (=> b!46662 (= res!27222 (bvslt (_1!858 (h!1812 lt!20271)) (_1!858 (h!1812 (t!4261 lt!20271)))))))

(declare-fun b!46663 () Bool)

(assert (=> b!46663 (= e!29756 (isStrictlySorted!229 (t!4261 lt!20271)))))

(assert (= (and d!9211 (not res!27221)) b!46662))

(assert (= (and b!46662 res!27222) b!46663))

(declare-fun m!40959 () Bool)

(assert (=> b!46663 m!40959))

(assert (=> d!9093 d!9211))

(assert (=> d!9093 d!9081))

(assert (=> d!9097 d!9079))

(declare-fun d!9213 () Bool)

(assert (=> d!9213 (= (removeStrictlySorted!41 (removeStrictlySorted!41 (t!4261 l!812) key1!43) key2!27) (removeStrictlySorted!41 (removeStrictlySorted!41 (t!4261 l!812) key2!27) key1!43))))

(assert (=> d!9213 true))

(declare-fun _$6!50 () Unit!1332)

(assert (=> d!9213 (= (choose!285 (t!4261 l!812) key1!43 key2!27) _$6!50)))

(declare-fun bs!2185 () Bool)

(assert (= bs!2185 d!9213))

(assert (=> bs!2185 m!40597))

(assert (=> bs!2185 m!40597))

(assert (=> bs!2185 m!40599))

(assert (=> bs!2185 m!40591))

(assert (=> bs!2185 m!40591))

(assert (=> bs!2185 m!40603))

(assert (=> d!9097 d!9213))

(assert (=> d!9097 d!9121))

(assert (=> d!9097 d!9113))

(assert (=> d!9097 d!9117))

(assert (=> d!9097 d!9119))

(declare-fun b!46664 () Bool)

(declare-fun e!29757 () Bool)

(declare-fun tp!6153 () Bool)

(assert (=> b!46664 (= e!29757 (and tp_is_empty!1987 tp!6153))))

(assert (=> b!46532 (= tp!6149 e!29757)))

(assert (= (and b!46532 ((_ is Cons!1232) (t!4261 (t!4261 l!812)))) b!46664))

(check-sat tp_is_empty!1987 (not b!46648) (not b!46618) (not b!46664) (not b!46656) (not d!9149) (not b!46640) (not b!46633) (not d!9189) (not b!46654) (not b!46610) (not b!46638) (not b!46631) (not b!46614) (not d!9213) (not d!9197) (not b!46663) (not b!46608) (not b!46659) (not b!46650) (not d!9209) (not b!46602) (not b!46629) (not b!46652) (not b!46591) (not b!46596) (not b!46616) (not b!46594) (not b!46625) (not b!46623) (not b!46635) (not b!46606) (not d!9171) (not d!9193) (not b!46645) (not b!46621) (not b!46612) (not b!46661) (not b!46589) (not b!46643) (not b!46627) (not b!46604))
(check-sat)
