; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7258 () Bool)

(assert start!7258)

(declare-fun b!46431 () Bool)

(declare-fun e!29593 () Bool)

(declare-fun tp_is_empty!1987 () Bool)

(declare-fun tp!6137 () Bool)

(assert (=> b!46431 (= e!29593 (and tp_is_empty!1987 tp!6137))))

(declare-fun b!46429 () Bool)

(declare-fun res!27123 () Bool)

(declare-fun e!29594 () Bool)

(assert (=> b!46429 (=> (not res!27123) (not e!29594))))

(declare-datatypes ((B!890 0))(
  ( (B!891 (val!1032 Int)) )
))
(declare-datatypes ((tuple2!1712 0))(
  ( (tuple2!1713 (_1!867 (_ BitVec 64)) (_2!867 B!890)) )
))
(declare-datatypes ((List!1250 0))(
  ( (Nil!1247) (Cons!1246 (h!1826 tuple2!1712) (t!4275 List!1250)) )
))
(declare-fun l!812 () List!1250)

(declare-fun isStrictlySorted!241 (List!1250) Bool)

(assert (=> b!46429 (= res!27123 (isStrictlySorted!241 (t!4275 l!812)))))

(declare-fun b!46428 () Bool)

(declare-fun res!27121 () Bool)

(assert (=> b!46428 (=> (not res!27121) (not e!29594))))

(assert (=> b!46428 (= res!27121 (is-Cons!1246 l!812))))

(declare-fun res!27122 () Bool)

(assert (=> start!7258 (=> (not res!27122) (not e!29594))))

(assert (=> start!7258 (= res!27122 (isStrictlySorted!241 l!812))))

(assert (=> start!7258 e!29594))

(assert (=> start!7258 e!29593))

(assert (=> start!7258 true))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun b!46430 () Bool)

(declare-fun removeStrictlySorted!42 (List!1250 (_ BitVec 64)) List!1250)

(assert (=> b!46430 (= e!29594 (not (= (removeStrictlySorted!42 (removeStrictlySorted!42 l!812 key1!43) key2!27) (removeStrictlySorted!42 (removeStrictlySorted!42 l!812 key2!27) key1!43))))))

(assert (=> b!46430 (= (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4275 l!812) key1!43) key2!27) (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4275 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1321 0))(
  ( (Unit!1322) )
))
(declare-fun lt!20299 () Unit!1321)

(declare-fun lemmaRemoveStrictlySortedCommutative!16 (List!1250 (_ BitVec 64) (_ BitVec 64)) Unit!1321)

(assert (=> b!46430 (= lt!20299 (lemmaRemoveStrictlySortedCommutative!16 (t!4275 l!812) key1!43 key2!27))))

(assert (= (and start!7258 res!27122) b!46428))

(assert (= (and b!46428 res!27121) b!46429))

(assert (= (and b!46429 res!27123) b!46430))

(assert (= (and start!7258 (is-Cons!1246 l!812)) b!46431))

(declare-fun m!40713 () Bool)

(assert (=> b!46429 m!40713))

(declare-fun m!40715 () Bool)

(assert (=> start!7258 m!40715))

(declare-fun m!40717 () Bool)

(assert (=> b!46430 m!40717))

(declare-fun m!40719 () Bool)

(assert (=> b!46430 m!40719))

(declare-fun m!40721 () Bool)

(assert (=> b!46430 m!40721))

(assert (=> b!46430 m!40719))

(declare-fun m!40723 () Bool)

(assert (=> b!46430 m!40723))

(declare-fun m!40725 () Bool)

(assert (=> b!46430 m!40725))

(declare-fun m!40727 () Bool)

(assert (=> b!46430 m!40727))

(assert (=> b!46430 m!40717))

(declare-fun m!40729 () Bool)

(assert (=> b!46430 m!40729))

(declare-fun m!40731 () Bool)

(assert (=> b!46430 m!40731))

(assert (=> b!46430 m!40727))

(declare-fun m!40733 () Bool)

(assert (=> b!46430 m!40733))

(assert (=> b!46430 m!40723))

(push 1)

(assert (not b!46429))

(assert (not b!46431))

(assert (not b!46430))

(assert (not start!7258))

(assert tp_is_empty!1987)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9089 () Bool)

(declare-fun res!27146 () Bool)

(declare-fun e!29611 () Bool)

(assert (=> d!9089 (=> res!27146 e!29611)))

(assert (=> d!9089 (= res!27146 (or (is-Nil!1247 l!812) (is-Nil!1247 (t!4275 l!812))))))

(assert (=> d!9089 (= (isStrictlySorted!241 l!812) e!29611)))

(declare-fun b!46460 () Bool)

(declare-fun e!29612 () Bool)

(assert (=> b!46460 (= e!29611 e!29612)))

(declare-fun res!27147 () Bool)

(assert (=> b!46460 (=> (not res!27147) (not e!29612))))

(assert (=> b!46460 (= res!27147 (bvslt (_1!867 (h!1826 l!812)) (_1!867 (h!1826 (t!4275 l!812)))))))

(declare-fun b!46461 () Bool)

(assert (=> b!46461 (= e!29612 (isStrictlySorted!241 (t!4275 l!812)))))

(assert (= (and d!9089 (not res!27146)) b!46460))

(assert (= (and b!46460 res!27147) b!46461))

(assert (=> b!46461 m!40713))

(assert (=> start!7258 d!9089))

(declare-fun d!9091 () Bool)

(declare-fun res!27148 () Bool)

(declare-fun e!29613 () Bool)

(assert (=> d!9091 (=> res!27148 e!29613)))

(assert (=> d!9091 (= res!27148 (or (is-Nil!1247 (t!4275 l!812)) (is-Nil!1247 (t!4275 (t!4275 l!812)))))))

(assert (=> d!9091 (= (isStrictlySorted!241 (t!4275 l!812)) e!29613)))

(declare-fun b!46462 () Bool)

(declare-fun e!29614 () Bool)

(assert (=> b!46462 (= e!29613 e!29614)))

(declare-fun res!27149 () Bool)

(assert (=> b!46462 (=> (not res!27149) (not e!29614))))

(assert (=> b!46462 (= res!27149 (bvslt (_1!867 (h!1826 (t!4275 l!812))) (_1!867 (h!1826 (t!4275 (t!4275 l!812))))))))

(declare-fun b!46463 () Bool)

(assert (=> b!46463 (= e!29614 (isStrictlySorted!241 (t!4275 (t!4275 l!812))))))

(assert (= (and d!9091 (not res!27148)) b!46462))

(assert (= (and b!46462 res!27149) b!46463))

(declare-fun m!40779 () Bool)

(assert (=> b!46463 m!40779))

(assert (=> b!46429 d!9091))

(declare-fun b!46478 () Bool)

(declare-fun e!29626 () List!1250)

(assert (=> b!46478 (= e!29626 (t!4275 (removeStrictlySorted!42 l!812 key2!27)))))

(declare-fun b!46479 () Bool)

(declare-fun e!29627 () List!1250)

(assert (=> b!46479 (= e!29626 e!29627)))

(declare-fun c!6270 () Bool)

(assert (=> b!46479 (= c!6270 (and (is-Cons!1246 (removeStrictlySorted!42 l!812 key2!27)) (not (= (_1!867 (h!1826 (removeStrictlySorted!42 l!812 key2!27))) key1!43))))))

(declare-fun b!46480 () Bool)

(declare-fun e!29625 () Bool)

(declare-fun lt!20308 () List!1250)

(declare-fun containsKey!90 (List!1250 (_ BitVec 64)) Bool)

(assert (=> b!46480 (= e!29625 (not (containsKey!90 lt!20308 key1!43)))))

(declare-fun d!9093 () Bool)

(assert (=> d!9093 e!29625))

(declare-fun res!27156 () Bool)

(assert (=> d!9093 (=> (not res!27156) (not e!29625))))

(assert (=> d!9093 (= res!27156 (isStrictlySorted!241 lt!20308))))

(assert (=> d!9093 (= lt!20308 e!29626)))

(declare-fun c!6269 () Bool)

(assert (=> d!9093 (= c!6269 (and (is-Cons!1246 (removeStrictlySorted!42 l!812 key2!27)) (= (_1!867 (h!1826 (removeStrictlySorted!42 l!812 key2!27))) key1!43)))))

(assert (=> d!9093 (isStrictlySorted!241 (removeStrictlySorted!42 l!812 key2!27))))

(assert (=> d!9093 (= (removeStrictlySorted!42 (removeStrictlySorted!42 l!812 key2!27) key1!43) lt!20308)))

(declare-fun b!46481 () Bool)

(declare-fun $colon$colon!44 (List!1250 tuple2!1712) List!1250)

(assert (=> b!46481 (= e!29627 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 l!812 key2!27)) key1!43) (h!1826 (removeStrictlySorted!42 l!812 key2!27))))))

(declare-fun b!46482 () Bool)

(assert (=> b!46482 (= e!29627 Nil!1247)))

(assert (= (and d!9093 c!6269) b!46478))

(assert (= (and d!9093 (not c!6269)) b!46479))

(assert (= (and b!46479 c!6270) b!46481))

(assert (= (and b!46479 (not c!6270)) b!46482))

(assert (= (and d!9093 res!27156) b!46480))

(declare-fun m!40781 () Bool)

(assert (=> b!46480 m!40781))

(declare-fun m!40783 () Bool)

(assert (=> d!9093 m!40783))

(assert (=> d!9093 m!40719))

(declare-fun m!40785 () Bool)

(assert (=> d!9093 m!40785))

(declare-fun m!40787 () Bool)

(assert (=> b!46481 m!40787))

(assert (=> b!46481 m!40787))

(declare-fun m!40789 () Bool)

(assert (=> b!46481 m!40789))

(assert (=> b!46430 d!9093))

(declare-fun b!46483 () Bool)

(declare-fun e!29629 () List!1250)

(assert (=> b!46483 (= e!29629 (t!4275 l!812))))

(declare-fun b!46484 () Bool)

(declare-fun e!29630 () List!1250)

(assert (=> b!46484 (= e!29629 e!29630)))

