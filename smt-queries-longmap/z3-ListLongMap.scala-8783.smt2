; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106824 () Bool)

(assert start!106824)

(declare-fun b!1267570 () Bool)

(declare-fun res!843801 () Bool)

(declare-fun e!722125 () Bool)

(assert (=> b!1267570 (=> (not res!843801) (not e!722125))))

(declare-datatypes ((B!2090 0))(
  ( (B!2091 (val!16380 Int)) )
))
(declare-datatypes ((tuple2!21360 0))(
  ( (tuple2!21361 (_1!10691 (_ BitVec 64)) (_2!10691 B!2090)) )
))
(declare-datatypes ((List!28456 0))(
  ( (Nil!28453) (Cons!28452 (h!29661 tuple2!21360) (t!41974 List!28456)) )
))
(declare-fun l!874 () List!28456)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!686 (List!28456 (_ BitVec 64)) Bool)

(assert (=> b!1267570 (= res!843801 (not (containsKey!686 l!874 key!235)))))

(declare-fun b!1267571 () Bool)

(declare-fun e!722126 () Bool)

(declare-fun tp_is_empty!32611 () Bool)

(declare-fun tp!96641 () Bool)

(assert (=> b!1267571 (= e!722126 (and tp_is_empty!32611 tp!96641))))

(declare-fun res!843803 () Bool)

(assert (=> start!106824 (=> (not res!843803) (not e!722125))))

(declare-fun isStrictlySorted!825 (List!28456) Bool)

(assert (=> start!106824 (= res!843803 (isStrictlySorted!825 l!874))))

(assert (=> start!106824 e!722125))

(assert (=> start!106824 e!722126))

(assert (=> start!106824 true))

(declare-fun b!1267572 () Bool)

(declare-fun removeStrictlySorted!167 (List!28456 (_ BitVec 64)) List!28456)

(assert (=> b!1267572 (= e!722125 (not (= (removeStrictlySorted!167 l!874 key!235) l!874)))))

(assert (=> b!1267572 (= (removeStrictlySorted!167 (t!41974 l!874) key!235) (t!41974 l!874))))

(declare-datatypes ((Unit!42072 0))(
  ( (Unit!42073) )
))
(declare-fun lt!574165 () Unit!42072)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!7 (List!28456 (_ BitVec 64)) Unit!42072)

(assert (=> b!1267572 (= lt!574165 (lemmaRemoveStrictlySortedNotPresentPreserves!7 (t!41974 l!874) key!235))))

(declare-fun b!1267573 () Bool)

(declare-fun res!843802 () Bool)

(assert (=> b!1267573 (=> (not res!843802) (not e!722125))))

(assert (=> b!1267573 (= res!843802 (not (containsKey!686 (t!41974 l!874) key!235)))))

(declare-fun b!1267574 () Bool)

(declare-fun res!843804 () Bool)

(assert (=> b!1267574 (=> (not res!843804) (not e!722125))))

(get-info :version)

(assert (=> b!1267574 (= res!843804 ((_ is Cons!28452) l!874))))

(declare-fun b!1267575 () Bool)

(declare-fun res!843800 () Bool)

(assert (=> b!1267575 (=> (not res!843800) (not e!722125))))

(assert (=> b!1267575 (= res!843800 (isStrictlySorted!825 (t!41974 l!874)))))

(assert (= (and start!106824 res!843803) b!1267570))

(assert (= (and b!1267570 res!843801) b!1267574))

(assert (= (and b!1267574 res!843804) b!1267575))

(assert (= (and b!1267575 res!843800) b!1267573))

(assert (= (and b!1267573 res!843802) b!1267572))

(assert (= (and start!106824 ((_ is Cons!28452) l!874)) b!1267571))

(declare-fun m!1166291 () Bool)

(assert (=> b!1267575 m!1166291))

(declare-fun m!1166293 () Bool)

(assert (=> b!1267570 m!1166293))

(declare-fun m!1166295 () Bool)

