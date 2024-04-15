; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7260 () Bool)

(assert start!7260)

(declare-datatypes ((B!890 0))(
  ( (B!891 (val!1032 Int)) )
))
(declare-datatypes ((tuple2!1716 0))(
  ( (tuple2!1717 (_1!869 (_ BitVec 64)) (_2!869 B!890)) )
))
(declare-datatypes ((List!1243 0))(
  ( (Nil!1240) (Cons!1239 (h!1819 tuple2!1716) (t!4267 List!1243)) )
))
(declare-fun l!812 () List!1243)

(declare-fun b!46364 () Bool)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun e!29550 () Bool)

(declare-fun removeStrictlySorted!42 (List!1243 (_ BitVec 64)) List!1243)

(assert (=> b!46364 (= e!29550 (not (= (removeStrictlySorted!42 (removeStrictlySorted!42 l!812 key1!43) key2!27) (removeStrictlySorted!42 (removeStrictlySorted!42 l!812 key2!27) key1!43))))))

(assert (=> b!46364 (= (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4267 l!812) key1!43) key2!27) (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4267 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1326 0))(
  ( (Unit!1327) )
))
(declare-fun lt!20283 () Unit!1326)

(declare-fun lemmaRemoveStrictlySortedCommutative!16 (List!1243 (_ BitVec 64) (_ BitVec 64)) Unit!1326)

(assert (=> b!46364 (= lt!20283 (lemmaRemoveStrictlySortedCommutative!16 (t!4267 l!812) key1!43 key2!27))))

(declare-fun b!46363 () Bool)

(declare-fun res!27103 () Bool)

(assert (=> b!46363 (=> (not res!27103) (not e!29550))))

(declare-fun isStrictlySorted!236 (List!1243) Bool)

(assert (=> b!46363 (= res!27103 (isStrictlySorted!236 (t!4267 l!812)))))

(declare-fun b!46365 () Bool)

(declare-fun e!29551 () Bool)

(declare-fun tp_is_empty!1987 () Bool)

(declare-fun tp!6137 () Bool)

(assert (=> b!46365 (= e!29551 (and tp_is_empty!1987 tp!6137))))

(declare-fun b!46362 () Bool)

(declare-fun res!27101 () Bool)

(assert (=> b!46362 (=> (not res!27101) (not e!29550))))

(get-info :version)

(assert (=> b!46362 (= res!27101 ((_ is Cons!1239) l!812))))

(declare-fun res!27102 () Bool)

(assert (=> start!7260 (=> (not res!27102) (not e!29550))))

(assert (=> start!7260 (= res!27102 (isStrictlySorted!236 l!812))))

(assert (=> start!7260 e!29550))

(assert (=> start!7260 e!29551))

(assert (=> start!7260 true))

(assert (= (and start!7260 res!27102) b!46362))

(assert (= (and b!46362 res!27101) b!46363))

(assert (= (and b!46363 res!27103) b!46364))

(assert (= (and start!7260 ((_ is Cons!1239) l!812)) b!46365))

(declare-fun m!40631 () Bool)

(assert (=> b!46364 m!40631))

(declare-fun m!40633 () Bool)

(assert (=> b!46364 m!40633))

(declare-fun m!40635 () Bool)

(assert (=> b!46364 m!40635))

(assert (=> b!46364 m!40633))

(declare-fun m!40637 () Bool)

(assert (=> b!46364 m!40637))

(declare-fun m!40639 () Bool)

(assert (=> b!46364 m!40639))

(declare-fun m!40641 () Bool)

(assert (=> b!46364 m!40641))

(assert (=> b!46364 m!40631))

(declare-fun m!40643 () Bool)

(assert (=> b!46364 m!40643))

(declare-fun m!40645 () Bool)

(assert (=> b!46364 m!40645))

(assert (=> b!46364 m!40641))

(declare-fun m!40647 () Bool)

(assert (=> b!46364 m!40647))

(assert (=> b!46364 m!40637))

(declare-fun m!40649 () Bool)

(assert (=> b!46363 m!40649))

(declare-fun m!40651 () Bool)

(assert (=> start!7260 m!40651))

(check-sat (not b!46364) (not start!7260) (not b!46363) (not b!46365) tp_is_empty!1987)
(check-sat)
(get-model)

(declare-fun d!9065 () Bool)

(declare-fun res!27132 () Bool)

(declare-fun e!29574 () Bool)

(assert (=> d!9065 (=> res!27132 e!29574)))

(assert (=> d!9065 (= res!27132 (or ((_ is Nil!1240) l!812) ((_ is Nil!1240) (t!4267 l!812))))))

(assert (=> d!9065 (= (isStrictlySorted!236 l!812) e!29574)))

(declare-fun b!46400 () Bool)

(declare-fun e!29575 () Bool)

(assert (=> b!46400 (= e!29574 e!29575)))

(declare-fun res!27133 () Bool)

(assert (=> b!46400 (=> (not res!27133) (not e!29575))))

(assert (=> b!46400 (= res!27133 (bvslt (_1!869 (h!1819 l!812)) (_1!869 (h!1819 (t!4267 l!812)))))))

(declare-fun b!46401 () Bool)

(assert (=> b!46401 (= e!29575 (isStrictlySorted!236 (t!4267 l!812)))))

(assert (= (and d!9065 (not res!27132)) b!46400))

(assert (= (and b!46400 res!27133) b!46401))

(assert (=> b!46401 m!40649))

(assert (=> start!7260 d!9065))

(declare-fun d!9069 () Bool)

(declare-fun res!27134 () Bool)

(declare-fun e!29576 () Bool)

(assert (=> d!9069 (=> res!27134 e!29576)))

(assert (=> d!9069 (= res!27134 (or ((_ is Nil!1240) (t!4267 l!812)) ((_ is Nil!1240) (t!4267 (t!4267 l!812)))))))

(assert (=> d!9069 (= (isStrictlySorted!236 (t!4267 l!812)) e!29576)))

(declare-fun b!46402 () Bool)

(declare-fun e!29577 () Bool)

(assert (=> b!46402 (= e!29576 e!29577)))

(declare-fun res!27135 () Bool)

(assert (=> b!46402 (=> (not res!27135) (not e!29577))))

(assert (=> b!46402 (= res!27135 (bvslt (_1!869 (h!1819 (t!4267 l!812))) (_1!869 (h!1819 (t!4267 (t!4267 l!812))))))))

(declare-fun b!46403 () Bool)

(assert (=> b!46403 (= e!29577 (isStrictlySorted!236 (t!4267 (t!4267 l!812))))))

(assert (= (and d!9069 (not res!27134)) b!46402))

(assert (= (and b!46402 res!27135) b!46403))

(declare-fun m!40699 () Bool)

(assert (=> b!46403 m!40699))

(assert (=> b!46363 d!9069))

(declare-fun d!9071 () Bool)

(declare-fun e!29593 () Bool)

(assert (=> d!9071 e!29593))

(declare-fun res!27141 () Bool)

(assert (=> d!9071 (=> (not res!27141) (not e!29593))))

(declare-fun lt!20295 () List!1243)

(assert (=> d!9071 (= res!27141 (isStrictlySorted!236 lt!20295))))

(declare-fun e!29594 () List!1243)

(assert (=> d!9071 (= lt!20295 e!29594)))

(declare-fun c!6253 () Bool)

(assert (=> d!9071 (= c!6253 (and ((_ is Cons!1239) (removeStrictlySorted!42 l!812 key2!27)) (= (_1!869 (h!1819 (removeStrictlySorted!42 l!812 key2!27))) key1!43)))))

(assert (=> d!9071 (isStrictlySorted!236 (removeStrictlySorted!42 l!812 key2!27))))

(assert (=> d!9071 (= (removeStrictlySorted!42 (removeStrictlySorted!42 l!812 key2!27) key1!43) lt!20295)))

(declare-fun b!46429 () Bool)

(declare-fun e!29595 () List!1243)

(assert (=> b!46429 (= e!29594 e!29595)))

(declare-fun c!6252 () Bool)

(assert (=> b!46429 (= c!6252 (and ((_ is Cons!1239) (removeStrictlySorted!42 l!812 key2!27)) (not (= (_1!869 (h!1819 (removeStrictlySorted!42 l!812 key2!27))) key1!43))))))

(declare-fun b!46430 () Bool)

(declare-fun $colon$colon!44 (List!1243 tuple2!1716) List!1243)

(assert (=> b!46430 (= e!29595 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 l!812 key2!27)) key1!43) (h!1819 (removeStrictlySorted!42 l!812 key2!27))))))

(declare-fun b!46431 () Bool)

(assert (=> b!46431 (= e!29594 (t!4267 (removeStrictlySorted!42 l!812 key2!27)))))

(declare-fun b!46432 () Bool)

(declare-fun containsKey!89 (List!1243 (_ BitVec 64)) Bool)

(assert (=> b!46432 (= e!29593 (not (containsKey!89 lt!20295 key1!43)))))

(declare-fun b!46433 () Bool)

(assert (=> b!46433 (= e!29595 Nil!1240)))

(assert (= (and d!9071 c!6253) b!46431))

(assert (= (and d!9071 (not c!6253)) b!46429))

(assert (= (and b!46429 c!6252) b!46430))

(assert (= (and b!46429 (not c!6252)) b!46433))

(assert (= (and d!9071 res!27141) b!46432))

(declare-fun m!40711 () Bool)

(assert (=> d!9071 m!40711))

(assert (=> d!9071 m!40633))

(declare-fun m!40713 () Bool)

(assert (=> d!9071 m!40713))

(declare-fun m!40715 () Bool)

(assert (=> b!46430 m!40715))

(assert (=> b!46430 m!40715))

(declare-fun m!40717 () Bool)

(assert (=> b!46430 m!40717))

(declare-fun m!40719 () Bool)

(assert (=> b!46432 m!40719))

(assert (=> b!46364 d!9071))

(declare-fun d!9077 () Bool)

(declare-fun e!29599 () Bool)

(assert (=> d!9077 e!29599))

(declare-fun res!27143 () Bool)