(declare-fun c!6272 () Bool)

(assert (=> b!46484 (= c!6272 (and (is-Cons!1246 l!812) (not (= (_1!867 (h!1826 l!812)) key1!43))))))

(declare-fun b!46485 () Bool)

(declare-fun e!29628 () Bool)

(declare-fun lt!20309 () List!1250)

(assert (=> b!46485 (= e!29628 (not (containsKey!90 lt!20309 key1!43)))))

(declare-fun d!9099 () Bool)

(assert (=> d!9099 e!29628))

(declare-fun res!27157 () Bool)

(assert (=> d!9099 (=> (not res!27157) (not e!29628))))

(assert (=> d!9099 (= res!27157 (isStrictlySorted!241 lt!20309))))

(assert (=> d!9099 (= lt!20309 e!29629)))

(declare-fun c!6271 () Bool)

(assert (=> d!9099 (= c!6271 (and (is-Cons!1246 l!812) (= (_1!867 (h!1826 l!812)) key1!43)))))

(assert (=> d!9099 (isStrictlySorted!241 l!812)))

(assert (=> d!9099 (= (removeStrictlySorted!42 l!812 key1!43) lt!20309)))

(declare-fun b!46486 () Bool)

(assert (=> b!46486 (= e!29630 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 l!812) key1!43) (h!1826 l!812)))))

(declare-fun b!46487 () Bool)

(assert (=> b!46487 (= e!29630 Nil!1247)))

(assert (= (and d!9099 c!6271) b!46483))

(assert (= (and d!9099 (not c!6271)) b!46484))

(assert (= (and b!46484 c!6272) b!46486))

(assert (= (and b!46484 (not c!6272)) b!46487))

(assert (= (and d!9099 res!27157) b!46485))

(declare-fun m!40791 () Bool)

(assert (=> b!46485 m!40791))

(declare-fun m!40793 () Bool)

(assert (=> d!9099 m!40793))

(assert (=> d!9099 m!40715))

(assert (=> b!46486 m!40723))

(assert (=> b!46486 m!40723))

(declare-fun m!40795 () Bool)

(assert (=> b!46486 m!40795))

(assert (=> b!46430 d!9099))

(declare-fun b!46488 () Bool)

(declare-fun e!29632 () List!1250)

(assert (=> b!46488 (= e!29632 (t!4275 l!812))))

(declare-fun b!46489 () Bool)

(declare-fun e!29633 () List!1250)

(assert (=> b!46489 (= e!29632 e!29633)))

(declare-fun c!6274 () Bool)

(assert (=> b!46489 (= c!6274 (and (is-Cons!1246 l!812) (not (= (_1!867 (h!1826 l!812)) key2!27))))))

(declare-fun b!46490 () Bool)

(declare-fun e!29631 () Bool)

(declare-fun lt!20310 () List!1250)

(assert (=> b!46490 (= e!29631 (not (containsKey!90 lt!20310 key2!27)))))

(declare-fun d!9101 () Bool)

(assert (=> d!9101 e!29631))

(declare-fun res!27158 () Bool)

(assert (=> d!9101 (=> (not res!27158) (not e!29631))))

(assert (=> d!9101 (= res!27158 (isStrictlySorted!241 lt!20310))))

(assert (=> d!9101 (= lt!20310 e!29632)))

(declare-fun c!6273 () Bool)

(assert (=> d!9101 (= c!6273 (and (is-Cons!1246 l!812) (= (_1!867 (h!1826 l!812)) key2!27)))))

(assert (=> d!9101 (isStrictlySorted!241 l!812)))

(assert (=> d!9101 (= (removeStrictlySorted!42 l!812 key2!27) lt!20310)))

(declare-fun b!46491 () Bool)

(assert (=> b!46491 (= e!29633 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 l!812) key2!27) (h!1826 l!812)))))

(declare-fun b!46492 () Bool)

(assert (=> b!46492 (= e!29633 Nil!1247)))

(assert (= (and d!9101 c!6273) b!46488))

(assert (= (and d!9101 (not c!6273)) b!46489))

(assert (= (and b!46489 c!6274) b!46491))

(assert (= (and b!46489 (not c!6274)) b!46492))

(assert (= (and d!9101 res!27158) b!46490))

(declare-fun m!40797 () Bool)

(assert (=> b!46490 m!40797))

(declare-fun m!40799 () Bool)

(assert (=> d!9101 m!40799))

(assert (=> d!9101 m!40715))

(assert (=> b!46491 m!40717))

(assert (=> b!46491 m!40717))

(declare-fun m!40801 () Bool)

(assert (=> b!46491 m!40801))

(assert (=> b!46430 d!9101))

(declare-fun d!9103 () Bool)

(assert (=> d!9103 (= (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4275 l!812) key1!43) key2!27) (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4275 l!812) key2!27) key1!43))))

(declare-fun lt!20313 () Unit!1321)

(declare-fun choose!277 (List!1250 (_ BitVec 64) (_ BitVec 64)) Unit!1321)

(assert (=> d!9103 (= lt!20313 (choose!277 (t!4275 l!812) key1!43 key2!27))))

(assert (=> d!9103 (isStrictlySorted!241 (t!4275 l!812))))

(assert (=> d!9103 (= (lemmaRemoveStrictlySortedCommutative!16 (t!4275 l!812) key1!43 key2!27) lt!20313)))

(declare-fun bs!2182 () Bool)

(assert (= bs!2182 d!9103))

(assert (=> bs!2182 m!40717))

(declare-fun m!40805 () Bool)

(assert (=> bs!2182 m!40805))

(assert (=> bs!2182 m!40713))

(assert (=> bs!2182 m!40723))

(assert (=> bs!2182 m!40723))

(assert (=> bs!2182 m!40725))

(assert (=> bs!2182 m!40717))

(assert (=> bs!2182 m!40729))

(assert (=> b!46430 d!9103))

(declare-fun b!46497 () Bool)

(declare-fun e!29637 () List!1250)

(assert (=> b!46497 (= e!29637 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43)))))

(declare-fun b!46498 () Bool)

(declare-fun e!29638 () List!1250)

(assert (=> b!46498 (= e!29637 e!29638)))

(declare-fun c!6276 () Bool)

(assert (=> b!46498 (= c!6276 (and (is-Cons!1246 (removeStrictlySorted!42 (t!4275 l!812) key1!43)) (not (= (_1!867 (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key1!43))) key2!27))))))

(declare-fun b!46499 () Bool)

(declare-fun e!29636 () Bool)

(declare-fun lt!20316 () List!1250)

(assert (=> b!46499 (= e!29636 (not (containsKey!90 lt!20316 key2!27)))))

(declare-fun d!9107 () Bool)

(assert (=> d!9107 e!29636))

(declare-fun res!27161 () Bool)

(assert (=> d!9107 (=> (not res!27161) (not e!29636))))

(assert (=> d!9107 (= res!27161 (isStrictlySorted!241 lt!20316))))

(assert (=> d!9107 (= lt!20316 e!29637)))

(declare-fun c!6275 () Bool)

(assert (=> d!9107 (= c!6275 (and (is-Cons!1246 (removeStrictlySorted!42 (t!4275 l!812) key1!43)) (= (_1!867 (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key1!43))) key2!27)))))

(assert (=> d!9107 (isStrictlySorted!241 (removeStrictlySorted!42 (t!4275 l!812) key1!43))))

(assert (=> d!9107 (= (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4275 l!812) key1!43) key2!27) lt!20316)))

(declare-fun b!46500 () Bool)

(assert (=> b!46500 (= e!29638 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43)) key2!27) (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key1!43))))))

(declare-fun b!46501 () Bool)

(assert (=> b!46501 (= e!29638 Nil!1247)))

(assert (= (and d!9107 c!6275) b!46497))

(assert (= (and d!9107 (not c!6275)) b!46498))

(assert (= (and b!46498 c!6276) b!46500))

(assert (= (and b!46498 (not c!6276)) b!46501))

(assert (= (and d!9107 res!27161) b!46499))

(declare-fun m!40807 () Bool)

(assert (=> b!46499 m!40807))

(declare-fun m!40809 () Bool)

(assert (=> d!9107 m!40809))

(assert (=> d!9107 m!40723))

(declare-fun m!40811 () Bool)

(assert (=> d!9107 m!40811))

(declare-fun m!40813 () Bool)

(assert (=> b!46500 m!40813))

(assert (=> b!46500 m!40813))

(declare-fun m!40815 () Bool)

(assert (=> b!46500 m!40815))

(assert (=> b!46430 d!9107))

(declare-fun b!46508 () Bool)

(declare-fun e!29644 () List!1250)

(assert (=> b!46508 (= e!29644 (t!4275 (t!4275 l!812)))))

(declare-fun b!46509 () Bool)

(declare-fun e!29645 () List!1250)

(assert (=> b!46509 (= e!29644 e!29645)))

(declare-fun c!6282 () Bool)

(assert (=> b!46509 (= c!6282 (and (is-Cons!1246 (t!4275 l!812)) (not (= (_1!867 (h!1826 (t!4275 l!812))) key1!43))))))

(declare-fun b!46510 () Bool)

(declare-fun e!29643 () Bool)

(declare-fun lt!20317 () List!1250)

(assert (=> b!46510 (= e!29643 (not (containsKey!90 lt!20317 key1!43)))))

(declare-fun d!9109 () Bool)

(assert (=> d!9109 e!29643))

(declare-fun res!27162 () Bool)

(assert (=> d!9109 (=> (not res!27162) (not e!29643))))

(assert (=> d!9109 (= res!27162 (isStrictlySorted!241 lt!20317))))

(assert (=> d!9109 (= lt!20317 e!29644)))

(declare-fun c!6281 () Bool)

(assert (=> d!9109 (= c!6281 (and (is-Cons!1246 (t!4275 l!812)) (= (_1!867 (h!1826 (t!4275 l!812))) key1!43)))))

(assert (=> d!9109 (isStrictlySorted!241 (t!4275 l!812))))

(assert (=> d!9109 (= (removeStrictlySorted!42 (t!4275 l!812) key1!43) lt!20317)))