(assert (=> start!106824 m!1166295))

(declare-fun m!1166297 () Bool)

(assert (=> b!1267572 m!1166297))

(declare-fun m!1166299 () Bool)

(assert (=> b!1267572 m!1166299))

(declare-fun m!1166301 () Bool)

(assert (=> b!1267572 m!1166301))

(declare-fun m!1166303 () Bool)

(assert (=> b!1267573 m!1166303))

(check-sat (not b!1267573) (not b!1267572) (not b!1267571) tp_is_empty!32611 (not b!1267575) (not start!106824) (not b!1267570))
(check-sat)
(get-model)

(declare-fun d!139393 () Bool)

(declare-fun res!843843 () Bool)

(declare-fun e!722147 () Bool)

(assert (=> d!139393 (=> res!843843 e!722147)))

(assert (=> d!139393 (= res!843843 (and ((_ is Cons!28452) l!874) (= (_1!10691 (h!29661 l!874)) key!235)))))

(assert (=> d!139393 (= (containsKey!686 l!874 key!235) e!722147)))

(declare-fun b!1267620 () Bool)

(declare-fun e!722149 () Bool)

(assert (=> b!1267620 (= e!722147 e!722149)))

(declare-fun res!843845 () Bool)

(assert (=> b!1267620 (=> (not res!843845) (not e!722149))))

(assert (=> b!1267620 (= res!843845 (and (or (not ((_ is Cons!28452) l!874)) (bvsle (_1!10691 (h!29661 l!874)) key!235)) ((_ is Cons!28452) l!874) (bvslt (_1!10691 (h!29661 l!874)) key!235)))))

(declare-fun b!1267621 () Bool)

(assert (=> b!1267621 (= e!722149 (containsKey!686 (t!41974 l!874) key!235))))

(assert (= (and d!139393 (not res!843843)) b!1267620))

(assert (= (and b!1267620 res!843845) b!1267621))

(assert (=> b!1267621 m!1166303))

(assert (=> b!1267570 d!139393))

(declare-fun d!139400 () Bool)

(declare-fun res!843853 () Bool)

(declare-fun e!722161 () Bool)

(assert (=> d!139400 (=> res!843853 e!722161)))

(assert (=> d!139400 (= res!843853 (or ((_ is Nil!28453) l!874) ((_ is Nil!28453) (t!41974 l!874))))))

(assert (=> d!139400 (= (isStrictlySorted!825 l!874) e!722161)))

(declare-fun b!1267638 () Bool)

(declare-fun e!722162 () Bool)

(assert (=> b!1267638 (= e!722161 e!722162)))

(declare-fun res!843854 () Bool)

(assert (=> b!1267638 (=> (not res!843854) (not e!722162))))

(assert (=> b!1267638 (= res!843854 (bvslt (_1!10691 (h!29661 l!874)) (_1!10691 (h!29661 (t!41974 l!874)))))))

(declare-fun b!1267639 () Bool)

(assert (=> b!1267639 (= e!722162 (isStrictlySorted!825 (t!41974 l!874)))))

(assert (= (and d!139400 (not res!843853)) b!1267638))

(assert (= (and b!1267638 res!843854) b!1267639))

(assert (=> b!1267639 m!1166291))

(assert (=> start!106824 d!139400))

(declare-fun d!139403 () Bool)

(declare-fun e!722193 () Bool)

(assert (=> d!139403 e!722193))

(declare-fun res!843867 () Bool)

(assert (=> d!139403 (=> (not res!843867) (not e!722193))))

(declare-fun lt!574185 () List!28456)

(assert (=> d!139403 (= res!843867 (isStrictlySorted!825 lt!574185))))

(declare-fun e!722191 () List!28456)

(assert (=> d!139403 (= lt!574185 e!722191)))

(declare-fun c!123577 () Bool)

(assert (=> d!139403 (= c!123577 (and ((_ is Cons!28452) l!874) (= (_1!10691 (h!29661 l!874)) key!235)))))

