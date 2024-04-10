; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107860 () Bool)

(assert start!107860)

(declare-fun res!847475 () Bool)

(declare-fun e!727653 () Bool)

(assert (=> start!107860 (=> (not res!847475) (not e!727653))))

(declare-datatypes ((B!2170 0))(
  ( (B!2171 (val!16681 Int)) )
))
(declare-datatypes ((tuple2!21444 0))(
  ( (tuple2!21445 (_1!10733 (_ BitVec 64)) (_2!10733 B!2170)) )
))
(declare-datatypes ((List!28607 0))(
  ( (Nil!28604) (Cons!28603 (h!29812 tuple2!21444) (t!42140 List!28607)) )
))
(declare-fun l!595 () List!28607)

(declare-fun isStrictlySorted!859 (List!28607) Bool)

(assert (=> start!107860 (= res!847475 (isStrictlySorted!859 l!595))))

(assert (=> start!107860 e!727653))

(declare-fun e!727652 () Bool)

(assert (=> start!107860 e!727652))

(assert (=> start!107860 true))

(declare-fun b!1274918 () Bool)

(declare-fun e!727654 () Bool)

(declare-fun lt!575307 () List!28607)

(declare-fun key!173 () (_ BitVec 64))

(declare-fun containsKey!704 (List!28607 (_ BitVec 64)) Bool)

(assert (=> b!1274918 (= e!727654 (containsKey!704 lt!575307 key!173))))

(declare-fun b!1274917 () Bool)

(assert (=> b!1274917 (= e!727653 e!727654)))

(declare-fun res!847476 () Bool)

(assert (=> b!1274917 (=> res!847476 e!727654)))

(assert (=> b!1274917 (= res!847476 (not (isStrictlySorted!859 lt!575307)))))

(declare-fun $colon$colon!665 (List!28607 tuple2!21444) List!28607)

(declare-fun removeStrictlySorted!183 (List!28607 (_ BitVec 64)) List!28607)

(assert (=> b!1274917 (= lt!575307 ($colon$colon!665 (removeStrictlySorted!183 (t!42140 l!595) key!173) (h!29812 l!595)))))

(declare-fun b!1274916 () Bool)

(declare-fun res!847477 () Bool)

(assert (=> b!1274916 (=> (not res!847477) (not e!727653))))

(get-info :version)

(assert (=> b!1274916 (= res!847477 (and (not (= (_1!10733 (h!29812 l!595)) key!173)) ((_ is Cons!28603) l!595)))))

(declare-fun b!1274919 () Bool)

(declare-fun tp_is_empty!33213 () Bool)

(declare-fun tp!98060 () Bool)

(assert (=> b!1274919 (= e!727652 (and tp_is_empty!33213 tp!98060))))

(assert (= (and start!107860 res!847475) b!1274916))

(assert (= (and b!1274916 res!847477) b!1274917))

(assert (= (and b!1274917 (not res!847476)) b!1274918))

(assert (= (and start!107860 ((_ is Cons!28603) l!595)) b!1274919))

(declare-fun m!1171403 () Bool)

(assert (=> start!107860 m!1171403))

(declare-fun m!1171405 () Bool)

(assert (=> b!1274918 m!1171405))

(declare-fun m!1171407 () Bool)

(assert (=> b!1274917 m!1171407))

(declare-fun m!1171409 () Bool)

(assert (=> b!1274917 m!1171409))

(assert (=> b!1274917 m!1171409))

(declare-fun m!1171411 () Bool)

(assert (=> b!1274917 m!1171411))

(check-sat (not b!1274919) (not b!1274917) tp_is_empty!33213 (not b!1274918) (not start!107860))
(check-sat)
(get-model)

(declare-fun d!140255 () Bool)

(declare-fun res!847514 () Bool)

(declare-fun e!727697 () Bool)

(assert (=> d!140255 (=> res!847514 e!727697)))

(assert (=> d!140255 (= res!847514 (or ((_ is Nil!28604) lt!575307) ((_ is Nil!28604) (t!42140 lt!575307))))))

(assert (=> d!140255 (= (isStrictlySorted!859 lt!575307) e!727697)))

(declare-fun b!1274971 () Bool)

(declare-fun e!727698 () Bool)

(assert (=> b!1274971 (= e!727697 e!727698)))

(declare-fun res!847515 () Bool)

(assert (=> b!1274971 (=> (not res!847515) (not e!727698))))

(assert (=> b!1274971 (= res!847515 (bvslt (_1!10733 (h!29812 lt!575307)) (_1!10733 (h!29812 (t!42140 lt!575307)))))))