(declare-fun b!46511 () Bool)

(assert (=> b!46511 (= e!29645 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (t!4275 l!812)) key1!43) (h!1826 (t!4275 l!812))))))

(declare-fun b!46512 () Bool)

(assert (=> b!46512 (= e!29645 Nil!1247)))

(assert (= (and d!9109 c!6281) b!46508))

(assert (= (and d!9109 (not c!6281)) b!46509))

(assert (= (and b!46509 c!6282) b!46511))

(assert (= (and b!46509 (not c!6282)) b!46512))

(assert (= (and d!9109 res!27162) b!46510))

(declare-fun m!40817 () Bool)

(assert (=> b!46510 m!40817))

(declare-fun m!40819 () Bool)

(assert (=> d!9109 m!40819))

(assert (=> d!9109 m!40713))

(declare-fun m!40821 () Bool)

(assert (=> b!46511 m!40821))

(assert (=> b!46511 m!40821))

(declare-fun m!40823 () Bool)

(assert (=> b!46511 m!40823))

(assert (=> b!46430 d!9109))

(declare-fun b!46513 () Bool)

(declare-fun e!29647 () List!1250)

(assert (=> b!46513 (= e!29647 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27)))))

(declare-fun b!46514 () Bool)

(declare-fun e!29648 () List!1250)

(assert (=> b!46514 (= e!29647 e!29648)))

(declare-fun c!6284 () Bool)

(assert (=> b!46514 (= c!6284 (and (is-Cons!1246 (removeStrictlySorted!42 (t!4275 l!812) key2!27)) (not (= (_1!867 (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key2!27))) key1!43))))))

(declare-fun b!46515 () Bool)

(declare-fun e!29646 () Bool)

(declare-fun lt!20318 () List!1250)

(assert (=> b!46515 (= e!29646 (not (containsKey!90 lt!20318 key1!43)))))

(declare-fun d!9111 () Bool)

(assert (=> d!9111 e!29646))

(declare-fun res!27163 () Bool)

(assert (=> d!9111 (=> (not res!27163) (not e!29646))))

(assert (=> d!9111 (= res!27163 (isStrictlySorted!241 lt!20318))))

(assert (=> d!9111 (= lt!20318 e!29647)))

(declare-fun c!6283 () Bool)

(assert (=> d!9111 (= c!6283 (and (is-Cons!1246 (removeStrictlySorted!42 (t!4275 l!812) key2!27)) (= (_1!867 (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key2!27))) key1!43)))))

(assert (=> d!9111 (isStrictlySorted!241 (removeStrictlySorted!42 (t!4275 l!812) key2!27))))

(assert (=> d!9111 (= (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4275 l!812) key2!27) key1!43) lt!20318)))

(declare-fun b!46516 () Bool)

(assert (=> b!46516 (= e!29648 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27)) key1!43) (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key2!27))))))

(declare-fun b!46517 () Bool)

(assert (=> b!46517 (= e!29648 Nil!1247)))

(assert (= (and d!9111 c!6283) b!46513))

(assert (= (and d!9111 (not c!6283)) b!46514))

(assert (= (and b!46514 c!6284) b!46516))

(assert (= (and b!46514 (not c!6284)) b!46517))

(assert (= (and d!9111 res!27163) b!46515))

(declare-fun m!40825 () Bool)

(assert (=> b!46515 m!40825))

(declare-fun m!40827 () Bool)

(assert (=> d!9111 m!40827))

(assert (=> d!9111 m!40717))

(declare-fun m!40829 () Bool)

(assert (=> d!9111 m!40829))

(declare-fun m!40831 () Bool)

(assert (=> b!46516 m!40831))

(assert (=> b!46516 m!40831))

(declare-fun m!40833 () Bool)

(assert (=> b!46516 m!40833))

(assert (=> b!46430 d!9111))

(declare-fun b!46518 () Bool)

(declare-fun e!29650 () List!1250)

(assert (=> b!46518 (= e!29650 (t!4275 (t!4275 l!812)))))

(declare-fun b!46519 () Bool)

(declare-fun e!29651 () List!1250)

(assert (=> b!46519 (= e!29650 e!29651)))

(declare-fun c!6286 () Bool)

(assert (=> b!46519 (= c!6286 (and (is-Cons!1246 (t!4275 l!812)) (not (= (_1!867 (h!1826 (t!4275 l!812))) key2!27))))))

(declare-fun b!46520 () Bool)

(declare-fun e!29649 () Bool)

(declare-fun lt!20319 () List!1250)

(assert (=> b!46520 (= e!29649 (not (containsKey!90 lt!20319 key2!27)))))

(declare-fun d!9113 () Bool)

(assert (=> d!9113 e!29649))

(declare-fun res!27164 () Bool)

(assert (=> d!9113 (=> (not res!27164) (not e!29649))))

(assert (=> d!9113 (= res!27164 (isStrictlySorted!241 lt!20319))))

(assert (=> d!9113 (= lt!20319 e!29650)))

(declare-fun c!6285 () Bool)

(assert (=> d!9113 (= c!6285 (and (is-Cons!1246 (t!4275 l!812)) (= (_1!867 (h!1826 (t!4275 l!812))) key2!27)))))

(assert (=> d!9113 (isStrictlySorted!241 (t!4275 l!812))))

(assert (=> d!9113 (= (removeStrictlySorted!42 (t!4275 l!812) key2!27) lt!20319)))

(declare-fun b!46521 () Bool)

(assert (=> b!46521 (= e!29651 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (t!4275 l!812)) key2!27) (h!1826 (t!4275 l!812))))))

(declare-fun b!46522 () Bool)

(assert (=> b!46522 (= e!29651 Nil!1247)))

(assert (= (and d!9113 c!6285) b!46518))

(assert (= (and d!9113 (not c!6285)) b!46519))

(assert (= (and b!46519 c!6286) b!46521))

(assert (= (and b!46519 (not c!6286)) b!46522))

(assert (= (and d!9113 res!27164) b!46520))

(declare-fun m!40835 () Bool)

(assert (=> b!46520 m!40835))

(declare-fun m!40837 () Bool)

(assert (=> d!9113 m!40837))

(assert (=> d!9113 m!40713))

(declare-fun m!40839 () Bool)

(assert (=> b!46521 m!40839))

(assert (=> b!46521 m!40839))

(declare-fun m!40841 () Bool)

(assert (=> b!46521 m!40841))

(assert (=> b!46430 d!9113))

(declare-fun b!46525 () Bool)

(declare-fun e!29655 () List!1250)

(assert (=> b!46525 (= e!29655 (t!4275 (removeStrictlySorted!42 l!812 key1!43)))))

(declare-fun b!46526 () Bool)

(declare-fun e!29656 () List!1250)

(assert (=> b!46526 (= e!29655 e!29656)))

(declare-fun c!6288 () Bool)

(assert (=> b!46526 (= c!6288 (and (is-Cons!1246 (removeStrictlySorted!42 l!812 key1!43)) (not (= (_1!867 (h!1826 (removeStrictlySorted!42 l!812 key1!43))) key2!27))))))

(declare-fun b!46527 () Bool)

(declare-fun e!29654 () Bool)

(declare-fun lt!20320 () List!1250)

(assert (=> b!46527 (= e!29654 (not (containsKey!90 lt!20320 key2!27)))))

(declare-fun d!9115 () Bool)

(assert (=> d!9115 e!29654))

(declare-fun res!27167 () Bool)

(assert (=> d!9115 (=> (not res!27167) (not e!29654))))

(assert (=> d!9115 (= res!27167 (isStrictlySorted!241 lt!20320))))

(assert (=> d!9115 (= lt!20320 e!29655)))

(declare-fun c!6287 () Bool)

(assert (=> d!9115 (= c!6287 (and (is-Cons!1246 (removeStrictlySorted!42 l!812 key1!43)) (= (_1!867 (h!1826 (removeStrictlySorted!42 l!812 key1!43))) key2!27)))))

(assert (=> d!9115 (isStrictlySorted!241 (removeStrictlySorted!42 l!812 key1!43))))

(assert (=> d!9115 (= (removeStrictlySorted!42 (removeStrictlySorted!42 l!812 key1!43) key2!27) lt!20320)))

(declare-fun b!46528 () Bool)

(assert (=> b!46528 (= e!29656 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 l!812 key1!43)) key2!27) (h!1826 (removeStrictlySorted!42 l!812 key1!43))))))

(declare-fun b!46529 () Bool)

(assert (=> b!46529 (= e!29656 Nil!1247)))

(assert (= (and d!9115 c!6287) b!46525))

(assert (= (and d!9115 (not c!6287)) b!46526))

(assert (= (and b!46526 c!6288) b!46528))

(assert (= (and b!46526 (not c!6288)) b!46529))

(assert (= (and d!9115 res!27167) b!46527))

(declare-fun m!40843 () Bool)

(assert (=> b!46527 m!40843))

(declare-fun m!40845 () Bool)

(assert (=> d!9115 m!40845))

(assert (=> d!9115 m!40727))

(declare-fun m!40847 () Bool)

(assert (=> d!9115 m!40847))

(declare-fun m!40849 () Bool)

(assert (=> b!46528 m!40849))

(assert (=> b!46528 m!40849))

(declare-fun m!40851 () Bool)

(assert (=> b!46528 m!40851))

(assert (=> b!46430 d!9115))

(declare-fun b!46534 () Bool)

(declare-fun e!29659 () Bool)

(declare-fun tp!6146 () Bool)

(assert (=> b!46534 (= e!29659 (and tp_is_empty!1987 tp!6146))))

(assert (=> b!46431 (= tp!6137 e!29659)))

(assert (= (and b!46431 (is-Cons!1246 (t!4275 l!812))) b!46534))

(push 1)

(assert (not d!9099))

(assert (not b!46485))

(assert (not b!46528))

(assert (not b!46520))

(assert (not b!46499))

(assert (not b!46486))

(assert (not b!46480))

(assert (not b!46490))

(assert (not d!9109))

(assert (not b!46461))

(assert (not d!9111))