(assert (=> d!9077 (=> (not res!27143) (not e!29599))))

(declare-fun lt!20297 () List!1243)

(assert (=> d!9077 (= res!27143 (isStrictlySorted!236 lt!20297))))

(declare-fun e!29600 () List!1243)

(assert (=> d!9077 (= lt!20297 e!29600)))

(declare-fun c!6257 () Bool)

(assert (=> d!9077 (= c!6257 (and ((_ is Cons!1239) l!812) (= (_1!869 (h!1819 l!812)) key1!43)))))

(assert (=> d!9077 (isStrictlySorted!236 l!812)))

(assert (=> d!9077 (= (removeStrictlySorted!42 l!812 key1!43) lt!20297)))

(declare-fun b!46439 () Bool)

(declare-fun e!29601 () List!1243)

(assert (=> b!46439 (= e!29600 e!29601)))

(declare-fun c!6256 () Bool)

(assert (=> b!46439 (= c!6256 (and ((_ is Cons!1239) l!812) (not (= (_1!869 (h!1819 l!812)) key1!43))))))

(declare-fun b!46440 () Bool)

(assert (=> b!46440 (= e!29601 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 l!812) key1!43) (h!1819 l!812)))))

(declare-fun b!46441 () Bool)

(assert (=> b!46441 (= e!29600 (t!4267 l!812))))

(declare-fun b!46442 () Bool)

(assert (=> b!46442 (= e!29599 (not (containsKey!89 lt!20297 key1!43)))))

(declare-fun b!46443 () Bool)

(assert (=> b!46443 (= e!29601 Nil!1240)))

(assert (= (and d!9077 c!6257) b!46441))

(assert (= (and d!9077 (not c!6257)) b!46439))

(assert (= (and b!46439 c!6256) b!46440))

(assert (= (and b!46439 (not c!6256)) b!46443))

(assert (= (and d!9077 res!27143) b!46442))

(declare-fun m!40727 () Bool)

(assert (=> d!9077 m!40727))

(assert (=> d!9077 m!40651))

(assert (=> b!46440 m!40637))

(assert (=> b!46440 m!40637))

(declare-fun m!40729 () Bool)

(assert (=> b!46440 m!40729))

(declare-fun m!40731 () Bool)

(assert (=> b!46442 m!40731))

(assert (=> b!46364 d!9077))

(declare-fun d!9081 () Bool)

(declare-fun e!29605 () Bool)

(assert (=> d!9081 e!29605))

(declare-fun res!27145 () Bool)

(assert (=> d!9081 (=> (not res!27145) (not e!29605))))

(declare-fun lt!20299 () List!1243)

(assert (=> d!9081 (= res!27145 (isStrictlySorted!236 lt!20299))))

(declare-fun e!29606 () List!1243)

(assert (=> d!9081 (= lt!20299 e!29606)))

(declare-fun c!6261 () Bool)

(assert (=> d!9081 (= c!6261 (and ((_ is Cons!1239) l!812) (= (_1!869 (h!1819 l!812)) key2!27)))))

(assert (=> d!9081 (isStrictlySorted!236 l!812)))

(assert (=> d!9081 (= (removeStrictlySorted!42 l!812 key2!27) lt!20299)))

(declare-fun b!46449 () Bool)

(declare-fun e!29607 () List!1243)

(assert (=> b!46449 (= e!29606 e!29607)))

(declare-fun c!6260 () Bool)

(assert (=> b!46449 (= c!6260 (and ((_ is Cons!1239) l!812) (not (= (_1!869 (h!1819 l!812)) key2!27))))))

(declare-fun b!46450 () Bool)

(assert (=> b!46450 (= e!29607 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 l!812) key2!27) (h!1819 l!812)))))

(declare-fun b!46451 () Bool)

(assert (=> b!46451 (= e!29606 (t!4267 l!812))))

(declare-fun b!46452 () Bool)

(assert (=> b!46452 (= e!29605 (not (containsKey!89 lt!20299 key2!27)))))

(declare-fun b!46453 () Bool)

(assert (=> b!46453 (= e!29607 Nil!1240)))

(assert (= (and d!9081 c!6261) b!46451))

(assert (= (and d!9081 (not c!6261)) b!46449))

(assert (= (and b!46449 c!6260) b!46450))

(assert (= (and b!46449 (not c!6260)) b!46453))

(assert (= (and d!9081 res!27145) b!46452))

(declare-fun m!40739 () Bool)

(assert (=> d!9081 m!40739))

(assert (=> d!9081 m!40651))

(assert (=> b!46450 m!40631))

(assert (=> b!46450 m!40631))

(declare-fun m!40741 () Bool)

(assert (=> b!46450 m!40741))

(declare-fun m!40743 () Bool)

(assert (=> b!46452 m!40743))

(assert (=> b!46364 d!9081))

(declare-fun d!9085 () Bool)

(assert (=> d!9085 (= (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4267 l!812) key1!43) key2!27) (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4267 l!812) key2!27) key1!43))))

(declare-fun lt!20307 () Unit!1326)

(declare-fun choose!285 (List!1243 (_ BitVec 64) (_ BitVec 64)) Unit!1326)

(assert (=> d!9085 (= lt!20307 (choose!285 (t!4267 l!812) key1!43 key2!27))))

(assert (=> d!9085 (isStrictlySorted!236 (t!4267 l!812))))

(assert (=> d!9085 (= (lemmaRemoveStrictlySortedCommutative!16 (t!4267 l!812) key1!43 key2!27) lt!20307)))

(declare-fun bs!2182 () Bool)

(assert (= bs!2182 d!9085))

(assert (=> bs!2182 m!40637))

(assert (=> bs!2182 m!40649))

(assert (=> bs!2182 m!40631))

(assert (=> bs!2182 m!40643))

(declare-fun m!40747 () Bool)

(assert (=> bs!2182 m!40747))

(assert (=> bs!2182 m!40631))

(assert (=> bs!2182 m!40637))

(assert (=> bs!2182 m!40639))

(assert (=> b!46364 d!9085))

(declare-fun d!9089 () Bool)

(declare-fun e!29617 () Bool)

(assert (=> d!9089 e!29617))

(declare-fun res!27149 () Bool)

(assert (=> d!9089 (=> (not res!27149) (not e!29617))))

(declare-fun lt!20309 () List!1243)

(assert (=> d!9089 (= res!27149 (isStrictlySorted!236 lt!20309))))

(declare-fun e!29618 () List!1243)

(assert (=> d!9089 (= lt!20309 e!29618)))

(declare-fun c!6269 () Bool)

(assert (=> d!9089 (= c!6269 (and ((_ is Cons!1239) (removeStrictlySorted!42 (t!4267 l!812) key1!43)) (= (_1!869 (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key1!43))) key2!27)))))

(assert (=> d!9089 (isStrictlySorted!236 (removeStrictlySorted!42 (t!4267 l!812) key1!43))))

(assert (=> d!9089 (= (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4267 l!812) key1!43) key2!27) lt!20309)))

(declare-fun b!46469 () Bool)

(declare-fun e!29619 () List!1243)

(assert (=> b!46469 (= e!29618 e!29619)))

(declare-fun c!6268 () Bool)

(assert (=> b!46469 (= c!6268 (and ((_ is Cons!1239) (removeStrictlySorted!42 (t!4267 l!812) key1!43)) (not (= (_1!869 (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key1!43))) key2!27))))))

(declare-fun b!46470 () Bool)

(assert (=> b!46470 (= e!29619 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43)) key2!27) (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key1!43))))))

(declare-fun b!46471 () Bool)

(assert (=> b!46471 (= e!29618 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43)))))

(declare-fun b!46472 () Bool)

(assert (=> b!46472 (= e!29617 (not (containsKey!89 lt!20309 key2!27)))))

(declare-fun b!46473 () Bool)

(assert (=> b!46473 (= e!29619 Nil!1240)))

(assert (= (and d!9089 c!6269) b!46471))

(assert (= (and d!9089 (not c!6269)) b!46469))

(assert (= (and b!46469 c!6268) b!46470))

(assert (= (and b!46469 (not c!6268)) b!46473))

(assert (= (and d!9089 res!27149) b!46472))

(declare-fun m!40759 () Bool)

(assert (=> d!9089 m!40759))

(assert (=> d!9089 m!40637))

(declare-fun m!40761 () Bool)

(assert (=> d!9089 m!40761))

(declare-fun m!40763 () Bool)

(assert (=> b!46470 m!40763))

(assert (=> b!46470 m!40763))

(declare-fun m!40765 () Bool)

(assert (=> b!46470 m!40765))

(declare-fun m!40767 () Bool)

(assert (=> b!46472 m!40767))

(assert (=> b!46364 d!9089))

(declare-fun d!9093 () Bool)

(declare-fun e!29623 () Bool)

(assert (=> d!9093 e!29623))

(declare-fun res!27151 () Bool)

(assert (=> d!9093 (=> (not res!27151) (not e!29623))))

(declare-fun lt!20311 () List!1243)

(assert (=> d!9093 (= res!27151 (isStrictlySorted!236 lt!20311))))

(declare-fun e!29624 () List!1243)

(assert (=> d!9093 (= lt!20311 e!29624)))

(declare-fun c!6273 () Bool)

(assert (=> d!9093 (= c!6273 (and ((_ is Cons!1239) (t!4267 l!812)) (= (_1!869 (h!1819 (t!4267 l!812))) key1!43)))))

(assert (=> d!9093 (isStrictlySorted!236 (t!4267 l!812))))

(assert (=> d!9093 (= (removeStrictlySorted!42 (t!4267 l!812) key1!43) lt!20311)))

(declare-fun b!46479 () Bool)

(declare-fun e!29625 () List!1243)

(assert (=> b!46479 (= e!29624 e!29625)))

(declare-fun c!6272 () Bool)

(assert (=> b!46479 (= c!6272 (and ((_ is Cons!1239) (t!4267 l!812)) (not (= (_1!869 (h!1819 (t!4267 l!812))) key1!43))))))

(declare-fun b!46480 () Bool)

(assert (=> b!46480 (= e!29625 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (t!4267 l!812)) key1!43) (h!1819 (t!4267 l!812))))))