(assert (=> d!139403 (isStrictlySorted!825 l!874)))

(assert (=> d!139403 (= (removeStrictlySorted!167 l!874 key!235) lt!574185)))

(declare-fun b!1267684 () Bool)

(declare-fun e!722192 () List!28456)

(assert (=> b!1267684 (= e!722191 e!722192)))

(declare-fun c!123578 () Bool)

(assert (=> b!1267684 (= c!123578 (and ((_ is Cons!28452) l!874) (not (= (_1!10691 (h!29661 l!874)) key!235))))))

(declare-fun b!1267685 () Bool)

(assert (=> b!1267685 (= e!722191 (t!41974 l!874))))

(declare-fun b!1267686 () Bool)

(declare-fun $colon$colon!653 (List!28456 tuple2!21360) List!28456)

(assert (=> b!1267686 (= e!722192 ($colon$colon!653 (removeStrictlySorted!167 (t!41974 l!874) key!235) (h!29661 l!874)))))

(declare-fun b!1267687 () Bool)

(assert (=> b!1267687 (= e!722193 (not (containsKey!686 lt!574185 key!235)))))

(declare-fun b!1267688 () Bool)

(assert (=> b!1267688 (= e!722192 Nil!28453)))

(assert (= (and d!139403 c!123577) b!1267685))

(assert (= (and d!139403 (not c!123577)) b!1267684))

(assert (= (and b!1267684 c!123578) b!1267686))

(assert (= (and b!1267684 (not c!123578)) b!1267688))

(assert (= (and d!139403 res!843867) b!1267687))

(declare-fun m!1166365 () Bool)

(assert (=> d!139403 m!1166365))

(assert (=> d!139403 m!1166295))

(assert (=> b!1267686 m!1166299))

(assert (=> b!1267686 m!1166299))

(declare-fun m!1166367 () Bool)

(assert (=> b!1267686 m!1166367))

(declare-fun m!1166369 () Bool)

(assert (=> b!1267687 m!1166369))

(assert (=> b!1267572 d!139403))

(declare-fun d!139415 () Bool)

(declare-fun e!722196 () Bool)

(assert (=> d!139415 e!722196))

(declare-fun res!843868 () Bool)

(assert (=> d!139415 (=> (not res!843868) (not e!722196))))

(declare-fun lt!574188 () List!28456)

(assert (=> d!139415 (= res!843868 (isStrictlySorted!825 lt!574188))))

(declare-fun e!722194 () List!28456)

(assert (=> d!139415 (= lt!574188 e!722194)))

(declare-fun c!123579 () Bool)

(assert (=> d!139415 (= c!123579 (and ((_ is Cons!28452) (t!41974 l!874)) (= (_1!10691 (h!29661 (t!41974 l!874))) key!235)))))

(assert (=> d!139415 (isStrictlySorted!825 (t!41974 l!874))))

(assert (=> d!139415 (= (removeStrictlySorted!167 (t!41974 l!874) key!235) lt!574188)))

(declare-fun b!1267689 () Bool)

(declare-fun e!722195 () List!28456)

(assert (=> b!1267689 (= e!722194 e!722195)))

(declare-fun c!123580 () Bool)

(assert (=> b!1267689 (= c!123580 (and ((_ is Cons!28452) (t!41974 l!874)) (not (= (_1!10691 (h!29661 (t!41974 l!874))) key!235))))))

(declare-fun b!1267690 () Bool)

(assert (=> b!1267690 (= e!722194 (t!41974 (t!41974 l!874)))))

(declare-fun b!1267691 () Bool)

(assert (=> b!1267691 (= e!722195 ($colon$colon!653 (removeStrictlySorted!167 (t!41974 (t!41974 l!874)) key!235) (h!29661 (t!41974 l!874))))))

(declare-fun b!1267692 () Bool)

(assert (=> b!1267692 (= e!722196 (not (containsKey!686 lt!574188 key!235)))))

(declare-fun b!1267693 () Bool)