(assert (not d!9093))

(assert (not b!46527))

(assert (not b!46511))

(assert (not b!46510))

(assert (not b!46534))

(assert (not d!9101))

(assert (not b!46516))

(assert (not d!9107))

(assert (not b!46481))

(assert (not b!46491))

(assert (not d!9113))

(assert (not d!9115))

(assert (not d!9103))

(assert (not b!46521))

(assert (not b!46463))

(assert tp_is_empty!1987)

(assert (not b!46515))

(assert (not b!46500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9169 () Bool)

(assert (=> d!9169 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43)) key2!27) (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key1!43))) (Cons!1246 (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key1!43)) (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43)) key2!27)))))

(assert (=> b!46500 d!9169))

(declare-fun b!46667 () Bool)

(declare-fun e!29749 () List!1250)

(assert (=> b!46667 (= e!29749 (t!4275 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43))))))

(declare-fun b!46668 () Bool)

(declare-fun e!29750 () List!1250)

(assert (=> b!46668 (= e!29749 e!29750)))

(declare-fun c!6330 () Bool)

(assert (=> b!46668 (= c!6330 (and (is-Cons!1246 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43))) (not (= (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43)))) key2!27))))))

(declare-fun b!46669 () Bool)

(declare-fun e!29748 () Bool)

(declare-fun lt!20347 () List!1250)

(assert (=> b!46669 (= e!29748 (not (containsKey!90 lt!20347 key2!27)))))

(declare-fun d!9173 () Bool)

(assert (=> d!9173 e!29748))

(declare-fun res!27210 () Bool)

(assert (=> d!9173 (=> (not res!27210) (not e!29748))))

(assert (=> d!9173 (= res!27210 (isStrictlySorted!241 lt!20347))))

(assert (=> d!9173 (= lt!20347 e!29749)))

(declare-fun c!6329 () Bool)

(assert (=> d!9173 (= c!6329 (and (is-Cons!1246 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43))) (= (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43)))) key2!27)))))

(assert (=> d!9173 (isStrictlySorted!241 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43)))))

(assert (=> d!9173 (= (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43)) key2!27) lt!20347)))

(declare-fun b!46670 () Bool)

(assert (=> b!46670 (= e!29750 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43))) key2!27) (h!1826 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43)))))))

(declare-fun b!46671 () Bool)

(assert (=> b!46671 (= e!29750 Nil!1247)))

(assert (= (and d!9173 c!6329) b!46667))

(assert (= (and d!9173 (not c!6329)) b!46668))

(assert (= (and b!46668 c!6330) b!46670))

(assert (= (and b!46668 (not c!6330)) b!46671))

(assert (= (and d!9173 res!27210) b!46669))

(declare-fun m!41023 () Bool)

(assert (=> b!46669 m!41023))

(declare-fun m!41025 () Bool)

(assert (=> d!9173 m!41025))

(declare-fun m!41027 () Bool)

(assert (=> d!9173 m!41027))

(declare-fun m!41029 () Bool)

(assert (=> b!46670 m!41029))

(assert (=> b!46670 m!41029))

(declare-fun m!41031 () Bool)

(assert (=> b!46670 m!41031))

(assert (=> b!46500 d!9173))

(assert (=> d!9103 d!9091))

(declare-fun d!9179 () Bool)

(assert (=> d!9179 (= (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4275 l!812) key1!43) key2!27) (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4275 l!812) key2!27) key1!43))))

(assert (=> d!9179 true))

(declare-fun _$6!50 () Unit!1321)

(assert (=> d!9179 (= (choose!277 (t!4275 l!812) key1!43 key2!27) _$6!50)))

(declare-fun bs!2185 () Bool)

(assert (= bs!2185 d!9179))

(assert (=> bs!2185 m!40723))

(assert (=> bs!2185 m!40723))

(assert (=> bs!2185 m!40725))

(assert (=> bs!2185 m!40717))

(assert (=> bs!2185 m!40717))

(assert (=> bs!2185 m!40729))

(assert (=> d!9103 d!9179))

(assert (=> d!9103 d!9113))

(assert (=> d!9103 d!9107))

(assert (=> d!9103 d!9109))

(assert (=> d!9103 d!9111))

(declare-fun d!9193 () Bool)

(declare-fun res!27227 () Bool)

(declare-fun e!29767 () Bool)

(assert (=> d!9193 (=> res!27227 e!29767)))

(assert (=> d!9193 (= res!27227 (or (is-Nil!1247 lt!20310) (is-Nil!1247 (t!4275 lt!20310))))))

(assert (=> d!9193 (= (isStrictlySorted!241 lt!20310) e!29767)))

(declare-fun b!46688 () Bool)

(declare-fun e!29768 () Bool)

(assert (=> b!46688 (= e!29767 e!29768)))

(declare-fun res!27228 () Bool)

(assert (=> b!46688 (=> (not res!27228) (not e!29768))))

(assert (=> b!46688 (= res!27228 (bvslt (_1!867 (h!1826 lt!20310)) (_1!867 (h!1826 (t!4275 lt!20310)))))))

(declare-fun b!46689 () Bool)

(assert (=> b!46689 (= e!29768 (isStrictlySorted!241 (t!4275 lt!20310)))))

(assert (= (and d!9193 (not res!27227)) b!46688))

(assert (= (and b!46688 res!27228) b!46689))

(declare-fun m!41045 () Bool)

(assert (=> b!46689 m!41045))

(assert (=> d!9101 d!9193))

(assert (=> d!9101 d!9089))

(declare-fun d!9195 () Bool)

(declare-fun res!27237 () Bool)

(declare-fun e!29781 () Bool)

(assert (=> d!9195 (=> res!27237 e!29781)))

(assert (=> d!9195 (= res!27237 (and (is-Cons!1246 lt!20319) (= (_1!867 (h!1826 lt!20319)) key2!27)))))

(assert (=> d!9195 (= (containsKey!90 lt!20319 key2!27) e!29781)))

(declare-fun b!46706 () Bool)

(declare-fun e!29782 () Bool)

(assert (=> b!46706 (= e!29781 e!29782)))

(declare-fun res!27238 () Bool)

(assert (=> b!46706 (=> (not res!27238) (not e!29782))))

(assert (=> b!46706 (= res!27238 (and (or (not (is-Cons!1246 lt!20319)) (bvsle (_1!867 (h!1826 lt!20319)) key2!27)) (is-Cons!1246 lt!20319) (bvslt (_1!867 (h!1826 lt!20319)) key2!27)))))

(declare-fun b!46707 () Bool)

(assert (=> b!46707 (= e!29782 (containsKey!90 (t!4275 lt!20319) key2!27))))

(assert (= (and d!9195 (not res!27237)) b!46706))

(assert (= (and b!46706 res!27238) b!46707))

(declare-fun m!41067 () Bool)

(assert (=> b!46707 m!41067))

(assert (=> b!46520 d!9195))

(declare-fun d!9213 () Bool)

(assert (=> d!9213 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (t!4275 l!812)) key2!27) (h!1826 (t!4275 l!812))) (Cons!1246 (h!1826 (t!4275 l!812)) (removeStrictlySorted!42 (t!4275 (t!4275 l!812)) key2!27)))))

(assert (=> b!46521 d!9213))

(declare-fun b!46713 () Bool)

(declare-fun e!29787 () List!1250)

(assert (=> b!46713 (= e!29787 (t!4275 (t!4275 (t!4275 l!812))))))

(declare-fun b!46714 () Bool)

(declare-fun e!29788 () List!1250)

(assert (=> b!46714 (= e!29787 e!29788)))

(declare-fun c!6338 () Bool)

(assert (=> b!46714 (= c!6338 (and (is-Cons!1246 (t!4275 (t!4275 l!812))) (not (= (_1!867 (h!1826 (t!4275 (t!4275 l!812)))) key2!27))))))

(declare-fun b!46715 () Bool)

(declare-fun e!29786 () Bool)

(declare-fun lt!20351 () List!1250)

(assert (=> b!46715 (= e!29786 (not (containsKey!90 lt!20351 key2!27)))))

(declare-fun d!9215 () Bool)

(assert (=> d!9215 e!29786))

(declare-fun res!27240 () Bool)

(assert (=> d!9215 (=> (not res!27240) (not e!29786))))

(assert (=> d!9215 (= res!27240 (isStrictlySorted!241 lt!20351))))

(assert (=> d!9215 (= lt!20351 e!29787)))

(declare-fun c!6337 () Bool)

(assert (=> d!9215 (= c!6337 (and (is-Cons!1246 (t!4275 (t!4275 l!812))) (= (_1!867 (h!1826 (t!4275 (t!4275 l!812)))) key2!27)))))

(assert (=> d!9215 (isStrictlySorted!241 (t!4275 (t!4275 l!812)))))

(assert (=> d!9215 (= (removeStrictlySorted!42 (t!4275 (t!4275 l!812)) key2!27) lt!20351)))

(declare-fun b!46716 () Bool)

(assert (=> b!46716 (= e!29788 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (t!4275 (t!4275 l!812))) key2!27) (h!1826 (t!4275 (t!4275 l!812)))))))

(declare-fun b!46717 () Bool)

(assert (=> b!46717 (= e!29788 Nil!1247)))

(assert (= (and d!9215 c!6337) b!46713))

(assert (= (and d!9215 (not c!6337)) b!46714))

(assert (= (and b!46714 c!6338) b!46716))

(assert (= (and b!46714 (not c!6338)) b!46717))

(assert (= (and d!9215 res!27240) b!46715))

(declare-fun m!41077 () Bool)

(assert (=> b!46715 m!41077))

(declare-fun m!41079 () Bool)

(assert (=> d!9215 m!41079))

(assert (=> d!9215 m!40779))

(declare-fun m!41081 () Bool)

(assert (=> b!46716 m!41081))

(assert (=> b!46716 m!41081))

(declare-fun m!41085 () Bool)

(assert (=> b!46716 m!41085))

(assert (=> b!46521 d!9215))

(declare-fun d!9221 () Bool)

(declare-fun res!27245 () Bool)