(declare-fun b!46481 () Bool)

(assert (=> b!46481 (= e!29624 (t!4267 (t!4267 l!812)))))

(declare-fun b!46482 () Bool)

(assert (=> b!46482 (= e!29623 (not (containsKey!89 lt!20311 key1!43)))))

(declare-fun b!46483 () Bool)

(assert (=> b!46483 (= e!29625 Nil!1240)))

(assert (= (and d!9093 c!6273) b!46481))

(assert (= (and d!9093 (not c!6273)) b!46479))

(assert (= (and b!46479 c!6272) b!46480))

(assert (= (and b!46479 (not c!6272)) b!46483))

(assert (= (and d!9093 res!27151) b!46482))

(declare-fun m!40777 () Bool)

(assert (=> d!9093 m!40777))

(assert (=> d!9093 m!40649))

(declare-fun m!40779 () Bool)

(assert (=> b!46480 m!40779))

(assert (=> b!46480 m!40779))

(declare-fun m!40781 () Bool)

(assert (=> b!46480 m!40781))

(declare-fun m!40783 () Bool)

(assert (=> b!46482 m!40783))

(assert (=> b!46364 d!9093))

(declare-fun d!9097 () Bool)

(declare-fun e!29629 () Bool)

(assert (=> d!9097 e!29629))

(declare-fun res!27153 () Bool)

(assert (=> d!9097 (=> (not res!27153) (not e!29629))))

(declare-fun lt!20313 () List!1243)

(assert (=> d!9097 (= res!27153 (isStrictlySorted!236 lt!20313))))

(declare-fun e!29630 () List!1243)

(assert (=> d!9097 (= lt!20313 e!29630)))

(declare-fun c!6277 () Bool)

(assert (=> d!9097 (= c!6277 (and ((_ is Cons!1239) (removeStrictlySorted!42 (t!4267 l!812) key2!27)) (= (_1!869 (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key2!27))) key1!43)))))

(assert (=> d!9097 (isStrictlySorted!236 (removeStrictlySorted!42 (t!4267 l!812) key2!27))))

(assert (=> d!9097 (= (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4267 l!812) key2!27) key1!43) lt!20313)))

(declare-fun b!46489 () Bool)

(declare-fun e!29631 () List!1243)

(assert (=> b!46489 (= e!29630 e!29631)))

(declare-fun c!6276 () Bool)

(assert (=> b!46489 (= c!6276 (and ((_ is Cons!1239) (removeStrictlySorted!42 (t!4267 l!812) key2!27)) (not (= (_1!869 (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key2!27))) key1!43))))))

(declare-fun b!46490 () Bool)

(assert (=> b!46490 (= e!29631 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27)) key1!43) (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key2!27))))))

(declare-fun b!46491 () Bool)

(assert (=> b!46491 (= e!29630 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27)))))

(declare-fun b!46492 () Bool)

(assert (=> b!46492 (= e!29629 (not (containsKey!89 lt!20313 key1!43)))))

(declare-fun b!46493 () Bool)

(assert (=> b!46493 (= e!29631 Nil!1240)))

(assert (= (and d!9097 c!6277) b!46491))

(assert (= (and d!9097 (not c!6277)) b!46489))

(assert (= (and b!46489 c!6276) b!46490))

(assert (= (and b!46489 (not c!6276)) b!46493))

(assert (= (and d!9097 res!27153) b!46492))

(declare-fun m!40795 () Bool)

(assert (=> d!9097 m!40795))

(assert (=> d!9097 m!40631))

(declare-fun m!40797 () Bool)

(assert (=> d!9097 m!40797))

(declare-fun m!40799 () Bool)

(assert (=> b!46490 m!40799))

(assert (=> b!46490 m!40799))

(declare-fun m!40801 () Bool)

(assert (=> b!46490 m!40801))

(declare-fun m!40803 () Bool)

(assert (=> b!46492 m!40803))

(assert (=> b!46364 d!9097))

(declare-fun d!9101 () Bool)

(declare-fun e!29638 () Bool)

(assert (=> d!9101 e!29638))

(declare-fun res!27156 () Bool)

(assert (=> d!9101 (=> (not res!27156) (not e!29638))))

(declare-fun lt!20316 () List!1243)

(assert (=> d!9101 (= res!27156 (isStrictlySorted!236 lt!20316))))

(declare-fun e!29639 () List!1243)

(assert (=> d!9101 (= lt!20316 e!29639)))

(declare-fun c!6283 () Bool)

(assert (=> d!9101 (= c!6283 (and ((_ is Cons!1239) (t!4267 l!812)) (= (_1!869 (h!1819 (t!4267 l!812))) key2!27)))))

(assert (=> d!9101 (isStrictlySorted!236 (t!4267 l!812))))

(assert (=> d!9101 (= (removeStrictlySorted!42 (t!4267 l!812) key2!27) lt!20316)))

(declare-fun b!46504 () Bool)

(declare-fun e!29640 () List!1243)

(assert (=> b!46504 (= e!29639 e!29640)))

(declare-fun c!6282 () Bool)

(assert (=> b!46504 (= c!6282 (and ((_ is Cons!1239) (t!4267 l!812)) (not (= (_1!869 (h!1819 (t!4267 l!812))) key2!27))))))

(declare-fun b!46505 () Bool)

(assert (=> b!46505 (= e!29640 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (t!4267 l!812)) key2!27) (h!1819 (t!4267 l!812))))))

(declare-fun b!46506 () Bool)

(assert (=> b!46506 (= e!29639 (t!4267 (t!4267 l!812)))))

(declare-fun b!46507 () Bool)

(assert (=> b!46507 (= e!29638 (not (containsKey!89 lt!20316 key2!27)))))

(declare-fun b!46508 () Bool)

(assert (=> b!46508 (= e!29640 Nil!1240)))

(assert (= (and d!9101 c!6283) b!46506))

(assert (= (and d!9101 (not c!6283)) b!46504))

(assert (= (and b!46504 c!6282) b!46505))

(assert (= (and b!46504 (not c!6282)) b!46508))

(assert (= (and d!9101 res!27156) b!46507))

(declare-fun m!40815 () Bool)

(assert (=> d!9101 m!40815))

(assert (=> d!9101 m!40649))

(declare-fun m!40817 () Bool)

(assert (=> b!46505 m!40817))

(assert (=> b!46505 m!40817))

(declare-fun m!40821 () Bool)

(assert (=> b!46505 m!40821))

(declare-fun m!40823 () Bool)

(assert (=> b!46507 m!40823))

(assert (=> b!46364 d!9101))

(declare-fun d!9105 () Bool)

(declare-fun e!29644 () Bool)

(assert (=> d!9105 e!29644))

(declare-fun res!27158 () Bool)

(assert (=> d!9105 (=> (not res!27158) (not e!29644))))

(declare-fun lt!20318 () List!1243)

(assert (=> d!9105 (= res!27158 (isStrictlySorted!236 lt!20318))))

(declare-fun e!29645 () List!1243)

(assert (=> d!9105 (= lt!20318 e!29645)))

(declare-fun c!6287 () Bool)

(assert (=> d!9105 (= c!6287 (and ((_ is Cons!1239) (removeStrictlySorted!42 l!812 key1!43)) (= (_1!869 (h!1819 (removeStrictlySorted!42 l!812 key1!43))) key2!27)))))

(assert (=> d!9105 (isStrictlySorted!236 (removeStrictlySorted!42 l!812 key1!43))))

(assert (=> d!9105 (= (removeStrictlySorted!42 (removeStrictlySorted!42 l!812 key1!43) key2!27) lt!20318)))

(declare-fun b!46514 () Bool)

(declare-fun e!29646 () List!1243)

(assert (=> b!46514 (= e!29645 e!29646)))

(declare-fun c!6286 () Bool)

(assert (=> b!46514 (= c!6286 (and ((_ is Cons!1239) (removeStrictlySorted!42 l!812 key1!43)) (not (= (_1!869 (h!1819 (removeStrictlySorted!42 l!812 key1!43))) key2!27))))))

(declare-fun b!46515 () Bool)

(assert (=> b!46515 (= e!29646 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 l!812 key1!43)) key2!27) (h!1819 (removeStrictlySorted!42 l!812 key1!43))))))

(declare-fun b!46516 () Bool)

(assert (=> b!46516 (= e!29645 (t!4267 (removeStrictlySorted!42 l!812 key1!43)))))

(declare-fun b!46517 () Bool)

(assert (=> b!46517 (= e!29644 (not (containsKey!89 lt!20318 key2!27)))))

(declare-fun b!46518 () Bool)

(assert (=> b!46518 (= e!29646 Nil!1240)))

(assert (= (and d!9105 c!6287) b!46516))

(assert (= (and d!9105 (not c!6287)) b!46514))

(assert (= (and b!46514 c!6286) b!46515))

(assert (= (and b!46514 (not c!6286)) b!46518))

(assert (= (and d!9105 res!27158) b!46517))

(declare-fun m!40841 () Bool)

(assert (=> d!9105 m!40841))

(assert (=> d!9105 m!40641))

(declare-fun m!40843 () Bool)

(assert (=> d!9105 m!40843))

(declare-fun m!40845 () Bool)

(assert (=> b!46515 m!40845))

(assert (=> b!46515 m!40845))

(declare-fun m!40847 () Bool)

(assert (=> b!46515 m!40847))

(declare-fun m!40849 () Bool)

(assert (=> b!46517 m!40849))

(assert (=> b!46364 d!9105))

(declare-fun b!46539 () Bool)

(declare-fun e!29659 () Bool)

(declare-fun tp!6148 () Bool)

(assert (=> b!46539 (= e!29659 (and tp_is_empty!1987 tp!6148))))

(assert (=> b!46365 (= tp!6137 e!29659)))

(assert (= (and b!46365 ((_ is Cons!1239) (t!4267 l!812))) b!46539))