(assert (=> b!1267693 (= e!722195 Nil!28453)))

(assert (= (and d!139415 c!123579) b!1267690))

(assert (= (and d!139415 (not c!123579)) b!1267689))

(assert (= (and b!1267689 c!123580) b!1267691))

(assert (= (and b!1267689 (not c!123580)) b!1267693))

(assert (= (and d!139415 res!843868) b!1267692))

(declare-fun m!1166371 () Bool)

(assert (=> d!139415 m!1166371))

(assert (=> d!139415 m!1166291))

(declare-fun m!1166373 () Bool)

(assert (=> b!1267691 m!1166373))

(assert (=> b!1267691 m!1166373))

(declare-fun m!1166379 () Bool)

(assert (=> b!1267691 m!1166379))

(declare-fun m!1166381 () Bool)

(assert (=> b!1267692 m!1166381))

(assert (=> b!1267572 d!139415))

(declare-fun d!139421 () Bool)

(assert (=> d!139421 (= (removeStrictlySorted!167 (t!41974 l!874) key!235) (t!41974 l!874))))

(declare-fun lt!574192 () Unit!42072)

(declare-fun choose!1901 (List!28456 (_ BitVec 64)) Unit!42072)

(assert (=> d!139421 (= lt!574192 (choose!1901 (t!41974 l!874) key!235))))

(assert (=> d!139421 (isStrictlySorted!825 (t!41974 l!874))))

(assert (=> d!139421 (= (lemmaRemoveStrictlySortedNotPresentPreserves!7 (t!41974 l!874) key!235) lt!574192)))

(declare-fun bs!35877 () Bool)

(assert (= bs!35877 d!139421))

(assert (=> bs!35877 m!1166299))

(declare-fun m!1166383 () Bool)

(assert (=> bs!35877 m!1166383))

(assert (=> bs!35877 m!1166291))

(assert (=> b!1267572 d!139421))

(declare-fun d!139425 () Bool)

(declare-fun res!843883 () Bool)

(declare-fun e!722211 () Bool)

(assert (=> d!139425 (=> res!843883 e!722211)))

(assert (=> d!139425 (= res!843883 (and ((_ is Cons!28452) (t!41974 l!874)) (= (_1!10691 (h!29661 (t!41974 l!874))) key!235)))))

(assert (=> d!139425 (= (containsKey!686 (t!41974 l!874) key!235) e!722211)))

(declare-fun b!1267708 () Bool)

(declare-fun e!722212 () Bool)

(assert (=> b!1267708 (= e!722211 e!722212)))

(declare-fun res!843884 () Bool)

(assert (=> b!1267708 (=> (not res!843884) (not e!722212))))

(assert (=> b!1267708 (= res!843884 (and (or (not ((_ is Cons!28452) (t!41974 l!874))) (bvsle (_1!10691 (h!29661 (t!41974 l!874))) key!235)) ((_ is Cons!28452) (t!41974 l!874)) (bvslt (_1!10691 (h!29661 (t!41974 l!874))) key!235)))))

(declare-fun b!1267709 () Bool)

(assert (=> b!1267709 (= e!722212 (containsKey!686 (t!41974 (t!41974 l!874)) key!235))))

(assert (= (and d!139425 (not res!843883)) b!1267708))

(assert (= (and b!1267708 res!843884) b!1267709))

(declare-fun m!1166387 () Bool)

(assert (=> b!1267709 m!1166387))

(assert (=> b!1267573 d!139425))

(declare-fun d!139431 () Bool)

(declare-fun res!843889 () Bool)

(declare-fun e!722217 () Bool)

(assert (=> d!139431 (=> res!843889 e!722217)))

(assert (=> d!139431 (= res!843889 (or ((_ is Nil!28453) (t!41974 l!874)) ((_ is Nil!28453) (t!41974 (t!41974 l!874)))))))

(assert (=> d!139431 (= (isStrictlySorted!825 (t!41974 l!874)) e!722217)))