(declare-fun e!29793 () Bool)

(assert (=> d!9221 (=> res!27245 e!29793)))

(assert (=> d!9221 (= res!27245 (and (is-Cons!1246 lt!20316) (= (_1!867 (h!1826 lt!20316)) key2!27)))))

(assert (=> d!9221 (= (containsKey!90 lt!20316 key2!27) e!29793)))

(declare-fun b!46722 () Bool)

(declare-fun e!29794 () Bool)

(assert (=> b!46722 (= e!29793 e!29794)))

(declare-fun res!27246 () Bool)

(assert (=> b!46722 (=> (not res!27246) (not e!29794))))

(assert (=> b!46722 (= res!27246 (and (or (not (is-Cons!1246 lt!20316)) (bvsle (_1!867 (h!1826 lt!20316)) key2!27)) (is-Cons!1246 lt!20316) (bvslt (_1!867 (h!1826 lt!20316)) key2!27)))))

(declare-fun b!46723 () Bool)

(assert (=> b!46723 (= e!29794 (containsKey!90 (t!4275 lt!20316) key2!27))))

(assert (= (and d!9221 (not res!27245)) b!46722))

(assert (= (and b!46722 res!27246) b!46723))

(declare-fun m!41087 () Bool)

(assert (=> b!46723 m!41087))

(assert (=> b!46499 d!9221))

(assert (=> b!46461 d!9091))

(declare-fun d!9225 () Bool)

(assert (=> d!9225 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 l!812 key1!43)) key2!27) (h!1826 (removeStrictlySorted!42 l!812 key1!43))) (Cons!1246 (h!1826 (removeStrictlySorted!42 l!812 key1!43)) (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 l!812 key1!43)) key2!27)))))

(assert (=> b!46528 d!9225))

(declare-fun b!46726 () Bool)

(declare-fun e!29798 () List!1250)

(assert (=> b!46726 (= e!29798 (t!4275 (t!4275 (removeStrictlySorted!42 l!812 key1!43))))))

(declare-fun b!46727 () Bool)

(declare-fun e!29799 () List!1250)

(assert (=> b!46727 (= e!29798 e!29799)))

(declare-fun c!6340 () Bool)

(assert (=> b!46727 (= c!6340 (and (is-Cons!1246 (t!4275 (removeStrictlySorted!42 l!812 key1!43))) (not (= (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 l!812 key1!43)))) key2!27))))))

(declare-fun b!46728 () Bool)

(declare-fun e!29797 () Bool)

(declare-fun lt!20352 () List!1250)

(assert (=> b!46728 (= e!29797 (not (containsKey!90 lt!20352 key2!27)))))

(declare-fun d!9227 () Bool)

(assert (=> d!9227 e!29797))

(declare-fun res!27249 () Bool)

(assert (=> d!9227 (=> (not res!27249) (not e!29797))))

(assert (=> d!9227 (= res!27249 (isStrictlySorted!241 lt!20352))))

(assert (=> d!9227 (= lt!20352 e!29798)))

(declare-fun c!6339 () Bool)

(assert (=> d!9227 (= c!6339 (and (is-Cons!1246 (t!4275 (removeStrictlySorted!42 l!812 key1!43))) (= (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 l!812 key1!43)))) key2!27)))))

(assert (=> d!9227 (isStrictlySorted!241 (t!4275 (removeStrictlySorted!42 l!812 key1!43)))))

(assert (=> d!9227 (= (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 l!812 key1!43)) key2!27) lt!20352)))

(declare-fun b!46729 () Bool)

(assert (=> b!46729 (= e!29799 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (t!4275 (removeStrictlySorted!42 l!812 key1!43))) key2!27) (h!1826 (t!4275 (removeStrictlySorted!42 l!812 key1!43)))))))

(declare-fun b!46730 () Bool)

(assert (=> b!46730 (= e!29799 Nil!1247)))

(assert (= (and d!9227 c!6339) b!46726))

(assert (= (and d!9227 (not c!6339)) b!46727))

(assert (= (and b!46727 c!6340) b!46729))

(assert (= (and b!46727 (not c!6340)) b!46730))

(assert (= (and d!9227 res!27249) b!46728))

(declare-fun m!41091 () Bool)

(assert (=> b!46728 m!41091))

(declare-fun m!41093 () Bool)

(assert (=> d!9227 m!41093))

(declare-fun m!41095 () Bool)

(assert (=> d!9227 m!41095))

(declare-fun m!41097 () Bool)

(assert (=> b!46729 m!41097))

(assert (=> b!46729 m!41097))

(declare-fun m!41099 () Bool)

(assert (=> b!46729 m!41099))

(assert (=> b!46528 d!9227))

(declare-fun d!9233 () Bool)

(declare-fun res!27252 () Bool)

(declare-fun e!29802 () Bool)

(assert (=> d!9233 (=> res!27252 e!29802)))

(assert (=> d!9233 (= res!27252 (or (is-Nil!1247 lt!20317) (is-Nil!1247 (t!4275 lt!20317))))))

(assert (=> d!9233 (= (isStrictlySorted!241 lt!20317) e!29802)))

(declare-fun b!46733 () Bool)

(declare-fun e!29803 () Bool)

(assert (=> b!46733 (= e!29802 e!29803)))

(declare-fun res!27253 () Bool)

(assert (=> b!46733 (=> (not res!27253) (not e!29803))))

(assert (=> b!46733 (= res!27253 (bvslt (_1!867 (h!1826 lt!20317)) (_1!867 (h!1826 (t!4275 lt!20317)))))))

(declare-fun b!46734 () Bool)

(assert (=> b!46734 (= e!29803 (isStrictlySorted!241 (t!4275 lt!20317)))))

(assert (= (and d!9233 (not res!27252)) b!46733))

(assert (= (and b!46733 res!27253) b!46734))

(declare-fun m!41103 () Bool)

(assert (=> b!46734 m!41103))

(assert (=> d!9109 d!9233))

(assert (=> d!9109 d!9091))

(declare-fun d!9237 () Bool)

(declare-fun res!27256 () Bool)

(declare-fun e!29806 () Bool)

(assert (=> d!9237 (=> res!27256 e!29806)))

(assert (=> d!9237 (= res!27256 (or (is-Nil!1247 lt!20318) (is-Nil!1247 (t!4275 lt!20318))))))

(assert (=> d!9237 (= (isStrictlySorted!241 lt!20318) e!29806)))

(declare-fun b!46737 () Bool)

(declare-fun e!29807 () Bool)

(assert (=> b!46737 (= e!29806 e!29807)))

(declare-fun res!27257 () Bool)

(assert (=> b!46737 (=> (not res!27257) (not e!29807))))

(assert (=> b!46737 (= res!27257 (bvslt (_1!867 (h!1826 lt!20318)) (_1!867 (h!1826 (t!4275 lt!20318)))))))

(declare-fun b!46738 () Bool)

(assert (=> b!46738 (= e!29807 (isStrictlySorted!241 (t!4275 lt!20318)))))

(assert (= (and d!9237 (not res!27256)) b!46737))

(assert (= (and b!46737 res!27257) b!46738))

(declare-fun m!41107 () Bool)

(assert (=> b!46738 m!41107))

(assert (=> d!9111 d!9237))

(declare-fun d!9241 () Bool)

(declare-fun res!27258 () Bool)

(declare-fun e!29808 () Bool)

(assert (=> d!9241 (=> res!27258 e!29808)))

(assert (=> d!9241 (= res!27258 (or (is-Nil!1247 (removeStrictlySorted!42 (t!4275 l!812) key2!27)) (is-Nil!1247 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27)))))))

(assert (=> d!9241 (= (isStrictlySorted!241 (removeStrictlySorted!42 (t!4275 l!812) key2!27)) e!29808)))

(declare-fun b!46739 () Bool)

(declare-fun e!29809 () Bool)

(assert (=> b!46739 (= e!29808 e!29809)))

(declare-fun res!27259 () Bool)

(assert (=> b!46739 (=> (not res!27259) (not e!29809))))

(assert (=> b!46739 (= res!27259 (bvslt (_1!867 (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key2!27))) (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27))))))))

(declare-fun b!46740 () Bool)

(assert (=> b!46740 (= e!29809 (isStrictlySorted!241 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27))))))

(assert (= (and d!9241 (not res!27258)) b!46739))

(assert (= (and b!46739 res!27259) b!46740))

(declare-fun m!41109 () Bool)

(assert (=> b!46740 m!41109))

(assert (=> d!9111 d!9241))

(declare-fun d!9243 () Bool)

(declare-fun res!27260 () Bool)

(declare-fun e!29810 () Bool)

(assert (=> d!9243 (=> res!27260 e!29810)))

(assert (=> d!9243 (= res!27260 (or (is-Nil!1247 lt!20309) (is-Nil!1247 (t!4275 lt!20309))))))

(assert (=> d!9243 (= (isStrictlySorted!241 lt!20309) e!29810)))

(declare-fun b!46741 () Bool)

(declare-fun e!29811 () Bool)

(assert (=> b!46741 (= e!29810 e!29811)))

(declare-fun res!27261 () Bool)

(assert (=> b!46741 (=> (not res!27261) (not e!29811))))

(assert (=> b!46741 (= res!27261 (bvslt (_1!867 (h!1826 lt!20309)) (_1!867 (h!1826 (t!4275 lt!20309)))))))

(declare-fun b!46742 () Bool)

(assert (=> b!46742 (= e!29811 (isStrictlySorted!241 (t!4275 lt!20309)))))

(assert (= (and d!9243 (not res!27260)) b!46741))

(assert (= (and b!46741 res!27261) b!46742))

(declare-fun m!41111 () Bool)

(assert (=> b!46742 m!41111))

(assert (=> d!9099 d!9243))

(assert (=> d!9099 d!9089))

(declare-fun d!9245 () Bool)

(declare-fun res!27262 () Bool)

(declare-fun e!29812 () Bool)

(assert (=> d!9245 (=> res!27262 e!29812)))

(assert (=> d!9245 (= res!27262 (and (is-Cons!1246 lt!20320) (= (_1!867 (h!1826 lt!20320)) key2!27)))))