(check-sat (not b!46452) (not d!9097) (not b!46482) (not d!9071) (not d!9077) (not b!46472) (not d!9101) (not d!9089) (not b!46480) (not b!46470) (not d!9093) (not d!9081) (not b!46403) (not b!46505) (not b!46401) (not b!46492) (not b!46432) (not b!46430) (not b!46440) (not b!46442) (not b!46539) (not b!46490) (not d!9085) (not d!9105) (not b!46517) (not b!46507) (not b!46515) (not b!46450) tp_is_empty!1987)
(check-sat)
(get-model)

(declare-fun d!9129 () Bool)

(assert (=> d!9129 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43)) key2!27) (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key1!43))) (Cons!1239 (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key1!43)) (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43)) key2!27)))))

(assert (=> b!46470 d!9129))

(declare-fun d!9131 () Bool)

(declare-fun e!29687 () Bool)

(assert (=> d!9131 e!29687))

(declare-fun res!27176 () Bool)

(assert (=> d!9131 (=> (not res!27176) (not e!29687))))

(declare-fun lt!20329 () List!1243)

(assert (=> d!9131 (= res!27176 (isStrictlySorted!236 lt!20329))))

(declare-fun e!29688 () List!1243)

(assert (=> d!9131 (= lt!20329 e!29688)))

(declare-fun c!6303 () Bool)

(assert (=> d!9131 (= c!6303 (and ((_ is Cons!1239) (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43))) (= (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43)))) key2!27)))))

(assert (=> d!9131 (isStrictlySorted!236 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43)))))

(assert (=> d!9131 (= (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43)) key2!27) lt!20329)))

(declare-fun b!46579 () Bool)

(declare-fun e!29689 () List!1243)

(assert (=> b!46579 (= e!29688 e!29689)))

(declare-fun c!6302 () Bool)

(assert (=> b!46579 (= c!6302 (and ((_ is Cons!1239) (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43))) (not (= (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43)))) key2!27))))))

(declare-fun b!46580 () Bool)

(assert (=> b!46580 (= e!29689 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43))) key2!27) (h!1819 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43)))))))

(declare-fun b!46581 () Bool)

(assert (=> b!46581 (= e!29688 (t!4267 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43))))))

(declare-fun b!46582 () Bool)

(assert (=> b!46582 (= e!29687 (not (containsKey!89 lt!20329 key2!27)))))

(declare-fun b!46583 () Bool)

(assert (=> b!46583 (= e!29689 Nil!1240)))

(assert (= (and d!9131 c!6303) b!46581))

(assert (= (and d!9131 (not c!6303)) b!46579))

(assert (= (and b!46579 c!6302) b!46580))

(assert (= (and b!46579 (not c!6302)) b!46583))

(assert (= (and d!9131 res!27176) b!46582))

(declare-fun m!40913 () Bool)

(assert (=> d!9131 m!40913))

(declare-fun m!40915 () Bool)

(assert (=> d!9131 m!40915))

(declare-fun m!40917 () Bool)

(assert (=> b!46580 m!40917))

(assert (=> b!46580 m!40917))

(declare-fun m!40919 () Bool)

(assert (=> b!46580 m!40919))

(declare-fun m!40921 () Bool)

(assert (=> b!46582 m!40921))

(assert (=> b!46470 d!9131))

(assert (=> b!46401 d!9069))

(declare-fun d!9133 () Bool)

(declare-fun res!27181 () Bool)

(declare-fun e!29694 () Bool)

(assert (=> d!9133 (=> res!27181 e!29694)))

(assert (=> d!9133 (= res!27181 (and ((_ is Cons!1239) lt!20297) (= (_1!869 (h!1819 lt!20297)) key1!43)))))

(assert (=> d!9133 (= (containsKey!89 lt!20297 key1!43) e!29694)))

(declare-fun b!46588 () Bool)

(declare-fun e!29695 () Bool)

(assert (=> b!46588 (= e!29694 e!29695)))

(declare-fun res!27182 () Bool)

(assert (=> b!46588 (=> (not res!27182) (not e!29695))))

(assert (=> b!46588 (= res!27182 (and (or (not ((_ is Cons!1239) lt!20297)) (bvsle (_1!869 (h!1819 lt!20297)) key1!43)) ((_ is Cons!1239) lt!20297) (bvslt (_1!869 (h!1819 lt!20297)) key1!43)))))

(declare-fun b!46589 () Bool)

(assert (=> b!46589 (= e!29695 (containsKey!89 (t!4267 lt!20297) key1!43))))

(assert (= (and d!9133 (not res!27181)) b!46588))

(assert (= (and b!46588 res!27182) b!46589))

(declare-fun m!40923 () Bool)

(assert (=> b!46589 m!40923))

(assert (=> b!46442 d!9133))

(declare-fun d!9135 () Bool)

(declare-fun res!27183 () Bool)

(declare-fun e!29696 () Bool)

(assert (=> d!9135 (=> res!27183 e!29696)))

(assert (=> d!9135 (= res!27183 (or ((_ is Nil!1240) lt!20311) ((_ is Nil!1240) (t!4267 lt!20311))))))

(assert (=> d!9135 (= (isStrictlySorted!236 lt!20311) e!29696)))

(declare-fun b!46590 () Bool)

(declare-fun e!29697 () Bool)

(assert (=> b!46590 (= e!29696 e!29697)))

(declare-fun res!27184 () Bool)

(assert (=> b!46590 (=> (not res!27184) (not e!29697))))

(assert (=> b!46590 (= res!27184 (bvslt (_1!869 (h!1819 lt!20311)) (_1!869 (h!1819 (t!4267 lt!20311)))))))

(declare-fun b!46591 () Bool)

(assert (=> b!46591 (= e!29697 (isStrictlySorted!236 (t!4267 lt!20311)))))

(assert (= (and d!9135 (not res!27183)) b!46590))

(assert (= (and b!46590 res!27184) b!46591))

(declare-fun m!40925 () Bool)

(assert (=> b!46591 m!40925))

(assert (=> d!9093 d!9135))

(assert (=> d!9093 d!9069))

(declare-fun d!9137 () Bool)

(declare-fun res!27185 () Bool)

(declare-fun e!29698 () Bool)

(assert (=> d!9137 (=> res!27185 e!29698)))

(assert (=> d!9137 (= res!27185 (or ((_ is Nil!1240) lt!20313) ((_ is Nil!1240) (t!4267 lt!20313))))))

(assert (=> d!9137 (= (isStrictlySorted!236 lt!20313) e!29698)))

(declare-fun b!46592 () Bool)

(declare-fun e!29699 () Bool)

(assert (=> b!46592 (= e!29698 e!29699)))

(declare-fun res!27186 () Bool)

(assert (=> b!46592 (=> (not res!27186) (not e!29699))))

(assert (=> b!46592 (= res!27186 (bvslt (_1!869 (h!1819 lt!20313)) (_1!869 (h!1819 (t!4267 lt!20313)))))))

(declare-fun b!46593 () Bool)

(assert (=> b!46593 (= e!29699 (isStrictlySorted!236 (t!4267 lt!20313)))))

(assert (= (and d!9137 (not res!27185)) b!46592))

(assert (= (and b!46592 res!27186) b!46593))

(declare-fun m!40927 () Bool)

(assert (=> b!46593 m!40927))

(assert (=> d!9097 d!9137))

(declare-fun d!9139 () Bool)

(declare-fun res!27187 () Bool)

(declare-fun e!29700 () Bool)

(assert (=> d!9139 (=> res!27187 e!29700)))

(assert (=> d!9139 (= res!27187 (or ((_ is Nil!1240) (removeStrictlySorted!42 (t!4267 l!812) key2!27)) ((_ is Nil!1240) (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27)))))))

(assert (=> d!9139 (= (isStrictlySorted!236 (removeStrictlySorted!42 (t!4267 l!812) key2!27)) e!29700)))

(declare-fun b!46594 () Bool)

(declare-fun e!29701 () Bool)

(assert (=> b!46594 (= e!29700 e!29701)))

(declare-fun res!27188 () Bool)

(assert (=> b!46594 (=> (not res!27188) (not e!29701))))

(assert (=> b!46594 (= res!27188 (bvslt (_1!869 (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key2!27))) (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27))))))))

(declare-fun b!46595 () Bool)

(assert (=> b!46595 (= e!29701 (isStrictlySorted!236 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27))))))

(assert (= (and d!9139 (not res!27187)) b!46594))

(assert (= (and b!46594 res!27188) b!46595))

(declare-fun m!40929 () Bool)

(assert (=> b!46595 m!40929))

(assert (=> d!9097 d!9139))

(declare-fun d!9141 () Bool)

(declare-fun res!27189 () Bool)

(declare-fun e!29702 () Bool)

(assert (=> d!9141 (=> res!27189 e!29702)))

(assert (=> d!9141 (= res!27189 (or ((_ is Nil!1240) lt!20299) ((_ is Nil!1240) (t!4267 lt!20299))))))

(assert (=> d!9141 (= (isStrictlySorted!236 lt!20299) e!29702)))

(declare-fun b!46596 () Bool)

(declare-fun e!29703 () Bool)

(assert (=> b!46596 (= e!29702 e!29703)))

(declare-fun res!27190 () Bool)

(assert (=> b!46596 (=> (not res!27190) (not e!29703))))

(assert (=> b!46596 (= res!27190 (bvslt (_1!869 (h!1819 lt!20299)) (_1!869 (h!1819 (t!4267 lt!20299)))))))

(declare-fun b!46597 () Bool)

(assert (=> b!46597 (= e!29703 (isStrictlySorted!236 (t!4267 lt!20299)))))

(assert (= (and d!9141 (not res!27189)) b!46596))

(assert (= (and b!46596 res!27190) b!46597))

(declare-fun m!40931 () Bool)

(assert (=> b!46597 m!40931))

(assert (=> d!9081 d!9141))

(assert (=> d!9081 d!9065))

(declare-fun d!9143 () Bool)

(assert (=> d!9143 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (t!4267 l!812)) key1!43) (h!1819 (t!4267 l!812))) (Cons!1239 (h!1819 (t!4267 l!812)) (removeStrictlySorted!42 (t!4267 (t!4267 l!812)) key1!43)))))