(declare-fun b!1274972 () Bool)

(assert (=> b!1274972 (= e!727698 (isStrictlySorted!859 (t!42140 lt!575307)))))

(assert (= (and d!140255 (not res!847514)) b!1274971))

(assert (= (and b!1274971 res!847515) b!1274972))

(declare-fun m!1171441 () Bool)

(assert (=> b!1274972 m!1171441))

(assert (=> b!1274917 d!140255))

(declare-fun d!140267 () Bool)

(assert (=> d!140267 (= ($colon$colon!665 (removeStrictlySorted!183 (t!42140 l!595) key!173) (h!29812 l!595)) (Cons!28603 (h!29812 l!595) (removeStrictlySorted!183 (t!42140 l!595) key!173)))))

(assert (=> b!1274917 d!140267))

(declare-fun b!1275016 () Bool)

(declare-fun e!727729 () List!28607)

(declare-fun e!727730 () List!28607)

(assert (=> b!1275016 (= e!727729 e!727730)))

(declare-fun c!123908 () Bool)

(assert (=> b!1275016 (= c!123908 (and ((_ is Cons!28603) (t!42140 l!595)) (not (= (_1!10733 (h!29812 (t!42140 l!595))) key!173))))))

(declare-fun d!140269 () Bool)

(declare-fun e!727728 () Bool)

(assert (=> d!140269 e!727728))

(declare-fun res!847529 () Bool)

(assert (=> d!140269 (=> (not res!847529) (not e!727728))))

(declare-fun lt!575319 () List!28607)

(assert (=> d!140269 (= res!847529 (isStrictlySorted!859 lt!575319))))

(assert (=> d!140269 (= lt!575319 e!727729)))

(declare-fun c!123909 () Bool)

(assert (=> d!140269 (= c!123909 (and ((_ is Cons!28603) (t!42140 l!595)) (= (_1!10733 (h!29812 (t!42140 l!595))) key!173)))))

(assert (=> d!140269 (isStrictlySorted!859 (t!42140 l!595))))

(assert (=> d!140269 (= (removeStrictlySorted!183 (t!42140 l!595) key!173) lt!575319)))

(declare-fun b!1275017 () Bool)

(assert (=> b!1275017 (= e!727728 (not (containsKey!704 lt!575319 key!173)))))

(declare-fun b!1275018 () Bool)

(assert (=> b!1275018 (= e!727730 ($colon$colon!665 (removeStrictlySorted!183 (t!42140 (t!42140 l!595)) key!173) (h!29812 (t!42140 l!595))))))

(declare-fun b!1275019 () Bool)

(assert (=> b!1275019 (= e!727729 (t!42140 (t!42140 l!595)))))

(declare-fun b!1275020 () Bool)

(assert (=> b!1275020 (= e!727730 Nil!28604)))

(assert (= (and d!140269 c!123909) b!1275019))

(assert (= (and d!140269 (not c!123909)) b!1275016))

(assert (= (and b!1275016 c!123908) b!1275018))

(assert (= (and b!1275016 (not c!123908)) b!1275020))

(assert (= (and d!140269 res!847529) b!1275017))

(declare-fun m!1171453 () Bool)

(assert (=> d!140269 m!1171453))

(declare-fun m!1171455 () Bool)

(assert (=> d!140269 m!1171455))

(declare-fun m!1171457 () Bool)

(assert (=> b!1275017 m!1171457))

(declare-fun m!1171459 () Bool)

(assert (=> b!1275018 m!1171459))

(assert (=> b!1275018 m!1171459))

(declare-fun m!1171461 () Bool)

(assert (=> b!1275018 m!1171461))

(assert (=> b!1274917 d!140269))

(declare-fun d!140271 () Bool)

(declare-fun res!847530 () Bool)

(declare-fun e!727731 () Bool)

(assert (=> d!140271 (=> res!847530 e!727731)))

(assert (=> d!140271 (= res!847530 (or ((_ is Nil!28604) l!595) ((_ is Nil!28604) (t!42140 l!595))))))

(assert (=> d!140271 (= (isStrictlySorted!859 l!595) e!727731)))

(declare-fun b!1275021 () Bool)

(declare-fun e!727732 () Bool)

(assert (=> b!1275021 (= e!727731 e!727732)))

(declare-fun res!847531 () Bool)

(assert (=> b!1275021 (=> (not res!847531) (not e!727732))))

(assert (=> b!1275021 (= res!847531 (bvslt (_1!10733 (h!29812 l!595)) (_1!10733 (h!29812 (t!42140 l!595)))))))

(declare-fun b!1275022 () Bool)