(assert (=> d!9245 (= (containsKey!90 lt!20320 key2!27) e!29812)))

(declare-fun b!46743 () Bool)

(declare-fun e!29813 () Bool)

(assert (=> b!46743 (= e!29812 e!29813)))

(declare-fun res!27263 () Bool)

(assert (=> b!46743 (=> (not res!27263) (not e!29813))))

(assert (=> b!46743 (= res!27263 (and (or (not (is-Cons!1246 lt!20320)) (bvsle (_1!867 (h!1826 lt!20320)) key2!27)) (is-Cons!1246 lt!20320) (bvslt (_1!867 (h!1826 lt!20320)) key2!27)))))

(declare-fun b!46744 () Bool)

(assert (=> b!46744 (= e!29813 (containsKey!90 (t!4275 lt!20320) key2!27))))

(assert (= (and d!9245 (not res!27262)) b!46743))

(assert (= (and b!46743 res!27263) b!46744))

(declare-fun m!41113 () Bool)

(assert (=> b!46744 m!41113))

(assert (=> b!46527 d!9245))

(declare-fun d!9247 () Bool)

(declare-fun res!27264 () Bool)

(declare-fun e!29814 () Bool)

(assert (=> d!9247 (=> res!27264 e!29814)))

(assert (=> d!9247 (= res!27264 (or (is-Nil!1247 lt!20316) (is-Nil!1247 (t!4275 lt!20316))))))

(assert (=> d!9247 (= (isStrictlySorted!241 lt!20316) e!29814)))

(declare-fun b!46745 () Bool)

(declare-fun e!29815 () Bool)

(assert (=> b!46745 (= e!29814 e!29815)))

(declare-fun res!27265 () Bool)

(assert (=> b!46745 (=> (not res!27265) (not e!29815))))

(assert (=> b!46745 (= res!27265 (bvslt (_1!867 (h!1826 lt!20316)) (_1!867 (h!1826 (t!4275 lt!20316)))))))

(declare-fun b!46746 () Bool)

(assert (=> b!46746 (= e!29815 (isStrictlySorted!241 (t!4275 lt!20316)))))

(assert (= (and d!9247 (not res!27264)) b!46745))

(assert (= (and b!46745 res!27265) b!46746))

(declare-fun m!41115 () Bool)

(assert (=> b!46746 m!41115))

(assert (=> d!9107 d!9247))

(declare-fun d!9249 () Bool)

(declare-fun res!27266 () Bool)

(declare-fun e!29816 () Bool)

(assert (=> d!9249 (=> res!27266 e!29816)))

(assert (=> d!9249 (= res!27266 (or (is-Nil!1247 (removeStrictlySorted!42 (t!4275 l!812) key1!43)) (is-Nil!1247 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43)))))))

(assert (=> d!9249 (= (isStrictlySorted!241 (removeStrictlySorted!42 (t!4275 l!812) key1!43)) e!29816)))

(declare-fun b!46747 () Bool)

(declare-fun e!29817 () Bool)

(assert (=> b!46747 (= e!29816 e!29817)))

(declare-fun res!27267 () Bool)

(assert (=> b!46747 (=> (not res!27267) (not e!29817))))

(assert (=> b!46747 (= res!27267 (bvslt (_1!867 (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key1!43))) (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43))))))))

(declare-fun b!46748 () Bool)

(assert (=> b!46748 (= e!29817 (isStrictlySorted!241 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key1!43))))))

(assert (= (and d!9249 (not res!27266)) b!46747))

(assert (= (and b!46747 res!27267) b!46748))

(assert (=> b!46748 m!41027))

(assert (=> d!9107 d!9249))

(declare-fun d!9251 () Bool)

(declare-fun res!27268 () Bool)

(declare-fun e!29818 () Bool)

(assert (=> d!9251 (=> res!27268 e!29818)))

(assert (=> d!9251 (= res!27268 (and (is-Cons!1246 lt!20308) (= (_1!867 (h!1826 lt!20308)) key1!43)))))

(assert (=> d!9251 (= (containsKey!90 lt!20308 key1!43) e!29818)))

(declare-fun b!46749 () Bool)

(declare-fun e!29819 () Bool)

(assert (=> b!46749 (= e!29818 e!29819)))

(declare-fun res!27269 () Bool)

(assert (=> b!46749 (=> (not res!27269) (not e!29819))))

(assert (=> b!46749 (= res!27269 (and (or (not (is-Cons!1246 lt!20308)) (bvsle (_1!867 (h!1826 lt!20308)) key1!43)) (is-Cons!1246 lt!20308) (bvslt (_1!867 (h!1826 lt!20308)) key1!43)))))

(declare-fun b!46750 () Bool)

(assert (=> b!46750 (= e!29819 (containsKey!90 (t!4275 lt!20308) key1!43))))

(assert (= (and d!9251 (not res!27268)) b!46749))

(assert (= (and b!46749 res!27269) b!46750))

(declare-fun m!41117 () Bool)

(assert (=> b!46750 m!41117))

(assert (=> b!46480 d!9251))

(declare-fun d!9253 () Bool)

(declare-fun res!27270 () Bool)

(declare-fun e!29820 () Bool)

(assert (=> d!9253 (=> res!27270 e!29820)))

(assert (=> d!9253 (= res!27270 (and (is-Cons!1246 lt!20310) (= (_1!867 (h!1826 lt!20310)) key2!27)))))

(assert (=> d!9253 (= (containsKey!90 lt!20310 key2!27) e!29820)))

(declare-fun b!46751 () Bool)

(declare-fun e!29821 () Bool)

(assert (=> b!46751 (= e!29820 e!29821)))

(declare-fun res!27271 () Bool)

(assert (=> b!46751 (=> (not res!27271) (not e!29821))))

(assert (=> b!46751 (= res!27271 (and (or (not (is-Cons!1246 lt!20310)) (bvsle (_1!867 (h!1826 lt!20310)) key2!27)) (is-Cons!1246 lt!20310) (bvslt (_1!867 (h!1826 lt!20310)) key2!27)))))

(declare-fun b!46752 () Bool)

(assert (=> b!46752 (= e!29821 (containsKey!90 (t!4275 lt!20310) key2!27))))

(assert (= (and d!9253 (not res!27270)) b!46751))

(assert (= (and b!46751 res!27271) b!46752))

(declare-fun m!41119 () Bool)

(assert (=> b!46752 m!41119))

(assert (=> b!46490 d!9253))

(declare-fun d!9257 () Bool)

(assert (=> d!9257 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 l!812 key2!27)) key1!43) (h!1826 (removeStrictlySorted!42 l!812 key2!27))) (Cons!1246 (h!1826 (removeStrictlySorted!42 l!812 key2!27)) (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 l!812 key2!27)) key1!43)))))

(assert (=> b!46481 d!9257))

(declare-fun b!46755 () Bool)

(declare-fun e!29825 () List!1250)

(assert (=> b!46755 (= e!29825 (t!4275 (t!4275 (removeStrictlySorted!42 l!812 key2!27))))))

(declare-fun b!46756 () Bool)

(declare-fun e!29826 () List!1250)

(assert (=> b!46756 (= e!29825 e!29826)))

(declare-fun c!6342 () Bool)

(assert (=> b!46756 (= c!6342 (and (is-Cons!1246 (t!4275 (removeStrictlySorted!42 l!812 key2!27))) (not (= (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 l!812 key2!27)))) key1!43))))))

(declare-fun b!46757 () Bool)

(declare-fun e!29824 () Bool)

(declare-fun lt!20353 () List!1250)

(assert (=> b!46757 (= e!29824 (not (containsKey!90 lt!20353 key1!43)))))

(declare-fun d!9259 () Bool)

(assert (=> d!9259 e!29824))

(declare-fun res!27274 () Bool)

(assert (=> d!9259 (=> (not res!27274) (not e!29824))))

(assert (=> d!9259 (= res!27274 (isStrictlySorted!241 lt!20353))))

(assert (=> d!9259 (= lt!20353 e!29825)))

(declare-fun c!6341 () Bool)

(assert (=> d!9259 (= c!6341 (and (is-Cons!1246 (t!4275 (removeStrictlySorted!42 l!812 key2!27))) (= (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 l!812 key2!27)))) key1!43)))))

(assert (=> d!9259 (isStrictlySorted!241 (t!4275 (removeStrictlySorted!42 l!812 key2!27)))))

(assert (=> d!9259 (= (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 l!812 key2!27)) key1!43) lt!20353)))

(declare-fun b!46758 () Bool)

(assert (=> b!46758 (= e!29826 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (t!4275 (removeStrictlySorted!42 l!812 key2!27))) key1!43) (h!1826 (t!4275 (removeStrictlySorted!42 l!812 key2!27)))))))

(declare-fun b!46759 () Bool)

(assert (=> b!46759 (= e!29826 Nil!1247)))

(assert (= (and d!9259 c!6341) b!46755))

(assert (= (and d!9259 (not c!6341)) b!46756))

(assert (= (and b!46756 c!6342) b!46758))

(assert (= (and b!46756 (not c!6342)) b!46759))

(assert (= (and d!9259 res!27274) b!46757))

(declare-fun m!41123 () Bool)

(assert (=> b!46757 m!41123))

(declare-fun m!41125 () Bool)

(assert (=> d!9259 m!41125))

(declare-fun m!41129 () Bool)

(assert (=> d!9259 m!41129))

(declare-fun m!41131 () Bool)

(assert (=> b!46758 m!41131))

(assert (=> b!46758 m!41131))

(declare-fun m!41133 () Bool)

(assert (=> b!46758 m!41133))

(assert (=> b!46481 d!9259))

(declare-fun d!9265 () Bool)

(declare-fun res!27279 () Bool)

(declare-fun e!29831 () Bool)

(assert (=> d!9265 (=> res!27279 e!29831)))

(assert (=> d!9265 (= res!27279 (or (is-Nil!1247 lt!20319) (is-Nil!1247 (t!4275 lt!20319))))))

(assert (=> d!9265 (= (isStrictlySorted!241 lt!20319) e!29831)))