(assert (=> b!46480 d!9143))

(declare-fun d!9145 () Bool)

(declare-fun e!29704 () Bool)

(assert (=> d!9145 e!29704))

(declare-fun res!27191 () Bool)

(assert (=> d!9145 (=> (not res!27191) (not e!29704))))

(declare-fun lt!20330 () List!1243)

(assert (=> d!9145 (= res!27191 (isStrictlySorted!236 lt!20330))))

(declare-fun e!29705 () List!1243)

(assert (=> d!9145 (= lt!20330 e!29705)))

(declare-fun c!6305 () Bool)

(assert (=> d!9145 (= c!6305 (and ((_ is Cons!1239) (t!4267 (t!4267 l!812))) (= (_1!869 (h!1819 (t!4267 (t!4267 l!812)))) key1!43)))))

(assert (=> d!9145 (isStrictlySorted!236 (t!4267 (t!4267 l!812)))))

(assert (=> d!9145 (= (removeStrictlySorted!42 (t!4267 (t!4267 l!812)) key1!43) lt!20330)))

(declare-fun b!46598 () Bool)

(declare-fun e!29706 () List!1243)

(assert (=> b!46598 (= e!29705 e!29706)))

(declare-fun c!6304 () Bool)

(assert (=> b!46598 (= c!6304 (and ((_ is Cons!1239) (t!4267 (t!4267 l!812))) (not (= (_1!869 (h!1819 (t!4267 (t!4267 l!812)))) key1!43))))))

(declare-fun b!46599 () Bool)

(assert (=> b!46599 (= e!29706 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (t!4267 (t!4267 l!812))) key1!43) (h!1819 (t!4267 (t!4267 l!812)))))))

(declare-fun b!46600 () Bool)

(assert (=> b!46600 (= e!29705 (t!4267 (t!4267 (t!4267 l!812))))))

(declare-fun b!46601 () Bool)

(assert (=> b!46601 (= e!29704 (not (containsKey!89 lt!20330 key1!43)))))

(declare-fun b!46602 () Bool)

(assert (=> b!46602 (= e!29706 Nil!1240)))

(assert (= (and d!9145 c!6305) b!46600))

(assert (= (and d!9145 (not c!6305)) b!46598))

(assert (= (and b!46598 c!6304) b!46599))

(assert (= (and b!46598 (not c!6304)) b!46602))

(assert (= (and d!9145 res!27191) b!46601))

(declare-fun m!40933 () Bool)

(assert (=> d!9145 m!40933))

(assert (=> d!9145 m!40699))

(declare-fun m!40935 () Bool)

(assert (=> b!46599 m!40935))

(assert (=> b!46599 m!40935))

(declare-fun m!40937 () Bool)

(assert (=> b!46599 m!40937))

(declare-fun m!40939 () Bool)

(assert (=> b!46601 m!40939))

(assert (=> b!46480 d!9145))

(declare-fun d!9147 () Bool)

(declare-fun res!27192 () Bool)

(declare-fun e!29707 () Bool)

(assert (=> d!9147 (=> res!27192 e!29707)))

(assert (=> d!9147 (= res!27192 (and ((_ is Cons!1239) lt!20316) (= (_1!869 (h!1819 lt!20316)) key2!27)))))

(assert (=> d!9147 (= (containsKey!89 lt!20316 key2!27) e!29707)))

(declare-fun b!46603 () Bool)

(declare-fun e!29708 () Bool)

(assert (=> b!46603 (= e!29707 e!29708)))

(declare-fun res!27193 () Bool)

(assert (=> b!46603 (=> (not res!27193) (not e!29708))))

(assert (=> b!46603 (= res!27193 (and (or (not ((_ is Cons!1239) lt!20316)) (bvsle (_1!869 (h!1819 lt!20316)) key2!27)) ((_ is Cons!1239) lt!20316) (bvslt (_1!869 (h!1819 lt!20316)) key2!27)))))

(declare-fun b!46604 () Bool)

(assert (=> b!46604 (= e!29708 (containsKey!89 (t!4267 lt!20316) key2!27))))

(assert (= (and d!9147 (not res!27192)) b!46603))

(assert (= (and b!46603 res!27193) b!46604))

(declare-fun m!40941 () Bool)

(assert (=> b!46604 m!40941))

(assert (=> b!46507 d!9147))

(declare-fun d!9149 () Bool)

(declare-fun res!27194 () Bool)

(declare-fun e!29709 () Bool)

(assert (=> d!9149 (=> res!27194 e!29709)))

(assert (=> d!9149 (= res!27194 (or ((_ is Nil!1240) lt!20318) ((_ is Nil!1240) (t!4267 lt!20318))))))

(assert (=> d!9149 (= (isStrictlySorted!236 lt!20318) e!29709)))

(declare-fun b!46605 () Bool)

(declare-fun e!29710 () Bool)

(assert (=> b!46605 (= e!29709 e!29710)))

(declare-fun res!27195 () Bool)

(assert (=> b!46605 (=> (not res!27195) (not e!29710))))

(assert (=> b!46605 (= res!27195 (bvslt (_1!869 (h!1819 lt!20318)) (_1!869 (h!1819 (t!4267 lt!20318)))))))

(declare-fun b!46606 () Bool)

(assert (=> b!46606 (= e!29710 (isStrictlySorted!236 (t!4267 lt!20318)))))

(assert (= (and d!9149 (not res!27194)) b!46605))

(assert (= (and b!46605 res!27195) b!46606))

(declare-fun m!40943 () Bool)

(assert (=> b!46606 m!40943))

(assert (=> d!9105 d!9149))

(declare-fun d!9151 () Bool)

(declare-fun res!27196 () Bool)

(declare-fun e!29711 () Bool)

(assert (=> d!9151 (=> res!27196 e!29711)))

(assert (=> d!9151 (= res!27196 (or ((_ is Nil!1240) (removeStrictlySorted!42 l!812 key1!43)) ((_ is Nil!1240) (t!4267 (removeStrictlySorted!42 l!812 key1!43)))))))

(assert (=> d!9151 (= (isStrictlySorted!236 (removeStrictlySorted!42 l!812 key1!43)) e!29711)))

(declare-fun b!46607 () Bool)

(declare-fun e!29712 () Bool)

(assert (=> b!46607 (= e!29711 e!29712)))

(declare-fun res!27197 () Bool)

(assert (=> b!46607 (=> (not res!27197) (not e!29712))))

(assert (=> b!46607 (= res!27197 (bvslt (_1!869 (h!1819 (removeStrictlySorted!42 l!812 key1!43))) (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 l!812 key1!43))))))))

(declare-fun b!46608 () Bool)

(assert (=> b!46608 (= e!29712 (isStrictlySorted!236 (t!4267 (removeStrictlySorted!42 l!812 key1!43))))))

(assert (= (and d!9151 (not res!27196)) b!46607))

(assert (= (and b!46607 res!27197) b!46608))

(declare-fun m!40945 () Bool)

(assert (=> b!46608 m!40945))

(assert (=> d!9105 d!9151))

(declare-fun d!9153 () Bool)

(declare-fun res!27198 () Bool)

(declare-fun e!29713 () Bool)

(assert (=> d!9153 (=> res!27198 e!29713)))

(assert (=> d!9153 (= res!27198 (and ((_ is Cons!1239) lt!20309) (= (_1!869 (h!1819 lt!20309)) key2!27)))))

(assert (=> d!9153 (= (containsKey!89 lt!20309 key2!27) e!29713)))

(declare-fun b!46609 () Bool)

(declare-fun e!29714 () Bool)

(assert (=> b!46609 (= e!29713 e!29714)))

(declare-fun res!27199 () Bool)

(assert (=> b!46609 (=> (not res!27199) (not e!29714))))

(assert (=> b!46609 (= res!27199 (and (or (not ((_ is Cons!1239) lt!20309)) (bvsle (_1!869 (h!1819 lt!20309)) key2!27)) ((_ is Cons!1239) lt!20309) (bvslt (_1!869 (h!1819 lt!20309)) key2!27)))))

(declare-fun b!46610 () Bool)

(assert (=> b!46610 (= e!29714 (containsKey!89 (t!4267 lt!20309) key2!27))))

(assert (= (and d!9153 (not res!27198)) b!46609))

(assert (= (and b!46609 res!27199) b!46610))

(declare-fun m!40947 () Bool)

(assert (=> b!46610 m!40947))

(assert (=> b!46472 d!9153))

(declare-fun d!9155 () Bool)

(assert (=> d!9155 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (t!4267 l!812)) key2!27) (h!1819 (t!4267 l!812))) (Cons!1239 (h!1819 (t!4267 l!812)) (removeStrictlySorted!42 (t!4267 (t!4267 l!812)) key2!27)))))

(assert (=> b!46505 d!9155))

(declare-fun d!9157 () Bool)

(declare-fun e!29715 () Bool)

(assert (=> d!9157 e!29715))

(declare-fun res!27200 () Bool)

(assert (=> d!9157 (=> (not res!27200) (not e!29715))))

(declare-fun lt!20331 () List!1243)

(assert (=> d!9157 (= res!27200 (isStrictlySorted!236 lt!20331))))

(declare-fun e!29716 () List!1243)

(assert (=> d!9157 (= lt!20331 e!29716)))

(declare-fun c!6307 () Bool)

(assert (=> d!9157 (= c!6307 (and ((_ is Cons!1239) (t!4267 (t!4267 l!812))) (= (_1!869 (h!1819 (t!4267 (t!4267 l!812)))) key2!27)))))

(assert (=> d!9157 (isStrictlySorted!236 (t!4267 (t!4267 l!812)))))

(assert (=> d!9157 (= (removeStrictlySorted!42 (t!4267 (t!4267 l!812)) key2!27) lt!20331)))

(declare-fun b!46611 () Bool)

(declare-fun e!29717 () List!1243)

(assert (=> b!46611 (= e!29716 e!29717)))

(declare-fun c!6306 () Bool)

(assert (=> b!46611 (= c!6306 (and ((_ is Cons!1239) (t!4267 (t!4267 l!812))) (not (= (_1!869 (h!1819 (t!4267 (t!4267 l!812)))) key2!27))))))