(assert (=> b!1275022 (= e!727732 (isStrictlySorted!859 (t!42140 l!595)))))

(assert (= (and d!140271 (not res!847530)) b!1275021))

(assert (= (and b!1275021 res!847531) b!1275022))

(assert (=> b!1275022 m!1171455))

(assert (=> start!107860 d!140271))

(declare-fun d!140273 () Bool)

(declare-fun res!847536 () Bool)

(declare-fun e!727737 () Bool)

(assert (=> d!140273 (=> res!847536 e!727737)))

(assert (=> d!140273 (= res!847536 (and ((_ is Cons!28603) lt!575307) (= (_1!10733 (h!29812 lt!575307)) key!173)))))

(assert (=> d!140273 (= (containsKey!704 lt!575307 key!173) e!727737)))

(declare-fun b!1275027 () Bool)

(declare-fun e!727738 () Bool)

(assert (=> b!1275027 (= e!727737 e!727738)))

(declare-fun res!847537 () Bool)

(assert (=> b!1275027 (=> (not res!847537) (not e!727738))))

(assert (=> b!1275027 (= res!847537 (and (or (not ((_ is Cons!28603) lt!575307)) (bvsle (_1!10733 (h!29812 lt!575307)) key!173)) ((_ is Cons!28603) lt!575307) (bvslt (_1!10733 (h!29812 lt!575307)) key!173)))))

(declare-fun b!1275028 () Bool)

(assert (=> b!1275028 (= e!727738 (containsKey!704 (t!42140 lt!575307) key!173))))

(assert (= (and d!140273 (not res!847536)) b!1275027))

(assert (= (and b!1275027 res!847537) b!1275028))

(declare-fun m!1171463 () Bool)

(assert (=> b!1275028 m!1171463))

(assert (=> b!1274918 d!140273))

(declare-fun b!1275033 () Bool)

(declare-fun e!727741 () Bool)

(declare-fun tp!98072 () Bool)

(assert (=> b!1275033 (= e!727741 (and tp_is_empty!33213 tp!98072))))

(assert (=> b!1274919 (= tp!98060 e!727741)))

(assert (= (and b!1274919 ((_ is Cons!28603) (t!42140 l!595))) b!1275033))

(check-sat (not b!1275033) (not b!1274972) tp_is_empty!33213 (not b!1275018) (not d!140269) (not b!1275017) (not b!1275022) (not b!1275028))
(check-sat)
(get-model)

(declare-fun d!140289 () Bool)

(declare-fun res!847549 () Bool)

(declare-fun e!727756 () Bool)

(assert (=> d!140289 (=> res!847549 e!727756)))

(assert (=> d!140289 (= res!847549 (and ((_ is Cons!28603) lt!575319) (= (_1!10733 (h!29812 lt!575319)) key!173)))))

(assert (=> d!140289 (= (containsKey!704 lt!575319 key!173) e!727756)))

(declare-fun b!1275050 () Bool)

(declare-fun e!727757 () Bool)

(assert (=> b!1275050 (= e!727756 e!727757)))

(declare-fun res!847550 () Bool)

(assert (=> b!1275050 (=> (not res!847550) (not e!727757))))

(assert (=> b!1275050 (= res!847550 (and (or (not ((_ is Cons!28603) lt!575319)) (bvsle (_1!10733 (h!29812 lt!575319)) key!173)) ((_ is Cons!28603) lt!575319) (bvslt (_1!10733 (h!29812 lt!575319)) key!173)))))

(declare-fun b!1275051 () Bool)

(assert (=> b!1275051 (= e!727757 (containsKey!704 (t!42140 lt!575319) key!173))))

(assert (= (and d!140289 (not res!847549)) b!1275050))

(assert (= (and b!1275050 res!847550) b!1275051))

(declare-fun m!1171483 () Bool)

(assert (=> b!1275051 m!1171483))

(assert (=> b!1275017 d!140289))

(declare-fun d!140291 () Bool)

(declare-fun res!847551 () Bool)

(declare-fun e!727758 () Bool)

(assert (=> d!140291 (=> res!847551 e!727758)))

(assert (=> d!140291 (= res!847551 (or ((_ is Nil!28604) (t!42140 l!595)) ((_ is Nil!28604) (t!42140 (t!42140 l!595)))))))

(assert (=> d!140291 (= (isStrictlySorted!859 (t!42140 l!595)) e!727758)))

(declare-fun b!1275052 () Bool)

(declare-fun e!727759 () Bool)

(assert (=> b!1275052 (= e!727758 e!727759)))

(declare-fun res!847552 () Bool)