(declare-fun b!46764 () Bool)

(declare-fun e!29832 () Bool)

(assert (=> b!46764 (= e!29831 e!29832)))

(declare-fun res!27280 () Bool)

(assert (=> b!46764 (=> (not res!27280) (not e!29832))))

(assert (=> b!46764 (= res!27280 (bvslt (_1!867 (h!1826 lt!20319)) (_1!867 (h!1826 (t!4275 lt!20319)))))))

(declare-fun b!46765 () Bool)

(assert (=> b!46765 (= e!29832 (isStrictlySorted!241 (t!4275 lt!20319)))))

(assert (= (and d!9265 (not res!27279)) b!46764))

(assert (= (and b!46764 res!27280) b!46765))

(declare-fun m!41135 () Bool)

(assert (=> b!46765 m!41135))

(assert (=> d!9113 d!9265))

(assert (=> d!9113 d!9091))

(declare-fun d!9267 () Bool)

(declare-fun res!27281 () Bool)

(declare-fun e!29833 () Bool)

(assert (=> d!9267 (=> res!27281 e!29833)))

(assert (=> d!9267 (= res!27281 (or (is-Nil!1247 lt!20320) (is-Nil!1247 (t!4275 lt!20320))))))

(assert (=> d!9267 (= (isStrictlySorted!241 lt!20320) e!29833)))

(declare-fun b!46766 () Bool)

(declare-fun e!29834 () Bool)

(assert (=> b!46766 (= e!29833 e!29834)))

(declare-fun res!27282 () Bool)

(assert (=> b!46766 (=> (not res!27282) (not e!29834))))

(assert (=> b!46766 (= res!27282 (bvslt (_1!867 (h!1826 lt!20320)) (_1!867 (h!1826 (t!4275 lt!20320)))))))

(declare-fun b!46767 () Bool)

(assert (=> b!46767 (= e!29834 (isStrictlySorted!241 (t!4275 lt!20320)))))

(assert (= (and d!9267 (not res!27281)) b!46766))

(assert (= (and b!46766 res!27282) b!46767))

(declare-fun m!41139 () Bool)

(assert (=> b!46767 m!41139))

(assert (=> d!9115 d!9267))

(declare-fun d!9271 () Bool)

(declare-fun res!27283 () Bool)

(declare-fun e!29835 () Bool)

(assert (=> d!9271 (=> res!27283 e!29835)))

(assert (=> d!9271 (= res!27283 (or (is-Nil!1247 (removeStrictlySorted!42 l!812 key1!43)) (is-Nil!1247 (t!4275 (removeStrictlySorted!42 l!812 key1!43)))))))

(assert (=> d!9271 (= (isStrictlySorted!241 (removeStrictlySorted!42 l!812 key1!43)) e!29835)))

(declare-fun b!46768 () Bool)

(declare-fun e!29836 () Bool)

(assert (=> b!46768 (= e!29835 e!29836)))

(declare-fun res!27284 () Bool)

(assert (=> b!46768 (=> (not res!27284) (not e!29836))))

(assert (=> b!46768 (= res!27284 (bvslt (_1!867 (h!1826 (removeStrictlySorted!42 l!812 key1!43))) (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 l!812 key1!43))))))))

(declare-fun b!46769 () Bool)

(assert (=> b!46769 (= e!29836 (isStrictlySorted!241 (t!4275 (removeStrictlySorted!42 l!812 key1!43))))))

(assert (= (and d!9271 (not res!27283)) b!46768))

(assert (= (and b!46768 res!27284) b!46769))

(assert (=> b!46769 m!41095))

(assert (=> d!9115 d!9271))

(declare-fun d!9275 () Bool)

(declare-fun res!27286 () Bool)

(declare-fun e!29840 () Bool)

(assert (=> d!9275 (=> res!27286 e!29840)))

(assert (=> d!9275 (= res!27286 (and (is-Cons!1246 lt!20317) (= (_1!867 (h!1826 lt!20317)) key1!43)))))

(assert (=> d!9275 (= (containsKey!90 lt!20317 key1!43) e!29840)))

(declare-fun b!46775 () Bool)

(declare-fun e!29841 () Bool)

(assert (=> b!46775 (= e!29840 e!29841)))

(declare-fun res!27287 () Bool)

(assert (=> b!46775 (=> (not res!27287) (not e!29841))))

(assert (=> b!46775 (= res!27287 (and (or (not (is-Cons!1246 lt!20317)) (bvsle (_1!867 (h!1826 lt!20317)) key1!43)) (is-Cons!1246 lt!20317) (bvslt (_1!867 (h!1826 lt!20317)) key1!43)))))

(declare-fun b!46776 () Bool)

(assert (=> b!46776 (= e!29841 (containsKey!90 (t!4275 lt!20317) key1!43))))

(assert (= (and d!9275 (not res!27286)) b!46775))

(assert (= (and b!46775 res!27287) b!46776))

(declare-fun m!41141 () Bool)

(assert (=> b!46776 m!41141))

(assert (=> b!46510 d!9275))

(declare-fun d!9277 () Bool)

(assert (=> d!9277 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (t!4275 l!812)) key1!43) (h!1826 (t!4275 l!812))) (Cons!1246 (h!1826 (t!4275 l!812)) (removeStrictlySorted!42 (t!4275 (t!4275 l!812)) key1!43)))))

(assert (=> b!46511 d!9277))

(declare-fun b!46777 () Bool)

(declare-fun e!29843 () List!1250)

(assert (=> b!46777 (= e!29843 (t!4275 (t!4275 (t!4275 l!812))))))

(declare-fun b!46778 () Bool)

(declare-fun e!29844 () List!1250)

(assert (=> b!46778 (= e!29843 e!29844)))

(declare-fun c!6346 () Bool)

(assert (=> b!46778 (= c!6346 (and (is-Cons!1246 (t!4275 (t!4275 l!812))) (not (= (_1!867 (h!1826 (t!4275 (t!4275 l!812)))) key1!43))))))

(declare-fun b!46779 () Bool)

(declare-fun e!29842 () Bool)

(declare-fun lt!20355 () List!1250)

(assert (=> b!46779 (= e!29842 (not (containsKey!90 lt!20355 key1!43)))))

(declare-fun d!9279 () Bool)

(assert (=> d!9279 e!29842))

(declare-fun res!27288 () Bool)

(assert (=> d!9279 (=> (not res!27288) (not e!29842))))

(assert (=> d!9279 (= res!27288 (isStrictlySorted!241 lt!20355))))

(assert (=> d!9279 (= lt!20355 e!29843)))

(declare-fun c!6345 () Bool)

(assert (=> d!9279 (= c!6345 (and (is-Cons!1246 (t!4275 (t!4275 l!812))) (= (_1!867 (h!1826 (t!4275 (t!4275 l!812)))) key1!43)))))

(assert (=> d!9279 (isStrictlySorted!241 (t!4275 (t!4275 l!812)))))

(assert (=> d!9279 (= (removeStrictlySorted!42 (t!4275 (t!4275 l!812)) key1!43) lt!20355)))

(declare-fun b!46780 () Bool)

(assert (=> b!46780 (= e!29844 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (t!4275 (t!4275 l!812))) key1!43) (h!1826 (t!4275 (t!4275 l!812)))))))

(declare-fun b!46781 () Bool)

(assert (=> b!46781 (= e!29844 Nil!1247)))

(assert (= (and d!9279 c!6345) b!46777))

(assert (= (and d!9279 (not c!6345)) b!46778))

(assert (= (and b!46778 c!6346) b!46780))

(assert (= (and b!46778 (not c!6346)) b!46781))

(assert (= (and d!9279 res!27288) b!46779))

(declare-fun m!41151 () Bool)

(assert (=> b!46779 m!41151))

(declare-fun m!41153 () Bool)

(assert (=> d!9279 m!41153))

(assert (=> d!9279 m!40779))

(declare-fun m!41155 () Bool)

(assert (=> b!46780 m!41155))

(assert (=> b!46780 m!41155))

(declare-fun m!41157 () Bool)

(assert (=> b!46780 m!41157))

(assert (=> b!46511 d!9279))

(declare-fun d!9281 () Bool)

(declare-fun res!27289 () Bool)

(declare-fun e!29846 () Bool)

(assert (=> d!9281 (=> res!27289 e!29846)))

(assert (=> d!9281 (= res!27289 (and (is-Cons!1246 lt!20318) (= (_1!867 (h!1826 lt!20318)) key1!43)))))

(assert (=> d!9281 (= (containsKey!90 lt!20318 key1!43) e!29846)))

(declare-fun b!46783 () Bool)

(declare-fun e!29847 () Bool)

(assert (=> b!46783 (= e!29846 e!29847)))

(declare-fun res!27290 () Bool)

(assert (=> b!46783 (=> (not res!27290) (not e!29847))))

(assert (=> b!46783 (= res!27290 (and (or (not (is-Cons!1246 lt!20318)) (bvsle (_1!867 (h!1826 lt!20318)) key1!43)) (is-Cons!1246 lt!20318) (bvslt (_1!867 (h!1826 lt!20318)) key1!43)))))

(declare-fun b!46784 () Bool)

(assert (=> b!46784 (= e!29847 (containsKey!90 (t!4275 lt!20318) key1!43))))

(assert (= (and d!9281 (not res!27289)) b!46783))

(assert (= (and b!46783 res!27290) b!46784))

(declare-fun m!41159 () Bool)

(assert (=> b!46784 m!41159))

(assert (=> b!46515 d!9281))

(declare-fun d!9283 () Bool)

(declare-fun res!27291 () Bool)

(declare-fun e!29848 () Bool)

(assert (=> d!9283 (=> res!27291 e!29848)))

(assert (=> d!9283 (= res!27291 (or (is-Nil!1247 lt!20308) (is-Nil!1247 (t!4275 lt!20308))))))

(assert (=> d!9283 (= (isStrictlySorted!241 lt!20308) e!29848)))

(declare-fun b!46785 () Bool)

(declare-fun e!29849 () Bool)

(assert (=> b!46785 (= e!29848 e!29849)))