(declare-fun b!1267714 () Bool)

(declare-fun e!722218 () Bool)

(assert (=> b!1267714 (= e!722217 e!722218)))

(declare-fun res!843890 () Bool)

(assert (=> b!1267714 (=> (not res!843890) (not e!722218))))

(assert (=> b!1267714 (= res!843890 (bvslt (_1!10691 (h!29661 (t!41974 l!874))) (_1!10691 (h!29661 (t!41974 (t!41974 l!874))))))))

(declare-fun b!1267715 () Bool)

(assert (=> b!1267715 (= e!722218 (isStrictlySorted!825 (t!41974 (t!41974 l!874))))))

(assert (= (and d!139431 (not res!843889)) b!1267714))

(assert (= (and b!1267714 res!843890) b!1267715))

(declare-fun m!1166389 () Bool)

(assert (=> b!1267715 m!1166389))

(assert (=> b!1267575 d!139431))

(declare-fun b!1267733 () Bool)

(declare-fun e!722230 () Bool)

(declare-fun tp!96655 () Bool)

(assert (=> b!1267733 (= e!722230 (and tp_is_empty!32611 tp!96655))))

(assert (=> b!1267571 (= tp!96641 e!722230)))

(assert (= (and b!1267571 ((_ is Cons!28452) (t!41974 l!874))) b!1267733))

(check-sat (not d!139415) (not b!1267686) (not b!1267621) (not b!1267687) (not b!1267692) (not b!1267715) (not b!1267709) (not b!1267733) (not d!139421) (not d!139403) (not b!1267639) (not b!1267691) tp_is_empty!32611)
(check-sat)
(get-model)

(assert (=> d!139421 d!139415))

(declare-fun d!139443 () Bool)

(assert (=> d!139443 (= (removeStrictlySorted!167 (t!41974 l!874) key!235) (t!41974 l!874))))

(assert (=> d!139443 true))

(declare-fun _$7!134 () Unit!42072)

(assert (=> d!139443 (= (choose!1901 (t!41974 l!874) key!235) _$7!134)))

(declare-fun bs!35879 () Bool)

(assert (= bs!35879 d!139443))

(assert (=> bs!35879 m!1166299))

(assert (=> d!139421 d!139443))

(assert (=> d!139421 d!139431))

(declare-fun d!139455 () Bool)

(declare-fun res!843906 () Bool)

(declare-fun e!722245 () Bool)

(assert (=> d!139455 (=> res!843906 e!722245)))

(assert (=> d!139455 (= res!843906 (and ((_ is Cons!28452) lt!574185) (= (_1!10691 (h!29661 lt!574185)) key!235)))))

(assert (=> d!139455 (= (containsKey!686 lt!574185 key!235) e!722245)))

(declare-fun b!1267750 () Bool)

(declare-fun e!722246 () Bool)

(assert (=> b!1267750 (= e!722245 e!722246)))

(declare-fun res!843907 () Bool)

(assert (=> b!1267750 (=> (not res!843907) (not e!722246))))

(assert (=> b!1267750 (= res!843907 (and (or (not ((_ is Cons!28452) lt!574185)) (bvsle (_1!10691 (h!29661 lt!574185)) key!235)) ((_ is Cons!28452) lt!574185) (bvslt (_1!10691 (h!29661 lt!574185)) key!235)))))

(declare-fun b!1267751 () Bool)

(assert (=> b!1267751 (= e!722246 (containsKey!686 (t!41974 lt!574185) key!235))))

(assert (= (and d!139455 (not res!843906)) b!1267750))

(assert (= (and b!1267750 res!843907) b!1267751))

(declare-fun m!1166411 () Bool)

(assert (=> b!1267751 m!1166411))

(assert (=> b!1267687 d!139455))

(declare-fun d!139459 () Bool)

(declare-fun res!843910 () Bool)

(declare-fun e!722249 () Bool)

(assert (=> d!139459 (=> res!843910 e!722249)))