(assert (=> b!1275052 (=> (not res!847552) (not e!727759))))

(assert (=> b!1275052 (= res!847552 (bvslt (_1!10733 (h!29812 (t!42140 l!595))) (_1!10733 (h!29812 (t!42140 (t!42140 l!595))))))))

(declare-fun b!1275053 () Bool)

(assert (=> b!1275053 (= e!727759 (isStrictlySorted!859 (t!42140 (t!42140 l!595))))))

(assert (= (and d!140291 (not res!847551)) b!1275052))

(assert (= (and b!1275052 res!847552) b!1275053))

(declare-fun m!1171485 () Bool)

(assert (=> b!1275053 m!1171485))

(assert (=> b!1275022 d!140291))

(declare-fun d!140293 () Bool)

(declare-fun res!847553 () Bool)

(declare-fun e!727760 () Bool)

(assert (=> d!140293 (=> res!847553 e!727760)))

(assert (=> d!140293 (= res!847553 (or ((_ is Nil!28604) lt!575319) ((_ is Nil!28604) (t!42140 lt!575319))))))

(assert (=> d!140293 (= (isStrictlySorted!859 lt!575319) e!727760)))

(declare-fun b!1275054 () Bool)

(declare-fun e!727761 () Bool)

(assert (=> b!1275054 (= e!727760 e!727761)))

(declare-fun res!847554 () Bool)

(assert (=> b!1275054 (=> (not res!847554) (not e!727761))))

(assert (=> b!1275054 (= res!847554 (bvslt (_1!10733 (h!29812 lt!575319)) (_1!10733 (h!29812 (t!42140 lt!575319)))))))

(declare-fun b!1275055 () Bool)

(assert (=> b!1275055 (= e!727761 (isStrictlySorted!859 (t!42140 lt!575319)))))

(assert (= (and d!140293 (not res!847553)) b!1275054))

(assert (= (and b!1275054 res!847554) b!1275055))

(declare-fun m!1171487 () Bool)

(assert (=> b!1275055 m!1171487))

(assert (=> d!140269 d!140293))

(assert (=> d!140269 d!140291))

(declare-fun d!140295 () Bool)

(assert (=> d!140295 (= ($colon$colon!665 (removeStrictlySorted!183 (t!42140 (t!42140 l!595)) key!173) (h!29812 (t!42140 l!595))) (Cons!28603 (h!29812 (t!42140 l!595)) (removeStrictlySorted!183 (t!42140 (t!42140 l!595)) key!173)))))

(assert (=> b!1275018 d!140295))

(declare-fun b!1275056 () Bool)

(declare-fun e!727763 () List!28607)

(declare-fun e!727764 () List!28607)

(assert (=> b!1275056 (= e!727763 e!727764)))

(declare-fun c!123912 () Bool)

(assert (=> b!1275056 (= c!123912 (and ((_ is Cons!28603) (t!42140 (t!42140 l!595))) (not (= (_1!10733 (h!29812 (t!42140 (t!42140 l!595)))) key!173))))))

(declare-fun d!140297 () Bool)

(declare-fun e!727762 () Bool)

(assert (=> d!140297 e!727762))

(declare-fun res!847555 () Bool)

(assert (=> d!140297 (=> (not res!847555) (not e!727762))))

(declare-fun lt!575321 () List!28607)

(assert (=> d!140297 (= res!847555 (isStrictlySorted!859 lt!575321))))

(assert (=> d!140297 (= lt!575321 e!727763)))

(declare-fun c!123913 () Bool)

(assert (=> d!140297 (= c!123913 (and ((_ is Cons!28603) (t!42140 (t!42140 l!595))) (= (_1!10733 (h!29812 (t!42140 (t!42140 l!595)))) key!173)))))

(assert (=> d!140297 (isStrictlySorted!859 (t!42140 (t!42140 l!595)))))

(assert (=> d!140297 (= (removeStrictlySorted!183 (t!42140 (t!42140 l!595)) key!173) lt!575321)))

(declare-fun b!1275057 () Bool)

(assert (=> b!1275057 (= e!727762 (not (containsKey!704 lt!575321 key!173)))))

(declare-fun b!1275058 () Bool)

(assert (=> b!1275058 (= e!727764 ($colon$colon!665 (removeStrictlySorted!183 (t!42140 (t!42140 (t!42140 l!595))) key!173) (h!29812 (t!42140 (t!42140 l!595)))))))

(declare-fun b!1275059 () Bool)

(assert (=> b!1275059 (= e!727763 (t!42140 (t!42140 (t!42140 l!595))))))

(declare-fun b!1275060 () Bool)