(declare-fun res!27292 () Bool)

(assert (=> b!46785 (=> (not res!27292) (not e!29849))))

(assert (=> b!46785 (= res!27292 (bvslt (_1!867 (h!1826 lt!20308)) (_1!867 (h!1826 (t!4275 lt!20308)))))))

(declare-fun b!46786 () Bool)

(assert (=> b!46786 (= e!29849 (isStrictlySorted!241 (t!4275 lt!20308)))))

(assert (= (and d!9283 (not res!27291)) b!46785))

(assert (= (and b!46785 res!27292) b!46786))

(declare-fun m!41161 () Bool)

(assert (=> b!46786 m!41161))

(assert (=> d!9093 d!9283))

(declare-fun d!9285 () Bool)

(declare-fun res!27293 () Bool)

(declare-fun e!29850 () Bool)

(assert (=> d!9285 (=> res!27293 e!29850)))

(assert (=> d!9285 (= res!27293 (or (is-Nil!1247 (removeStrictlySorted!42 l!812 key2!27)) (is-Nil!1247 (t!4275 (removeStrictlySorted!42 l!812 key2!27)))))))

(assert (=> d!9285 (= (isStrictlySorted!241 (removeStrictlySorted!42 l!812 key2!27)) e!29850)))

(declare-fun b!46787 () Bool)

(declare-fun e!29851 () Bool)

(assert (=> b!46787 (= e!29850 e!29851)))

(declare-fun res!27294 () Bool)

(assert (=> b!46787 (=> (not res!27294) (not e!29851))))

(assert (=> b!46787 (= res!27294 (bvslt (_1!867 (h!1826 (removeStrictlySorted!42 l!812 key2!27))) (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 l!812 key2!27))))))))

(declare-fun b!46788 () Bool)

(assert (=> b!46788 (= e!29851 (isStrictlySorted!241 (t!4275 (removeStrictlySorted!42 l!812 key2!27))))))

(assert (= (and d!9285 (not res!27293)) b!46787))

(assert (= (and b!46787 res!27294) b!46788))

(assert (=> b!46788 m!41129))

(assert (=> d!9093 d!9285))

(declare-fun d!9287 () Bool)

(assert (=> d!9287 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27)) key1!43) (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key2!27))) (Cons!1246 (h!1826 (removeStrictlySorted!42 (t!4275 l!812) key2!27)) (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27)) key1!43)))))

(assert (=> b!46516 d!9287))

(declare-fun b!46789 () Bool)

(declare-fun e!29853 () List!1250)

(assert (=> b!46789 (= e!29853 (t!4275 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27))))))

(declare-fun b!46790 () Bool)

(declare-fun e!29854 () List!1250)

(assert (=> b!46790 (= e!29853 e!29854)))

(declare-fun c!6348 () Bool)

(assert (=> b!46790 (= c!6348 (and (is-Cons!1246 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27))) (not (= (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27)))) key1!43))))))

(declare-fun b!46791 () Bool)

(declare-fun e!29852 () Bool)

(declare-fun lt!20356 () List!1250)

(assert (=> b!46791 (= e!29852 (not (containsKey!90 lt!20356 key1!43)))))

(declare-fun d!9289 () Bool)

(assert (=> d!9289 e!29852))

(declare-fun res!27295 () Bool)

(assert (=> d!9289 (=> (not res!27295) (not e!29852))))

(assert (=> d!9289 (= res!27295 (isStrictlySorted!241 lt!20356))))

(assert (=> d!9289 (= lt!20356 e!29853)))

(declare-fun c!6347 () Bool)

(assert (=> d!9289 (= c!6347 (and (is-Cons!1246 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27))) (= (_1!867 (h!1826 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27)))) key1!43)))))

(assert (=> d!9289 (isStrictlySorted!241 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27)))))

(assert (=> d!9289 (= (removeStrictlySorted!42 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27)) key1!43) lt!20356)))

(declare-fun b!46792 () Bool)

(assert (=> b!46792 (= e!29854 ($colon$colon!44 (removeStrictlySorted!42 (t!4275 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27))) key1!43) (h!1826 (t!4275 (removeStrictlySorted!42 (t!4275 l!812) key2!27)))))))

(declare-fun b!46793 () Bool)

(assert (=> b!46793 (= e!29854 Nil!1247)))

(assert (= (and d!9289 c!6347) b!46789))

(assert (= (and d!9289 (not c!6347)) b!46790))

(assert (= (and b!46790 c!6348) b!46792))

(assert (= (and b!46790 (not c!6348)) b!46793))

(assert (= (and d!9289 res!27295) b!46791))

(declare-fun m!41163 () Bool)

(assert (=> b!46791 m!41163))

(declare-fun m!41165 () Bool)

(assert (=> d!9289 m!41165))

(assert (=> d!9289 m!41109))

(declare-fun m!41167 () Bool)

(assert (=> b!46792 m!41167))

(assert (=> b!46792 m!41167))

(declare-fun m!41169 () Bool)

(assert (=> b!46792 m!41169))

(assert (=> b!46516 d!9289))

(declare-fun d!9291 () Bool)

(declare-fun res!27296 () Bool)

(declare-fun e!29855 () Bool)

(assert (=> d!9291 (=> res!27296 e!29855)))

(assert (=> d!9291 (= res!27296 (or (is-Nil!1247 (t!4275 (t!4275 l!812))) (is-Nil!1247 (t!4275 (t!4275 (t!4275 l!812))))))))

(assert (=> d!9291 (= (isStrictlySorted!241 (t!4275 (t!4275 l!812))) e!29855)))

(declare-fun b!46794 () Bool)

(declare-fun e!29856 () Bool)

(assert (=> b!46794 (= e!29855 e!29856)))

(declare-fun res!27297 () Bool)

(assert (=> b!46794 (=> (not res!27297) (not e!29856))))

(assert (=> b!46794 (= res!27297 (bvslt (_1!867 (h!1826 (t!4275 (t!4275 l!812)))) (_1!867 (h!1826 (t!4275 (t!4275 (t!4275 l!812)))))))))

(declare-fun b!46795 () Bool)

(assert (=> b!46795 (= e!29856 (isStrictlySorted!241 (t!4275 (t!4275 (t!4275 l!812)))))))

(assert (= (and d!9291 (not res!27296)) b!46794))

(assert (= (and b!46794 res!27297) b!46795))

(declare-fun m!41171 () Bool)

(assert (=> b!46795 m!41171))

(assert (=> b!46463 d!9291))

(declare-fun d!9293 () Bool)

(declare-fun res!27298 () Bool)

(declare-fun e!29857 () Bool)

(assert (=> d!9293 (=> res!27298 e!29857)))

(assert (=> d!9293 (= res!27298 (and (is-Cons!1246 lt!20309) (= (_1!867 (h!1826 lt!20309)) key1!43)))))

(assert (=> d!9293 (= (containsKey!90 lt!20309 key1!43) e!29857)))

(declare-fun b!46796 () Bool)

(declare-fun e!29858 () Bool)

(assert (=> b!46796 (= e!29857 e!29858)))

(declare-fun res!27299 () Bool)

(assert (=> b!46796 (=> (not res!27299) (not e!29858))))

(assert (=> b!46796 (= res!27299 (and (or (not (is-Cons!1246 lt!20309)) (bvsle (_1!867 (h!1826 lt!20309)) key1!43)) (is-Cons!1246 lt!20309) (bvslt (_1!867 (h!1826 lt!20309)) key1!43)))))

(declare-fun b!46797 () Bool)

(assert (=> b!46797 (= e!29858 (containsKey!90 (t!4275 lt!20309) key1!43))))

(assert (= (and d!9293 (not res!27298)) b!46796))

(assert (= (and b!46796 res!27299) b!46797))

(declare-fun m!41173 () Bool)

(assert (=> b!46797 m!41173))

(assert (=> b!46485 d!9293))

(declare-fun d!9295 () Bool)

(assert (=> d!9295 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4275 l!812) key2!27) (h!1826 l!812)) (Cons!1246 (h!1826 l!812) (removeStrictlySorted!42 (t!4275 l!812) key2!27)))))

(assert (=> b!46491 d!9295))

(assert (=> b!46491 d!9113))

(declare-fun d!9297 () Bool)

(assert (=> d!9297 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4275 l!812) key1!43) (h!1826 l!812)) (Cons!1246 (h!1826 l!812) (removeStrictlySorted!42 (t!4275 l!812) key1!43)))))

(assert (=> b!46486 d!9297))

(assert (=> b!46486 d!9109))

(declare-fun b!46798 () Bool)

(declare-fun e!29859 () Bool)

(declare-fun tp!6154 () Bool)

(assert (=> b!46798 (= e!29859 (and tp_is_empty!1987 tp!6154))))

(assert (=> b!46534 (= tp!6146 e!29859)))

(assert (= (and b!46534 (is-Cons!1246 (t!4275 (t!4275 l!812)))) b!46798))

(push 1)

(assert (not b!46689))

(assert (not d!9179))

(assert (not b!46746))

(assert (not b!46669))

(assert (not b!46795))

(assert (not d!9215))

(assert (not d!9289))

(assert (not b!46784))

(assert (not b!46738))

(assert (not b!46715))

(assert (not b!46728))

(assert (not b!46792))

(assert (not d!9279))

(assert (not b!46744))

(assert (not b!46752))

(assert (not b!46769))

(assert (not b!46788))

(assert (not b!46797))

(assert (not b!46779))

(assert (not b!46776))

(assert (not b!46758))

(assert (not b!46750))

(assert (not b!46723))

(assert (not b!46765))

(assert (not b!46716))

(assert (not b!46729))

(assert (not b!46786))

(assert (not b!46742))

(assert (not b!46757))

(assert (not b!46670))

(assert (not b!46740))

(assert tp_is_empty!1987)

(assert (not b!46798))

(assert (not d!9227))

(assert (not d!9259))

(assert (not b!46748))

(assert (not b!46791))

(assert (not b!46707))

(assert (not b!46767))

(assert (not b!46734))

(assert (not d!9173))

(assert (not b!46780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