(declare-fun b!46612 () Bool)

(assert (=> b!46612 (= e!29717 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (t!4267 (t!4267 l!812))) key2!27) (h!1819 (t!4267 (t!4267 l!812)))))))

(declare-fun b!46613 () Bool)

(assert (=> b!46613 (= e!29716 (t!4267 (t!4267 (t!4267 l!812))))))

(declare-fun b!46614 () Bool)

(assert (=> b!46614 (= e!29715 (not (containsKey!89 lt!20331 key2!27)))))

(declare-fun b!46615 () Bool)

(assert (=> b!46615 (= e!29717 Nil!1240)))

(assert (= (and d!9157 c!6307) b!46613))

(assert (= (and d!9157 (not c!6307)) b!46611))

(assert (= (and b!46611 c!6306) b!46612))

(assert (= (and b!46611 (not c!6306)) b!46615))

(assert (= (and d!9157 res!27200) b!46614))

(declare-fun m!40949 () Bool)

(assert (=> d!9157 m!40949))

(assert (=> d!9157 m!40699))

(declare-fun m!40951 () Bool)

(assert (=> b!46612 m!40951))

(assert (=> b!46612 m!40951))

(declare-fun m!40953 () Bool)

(assert (=> b!46612 m!40953))

(declare-fun m!40955 () Bool)

(assert (=> b!46614 m!40955))

(assert (=> b!46505 d!9157))

(declare-fun d!9159 () Bool)

(declare-fun res!27201 () Bool)

(declare-fun e!29718 () Bool)

(assert (=> d!9159 (=> res!27201 e!29718)))

(assert (=> d!9159 (= res!27201 (and ((_ is Cons!1239) lt!20313) (= (_1!869 (h!1819 lt!20313)) key1!43)))))

(assert (=> d!9159 (= (containsKey!89 lt!20313 key1!43) e!29718)))

(declare-fun b!46616 () Bool)

(declare-fun e!29719 () Bool)

(assert (=> b!46616 (= e!29718 e!29719)))

(declare-fun res!27202 () Bool)

(assert (=> b!46616 (=> (not res!27202) (not e!29719))))

(assert (=> b!46616 (= res!27202 (and (or (not ((_ is Cons!1239) lt!20313)) (bvsle (_1!869 (h!1819 lt!20313)) key1!43)) ((_ is Cons!1239) lt!20313) (bvslt (_1!869 (h!1819 lt!20313)) key1!43)))))

(declare-fun b!46617 () Bool)

(assert (=> b!46617 (= e!29719 (containsKey!89 (t!4267 lt!20313) key1!43))))

(assert (= (and d!9159 (not res!27201)) b!46616))

(assert (= (and b!46616 res!27202) b!46617))

(declare-fun m!40957 () Bool)

(assert (=> b!46617 m!40957))

(assert (=> b!46492 d!9159))

(declare-fun d!9161 () Bool)

(assert (=> d!9161 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 l!812 key2!27)) key1!43) (h!1819 (removeStrictlySorted!42 l!812 key2!27))) (Cons!1239 (h!1819 (removeStrictlySorted!42 l!812 key2!27)) (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 l!812 key2!27)) key1!43)))))

(assert (=> b!46430 d!9161))

(declare-fun d!9163 () Bool)

(declare-fun e!29720 () Bool)

(assert (=> d!9163 e!29720))

(declare-fun res!27203 () Bool)

(assert (=> d!9163 (=> (not res!27203) (not e!29720))))

(declare-fun lt!20332 () List!1243)

(assert (=> d!9163 (= res!27203 (isStrictlySorted!236 lt!20332))))

(declare-fun e!29721 () List!1243)

(assert (=> d!9163 (= lt!20332 e!29721)))

(declare-fun c!6309 () Bool)

(assert (=> d!9163 (= c!6309 (and ((_ is Cons!1239) (t!4267 (removeStrictlySorted!42 l!812 key2!27))) (= (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 l!812 key2!27)))) key1!43)))))

(assert (=> d!9163 (isStrictlySorted!236 (t!4267 (removeStrictlySorted!42 l!812 key2!27)))))

(assert (=> d!9163 (= (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 l!812 key2!27)) key1!43) lt!20332)))

(declare-fun b!46618 () Bool)

(declare-fun e!29722 () List!1243)

(assert (=> b!46618 (= e!29721 e!29722)))

(declare-fun c!6308 () Bool)

(assert (=> b!46618 (= c!6308 (and ((_ is Cons!1239) (t!4267 (removeStrictlySorted!42 l!812 key2!27))) (not (= (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 l!812 key2!27)))) key1!43))))))

(declare-fun b!46619 () Bool)

(assert (=> b!46619 (= e!29722 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (t!4267 (removeStrictlySorted!42 l!812 key2!27))) key1!43) (h!1819 (t!4267 (removeStrictlySorted!42 l!812 key2!27)))))))

(declare-fun b!46620 () Bool)

(assert (=> b!46620 (= e!29721 (t!4267 (t!4267 (removeStrictlySorted!42 l!812 key2!27))))))

(declare-fun b!46621 () Bool)

(assert (=> b!46621 (= e!29720 (not (containsKey!89 lt!20332 key1!43)))))

(declare-fun b!46622 () Bool)

(assert (=> b!46622 (= e!29722 Nil!1240)))

(assert (= (and d!9163 c!6309) b!46620))

(assert (= (and d!9163 (not c!6309)) b!46618))

(assert (= (and b!46618 c!6308) b!46619))

(assert (= (and b!46618 (not c!6308)) b!46622))

(assert (= (and d!9163 res!27203) b!46621))

(declare-fun m!40959 () Bool)

(assert (=> d!9163 m!40959))

(declare-fun m!40961 () Bool)

(assert (=> d!9163 m!40961))

(declare-fun m!40963 () Bool)

(assert (=> b!46619 m!40963))

(assert (=> b!46619 m!40963))

(declare-fun m!40965 () Bool)

(assert (=> b!46619 m!40965))

(declare-fun m!40967 () Bool)

(assert (=> b!46621 m!40967))

(assert (=> b!46430 d!9163))

(assert (=> d!9085 d!9069))

(declare-fun d!9165 () Bool)

(assert (=> d!9165 (= (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4267 l!812) key1!43) key2!27) (removeStrictlySorted!42 (removeStrictlySorted!42 (t!4267 l!812) key2!27) key1!43))))

(assert (=> d!9165 true))

(declare-fun _$6!50 () Unit!1326)

(assert (=> d!9165 (= (choose!285 (t!4267 l!812) key1!43 key2!27) _$6!50)))

(declare-fun bs!2184 () Bool)

(assert (= bs!2184 d!9165))

(assert (=> bs!2184 m!40637))

(assert (=> bs!2184 m!40637))

(assert (=> bs!2184 m!40639))

(assert (=> bs!2184 m!40631))

(assert (=> bs!2184 m!40631))

(assert (=> bs!2184 m!40643))

(assert (=> d!9085 d!9165))

(assert (=> d!9085 d!9101))

(assert (=> d!9085 d!9089))

(assert (=> d!9085 d!9093))

(assert (=> d!9085 d!9097))

(declare-fun d!9167 () Bool)

(declare-fun res!27204 () Bool)

(declare-fun e!29723 () Bool)

(assert (=> d!9167 (=> res!27204 e!29723)))

(assert (=> d!9167 (= res!27204 (or ((_ is Nil!1240) lt!20297) ((_ is Nil!1240) (t!4267 lt!20297))))))

(assert (=> d!9167 (= (isStrictlySorted!236 lt!20297) e!29723)))

(declare-fun b!46623 () Bool)

(declare-fun e!29724 () Bool)

(assert (=> b!46623 (= e!29723 e!29724)))

(declare-fun res!27205 () Bool)

(assert (=> b!46623 (=> (not res!27205) (not e!29724))))

(assert (=> b!46623 (= res!27205 (bvslt (_1!869 (h!1819 lt!20297)) (_1!869 (h!1819 (t!4267 lt!20297)))))))

(declare-fun b!46624 () Bool)

(assert (=> b!46624 (= e!29724 (isStrictlySorted!236 (t!4267 lt!20297)))))

(assert (= (and d!9167 (not res!27204)) b!46623))

(assert (= (and b!46623 res!27205) b!46624))

(declare-fun m!40969 () Bool)

(assert (=> b!46624 m!40969))

(assert (=> d!9077 d!9167))

(assert (=> d!9077 d!9065))

(declare-fun d!9169 () Bool)

(assert (=> d!9169 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27)) key1!43) (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key2!27))) (Cons!1239 (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key2!27)) (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27)) key1!43)))))

(assert (=> b!46490 d!9169))

(declare-fun d!9171 () Bool)

(declare-fun e!29725 () Bool)

(assert (=> d!9171 e!29725))

(declare-fun res!27206 () Bool)

(assert (=> d!9171 (=> (not res!27206) (not e!29725))))

(declare-fun lt!20333 () List!1243)

(assert (=> d!9171 (= res!27206 (isStrictlySorted!236 lt!20333))))

(declare-fun e!29726 () List!1243)

(assert (=> d!9171 (= lt!20333 e!29726)))

(declare-fun c!6311 () Bool)

(assert (=> d!9171 (= c!6311 (and ((_ is Cons!1239) (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27))) (= (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27)))) key1!43)))))

(assert (=> d!9171 (isStrictlySorted!236 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27)))))

(assert (=> d!9171 (= (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27)) key1!43) lt!20333)))

(declare-fun b!46625 () Bool)

(declare-fun e!29727 () List!1243)

(assert (=> b!46625 (= e!29726 e!29727)))

(declare-fun c!6310 () Bool)

(assert (=> b!46625 (= c!6310 (and ((_ is Cons!1239) (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27))) (not (= (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27)))) key1!43))))))

(declare-fun b!46626 () Bool)

(assert (=> b!46626 (= e!29727 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27))) key1!43) (h!1819 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27)))))))

(declare-fun b!46627 () Bool)

(assert (=> b!46627 (= e!29726 (t!4267 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key2!27))))))