(assert (=> d!139459 (= res!843910 (or ((_ is Nil!28453) (t!41974 (t!41974 l!874))) ((_ is Nil!28453) (t!41974 (t!41974 (t!41974 l!874))))))))

(assert (=> d!139459 (= (isStrictlySorted!825 (t!41974 (t!41974 l!874))) e!722249)))

(declare-fun b!1267754 () Bool)

(declare-fun e!722250 () Bool)

(assert (=> b!1267754 (= e!722249 e!722250)))

(declare-fun res!843911 () Bool)

(assert (=> b!1267754 (=> (not res!843911) (not e!722250))))

(assert (=> b!1267754 (= res!843911 (bvslt (_1!10691 (h!29661 (t!41974 (t!41974 l!874)))) (_1!10691 (h!29661 (t!41974 (t!41974 (t!41974 l!874)))))))))

(declare-fun b!1267755 () Bool)

(assert (=> b!1267755 (= e!722250 (isStrictlySorted!825 (t!41974 (t!41974 (t!41974 l!874)))))))

(assert (= (and d!139459 (not res!843910)) b!1267754))

(assert (= (and b!1267754 res!843911) b!1267755))

(declare-fun m!1166415 () Bool)

(assert (=> b!1267755 m!1166415))

(assert (=> b!1267715 d!139459))

(declare-fun d!139461 () Bool)

(declare-fun res!843912 () Bool)

(declare-fun e!722252 () Bool)

(assert (=> d!139461 (=> res!843912 e!722252)))

(assert (=> d!139461 (= res!843912 (and ((_ is Cons!28452) lt!574188) (= (_1!10691 (h!29661 lt!574188)) key!235)))))

(assert (=> d!139461 (= (containsKey!686 lt!574188 key!235) e!722252)))

(declare-fun b!1267757 () Bool)

(declare-fun e!722253 () Bool)

(assert (=> b!1267757 (= e!722252 e!722253)))

(declare-fun res!843913 () Bool)

(assert (=> b!1267757 (=> (not res!843913) (not e!722253))))

(assert (=> b!1267757 (= res!843913 (and (or (not ((_ is Cons!28452) lt!574188)) (bvsle (_1!10691 (h!29661 lt!574188)) key!235)) ((_ is Cons!28452) lt!574188) (bvslt (_1!10691 (h!29661 lt!574188)) key!235)))))

(declare-fun b!1267758 () Bool)

(assert (=> b!1267758 (= e!722253 (containsKey!686 (t!41974 lt!574188) key!235))))

(assert (= (and d!139461 (not res!843912)) b!1267757))

(assert (= (and b!1267757 res!843913) b!1267758))

(declare-fun m!1166417 () Bool)

(assert (=> b!1267758 m!1166417))

(assert (=> b!1267692 d!139461))

(declare-fun d!139463 () Bool)

(declare-fun res!843914 () Bool)

(declare-fun e!722254 () Bool)

(assert (=> d!139463 (=> res!843914 e!722254)))

(assert (=> d!139463 (= res!843914 (or ((_ is Nil!28453) lt!574188) ((_ is Nil!28453) (t!41974 lt!574188))))))

(assert (=> d!139463 (= (isStrictlySorted!825 lt!574188) e!722254)))

(declare-fun b!1267759 () Bool)

(declare-fun e!722255 () Bool)

(assert (=> b!1267759 (= e!722254 e!722255)))

(declare-fun res!843915 () Bool)

(assert (=> b!1267759 (=> (not res!843915) (not e!722255))))

(assert (=> b!1267759 (= res!843915 (bvslt (_1!10691 (h!29661 lt!574188)) (_1!10691 (h!29661 (t!41974 lt!574188)))))))

(declare-fun b!1267760 () Bool)

(assert (=> b!1267760 (= e!722255 (isStrictlySorted!825 (t!41974 lt!574188)))))

(assert (= (and d!139463 (not res!843914)) b!1267759))