(assert (=> b!1275060 (= e!727764 Nil!28604)))

(assert (= (and d!140297 c!123913) b!1275059))

(assert (= (and d!140297 (not c!123913)) b!1275056))

(assert (= (and b!1275056 c!123912) b!1275058))

(assert (= (and b!1275056 (not c!123912)) b!1275060))

(assert (= (and d!140297 res!847555) b!1275057))

(declare-fun m!1171489 () Bool)

(assert (=> d!140297 m!1171489))

(assert (=> d!140297 m!1171485))

(declare-fun m!1171491 () Bool)

(assert (=> b!1275057 m!1171491))

(declare-fun m!1171493 () Bool)

(assert (=> b!1275058 m!1171493))

(assert (=> b!1275058 m!1171493))

(declare-fun m!1171495 () Bool)

(assert (=> b!1275058 m!1171495))

(assert (=> b!1275018 d!140297))

(declare-fun d!140299 () Bool)

(declare-fun res!847556 () Bool)

(declare-fun e!727765 () Bool)

(assert (=> d!140299 (=> res!847556 e!727765)))

(assert (=> d!140299 (= res!847556 (and ((_ is Cons!28603) (t!42140 lt!575307)) (= (_1!10733 (h!29812 (t!42140 lt!575307))) key!173)))))

(assert (=> d!140299 (= (containsKey!704 (t!42140 lt!575307) key!173) e!727765)))

(declare-fun b!1275061 () Bool)

(declare-fun e!727766 () Bool)

(assert (=> b!1275061 (= e!727765 e!727766)))

(declare-fun res!847557 () Bool)

(assert (=> b!1275061 (=> (not res!847557) (not e!727766))))

(assert (=> b!1275061 (= res!847557 (and (or (not ((_ is Cons!28603) (t!42140 lt!575307))) (bvsle (_1!10733 (h!29812 (t!42140 lt!575307))) key!173)) ((_ is Cons!28603) (t!42140 lt!575307)) (bvslt (_1!10733 (h!29812 (t!42140 lt!575307))) key!173)))))

(declare-fun b!1275062 () Bool)

(assert (=> b!1275062 (= e!727766 (containsKey!704 (t!42140 (t!42140 lt!575307)) key!173))))

(assert (= (and d!140299 (not res!847556)) b!1275061))

(assert (= (and b!1275061 res!847557) b!1275062))

(declare-fun m!1171497 () Bool)

(assert (=> b!1275062 m!1171497))

(assert (=> b!1275028 d!140299))

(declare-fun d!140301 () Bool)

(declare-fun res!847558 () Bool)

(declare-fun e!727767 () Bool)

(assert (=> d!140301 (=> res!847558 e!727767)))

(assert (=> d!140301 (= res!847558 (or ((_ is Nil!28604) (t!42140 lt!575307)) ((_ is Nil!28604) (t!42140 (t!42140 lt!575307)))))))

(assert (=> d!140301 (= (isStrictlySorted!859 (t!42140 lt!575307)) e!727767)))

(declare-fun b!1275063 () Bool)

(declare-fun e!727768 () Bool)

(assert (=> b!1275063 (= e!727767 e!727768)))

(declare-fun res!847559 () Bool)

(assert (=> b!1275063 (=> (not res!847559) (not e!727768))))

(assert (=> b!1275063 (= res!847559 (bvslt (_1!10733 (h!29812 (t!42140 lt!575307))) (_1!10733 (h!29812 (t!42140 (t!42140 lt!575307))))))))

(declare-fun b!1275064 () Bool)

(assert (=> b!1275064 (= e!727768 (isStrictlySorted!859 (t!42140 (t!42140 lt!575307))))))

(assert (= (and d!140301 (not res!847558)) b!1275063))

(assert (= (and b!1275063 res!847559) b!1275064))

(declare-fun m!1171499 () Bool)

(assert (=> b!1275064 m!1171499))

(assert (=> b!1274972 d!140301))

(declare-fun b!1275065 () Bool)

(declare-fun e!727769 () Bool)

(declare-fun tp!98074 () Bool)

(assert (=> b!1275065 (= e!727769 (and tp_is_empty!33213 tp!98074))))

(assert (=> b!1275033 (= tp!98072 e!727769)))

(assert (= (and b!1275033 ((_ is Cons!28603) (t!42140 (t!42140 l!595)))) b!1275065))

(check-sat (not d!140297) (not b!1275058) (not b!1275065) tp_is_empty!33213 (not b!1275051) (not b!1275055) (not b!1275062) (not b!1275057) (not b!1275064) (not b!1275053))
(check-sat)