(declare-fun b!46628 () Bool)

(assert (=> b!46628 (= e!29725 (not (containsKey!89 lt!20333 key1!43)))))

(declare-fun b!46629 () Bool)

(assert (=> b!46629 (= e!29727 Nil!1240)))

(assert (= (and d!9171 c!6311) b!46627))

(assert (= (and d!9171 (not c!6311)) b!46625))

(assert (= (and b!46625 c!6310) b!46626))

(assert (= (and b!46625 (not c!6310)) b!46629))

(assert (= (and d!9171 res!27206) b!46628))

(declare-fun m!40971 () Bool)

(assert (=> d!9171 m!40971))

(assert (=> d!9171 m!40929))

(declare-fun m!40973 () Bool)

(assert (=> b!46626 m!40973))

(assert (=> b!46626 m!40973))

(declare-fun m!40975 () Bool)

(assert (=> b!46626 m!40975))

(declare-fun m!40977 () Bool)

(assert (=> b!46628 m!40977))

(assert (=> b!46490 d!9171))

(declare-fun d!9173 () Bool)

(declare-fun res!27207 () Bool)

(declare-fun e!29728 () Bool)

(assert (=> d!9173 (=> res!27207 e!29728)))

(assert (=> d!9173 (= res!27207 (and ((_ is Cons!1239) lt!20311) (= (_1!869 (h!1819 lt!20311)) key1!43)))))

(assert (=> d!9173 (= (containsKey!89 lt!20311 key1!43) e!29728)))

(declare-fun b!46630 () Bool)

(declare-fun e!29729 () Bool)

(assert (=> b!46630 (= e!29728 e!29729)))

(declare-fun res!27208 () Bool)

(assert (=> b!46630 (=> (not res!27208) (not e!29729))))

(assert (=> b!46630 (= res!27208 (and (or (not ((_ is Cons!1239) lt!20311)) (bvsle (_1!869 (h!1819 lt!20311)) key1!43)) ((_ is Cons!1239) lt!20311) (bvslt (_1!869 (h!1819 lt!20311)) key1!43)))))

(declare-fun b!46631 () Bool)

(assert (=> b!46631 (= e!29729 (containsKey!89 (t!4267 lt!20311) key1!43))))

(assert (= (and d!9173 (not res!27207)) b!46630))

(assert (= (and b!46630 res!27208) b!46631))

(declare-fun m!40979 () Bool)

(assert (=> b!46631 m!40979))

(assert (=> b!46482 d!9173))

(declare-fun d!9175 () Bool)

(declare-fun res!27209 () Bool)

(declare-fun e!29730 () Bool)

(assert (=> d!9175 (=> res!27209 e!29730)))

(assert (=> d!9175 (= res!27209 (and ((_ is Cons!1239) lt!20299) (= (_1!869 (h!1819 lt!20299)) key2!27)))))

(assert (=> d!9175 (= (containsKey!89 lt!20299 key2!27) e!29730)))

(declare-fun b!46632 () Bool)

(declare-fun e!29731 () Bool)

(assert (=> b!46632 (= e!29730 e!29731)))

(declare-fun res!27210 () Bool)

(assert (=> b!46632 (=> (not res!27210) (not e!29731))))

(assert (=> b!46632 (= res!27210 (and (or (not ((_ is Cons!1239) lt!20299)) (bvsle (_1!869 (h!1819 lt!20299)) key2!27)) ((_ is Cons!1239) lt!20299) (bvslt (_1!869 (h!1819 lt!20299)) key2!27)))))

(declare-fun b!46633 () Bool)

(assert (=> b!46633 (= e!29731 (containsKey!89 (t!4267 lt!20299) key2!27))))

(assert (= (and d!9175 (not res!27209)) b!46632))

(assert (= (and b!46632 res!27210) b!46633))

(declare-fun m!40981 () Bool)

(assert (=> b!46633 m!40981))

(assert (=> b!46452 d!9175))

(declare-fun d!9177 () Bool)

(assert (=> d!9177 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 l!812 key1!43)) key2!27) (h!1819 (removeStrictlySorted!42 l!812 key1!43))) (Cons!1239 (h!1819 (removeStrictlySorted!42 l!812 key1!43)) (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 l!812 key1!43)) key2!27)))))

(assert (=> b!46515 d!9177))

(declare-fun d!9179 () Bool)

(declare-fun e!29732 () Bool)

(assert (=> d!9179 e!29732))

(declare-fun res!27211 () Bool)

(assert (=> d!9179 (=> (not res!27211) (not e!29732))))

(declare-fun lt!20334 () List!1243)

(assert (=> d!9179 (= res!27211 (isStrictlySorted!236 lt!20334))))

(declare-fun e!29733 () List!1243)

(assert (=> d!9179 (= lt!20334 e!29733)))

(declare-fun c!6313 () Bool)

(assert (=> d!9179 (= c!6313 (and ((_ is Cons!1239) (t!4267 (removeStrictlySorted!42 l!812 key1!43))) (= (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 l!812 key1!43)))) key2!27)))))

(assert (=> d!9179 (isStrictlySorted!236 (t!4267 (removeStrictlySorted!42 l!812 key1!43)))))

(assert (=> d!9179 (= (removeStrictlySorted!42 (t!4267 (removeStrictlySorted!42 l!812 key1!43)) key2!27) lt!20334)))

(declare-fun b!46634 () Bool)

(declare-fun e!29734 () List!1243)

(assert (=> b!46634 (= e!29733 e!29734)))

(declare-fun c!6312 () Bool)

(assert (=> b!46634 (= c!6312 (and ((_ is Cons!1239) (t!4267 (removeStrictlySorted!42 l!812 key1!43))) (not (= (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 l!812 key1!43)))) key2!27))))))

(declare-fun b!46635 () Bool)

(assert (=> b!46635 (= e!29734 ($colon$colon!44 (removeStrictlySorted!42 (t!4267 (t!4267 (removeStrictlySorted!42 l!812 key1!43))) key2!27) (h!1819 (t!4267 (removeStrictlySorted!42 l!812 key1!43)))))))

(declare-fun b!46636 () Bool)

(assert (=> b!46636 (= e!29733 (t!4267 (t!4267 (removeStrictlySorted!42 l!812 key1!43))))))

(declare-fun b!46637 () Bool)

(assert (=> b!46637 (= e!29732 (not (containsKey!89 lt!20334 key2!27)))))

(declare-fun b!46638 () Bool)

(assert (=> b!46638 (= e!29734 Nil!1240)))

(assert (= (and d!9179 c!6313) b!46636))

(assert (= (and d!9179 (not c!6313)) b!46634))

(assert (= (and b!46634 c!6312) b!46635))

(assert (= (and b!46634 (not c!6312)) b!46638))

(assert (= (and d!9179 res!27211) b!46637))

(declare-fun m!40983 () Bool)

(assert (=> d!9179 m!40983))

(assert (=> d!9179 m!40945))

(declare-fun m!40985 () Bool)

(assert (=> b!46635 m!40985))

(assert (=> b!46635 m!40985))

(declare-fun m!40987 () Bool)

(assert (=> b!46635 m!40987))

(declare-fun m!40989 () Bool)

(assert (=> b!46637 m!40989))

(assert (=> b!46515 d!9179))

(declare-fun d!9181 () Bool)

(declare-fun res!27212 () Bool)

(declare-fun e!29735 () Bool)

(assert (=> d!9181 (=> res!27212 e!29735)))

(assert (=> d!9181 (= res!27212 (or ((_ is Nil!1240) lt!20316) ((_ is Nil!1240) (t!4267 lt!20316))))))

(assert (=> d!9181 (= (isStrictlySorted!236 lt!20316) e!29735)))

(declare-fun b!46639 () Bool)

(declare-fun e!29736 () Bool)

(assert (=> b!46639 (= e!29735 e!29736)))

(declare-fun res!27213 () Bool)

(assert (=> b!46639 (=> (not res!27213) (not e!29736))))

(assert (=> b!46639 (= res!27213 (bvslt (_1!869 (h!1819 lt!20316)) (_1!869 (h!1819 (t!4267 lt!20316)))))))

(declare-fun b!46640 () Bool)

(assert (=> b!46640 (= e!29736 (isStrictlySorted!236 (t!4267 lt!20316)))))

(assert (= (and d!9181 (not res!27212)) b!46639))

(assert (= (and b!46639 res!27213) b!46640))

(declare-fun m!40991 () Bool)

(assert (=> b!46640 m!40991))

(assert (=> d!9101 d!9181))

(assert (=> d!9101 d!9069))

(declare-fun d!9183 () Bool)

(declare-fun res!27214 () Bool)

(declare-fun e!29737 () Bool)

(assert (=> d!9183 (=> res!27214 e!29737)))

(assert (=> d!9183 (= res!27214 (or ((_ is Nil!1240) lt!20295) ((_ is Nil!1240) (t!4267 lt!20295))))))

(assert (=> d!9183 (= (isStrictlySorted!236 lt!20295) e!29737)))

(declare-fun b!46641 () Bool)

(declare-fun e!29738 () Bool)

(assert (=> b!46641 (= e!29737 e!29738)))

(declare-fun res!27215 () Bool)

(assert (=> b!46641 (=> (not res!27215) (not e!29738))))

(assert (=> b!46641 (= res!27215 (bvslt (_1!869 (h!1819 lt!20295)) (_1!869 (h!1819 (t!4267 lt!20295)))))))

(declare-fun b!46642 () Bool)

(assert (=> b!46642 (= e!29738 (isStrictlySorted!236 (t!4267 lt!20295)))))

(assert (= (and d!9183 (not res!27214)) b!46641))

(assert (= (and b!46641 res!27215) b!46642))

(declare-fun m!40993 () Bool)

(assert (=> b!46642 m!40993))

(assert (=> d!9071 d!9183))

(declare-fun d!9185 () Bool)

(declare-fun res!27216 () Bool)

(declare-fun e!29739 () Bool)

(assert (=> d!9185 (=> res!27216 e!29739)))