(assert (= (and b!1267759 res!843915) b!1267760))

(declare-fun m!1166419 () Bool)

(assert (=> b!1267760 m!1166419))

(assert (=> d!139415 d!139463))

(assert (=> d!139415 d!139431))

(declare-fun d!139465 () Bool)

(assert (=> d!139465 (= ($colon$colon!653 (removeStrictlySorted!167 (t!41974 l!874) key!235) (h!29661 l!874)) (Cons!28452 (h!29661 l!874) (removeStrictlySorted!167 (t!41974 l!874) key!235)))))

(assert (=> b!1267686 d!139465))

(assert (=> b!1267686 d!139415))

(declare-fun d!139467 () Bool)

(assert (=> d!139467 (= ($colon$colon!653 (removeStrictlySorted!167 (t!41974 (t!41974 l!874)) key!235) (h!29661 (t!41974 l!874))) (Cons!28452 (h!29661 (t!41974 l!874)) (removeStrictlySorted!167 (t!41974 (t!41974 l!874)) key!235)))))

(assert (=> b!1267691 d!139467))

(declare-fun d!139469 () Bool)

(declare-fun e!722258 () Bool)

(assert (=> d!139469 e!722258))

(declare-fun res!843916 () Bool)

(assert (=> d!139469 (=> (not res!843916) (not e!722258))))

(declare-fun lt!574194 () List!28456)

(assert (=> d!139469 (= res!843916 (isStrictlySorted!825 lt!574194))))

(declare-fun e!722256 () List!28456)

(assert (=> d!139469 (= lt!574194 e!722256)))

(declare-fun c!123583 () Bool)

(assert (=> d!139469 (= c!123583 (and ((_ is Cons!28452) (t!41974 (t!41974 l!874))) (= (_1!10691 (h!29661 (t!41974 (t!41974 l!874)))) key!235)))))

(assert (=> d!139469 (isStrictlySorted!825 (t!41974 (t!41974 l!874)))))

(assert (=> d!139469 (= (removeStrictlySorted!167 (t!41974 (t!41974 l!874)) key!235) lt!574194)))

(declare-fun b!1267761 () Bool)

(declare-fun e!722257 () List!28456)

(assert (=> b!1267761 (= e!722256 e!722257)))

(declare-fun c!123584 () Bool)

(assert (=> b!1267761 (= c!123584 (and ((_ is Cons!28452) (t!41974 (t!41974 l!874))) (not (= (_1!10691 (h!29661 (t!41974 (t!41974 l!874)))) key!235))))))

(declare-fun b!1267762 () Bool)

(assert (=> b!1267762 (= e!722256 (t!41974 (t!41974 (t!41974 l!874))))))

(declare-fun b!1267763 () Bool)

(assert (=> b!1267763 (= e!722257 ($colon$colon!653 (removeStrictlySorted!167 (t!41974 (t!41974 (t!41974 l!874))) key!235) (h!29661 (t!41974 (t!41974 l!874)))))))

(declare-fun b!1267764 () Bool)

(assert (=> b!1267764 (= e!722258 (not (containsKey!686 lt!574194 key!235)))))

(declare-fun b!1267765 () Bool)

(assert (=> b!1267765 (= e!722257 Nil!28453)))

(assert (= (and d!139469 c!123583) b!1267762))

(assert (= (and d!139469 (not c!123583)) b!1267761))

(assert (= (and b!1267761 c!123584) b!1267763))

(assert (= (and b!1267761 (not c!123584)) b!1267765))

(assert (= (and d!139469 res!843916) b!1267764))

(declare-fun m!1166421 () Bool)

(assert (=> d!139469 m!1166421))

(assert (=> d!139469 m!1166389))

(declare-fun m!1166423 () Bool)

(assert (=> b!1267763 m!1166423))

(assert (=> b!1267763 m!1166423))

(declare-fun m!1166425 () Bool)

(assert (=> b!1267763 m!1166425))

(declare-fun m!1166427 () Bool)

(assert (=> b!1267764 m!1166427))

(assert (=> b!1267691 d!139469))

(declare-fun d!139471 () Bool)

(declare-fun res!843917 () Bool)

(declare-fun e!722259 () Bool)

(assert (=> d!139471 (=> res!843917 e!722259)))

(assert (=> d!139471 (= res!843917 (or ((_ is Nil!28453) lt!574185) ((_ is Nil!28453) (t!41974 lt!574185))))))

(assert (=> d!139471 (= (isStrictlySorted!825 lt!574185) e!722259)))

(declare-fun b!1267766 () Bool)

(declare-fun e!722260 () Bool)

(assert (=> b!1267766 (= e!722259 e!722260)))

(declare-fun res!843918 () Bool)

(assert (=> b!1267766 (=> (not res!843918) (not e!722260))))

(assert (=> b!1267766 (= res!843918 (bvslt (_1!10691 (h!29661 lt!574185)) (_1!10691 (h!29661 (t!41974 lt!574185)))))))

(declare-fun b!1267767 () Bool)

(assert (=> b!1267767 (= e!722260 (isStrictlySorted!825 (t!41974 lt!574185)))))

(assert (= (and d!139471 (not res!843917)) b!1267766))

(assert (= (and b!1267766 res!843918) b!1267767))

(declare-fun m!1166429 () Bool)

(assert (=> b!1267767 m!1166429))

(assert (=> d!139403 d!139471))

(assert (=> d!139403 d!139400))

(assert (=> b!1267621 d!139425))

(declare-fun d!139473 () Bool)

(declare-fun res!843919 () Bool)

(declare-fun e!722261 () Bool)

(assert (=> d!139473 (=> res!843919 e!722261)))

(assert (=> d!139473 (= res!843919 (and ((_ is Cons!28452) (t!41974 (t!41974 l!874))) (= (_1!10691 (h!29661 (t!41974 (t!41974 l!874)))) key!235)))))

(assert (=> d!139473 (= (containsKey!686 (t!41974 (t!41974 l!874)) key!235) e!722261)))

(declare-fun b!1267768 () Bool)

(declare-fun e!722262 () Bool)

(assert (=> b!1267768 (= e!722261 e!722262)))

(declare-fun res!843920 () Bool)

(assert (=> b!1267768 (=> (not res!843920) (not e!722262))))

(assert (=> b!1267768 (= res!843920 (and (or (not ((_ is Cons!28452) (t!41974 (t!41974 l!874)))) (bvsle (_1!10691 (h!29661 (t!41974 (t!41974 l!874)))) key!235)) ((_ is Cons!28452) (t!41974 (t!41974 l!874))) (bvslt (_1!10691 (h!29661 (t!41974 (t!41974 l!874)))) key!235)))))

(declare-fun b!1267769 () Bool)

(assert (=> b!1267769 (= e!722262 (containsKey!686 (t!41974 (t!41974 (t!41974 l!874))) key!235))))

(assert (= (and d!139473 (not res!843919)) b!1267768))

(assert (= (and b!1267768 res!843920) b!1267769))

(declare-fun m!1166431 () Bool)

(assert (=> b!1267769 m!1166431))

(assert (=> b!1267709 d!139473))

(assert (=> b!1267639 d!139431))

(declare-fun b!1267770 () Bool)

(declare-fun e!722263 () Bool)

(declare-fun tp!96658 () Bool)

(assert (=> b!1267770 (= e!722263 (and tp_is_empty!32611 tp!96658))))

(assert (=> b!1267733 (= tp!96655 e!722263)))

(assert (= (and b!1267733 ((_ is Cons!28452) (t!41974 (t!41974 l!874)))) b!1267770))

(check-sat (not b!1267764) (not b!1267769) (not b!1267755) (not d!139443) (not b!1267760) tp_is_empty!32611 (not b!1267751) (not b!1267767) (not b!1267763) (not b!1267770) (not b!1267758) (not d!139469))
(check-sat)