(assert (=> d!9185 (= res!27216 (or ((_ is Nil!1240) (removeStrictlySorted!42 l!812 key2!27)) ((_ is Nil!1240) (t!4267 (removeStrictlySorted!42 l!812 key2!27)))))))

(assert (=> d!9185 (= (isStrictlySorted!236 (removeStrictlySorted!42 l!812 key2!27)) e!29739)))

(declare-fun b!46643 () Bool)

(declare-fun e!29740 () Bool)

(assert (=> b!46643 (= e!29739 e!29740)))

(declare-fun res!27217 () Bool)

(assert (=> b!46643 (=> (not res!27217) (not e!29740))))

(assert (=> b!46643 (= res!27217 (bvslt (_1!869 (h!1819 (removeStrictlySorted!42 l!812 key2!27))) (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 l!812 key2!27))))))))

(declare-fun b!46644 () Bool)

(assert (=> b!46644 (= e!29740 (isStrictlySorted!236 (t!4267 (removeStrictlySorted!42 l!812 key2!27))))))

(assert (= (and d!9185 (not res!27216)) b!46643))

(assert (= (and b!46643 res!27217) b!46644))

(assert (=> b!46644 m!40961))

(assert (=> d!9071 d!9185))

(declare-fun d!9187 () Bool)

(assert (=> d!9187 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4267 l!812) key1!43) (h!1819 l!812)) (Cons!1239 (h!1819 l!812) (removeStrictlySorted!42 (t!4267 l!812) key1!43)))))

(assert (=> b!46440 d!9187))

(assert (=> b!46440 d!9093))

(declare-fun d!9189 () Bool)

(declare-fun res!27218 () Bool)

(declare-fun e!29741 () Bool)

(assert (=> d!9189 (=> res!27218 e!29741)))

(assert (=> d!9189 (= res!27218 (and ((_ is Cons!1239) lt!20318) (= (_1!869 (h!1819 lt!20318)) key2!27)))))

(assert (=> d!9189 (= (containsKey!89 lt!20318 key2!27) e!29741)))

(declare-fun b!46645 () Bool)

(declare-fun e!29742 () Bool)

(assert (=> b!46645 (= e!29741 e!29742)))

(declare-fun res!27219 () Bool)

(assert (=> b!46645 (=> (not res!27219) (not e!29742))))

(assert (=> b!46645 (= res!27219 (and (or (not ((_ is Cons!1239) lt!20318)) (bvsle (_1!869 (h!1819 lt!20318)) key2!27)) ((_ is Cons!1239) lt!20318) (bvslt (_1!869 (h!1819 lt!20318)) key2!27)))))

(declare-fun b!46646 () Bool)

(assert (=> b!46646 (= e!29742 (containsKey!89 (t!4267 lt!20318) key2!27))))

(assert (= (and d!9189 (not res!27218)) b!46645))

(assert (= (and b!46645 res!27219) b!46646))

(declare-fun m!40995 () Bool)

(assert (=> b!46646 m!40995))

(assert (=> b!46517 d!9189))

(declare-fun d!9191 () Bool)

(declare-fun res!27220 () Bool)

(declare-fun e!29743 () Bool)

(assert (=> d!9191 (=> res!27220 e!29743)))

(assert (=> d!9191 (= res!27220 (and ((_ is Cons!1239) lt!20295) (= (_1!869 (h!1819 lt!20295)) key1!43)))))

(assert (=> d!9191 (= (containsKey!89 lt!20295 key1!43) e!29743)))

(declare-fun b!46647 () Bool)

(declare-fun e!29744 () Bool)

(assert (=> b!46647 (= e!29743 e!29744)))

(declare-fun res!27221 () Bool)

(assert (=> b!46647 (=> (not res!27221) (not e!29744))))

(assert (=> b!46647 (= res!27221 (and (or (not ((_ is Cons!1239) lt!20295)) (bvsle (_1!869 (h!1819 lt!20295)) key1!43)) ((_ is Cons!1239) lt!20295) (bvslt (_1!869 (h!1819 lt!20295)) key1!43)))))

(declare-fun b!46648 () Bool)

(assert (=> b!46648 (= e!29744 (containsKey!89 (t!4267 lt!20295) key1!43))))

(assert (= (and d!9191 (not res!27220)) b!46647))

(assert (= (and b!46647 res!27221) b!46648))

(declare-fun m!40997 () Bool)

(assert (=> b!46648 m!40997))

(assert (=> b!46432 d!9191))

(declare-fun d!9193 () Bool)

(declare-fun res!27222 () Bool)

(declare-fun e!29745 () Bool)

(assert (=> d!9193 (=> res!27222 e!29745)))

(assert (=> d!9193 (= res!27222 (or ((_ is Nil!1240) lt!20309) ((_ is Nil!1240) (t!4267 lt!20309))))))

(assert (=> d!9193 (= (isStrictlySorted!236 lt!20309) e!29745)))

(declare-fun b!46649 () Bool)

(declare-fun e!29746 () Bool)

(assert (=> b!46649 (= e!29745 e!29746)))

(declare-fun res!27223 () Bool)

(assert (=> b!46649 (=> (not res!27223) (not e!29746))))

(assert (=> b!46649 (= res!27223 (bvslt (_1!869 (h!1819 lt!20309)) (_1!869 (h!1819 (t!4267 lt!20309)))))))

(declare-fun b!46650 () Bool)

(assert (=> b!46650 (= e!29746 (isStrictlySorted!236 (t!4267 lt!20309)))))

(assert (= (and d!9193 (not res!27222)) b!46649))

(assert (= (and b!46649 res!27223) b!46650))

(declare-fun m!40999 () Bool)

(assert (=> b!46650 m!40999))

(assert (=> d!9089 d!9193))

(declare-fun d!9195 () Bool)

(declare-fun res!27224 () Bool)

(declare-fun e!29747 () Bool)

(assert (=> d!9195 (=> res!27224 e!29747)))

(assert (=> d!9195 (= res!27224 (or ((_ is Nil!1240) (removeStrictlySorted!42 (t!4267 l!812) key1!43)) ((_ is Nil!1240) (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43)))))))

(assert (=> d!9195 (= (isStrictlySorted!236 (removeStrictlySorted!42 (t!4267 l!812) key1!43)) e!29747)))

(declare-fun b!46651 () Bool)

(declare-fun e!29748 () Bool)

(assert (=> b!46651 (= e!29747 e!29748)))

(declare-fun res!27225 () Bool)

(assert (=> b!46651 (=> (not res!27225) (not e!29748))))

(assert (=> b!46651 (= res!27225 (bvslt (_1!869 (h!1819 (removeStrictlySorted!42 (t!4267 l!812) key1!43))) (_1!869 (h!1819 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43))))))))

(declare-fun b!46652 () Bool)

(assert (=> b!46652 (= e!29748 (isStrictlySorted!236 (t!4267 (removeStrictlySorted!42 (t!4267 l!812) key1!43))))))

(assert (= (and d!9195 (not res!27224)) b!46651))

(assert (= (and b!46651 res!27225) b!46652))

(assert (=> b!46652 m!40915))

(assert (=> d!9089 d!9195))

(declare-fun d!9197 () Bool)

(declare-fun res!27226 () Bool)

(declare-fun e!29749 () Bool)

(assert (=> d!9197 (=> res!27226 e!29749)))

(assert (=> d!9197 (= res!27226 (or ((_ is Nil!1240) (t!4267 (t!4267 l!812))) ((_ is Nil!1240) (t!4267 (t!4267 (t!4267 l!812))))))))

(assert (=> d!9197 (= (isStrictlySorted!236 (t!4267 (t!4267 l!812))) e!29749)))

(declare-fun b!46653 () Bool)

(declare-fun e!29750 () Bool)

(assert (=> b!46653 (= e!29749 e!29750)))

(declare-fun res!27227 () Bool)

(assert (=> b!46653 (=> (not res!27227) (not e!29750))))

(assert (=> b!46653 (= res!27227 (bvslt (_1!869 (h!1819 (t!4267 (t!4267 l!812)))) (_1!869 (h!1819 (t!4267 (t!4267 (t!4267 l!812)))))))))

(declare-fun b!46654 () Bool)

(assert (=> b!46654 (= e!29750 (isStrictlySorted!236 (t!4267 (t!4267 (t!4267 l!812)))))))

(assert (= (and d!9197 (not res!27226)) b!46653))

(assert (= (and b!46653 res!27227) b!46654))

(declare-fun m!41001 () Bool)

(assert (=> b!46654 m!41001))

(assert (=> b!46403 d!9197))

(declare-fun d!9199 () Bool)

(assert (=> d!9199 (= ($colon$colon!44 (removeStrictlySorted!42 (t!4267 l!812) key2!27) (h!1819 l!812)) (Cons!1239 (h!1819 l!812) (removeStrictlySorted!42 (t!4267 l!812) key2!27)))))

(assert (=> b!46450 d!9199))

(assert (=> b!46450 d!9101))

(declare-fun b!46655 () Bool)

(declare-fun e!29751 () Bool)

(declare-fun tp!6153 () Bool)

(assert (=> b!46655 (= e!29751 (and tp_is_empty!1987 tp!6153))))

(assert (=> b!46539 (= tp!6148 e!29751)))

(assert (= (and b!46539 ((_ is Cons!1239) (t!4267 (t!4267 l!812)))) b!46655))

(check-sat (not b!46626) (not b!46648) (not b!46582) (not b!46610) (not b!46646) (not b!46608) (not b!46637) (not b!46597) (not b!46650) (not d!9131) (not b!46619) (not b!46599) (not b!46652) (not b!46593) (not b!46642) (not b!46604) (not d!9145) (not d!9163) (not b!46601) (not b!46640) (not b!46591) (not b!46614) (not b!46654) (not b!46621) (not b!46633) (not d!9157) (not b!46655) (not b!46631) (not b!46628) (not b!46644) (not b!46606) (not d!9179) (not d!9165) (not b!46617) (not b!46580) (not b!46589) (not b!46635) (not d!9171) (not b!46612) tp_is_empty!1987 (not b!46595) (not b!46624))
(check-sat)
