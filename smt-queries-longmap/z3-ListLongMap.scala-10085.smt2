; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118856 () Bool)

(assert start!118856)

(declare-fun res!928705 () Bool)

(declare-fun e!786562 () Bool)

(assert (=> start!118856 (=> (not res!928705) (not e!786562))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118856 (= res!928705 (validMask!0 mask!2987))))

(assert (=> start!118856 e!786562))

(assert (=> start!118856 true))

(declare-datatypes ((array!95030 0))(
  ( (array!95031 (arr!45889 (Array (_ BitVec 32) (_ BitVec 64))) (size!46440 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!95030)

(declare-fun array_inv!35170 (array!95030) Bool)

(assert (=> start!118856 (array_inv!35170 a!2938)))

(declare-fun b!1388439 () Bool)

(declare-fun res!928701 () Bool)

(assert (=> b!1388439 (=> (not res!928701) (not e!786562))))

(declare-datatypes ((List!32404 0))(
  ( (Nil!32401) (Cons!32400 (h!33618 (_ BitVec 64)) (t!47090 List!32404)) )
))
(declare-fun arrayNoDuplicates!0 (array!95030 (_ BitVec 32) List!32404) Bool)

(assert (=> b!1388439 (= res!928701 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32401))))

(declare-fun b!1388440 () Bool)

(declare-datatypes ((Unit!46320 0))(
  ( (Unit!46321) )
))
(declare-fun e!786560 () Unit!46320)

(declare-fun Unit!46322 () Unit!46320)

(assert (=> b!1388440 (= e!786560 Unit!46322)))

(declare-fun lt!610194 () array!95030)

(declare-fun e!786561 () Bool)

(declare-fun b!1388441 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95030 (_ BitVec 32)) Bool)

(assert (=> b!1388441 (= e!786561 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!610194 mask!2987)))))

(assert (=> b!1388441 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!610194 mask!2987)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!610193 () Unit!46320)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!95030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46320)

(assert (=> b!1388441 (= lt!610193 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1388442 () Bool)

(declare-fun e!786558 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388442 (= e!786558 (validKeyInArray!0 (select (arr!45889 a!2938) startIndex!16)))))

(declare-fun b!1388443 () Bool)

(declare-fun res!928700 () Bool)

(assert (=> b!1388443 (=> (not res!928700) (not e!786562))))

(assert (=> b!1388443 (= res!928700 (and (not (= (select (arr!45889 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45889 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1388444 () Bool)

(declare-fun res!928699 () Bool)

(assert (=> b!1388444 (=> (not res!928699) (not e!786562))))

(assert (=> b!1388444 (= res!928699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1388445 () Bool)

(declare-fun lt!610196 () Unit!46320)

(assert (=> b!1388445 (= e!786560 lt!610196)))

(declare-fun lt!610195 () Unit!46320)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!95030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46320)

(assert (=> b!1388445 (= lt!610195 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10136 0))(
  ( (MissingZero!10136 (index!42915 (_ BitVec 32))) (Found!10136 (index!42916 (_ BitVec 32))) (Intermediate!10136 (undefined!10948 Bool) (index!42917 (_ BitVec 32)) (x!124679 (_ BitVec 32))) (Undefined!10136) (MissingVacant!10136 (index!42918 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95030 (_ BitVec 32)) SeekEntryResult!10136)

(assert (=> b!1388445 (= (seekEntryOrOpen!0 (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610194 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46320)

(assert (=> b!1388445 (= lt!610196 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1388445 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1388446 () Bool)

(declare-fun res!928698 () Bool)

(assert (=> b!1388446 (=> (not res!928698) (not e!786562))))

(assert (=> b!1388446 (= res!928698 (and (= (size!46440 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46440 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46440 a!2938))))))

(declare-fun b!1388447 () Bool)

(declare-fun res!928704 () Bool)

(assert (=> b!1388447 (=> (not res!928704) (not e!786562))))

(assert (=> b!1388447 (= res!928704 (validKeyInArray!0 (select (arr!45889 a!2938) i!1065)))))

(declare-fun b!1388448 () Bool)

(assert (=> b!1388448 (= e!786562 e!786561)))

(declare-fun res!928703 () Bool)

(assert (=> b!1388448 (=> (not res!928703) (not e!786561))))

(assert (=> b!1388448 (= res!928703 (and (bvslt startIndex!16 (bvsub (size!46440 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!610197 () Unit!46320)

(assert (=> b!1388448 (= lt!610197 e!786560)))

(declare-fun c!129318 () Bool)

(assert (=> b!1388448 (= c!129318 e!786558)))

(declare-fun res!928702 () Bool)

(assert (=> b!1388448 (=> (not res!928702) (not e!786558))))

(assert (=> b!1388448 (= res!928702 (not (= startIndex!16 i!1065)))))

(assert (=> b!1388448 (= lt!610194 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)))))

(assert (= (and start!118856 res!928705) b!1388446))

(assert (= (and b!1388446 res!928698) b!1388447))

(assert (= (and b!1388447 res!928704) b!1388439))

(assert (= (and b!1388439 res!928701) b!1388444))

(assert (= (and b!1388444 res!928699) b!1388443))

(assert (= (and b!1388443 res!928700) b!1388448))

(assert (= (and b!1388448 res!928702) b!1388442))

(assert (= (and b!1388448 c!129318) b!1388445))

(assert (= (and b!1388448 (not c!129318)) b!1388440))

(assert (= (and b!1388448 res!928703) b!1388441))

(declare-fun m!1274205 () Bool)

(assert (=> b!1388447 m!1274205))

(assert (=> b!1388447 m!1274205))

(declare-fun m!1274207 () Bool)

(assert (=> b!1388447 m!1274207))

(declare-fun m!1274209 () Bool)

(assert (=> b!1388444 m!1274209))

(declare-fun m!1274211 () Bool)

(assert (=> start!118856 m!1274211))

(declare-fun m!1274213 () Bool)

(assert (=> start!118856 m!1274213))

(declare-fun m!1274215 () Bool)

(assert (=> b!1388442 m!1274215))

(assert (=> b!1388442 m!1274215))

(declare-fun m!1274217 () Bool)

(assert (=> b!1388442 m!1274217))

(declare-fun m!1274219 () Bool)

(assert (=> b!1388448 m!1274219))

(declare-fun m!1274221 () Bool)

(assert (=> b!1388439 m!1274221))

(declare-fun m!1274223 () Bool)

(assert (=> b!1388441 m!1274223))

(declare-fun m!1274225 () Bool)

(assert (=> b!1388441 m!1274225))

(declare-fun m!1274227 () Bool)

(assert (=> b!1388441 m!1274227))

(declare-fun m!1274229 () Bool)

(assert (=> b!1388445 m!1274229))

(declare-fun m!1274231 () Bool)

(assert (=> b!1388445 m!1274231))

(assert (=> b!1388445 m!1274219))

(declare-fun m!1274233 () Bool)

(assert (=> b!1388445 m!1274233))

(assert (=> b!1388445 m!1274231))

(declare-fun m!1274235 () Bool)

(assert (=> b!1388445 m!1274235))

(assert (=> b!1388445 m!1274215))

(declare-fun m!1274237 () Bool)

(assert (=> b!1388445 m!1274237))

(assert (=> b!1388445 m!1274215))

(declare-fun m!1274239 () Bool)

(assert (=> b!1388445 m!1274239))

(assert (=> b!1388443 m!1274205))

(check-sat (not b!1388441) (not b!1388447) (not start!118856) (not b!1388442) (not b!1388445) (not b!1388439) (not b!1388444))
(check-sat)
(get-model)

(declare-fun d!149891 () Bool)

(assert (=> d!149891 (= (validKeyInArray!0 (select (arr!45889 a!2938) startIndex!16)) (and (not (= (select (arr!45889 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45889 a!2938) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388442 d!149891))

(declare-fun d!149893 () Bool)

(assert (=> d!149893 (= (validKeyInArray!0 (select (arr!45889 a!2938) i!1065)) (and (not (= (select (arr!45889 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45889 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388447 d!149893))

(declare-fun bm!66620 () Bool)

(declare-fun call!66623 () Bool)

(assert (=> bm!66620 (= call!66623 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1388517 () Bool)

(declare-fun e!786600 () Bool)

(declare-fun e!786601 () Bool)

(assert (=> b!1388517 (= e!786600 e!786601)))

(declare-fun lt!610234 () (_ BitVec 64))

(assert (=> b!1388517 (= lt!610234 (select (arr!45889 a!2938) #b00000000000000000000000000000000))))

(declare-fun lt!610235 () Unit!46320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95030 (_ BitVec 64) (_ BitVec 32)) Unit!46320)

(assert (=> b!1388517 (= lt!610235 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610234 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388517 (arrayContainsKey!0 a!2938 lt!610234 #b00000000000000000000000000000000)))

(declare-fun lt!610236 () Unit!46320)

(assert (=> b!1388517 (= lt!610236 lt!610235)))

(declare-fun res!928758 () Bool)

(assert (=> b!1388517 (= res!928758 (= (seekEntryOrOpen!0 (select (arr!45889 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10136 #b00000000000000000000000000000000)))))

(assert (=> b!1388517 (=> (not res!928758) (not e!786601))))

(declare-fun b!1388518 () Bool)

(assert (=> b!1388518 (= e!786600 call!66623)))

(declare-fun b!1388520 () Bool)

(declare-fun e!786599 () Bool)

(assert (=> b!1388520 (= e!786599 e!786600)))

(declare-fun c!129327 () Bool)

(assert (=> b!1388520 (= c!129327 (validKeyInArray!0 (select (arr!45889 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388519 () Bool)

(assert (=> b!1388519 (= e!786601 call!66623)))

(declare-fun d!149895 () Bool)

(declare-fun res!928759 () Bool)

(assert (=> d!149895 (=> res!928759 e!786599)))

(assert (=> d!149895 (= res!928759 (bvsge #b00000000000000000000000000000000 (size!46440 a!2938)))))

(assert (=> d!149895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!786599)))

(assert (= (and d!149895 (not res!928759)) b!1388520))

(assert (= (and b!1388520 c!129327) b!1388517))

(assert (= (and b!1388520 (not c!129327)) b!1388518))

(assert (= (and b!1388517 res!928758) b!1388519))

(assert (= (or b!1388519 b!1388518) bm!66620))

(declare-fun m!1274313 () Bool)

(assert (=> bm!66620 m!1274313))

(declare-fun m!1274315 () Bool)

(assert (=> b!1388517 m!1274315))

(declare-fun m!1274317 () Bool)

(assert (=> b!1388517 m!1274317))

(declare-fun m!1274319 () Bool)

(assert (=> b!1388517 m!1274319))

(assert (=> b!1388517 m!1274315))

(declare-fun m!1274321 () Bool)

(assert (=> b!1388517 m!1274321))

(assert (=> b!1388520 m!1274315))

(assert (=> b!1388520 m!1274315))

(declare-fun m!1274323 () Bool)

(assert (=> b!1388520 m!1274323))

(assert (=> b!1388444 d!149895))

(declare-fun b!1388531 () Bool)

(declare-fun e!786611 () Bool)

(declare-fun e!786610 () Bool)

(assert (=> b!1388531 (= e!786611 e!786610)))

(declare-fun c!129330 () Bool)

(assert (=> b!1388531 (= c!129330 (validKeyInArray!0 (select (arr!45889 a!2938) #b00000000000000000000000000000000)))))

(declare-fun bm!66623 () Bool)

(declare-fun call!66626 () Bool)

(assert (=> bm!66623 (= call!66626 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129330 (Cons!32400 (select (arr!45889 a!2938) #b00000000000000000000000000000000) Nil!32401) Nil!32401)))))

(declare-fun b!1388532 () Bool)

(declare-fun e!786613 () Bool)

(declare-fun contains!9787 (List!32404 (_ BitVec 64)) Bool)

(assert (=> b!1388532 (= e!786613 (contains!9787 Nil!32401 (select (arr!45889 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388533 () Bool)

(assert (=> b!1388533 (= e!786610 call!66626)))

(declare-fun b!1388534 () Bool)

(declare-fun e!786612 () Bool)

(assert (=> b!1388534 (= e!786612 e!786611)))

(declare-fun res!928767 () Bool)

(assert (=> b!1388534 (=> (not res!928767) (not e!786611))))

(assert (=> b!1388534 (= res!928767 (not e!786613))))

(declare-fun res!928766 () Bool)

(assert (=> b!1388534 (=> (not res!928766) (not e!786613))))

(assert (=> b!1388534 (= res!928766 (validKeyInArray!0 (select (arr!45889 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388535 () Bool)

(assert (=> b!1388535 (= e!786610 call!66626)))

(declare-fun d!149897 () Bool)

(declare-fun res!928768 () Bool)

(assert (=> d!149897 (=> res!928768 e!786612)))

(assert (=> d!149897 (= res!928768 (bvsge #b00000000000000000000000000000000 (size!46440 a!2938)))))

(assert (=> d!149897 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32401) e!786612)))

(assert (= (and d!149897 (not res!928768)) b!1388534))

(assert (= (and b!1388534 res!928766) b!1388532))

(assert (= (and b!1388534 res!928767) b!1388531))

(assert (= (and b!1388531 c!129330) b!1388535))

(assert (= (and b!1388531 (not c!129330)) b!1388533))

(assert (= (or b!1388535 b!1388533) bm!66623))

(assert (=> b!1388531 m!1274315))

(assert (=> b!1388531 m!1274315))

(assert (=> b!1388531 m!1274323))

(assert (=> bm!66623 m!1274315))

(declare-fun m!1274325 () Bool)

(assert (=> bm!66623 m!1274325))

(assert (=> b!1388532 m!1274315))

(assert (=> b!1388532 m!1274315))

(declare-fun m!1274327 () Bool)

(assert (=> b!1388532 m!1274327))

(assert (=> b!1388534 m!1274315))

(assert (=> b!1388534 m!1274315))

(assert (=> b!1388534 m!1274323))

(assert (=> b!1388439 d!149897))

(declare-fun d!149899 () Bool)

(assert (=> d!149899 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun lt!610239 () Unit!46320)

(declare-fun choose!38 (array!95030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46320)

(assert (=> d!149899 (= lt!610239 (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> d!149899 (validMask!0 mask!2987)))

(assert (=> d!149899 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) lt!610239)))

(declare-fun bs!40327 () Bool)

(assert (= bs!40327 d!149899))

(assert (=> bs!40327 m!1274239))

(declare-fun m!1274329 () Bool)

(assert (=> bs!40327 m!1274329))

(assert (=> bs!40327 m!1274211))

(assert (=> b!1388445 d!149899))

(declare-fun call!66627 () Bool)

(declare-fun bm!66624 () Bool)

(assert (=> bm!66624 (= call!66627 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1388536 () Bool)

(declare-fun e!786615 () Bool)

(declare-fun e!786616 () Bool)

(assert (=> b!1388536 (= e!786615 e!786616)))

(declare-fun lt!610240 () (_ BitVec 64))

(assert (=> b!1388536 (= lt!610240 (select (arr!45889 a!2938) startIndex!16))))

(declare-fun lt!610241 () Unit!46320)

(assert (=> b!1388536 (= lt!610241 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610240 startIndex!16))))

(assert (=> b!1388536 (arrayContainsKey!0 a!2938 lt!610240 #b00000000000000000000000000000000)))

(declare-fun lt!610242 () Unit!46320)

(assert (=> b!1388536 (= lt!610242 lt!610241)))

(declare-fun res!928769 () Bool)

(assert (=> b!1388536 (= res!928769 (= (seekEntryOrOpen!0 (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987) (Found!10136 startIndex!16)))))

(assert (=> b!1388536 (=> (not res!928769) (not e!786616))))

(declare-fun b!1388537 () Bool)

(assert (=> b!1388537 (= e!786615 call!66627)))

(declare-fun b!1388539 () Bool)

(declare-fun e!786614 () Bool)

(assert (=> b!1388539 (= e!786614 e!786615)))

(declare-fun c!129331 () Bool)

(assert (=> b!1388539 (= c!129331 (validKeyInArray!0 (select (arr!45889 a!2938) startIndex!16)))))

(declare-fun b!1388538 () Bool)

(assert (=> b!1388538 (= e!786616 call!66627)))

(declare-fun d!149901 () Bool)

(declare-fun res!928770 () Bool)

(assert (=> d!149901 (=> res!928770 e!786614)))

(assert (=> d!149901 (= res!928770 (bvsge startIndex!16 (size!46440 a!2938)))))

(assert (=> d!149901 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987) e!786614)))

(assert (= (and d!149901 (not res!928770)) b!1388539))

(assert (= (and b!1388539 c!129331) b!1388536))

(assert (= (and b!1388539 (not c!129331)) b!1388537))

(assert (= (and b!1388536 res!928769) b!1388538))

(assert (= (or b!1388538 b!1388537) bm!66624))

(declare-fun m!1274331 () Bool)

(assert (=> bm!66624 m!1274331))

(assert (=> b!1388536 m!1274215))

(declare-fun m!1274333 () Bool)

(assert (=> b!1388536 m!1274333))

(declare-fun m!1274335 () Bool)

(assert (=> b!1388536 m!1274335))

(assert (=> b!1388536 m!1274215))

(assert (=> b!1388536 m!1274237))

(assert (=> b!1388539 m!1274215))

(assert (=> b!1388539 m!1274215))

(assert (=> b!1388539 m!1274217))

(assert (=> b!1388445 d!149901))

(declare-fun d!149903 () Bool)

(declare-fun e!786619 () Bool)

(assert (=> d!149903 e!786619))

(declare-fun res!928773 () Bool)

(assert (=> d!149903 (=> (not res!928773) (not e!786619))))

(assert (=> d!149903 (= res!928773 (and (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46440 a!2938)) (and (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46440 a!2938)))) (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46440 a!2938)) (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46440 a!2938)))) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46440 a!2938))))))

(declare-fun lt!610245 () Unit!46320)

(declare-fun choose!14 (array!95030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46320)

(assert (=> d!149903 (= lt!610245 (choose!14 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (=> d!149903 (validMask!0 mask!2987)))

(assert (=> d!149903 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987) lt!610245)))

(declare-fun b!1388542 () Bool)

(assert (=> b!1388542 (= e!786619 (= (seekEntryOrOpen!0 (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) mask!2987)))))

(assert (= (and d!149903 res!928773) b!1388542))

(declare-fun m!1274337 () Bool)

(assert (=> d!149903 m!1274337))

(assert (=> d!149903 m!1274211))

(assert (=> b!1388542 m!1274215))

(assert (=> b!1388542 m!1274237))

(assert (=> b!1388542 m!1274231))

(assert (=> b!1388542 m!1274231))

(declare-fun m!1274339 () Bool)

(assert (=> b!1388542 m!1274339))

(assert (=> b!1388542 m!1274219))

(assert (=> b!1388542 m!1274215))

(assert (=> b!1388445 d!149903))

(declare-fun b!1388579 () Bool)

(declare-fun e!786646 () SeekEntryResult!10136)

(declare-fun e!786644 () SeekEntryResult!10136)

(assert (=> b!1388579 (= e!786646 e!786644)))

(declare-fun lt!610277 () (_ BitVec 64))

(declare-fun lt!610278 () SeekEntryResult!10136)

(assert (=> b!1388579 (= lt!610277 (select (arr!45889 a!2938) (index!42917 lt!610278)))))

(declare-fun c!129345 () Bool)

(assert (=> b!1388579 (= c!129345 (= lt!610277 (select (arr!45889 a!2938) startIndex!16)))))

(declare-fun b!1388581 () Bool)

(declare-fun e!786645 () SeekEntryResult!10136)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95030 (_ BitVec 32)) SeekEntryResult!10136)

(assert (=> b!1388581 (= e!786645 (seekKeyOrZeroReturnVacant!0 (x!124679 lt!610278) (index!42917 lt!610278) (index!42917 lt!610278) (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388582 () Bool)

(declare-fun c!129346 () Bool)

(assert (=> b!1388582 (= c!129346 (= lt!610277 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388582 (= e!786644 e!786645)))

(declare-fun b!1388583 () Bool)

(assert (=> b!1388583 (= e!786645 (MissingZero!10136 (index!42917 lt!610278)))))

(declare-fun b!1388584 () Bool)

(assert (=> b!1388584 (= e!786644 (Found!10136 (index!42917 lt!610278)))))

(declare-fun d!149909 () Bool)

(declare-fun lt!610276 () SeekEntryResult!10136)

(get-info :version)

(assert (=> d!149909 (and (or ((_ is Undefined!10136) lt!610276) (not ((_ is Found!10136) lt!610276)) (and (bvsge (index!42916 lt!610276) #b00000000000000000000000000000000) (bvslt (index!42916 lt!610276) (size!46440 a!2938)))) (or ((_ is Undefined!10136) lt!610276) ((_ is Found!10136) lt!610276) (not ((_ is MissingZero!10136) lt!610276)) (and (bvsge (index!42915 lt!610276) #b00000000000000000000000000000000) (bvslt (index!42915 lt!610276) (size!46440 a!2938)))) (or ((_ is Undefined!10136) lt!610276) ((_ is Found!10136) lt!610276) ((_ is MissingZero!10136) lt!610276) (not ((_ is MissingVacant!10136) lt!610276)) (and (bvsge (index!42918 lt!610276) #b00000000000000000000000000000000) (bvslt (index!42918 lt!610276) (size!46440 a!2938)))) (or ((_ is Undefined!10136) lt!610276) (ite ((_ is Found!10136) lt!610276) (= (select (arr!45889 a!2938) (index!42916 lt!610276)) (select (arr!45889 a!2938) startIndex!16)) (ite ((_ is MissingZero!10136) lt!610276) (= (select (arr!45889 a!2938) (index!42915 lt!610276)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10136) lt!610276) (= (select (arr!45889 a!2938) (index!42918 lt!610276)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149909 (= lt!610276 e!786646)))

(declare-fun c!129344 () Bool)

(assert (=> d!149909 (= c!129344 (and ((_ is Intermediate!10136) lt!610278) (undefined!10948 lt!610278)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95030 (_ BitVec 32)) SeekEntryResult!10136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!149909 (= lt!610278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45889 a!2938) startIndex!16) mask!2987) (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (=> d!149909 (validMask!0 mask!2987)))

(assert (=> d!149909 (= (seekEntryOrOpen!0 (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987) lt!610276)))

(declare-fun b!1388580 () Bool)

(assert (=> b!1388580 (= e!786646 Undefined!10136)))

(assert (= (and d!149909 c!129344) b!1388580))

(assert (= (and d!149909 (not c!129344)) b!1388579))

(assert (= (and b!1388579 c!129345) b!1388584))

(assert (= (and b!1388579 (not c!129345)) b!1388582))

(assert (= (and b!1388582 c!129346) b!1388583))

(assert (= (and b!1388582 (not c!129346)) b!1388581))

(declare-fun m!1274357 () Bool)

(assert (=> b!1388579 m!1274357))

(assert (=> b!1388581 m!1274215))

(declare-fun m!1274359 () Bool)

(assert (=> b!1388581 m!1274359))

(declare-fun m!1274361 () Bool)

(assert (=> d!149909 m!1274361))

(declare-fun m!1274363 () Bool)

(assert (=> d!149909 m!1274363))

(assert (=> d!149909 m!1274215))

(declare-fun m!1274365 () Bool)

(assert (=> d!149909 m!1274365))

(assert (=> d!149909 m!1274211))

(assert (=> d!149909 m!1274215))

(assert (=> d!149909 m!1274363))

(declare-fun m!1274367 () Bool)

(assert (=> d!149909 m!1274367))

(declare-fun m!1274369 () Bool)

(assert (=> d!149909 m!1274369))

(assert (=> b!1388445 d!149909))

(declare-fun b!1388585 () Bool)

(declare-fun e!786649 () SeekEntryResult!10136)

(declare-fun e!786647 () SeekEntryResult!10136)

(assert (=> b!1388585 (= e!786649 e!786647)))

(declare-fun lt!610280 () (_ BitVec 64))

(declare-fun lt!610281 () SeekEntryResult!10136)

(assert (=> b!1388585 (= lt!610280 (select (arr!45889 lt!610194) (index!42917 lt!610281)))))

(declare-fun c!129348 () Bool)

(assert (=> b!1388585 (= c!129348 (= lt!610280 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1388587 () Bool)

(declare-fun e!786648 () SeekEntryResult!10136)

(assert (=> b!1388587 (= e!786648 (seekKeyOrZeroReturnVacant!0 (x!124679 lt!610281) (index!42917 lt!610281) (index!42917 lt!610281) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610194 mask!2987))))

(declare-fun b!1388588 () Bool)

(declare-fun c!129349 () Bool)

(assert (=> b!1388588 (= c!129349 (= lt!610280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388588 (= e!786647 e!786648)))

(declare-fun b!1388589 () Bool)

(assert (=> b!1388589 (= e!786648 (MissingZero!10136 (index!42917 lt!610281)))))

(declare-fun b!1388590 () Bool)

(assert (=> b!1388590 (= e!786647 (Found!10136 (index!42917 lt!610281)))))

(declare-fun d!149927 () Bool)

(declare-fun lt!610279 () SeekEntryResult!10136)

(assert (=> d!149927 (and (or ((_ is Undefined!10136) lt!610279) (not ((_ is Found!10136) lt!610279)) (and (bvsge (index!42916 lt!610279) #b00000000000000000000000000000000) (bvslt (index!42916 lt!610279) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610279) ((_ is Found!10136) lt!610279) (not ((_ is MissingZero!10136) lt!610279)) (and (bvsge (index!42915 lt!610279) #b00000000000000000000000000000000) (bvslt (index!42915 lt!610279) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610279) ((_ is Found!10136) lt!610279) ((_ is MissingZero!10136) lt!610279) (not ((_ is MissingVacant!10136) lt!610279)) (and (bvsge (index!42918 lt!610279) #b00000000000000000000000000000000) (bvslt (index!42918 lt!610279) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610279) (ite ((_ is Found!10136) lt!610279) (= (select (arr!45889 lt!610194) (index!42916 lt!610279)) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10136) lt!610279) (= (select (arr!45889 lt!610194) (index!42915 lt!610279)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10136) lt!610279) (= (select (arr!45889 lt!610194) (index!42918 lt!610279)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149927 (= lt!610279 e!786649)))

(declare-fun c!129347 () Bool)

(assert (=> d!149927 (= c!129347 (and ((_ is Intermediate!10136) lt!610281) (undefined!10948 lt!610281)))))

(assert (=> d!149927 (= lt!610281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610194 mask!2987))))

(assert (=> d!149927 (validMask!0 mask!2987)))

(assert (=> d!149927 (= (seekEntryOrOpen!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610194 mask!2987) lt!610279)))

(declare-fun b!1388586 () Bool)

(assert (=> b!1388586 (= e!786649 Undefined!10136)))

(assert (= (and d!149927 c!129347) b!1388586))

(assert (= (and d!149927 (not c!129347)) b!1388585))

(assert (= (and b!1388585 c!129348) b!1388590))

(assert (= (and b!1388585 (not c!129348)) b!1388588))

(assert (= (and b!1388588 c!129349) b!1388589))

(assert (= (and b!1388588 (not c!129349)) b!1388587))

(declare-fun m!1274371 () Bool)

(assert (=> b!1388585 m!1274371))

(assert (=> b!1388587 m!1274231))

(declare-fun m!1274373 () Bool)

(assert (=> b!1388587 m!1274373))

(declare-fun m!1274375 () Bool)

(assert (=> d!149927 m!1274375))

(declare-fun m!1274377 () Bool)

(assert (=> d!149927 m!1274377))

(assert (=> d!149927 m!1274231))

(declare-fun m!1274379 () Bool)

(assert (=> d!149927 m!1274379))

(assert (=> d!149927 m!1274211))

(assert (=> d!149927 m!1274231))

(assert (=> d!149927 m!1274377))

(declare-fun m!1274381 () Bool)

(assert (=> d!149927 m!1274381))

(declare-fun m!1274383 () Bool)

(assert (=> d!149927 m!1274383))

(assert (=> b!1388445 d!149927))

(declare-fun d!149929 () Bool)

(assert (=> d!149929 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118856 d!149929))

(declare-fun d!149931 () Bool)

(assert (=> d!149931 (= (array_inv!35170 a!2938) (bvsge (size!46440 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118856 d!149931))

(declare-fun bm!66631 () Bool)

(declare-fun call!66634 () Bool)

(assert (=> bm!66631 (= call!66634 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!610194 mask!2987))))

(declare-fun b!1388595 () Bool)

(declare-fun e!786655 () Bool)

(declare-fun e!786656 () Bool)

(assert (=> b!1388595 (= e!786655 e!786656)))

(declare-fun lt!610286 () (_ BitVec 64))

(assert (=> b!1388595 (= lt!610286 (select (arr!45889 lt!610194) startIndex!16))))

(declare-fun lt!610287 () Unit!46320)

(assert (=> b!1388595 (= lt!610287 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610194 lt!610286 startIndex!16))))

(assert (=> b!1388595 (arrayContainsKey!0 lt!610194 lt!610286 #b00000000000000000000000000000000)))

(declare-fun lt!610288 () Unit!46320)

(assert (=> b!1388595 (= lt!610288 lt!610287)))

(declare-fun res!928790 () Bool)

(assert (=> b!1388595 (= res!928790 (= (seekEntryOrOpen!0 (select (arr!45889 lt!610194) startIndex!16) lt!610194 mask!2987) (Found!10136 startIndex!16)))))

(assert (=> b!1388595 (=> (not res!928790) (not e!786656))))

(declare-fun b!1388596 () Bool)

(assert (=> b!1388596 (= e!786655 call!66634)))

(declare-fun b!1388598 () Bool)

(declare-fun e!786654 () Bool)

(assert (=> b!1388598 (= e!786654 e!786655)))

(declare-fun c!129350 () Bool)

(assert (=> b!1388598 (= c!129350 (validKeyInArray!0 (select (arr!45889 lt!610194) startIndex!16)))))

(declare-fun b!1388597 () Bool)

(assert (=> b!1388597 (= e!786656 call!66634)))

(declare-fun d!149933 () Bool)

(declare-fun res!928791 () Bool)

(assert (=> d!149933 (=> res!928791 e!786654)))

(assert (=> d!149933 (= res!928791 (bvsge startIndex!16 (size!46440 lt!610194)))))

(assert (=> d!149933 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!610194 mask!2987) e!786654)))

(assert (= (and d!149933 (not res!928791)) b!1388598))

(assert (= (and b!1388598 c!129350) b!1388595))

(assert (= (and b!1388598 (not c!129350)) b!1388596))

(assert (= (and b!1388595 res!928790) b!1388597))

(assert (= (or b!1388597 b!1388596) bm!66631))

(declare-fun m!1274385 () Bool)

(assert (=> bm!66631 m!1274385))

(declare-fun m!1274387 () Bool)

(assert (=> b!1388595 m!1274387))

(declare-fun m!1274393 () Bool)

(assert (=> b!1388595 m!1274393))

(declare-fun m!1274395 () Bool)

(assert (=> b!1388595 m!1274395))

(assert (=> b!1388595 m!1274387))

(declare-fun m!1274397 () Bool)

(assert (=> b!1388595 m!1274397))

(assert (=> b!1388598 m!1274387))

(assert (=> b!1388598 m!1274387))

(declare-fun m!1274403 () Bool)

(assert (=> b!1388598 m!1274403))

(assert (=> b!1388441 d!149933))

(declare-fun call!66635 () Bool)

(declare-fun bm!66632 () Bool)

(assert (=> bm!66632 (= call!66635 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) lt!610194 mask!2987))))

(declare-fun b!1388601 () Bool)

(declare-fun e!786660 () Bool)

(declare-fun e!786661 () Bool)

(assert (=> b!1388601 (= e!786660 e!786661)))

(declare-fun lt!610291 () (_ BitVec 64))

(assert (=> b!1388601 (= lt!610291 (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(declare-fun lt!610292 () Unit!46320)

(assert (=> b!1388601 (= lt!610292 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610194 lt!610291 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> b!1388601 (arrayContainsKey!0 lt!610194 lt!610291 #b00000000000000000000000000000000)))

(declare-fun lt!610293 () Unit!46320)

(assert (=> b!1388601 (= lt!610293 lt!610292)))

(declare-fun res!928794 () Bool)

(assert (=> b!1388601 (= res!928794 (= (seekEntryOrOpen!0 (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!610194 mask!2987) (Found!10136 (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(assert (=> b!1388601 (=> (not res!928794) (not e!786661))))

(declare-fun b!1388602 () Bool)

(assert (=> b!1388602 (= e!786660 call!66635)))

(declare-fun b!1388604 () Bool)

(declare-fun e!786659 () Bool)

(assert (=> b!1388604 (= e!786659 e!786660)))

(declare-fun c!129351 () Bool)

(assert (=> b!1388604 (= c!129351 (validKeyInArray!0 (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1388603 () Bool)

(assert (=> b!1388603 (= e!786661 call!66635)))

(declare-fun d!149935 () Bool)

(declare-fun res!928795 () Bool)

(assert (=> d!149935 (=> res!928795 e!786659)))

(assert (=> d!149935 (= res!928795 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) (size!46440 lt!610194)))))

(assert (=> d!149935 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!610194 mask!2987) e!786659)))

(assert (= (and d!149935 (not res!928795)) b!1388604))

(assert (= (and b!1388604 c!129351) b!1388601))

(assert (= (and b!1388604 (not c!129351)) b!1388602))

(assert (= (and b!1388601 res!928794) b!1388603))

(assert (= (or b!1388603 b!1388602) bm!66632))

(declare-fun m!1274405 () Bool)

(assert (=> bm!66632 m!1274405))

(declare-fun m!1274407 () Bool)

(assert (=> b!1388601 m!1274407))

(declare-fun m!1274409 () Bool)

(assert (=> b!1388601 m!1274409))

(declare-fun m!1274411 () Bool)

(assert (=> b!1388601 m!1274411))

(assert (=> b!1388601 m!1274407))

(declare-fun m!1274413 () Bool)

(assert (=> b!1388601 m!1274413))

(assert (=> b!1388604 m!1274407))

(assert (=> b!1388604 m!1274407))

(declare-fun m!1274415 () Bool)

(assert (=> b!1388604 m!1274415))

(assert (=> b!1388441 d!149935))

(declare-fun d!149941 () Bool)

(declare-fun e!786664 () Bool)

(assert (=> d!149941 e!786664))

(declare-fun res!928798 () Bool)

(assert (=> d!149941 (=> (not res!928798) (not e!786664))))

(assert (=> d!149941 (= res!928798 (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46440 a!2938))))))

(declare-fun lt!610296 () Unit!46320)

(declare-fun choose!23 (array!95030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46320)

(assert (=> d!149941 (= lt!610296 (choose!23 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(assert (=> d!149941 (validMask!0 mask!2987)))

(assert (=> d!149941 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987) lt!610296)))

(declare-fun b!1388607 () Bool)

(assert (=> b!1388607 (= e!786664 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) mask!2987))))

(assert (= (and d!149941 res!928798) b!1388607))

(declare-fun m!1274417 () Bool)

(assert (=> d!149941 m!1274417))

(assert (=> d!149941 m!1274211))

(assert (=> b!1388607 m!1274219))

(declare-fun m!1274419 () Bool)

(assert (=> b!1388607 m!1274419))

(assert (=> b!1388441 d!149941))

(check-sat (not b!1388534) (not bm!66620) (not d!149941) (not b!1388587) (not b!1388539) (not b!1388598) (not b!1388581) (not b!1388531) (not d!149927) (not b!1388520) (not b!1388595) (not b!1388517) (not d!149909) (not bm!66632) (not b!1388532) (not b!1388542) (not d!149903) (not b!1388607) (not b!1388601) (not bm!66631) (not bm!66623) (not bm!66624) (not b!1388604) (not d!149899) (not b!1388536))
(check-sat)
(get-model)

(declare-fun d!149975 () Bool)

(assert (=> d!149975 (= (seekEntryOrOpen!0 (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) mask!2987))))

(assert (=> d!149975 true))

(declare-fun _$42!16 () Unit!46320)

(assert (=> d!149975 (= (choose!14 a!2938 i!1065 startIndex!16 mask!2987) _$42!16)))

(declare-fun bs!40330 () Bool)

(assert (= bs!40330 d!149975))

(assert (=> bs!40330 m!1274215))

(assert (=> bs!40330 m!1274237))

(assert (=> bs!40330 m!1274231))

(assert (=> bs!40330 m!1274215))

(assert (=> bs!40330 m!1274231))

(assert (=> bs!40330 m!1274339))

(assert (=> bs!40330 m!1274219))

(assert (=> d!149903 d!149975))

(assert (=> d!149903 d!149929))

(declare-fun d!149977 () Bool)

(assert (=> d!149977 (= (validKeyInArray!0 (select (arr!45889 a!2938) #b00000000000000000000000000000000)) (and (not (= (select (arr!45889 a!2938) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45889 a!2938) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388534 d!149977))

(declare-fun b!1388728 () Bool)

(declare-fun e!786743 () SeekEntryResult!10136)

(declare-fun e!786744 () SeekEntryResult!10136)

(assert (=> b!1388728 (= e!786743 e!786744)))

(declare-fun c!129396 () Bool)

(declare-fun lt!610350 () (_ BitVec 64))

(assert (=> b!1388728 (= c!129396 (= lt!610350 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1388729 () Bool)

(declare-fun e!786745 () SeekEntryResult!10136)

(assert (=> b!1388729 (= e!786745 (MissingVacant!10136 (index!42917 lt!610281)))))

(declare-fun b!1388730 () Bool)

(assert (=> b!1388730 (= e!786744 (Found!10136 (index!42917 lt!610281)))))

(declare-fun b!1388731 () Bool)

(declare-fun c!129394 () Bool)

(assert (=> b!1388731 (= c!129394 (= lt!610350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388731 (= e!786744 e!786745)))

(declare-fun b!1388733 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1388733 (= e!786745 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124679 lt!610281) #b00000000000000000000000000000001) (nextIndex!0 (index!42917 lt!610281) (bvadd (x!124679 lt!610281) #b00000000000000000000000000000001) mask!2987) (index!42917 lt!610281) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610194 mask!2987))))

(declare-fun lt!610349 () SeekEntryResult!10136)

(declare-fun d!149979 () Bool)

(assert (=> d!149979 (and (or ((_ is Undefined!10136) lt!610349) (not ((_ is Found!10136) lt!610349)) (and (bvsge (index!42916 lt!610349) #b00000000000000000000000000000000) (bvslt (index!42916 lt!610349) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610349) ((_ is Found!10136) lt!610349) (not ((_ is MissingVacant!10136) lt!610349)) (not (= (index!42918 lt!610349) (index!42917 lt!610281))) (and (bvsge (index!42918 lt!610349) #b00000000000000000000000000000000) (bvslt (index!42918 lt!610349) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610349) (ite ((_ is Found!10136) lt!610349) (= (select (arr!45889 lt!610194) (index!42916 lt!610349)) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (and ((_ is MissingVacant!10136) lt!610349) (= (index!42918 lt!610349) (index!42917 lt!610281)) (= (select (arr!45889 lt!610194) (index!42918 lt!610349)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149979 (= lt!610349 e!786743)))

(declare-fun c!129395 () Bool)

(assert (=> d!149979 (= c!129395 (bvsge (x!124679 lt!610281) #b01111111111111111111111111111110))))

(assert (=> d!149979 (= lt!610350 (select (arr!45889 lt!610194) (index!42917 lt!610281)))))

(assert (=> d!149979 (validMask!0 mask!2987)))

(assert (=> d!149979 (= (seekKeyOrZeroReturnVacant!0 (x!124679 lt!610281) (index!42917 lt!610281) (index!42917 lt!610281) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610194 mask!2987) lt!610349)))

(declare-fun b!1388732 () Bool)

(assert (=> b!1388732 (= e!786743 Undefined!10136)))

(assert (= (and d!149979 c!129395) b!1388732))

(assert (= (and d!149979 (not c!129395)) b!1388728))

(assert (= (and b!1388728 c!129396) b!1388730))

(assert (= (and b!1388728 (not c!129396)) b!1388731))

(assert (= (and b!1388731 c!129394) b!1388729))

(assert (= (and b!1388731 (not c!129394)) b!1388733))

(declare-fun m!1274565 () Bool)

(assert (=> b!1388733 m!1274565))

(assert (=> b!1388733 m!1274565))

(assert (=> b!1388733 m!1274231))

(declare-fun m!1274567 () Bool)

(assert (=> b!1388733 m!1274567))

(declare-fun m!1274569 () Bool)

(assert (=> d!149979 m!1274569))

(declare-fun m!1274571 () Bool)

(assert (=> d!149979 m!1274571))

(assert (=> d!149979 m!1274371))

(assert (=> d!149979 m!1274211))

(assert (=> b!1388587 d!149979))

(assert (=> b!1388520 d!149977))

(assert (=> d!149899 d!149901))

(declare-fun d!149981 () Bool)

(assert (=> d!149981 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (=> d!149981 true))

(declare-fun _$72!122 () Unit!46320)

(assert (=> d!149981 (= (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) _$72!122)))

(declare-fun bs!40331 () Bool)

(assert (= bs!40331 d!149981))

(assert (=> bs!40331 m!1274239))

(assert (=> d!149899 d!149981))

(assert (=> d!149899 d!149929))

(assert (=> b!1388542 d!149909))

(declare-fun b!1388734 () Bool)

(declare-fun e!786748 () SeekEntryResult!10136)

(declare-fun e!786746 () SeekEntryResult!10136)

(assert (=> b!1388734 (= e!786748 e!786746)))

(declare-fun lt!610353 () SeekEntryResult!10136)

(declare-fun lt!610352 () (_ BitVec 64))

(assert (=> b!1388734 (= lt!610352 (select (arr!45889 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938))) (index!42917 lt!610353)))))

(declare-fun c!129398 () Bool)

(assert (=> b!1388734 (= c!129398 (= lt!610352 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun e!786747 () SeekEntryResult!10136)

(declare-fun b!1388736 () Bool)

(assert (=> b!1388736 (= e!786747 (seekKeyOrZeroReturnVacant!0 (x!124679 lt!610353) (index!42917 lt!610353) (index!42917 lt!610353) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) mask!2987))))

(declare-fun b!1388737 () Bool)

(declare-fun c!129399 () Bool)

(assert (=> b!1388737 (= c!129399 (= lt!610352 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388737 (= e!786746 e!786747)))

(declare-fun b!1388738 () Bool)

(assert (=> b!1388738 (= e!786747 (MissingZero!10136 (index!42917 lt!610353)))))

(declare-fun b!1388739 () Bool)

(assert (=> b!1388739 (= e!786746 (Found!10136 (index!42917 lt!610353)))))

(declare-fun d!149983 () Bool)

(declare-fun lt!610351 () SeekEntryResult!10136)

(assert (=> d!149983 (and (or ((_ is Undefined!10136) lt!610351) (not ((_ is Found!10136) lt!610351)) (and (bvsge (index!42916 lt!610351) #b00000000000000000000000000000000) (bvslt (index!42916 lt!610351) (size!46440 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)))))) (or ((_ is Undefined!10136) lt!610351) ((_ is Found!10136) lt!610351) (not ((_ is MissingZero!10136) lt!610351)) (and (bvsge (index!42915 lt!610351) #b00000000000000000000000000000000) (bvslt (index!42915 lt!610351) (size!46440 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)))))) (or ((_ is Undefined!10136) lt!610351) ((_ is Found!10136) lt!610351) ((_ is MissingZero!10136) lt!610351) (not ((_ is MissingVacant!10136) lt!610351)) (and (bvsge (index!42918 lt!610351) #b00000000000000000000000000000000) (bvslt (index!42918 lt!610351) (size!46440 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)))))) (or ((_ is Undefined!10136) lt!610351) (ite ((_ is Found!10136) lt!610351) (= (select (arr!45889 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938))) (index!42916 lt!610351)) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10136) lt!610351) (= (select (arr!45889 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938))) (index!42915 lt!610351)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10136) lt!610351) (= (select (arr!45889 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938))) (index!42918 lt!610351)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149983 (= lt!610351 e!786748)))

(declare-fun c!129397 () Bool)

(assert (=> d!149983 (= c!129397 (and ((_ is Intermediate!10136) lt!610353) (undefined!10948 lt!610353)))))

(assert (=> d!149983 (= lt!610353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) mask!2987))))

(assert (=> d!149983 (validMask!0 mask!2987)))

(assert (=> d!149983 (= (seekEntryOrOpen!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) mask!2987) lt!610351)))

(declare-fun b!1388735 () Bool)

(assert (=> b!1388735 (= e!786748 Undefined!10136)))

(assert (= (and d!149983 c!129397) b!1388735))

(assert (= (and d!149983 (not c!129397)) b!1388734))

(assert (= (and b!1388734 c!129398) b!1388739))

(assert (= (and b!1388734 (not c!129398)) b!1388737))

(assert (= (and b!1388737 c!129399) b!1388738))

(assert (= (and b!1388737 (not c!129399)) b!1388736))

(declare-fun m!1274573 () Bool)

(assert (=> b!1388734 m!1274573))

(assert (=> b!1388736 m!1274231))

(declare-fun m!1274575 () Bool)

(assert (=> b!1388736 m!1274575))

(declare-fun m!1274577 () Bool)

(assert (=> d!149983 m!1274577))

(assert (=> d!149983 m!1274377))

(assert (=> d!149983 m!1274231))

(declare-fun m!1274579 () Bool)

(assert (=> d!149983 m!1274579))

(assert (=> d!149983 m!1274211))

(assert (=> d!149983 m!1274231))

(assert (=> d!149983 m!1274377))

(declare-fun m!1274581 () Bool)

(assert (=> d!149983 m!1274581))

(declare-fun m!1274583 () Bool)

(assert (=> d!149983 m!1274583))

(assert (=> b!1388542 d!149983))

(declare-fun bm!66645 () Bool)

(declare-fun call!66648 () Bool)

(assert (=> bm!66645 (= call!66648 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!610194 mask!2987))))

(declare-fun b!1388740 () Bool)

(declare-fun e!786750 () Bool)

(declare-fun e!786751 () Bool)

(assert (=> b!1388740 (= e!786750 e!786751)))

(declare-fun lt!610354 () (_ BitVec 64))

(assert (=> b!1388740 (= lt!610354 (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610355 () Unit!46320)

(assert (=> b!1388740 (= lt!610355 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610194 lt!610354 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388740 (arrayContainsKey!0 lt!610194 lt!610354 #b00000000000000000000000000000000)))

(declare-fun lt!610356 () Unit!46320)

(assert (=> b!1388740 (= lt!610356 lt!610355)))

(declare-fun res!928835 () Bool)

(assert (=> b!1388740 (= res!928835 (= (seekEntryOrOpen!0 (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)) lt!610194 mask!2987) (Found!10136 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388740 (=> (not res!928835) (not e!786751))))

(declare-fun b!1388741 () Bool)

(assert (=> b!1388741 (= e!786750 call!66648)))

(declare-fun b!1388743 () Bool)

(declare-fun e!786749 () Bool)

(assert (=> b!1388743 (= e!786749 e!786750)))

(declare-fun c!129400 () Bool)

(assert (=> b!1388743 (= c!129400 (validKeyInArray!0 (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1388742 () Bool)

(assert (=> b!1388742 (= e!786751 call!66648)))

(declare-fun d!149985 () Bool)

(declare-fun res!928836 () Bool)

(assert (=> d!149985 (=> res!928836 e!786749)))

(assert (=> d!149985 (= res!928836 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) (size!46440 lt!610194)))))

(assert (=> d!149985 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) lt!610194 mask!2987) e!786749)))

(assert (= (and d!149985 (not res!928836)) b!1388743))

(assert (= (and b!1388743 c!129400) b!1388740))

(assert (= (and b!1388743 (not c!129400)) b!1388741))

(assert (= (and b!1388740 res!928835) b!1388742))

(assert (= (or b!1388742 b!1388741) bm!66645))

(declare-fun m!1274585 () Bool)

(assert (=> bm!66645 m!1274585))

(declare-fun m!1274587 () Bool)

(assert (=> b!1388740 m!1274587))

(declare-fun m!1274589 () Bool)

(assert (=> b!1388740 m!1274589))

(declare-fun m!1274591 () Bool)

(assert (=> b!1388740 m!1274591))

(assert (=> b!1388740 m!1274587))

(declare-fun m!1274593 () Bool)

(assert (=> b!1388740 m!1274593))

(assert (=> b!1388743 m!1274587))

(assert (=> b!1388743 m!1274587))

(declare-fun m!1274595 () Bool)

(assert (=> b!1388743 m!1274595))

(assert (=> bm!66632 d!149985))

(declare-fun d!149987 () Bool)

(assert (=> d!149987 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) mask!2987)))

(assert (=> d!149987 true))

(declare-fun _$43!15 () Unit!46320)

(assert (=> d!149987 (= (choose!23 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987) _$43!15)))

(declare-fun bs!40332 () Bool)

(assert (= bs!40332 d!149987))

(assert (=> bs!40332 m!1274219))

(assert (=> bs!40332 m!1274419))

(assert (=> d!149941 d!149987))

(assert (=> d!149941 d!149929))

(declare-fun d!149989 () Bool)

(assert (=> d!149989 (arrayContainsKey!0 lt!610194 lt!610291 #b00000000000000000000000000000000)))

(declare-fun lt!610359 () Unit!46320)

(declare-fun choose!13 (array!95030 (_ BitVec 64) (_ BitVec 32)) Unit!46320)

(assert (=> d!149989 (= lt!610359 (choose!13 lt!610194 lt!610291 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> d!149989 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))

(assert (=> d!149989 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610194 lt!610291 (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!610359)))

(declare-fun bs!40333 () Bool)

(assert (= bs!40333 d!149989))

(assert (=> bs!40333 m!1274411))

(declare-fun m!1274597 () Bool)

(assert (=> bs!40333 m!1274597))

(assert (=> b!1388601 d!149989))

(declare-fun d!149991 () Bool)

(declare-fun res!928841 () Bool)

(declare-fun e!786756 () Bool)

(assert (=> d!149991 (=> res!928841 e!786756)))

(assert (=> d!149991 (= res!928841 (= (select (arr!45889 lt!610194) #b00000000000000000000000000000000) lt!610291))))

(assert (=> d!149991 (= (arrayContainsKey!0 lt!610194 lt!610291 #b00000000000000000000000000000000) e!786756)))

(declare-fun b!1388748 () Bool)

(declare-fun e!786757 () Bool)

(assert (=> b!1388748 (= e!786756 e!786757)))

(declare-fun res!928842 () Bool)

(assert (=> b!1388748 (=> (not res!928842) (not e!786757))))

(assert (=> b!1388748 (= res!928842 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46440 lt!610194)))))

(declare-fun b!1388749 () Bool)

(assert (=> b!1388749 (= e!786757 (arrayContainsKey!0 lt!610194 lt!610291 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149991 (not res!928841)) b!1388748))

(assert (= (and b!1388748 res!928842) b!1388749))

(declare-fun m!1274599 () Bool)

(assert (=> d!149991 m!1274599))

(declare-fun m!1274601 () Bool)

(assert (=> b!1388749 m!1274601))

(assert (=> b!1388601 d!149991))

(declare-fun b!1388750 () Bool)

(declare-fun e!786760 () SeekEntryResult!10136)

(declare-fun e!786758 () SeekEntryResult!10136)

(assert (=> b!1388750 (= e!786760 e!786758)))

(declare-fun lt!610361 () (_ BitVec 64))

(declare-fun lt!610362 () SeekEntryResult!10136)

(assert (=> b!1388750 (= lt!610361 (select (arr!45889 lt!610194) (index!42917 lt!610362)))))

(declare-fun c!129402 () Bool)

(assert (=> b!1388750 (= c!129402 (= lt!610361 (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1388752 () Bool)

(declare-fun e!786759 () SeekEntryResult!10136)

(assert (=> b!1388752 (= e!786759 (seekKeyOrZeroReturnVacant!0 (x!124679 lt!610362) (index!42917 lt!610362) (index!42917 lt!610362) (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!610194 mask!2987))))

(declare-fun b!1388753 () Bool)

(declare-fun c!129403 () Bool)

(assert (=> b!1388753 (= c!129403 (= lt!610361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388753 (= e!786758 e!786759)))

(declare-fun b!1388754 () Bool)

(assert (=> b!1388754 (= e!786759 (MissingZero!10136 (index!42917 lt!610362)))))

(declare-fun b!1388755 () Bool)

(assert (=> b!1388755 (= e!786758 (Found!10136 (index!42917 lt!610362)))))

(declare-fun d!149993 () Bool)

(declare-fun lt!610360 () SeekEntryResult!10136)

(assert (=> d!149993 (and (or ((_ is Undefined!10136) lt!610360) (not ((_ is Found!10136) lt!610360)) (and (bvsge (index!42916 lt!610360) #b00000000000000000000000000000000) (bvslt (index!42916 lt!610360) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610360) ((_ is Found!10136) lt!610360) (not ((_ is MissingZero!10136) lt!610360)) (and (bvsge (index!42915 lt!610360) #b00000000000000000000000000000000) (bvslt (index!42915 lt!610360) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610360) ((_ is Found!10136) lt!610360) ((_ is MissingZero!10136) lt!610360) (not ((_ is MissingVacant!10136) lt!610360)) (and (bvsge (index!42918 lt!610360) #b00000000000000000000000000000000) (bvslt (index!42918 lt!610360) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610360) (ite ((_ is Found!10136) lt!610360) (= (select (arr!45889 lt!610194) (index!42916 lt!610360)) (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16))) (ite ((_ is MissingZero!10136) lt!610360) (= (select (arr!45889 lt!610194) (index!42915 lt!610360)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10136) lt!610360) (= (select (arr!45889 lt!610194) (index!42918 lt!610360)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149993 (= lt!610360 e!786760)))

(declare-fun c!129401 () Bool)

(assert (=> d!149993 (= c!129401 (and ((_ is Intermediate!10136) lt!610362) (undefined!10948 lt!610362)))))

(assert (=> d!149993 (= lt!610362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16)) mask!2987) (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!610194 mask!2987))))

(assert (=> d!149993 (validMask!0 mask!2987)))

(assert (=> d!149993 (= (seekEntryOrOpen!0 (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!610194 mask!2987) lt!610360)))

(declare-fun b!1388751 () Bool)

(assert (=> b!1388751 (= e!786760 Undefined!10136)))

(assert (= (and d!149993 c!129401) b!1388751))

(assert (= (and d!149993 (not c!129401)) b!1388750))

(assert (= (and b!1388750 c!129402) b!1388755))

(assert (= (and b!1388750 (not c!129402)) b!1388753))

(assert (= (and b!1388753 c!129403) b!1388754))

(assert (= (and b!1388753 (not c!129403)) b!1388752))

(declare-fun m!1274603 () Bool)

(assert (=> b!1388750 m!1274603))

(assert (=> b!1388752 m!1274407))

(declare-fun m!1274605 () Bool)

(assert (=> b!1388752 m!1274605))

(declare-fun m!1274607 () Bool)

(assert (=> d!149993 m!1274607))

(declare-fun m!1274609 () Bool)

(assert (=> d!149993 m!1274609))

(assert (=> d!149993 m!1274407))

(declare-fun m!1274611 () Bool)

(assert (=> d!149993 m!1274611))

(assert (=> d!149993 m!1274211))

(assert (=> d!149993 m!1274407))

(assert (=> d!149993 m!1274609))

(declare-fun m!1274613 () Bool)

(assert (=> d!149993 m!1274613))

(declare-fun m!1274615 () Bool)

(assert (=> d!149993 m!1274615))

(assert (=> b!1388601 d!149993))

(declare-fun d!149995 () Bool)

(assert (=> d!149995 (= (validKeyInArray!0 (select (arr!45889 lt!610194) startIndex!16)) (and (not (= (select (arr!45889 lt!610194) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45889 lt!610194) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388598 d!149995))

(declare-fun e!786772 () SeekEntryResult!10136)

(declare-fun b!1388774 () Bool)

(assert (=> b!1388774 (= e!786772 (Intermediate!10136 false (toIndex!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388776 () Bool)

(declare-fun e!786775 () Bool)

(declare-fun lt!610368 () SeekEntryResult!10136)

(assert (=> b!1388776 (= e!786775 (bvsge (x!124679 lt!610368) #b01111111111111111111111111111110))))

(declare-fun b!1388777 () Bool)

(assert (=> b!1388777 (and (bvsge (index!42917 lt!610368) #b00000000000000000000000000000000) (bvslt (index!42917 lt!610368) (size!46440 lt!610194)))))

(declare-fun e!786773 () Bool)

(assert (=> b!1388777 (= e!786773 (= (select (arr!45889 lt!610194) (index!42917 lt!610368)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388778 () Bool)

(assert (=> b!1388778 (= e!786772 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2987) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610194 mask!2987))))

(declare-fun b!1388779 () Bool)

(declare-fun e!786774 () SeekEntryResult!10136)

(assert (=> b!1388779 (= e!786774 e!786772)))

(declare-fun lt!610367 () (_ BitVec 64))

(declare-fun c!129412 () Bool)

(assert (=> b!1388779 (= c!129412 (or (= lt!610367 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (= (bvadd lt!610367 lt!610367) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1388780 () Bool)

(assert (=> b!1388780 (and (bvsge (index!42917 lt!610368) #b00000000000000000000000000000000) (bvslt (index!42917 lt!610368) (size!46440 lt!610194)))))

(declare-fun res!928849 () Bool)

(assert (=> b!1388780 (= res!928849 (= (select (arr!45889 lt!610194) (index!42917 lt!610368)) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(assert (=> b!1388780 (=> res!928849 e!786773)))

(declare-fun e!786771 () Bool)

(assert (=> b!1388780 (= e!786771 e!786773)))

(declare-fun b!1388781 () Bool)

(assert (=> b!1388781 (= e!786774 (Intermediate!10136 true (toIndex!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388782 () Bool)

(assert (=> b!1388782 (= e!786775 e!786771)))

(declare-fun res!928850 () Bool)

(assert (=> b!1388782 (= res!928850 (and ((_ is Intermediate!10136) lt!610368) (not (undefined!10948 lt!610368)) (bvslt (x!124679 lt!610368) #b01111111111111111111111111111110) (bvsge (x!124679 lt!610368) #b00000000000000000000000000000000) (bvsge (x!124679 lt!610368) #b00000000000000000000000000000000)))))

(assert (=> b!1388782 (=> (not res!928850) (not e!786771))))

(declare-fun b!1388775 () Bool)

(assert (=> b!1388775 (and (bvsge (index!42917 lt!610368) #b00000000000000000000000000000000) (bvslt (index!42917 lt!610368) (size!46440 lt!610194)))))

(declare-fun res!928851 () Bool)

(assert (=> b!1388775 (= res!928851 (= (select (arr!45889 lt!610194) (index!42917 lt!610368)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388775 (=> res!928851 e!786773)))

(declare-fun d!149997 () Bool)

(assert (=> d!149997 e!786775))

(declare-fun c!129411 () Bool)

(assert (=> d!149997 (= c!129411 (and ((_ is Intermediate!10136) lt!610368) (undefined!10948 lt!610368)))))

(assert (=> d!149997 (= lt!610368 e!786774)))

(declare-fun c!129410 () Bool)

(assert (=> d!149997 (= c!129410 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!149997 (= lt!610367 (select (arr!45889 lt!610194) (toIndex!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987)))))

(assert (=> d!149997 (validMask!0 mask!2987)))

(assert (=> d!149997 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610194 mask!2987) lt!610368)))

(assert (= (and d!149997 c!129410) b!1388781))

(assert (= (and d!149997 (not c!129410)) b!1388779))

(assert (= (and b!1388779 c!129412) b!1388774))

(assert (= (and b!1388779 (not c!129412)) b!1388778))

(assert (= (and d!149997 c!129411) b!1388776))

(assert (= (and d!149997 (not c!129411)) b!1388782))

(assert (= (and b!1388782 res!928850) b!1388780))

(assert (= (and b!1388780 (not res!928849)) b!1388775))

(assert (= (and b!1388775 (not res!928851)) b!1388777))

(declare-fun m!1274617 () Bool)

(assert (=> b!1388780 m!1274617))

(assert (=> b!1388777 m!1274617))

(assert (=> b!1388775 m!1274617))

(assert (=> b!1388778 m!1274377))

(declare-fun m!1274619 () Bool)

(assert (=> b!1388778 m!1274619))

(assert (=> b!1388778 m!1274619))

(assert (=> b!1388778 m!1274231))

(declare-fun m!1274621 () Bool)

(assert (=> b!1388778 m!1274621))

(assert (=> d!149997 m!1274377))

(declare-fun m!1274623 () Bool)

(assert (=> d!149997 m!1274623))

(assert (=> d!149997 m!1274211))

(assert (=> d!149927 d!149997))

(declare-fun d!149999 () Bool)

(declare-fun lt!610374 () (_ BitVec 32))

(declare-fun lt!610373 () (_ BitVec 32))

(assert (=> d!149999 (= lt!610374 (bvmul (bvxor lt!610373 (bvlshr lt!610373 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149999 (= lt!610373 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149999 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928852 (let ((h!33621 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124684 (bvmul (bvxor h!33621 (bvlshr h!33621 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124684 (bvlshr x!124684 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928852 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928852 #b00000000000000000000000000000000))))))

(assert (=> d!149999 (= (toIndex!0 (select (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvand (bvxor lt!610374 (bvlshr lt!610374 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149927 d!149999))

(assert (=> d!149927 d!149929))

(declare-fun call!66649 () Bool)

(declare-fun bm!66646 () Bool)

(assert (=> bm!66646 (= call!66649 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!610194 mask!2987))))

(declare-fun b!1388783 () Bool)

(declare-fun e!786777 () Bool)

(declare-fun e!786778 () Bool)

(assert (=> b!1388783 (= e!786777 e!786778)))

(declare-fun lt!610375 () (_ BitVec 64))

(assert (=> b!1388783 (= lt!610375 (select (arr!45889 lt!610194) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610376 () Unit!46320)

(assert (=> b!1388783 (= lt!610376 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610194 lt!610375 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388783 (arrayContainsKey!0 lt!610194 lt!610375 #b00000000000000000000000000000000)))

(declare-fun lt!610377 () Unit!46320)

(assert (=> b!1388783 (= lt!610377 lt!610376)))

(declare-fun res!928853 () Bool)

(assert (=> b!1388783 (= res!928853 (= (seekEntryOrOpen!0 (select (arr!45889 lt!610194) (bvadd startIndex!16 #b00000000000000000000000000000001)) lt!610194 mask!2987) (Found!10136 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388783 (=> (not res!928853) (not e!786778))))

(declare-fun b!1388784 () Bool)

(assert (=> b!1388784 (= e!786777 call!66649)))

(declare-fun b!1388786 () Bool)

(declare-fun e!786776 () Bool)

(assert (=> b!1388786 (= e!786776 e!786777)))

(declare-fun c!129413 () Bool)

(assert (=> b!1388786 (= c!129413 (validKeyInArray!0 (select (arr!45889 lt!610194) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1388785 () Bool)

(assert (=> b!1388785 (= e!786778 call!66649)))

(declare-fun d!150001 () Bool)

(declare-fun res!928854 () Bool)

(assert (=> d!150001 (=> res!928854 e!786776)))

(assert (=> d!150001 (= res!928854 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46440 lt!610194)))))

(assert (=> d!150001 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!610194 mask!2987) e!786776)))

(assert (= (and d!150001 (not res!928854)) b!1388786))

(assert (= (and b!1388786 c!129413) b!1388783))

(assert (= (and b!1388786 (not c!129413)) b!1388784))

(assert (= (and b!1388783 res!928853) b!1388785))

(assert (= (or b!1388785 b!1388784) bm!66646))

(declare-fun m!1274625 () Bool)

(assert (=> bm!66646 m!1274625))

(declare-fun m!1274627 () Bool)

(assert (=> b!1388783 m!1274627))

(declare-fun m!1274629 () Bool)

(assert (=> b!1388783 m!1274629))

(declare-fun m!1274631 () Bool)

(assert (=> b!1388783 m!1274631))

(assert (=> b!1388783 m!1274627))

(declare-fun m!1274633 () Bool)

(assert (=> b!1388783 m!1274633))

(assert (=> b!1388786 m!1274627))

(assert (=> b!1388786 m!1274627))

(declare-fun m!1274635 () Bool)

(assert (=> b!1388786 m!1274635))

(assert (=> bm!66631 d!150001))

(declare-fun b!1388787 () Bool)

(declare-fun e!786780 () SeekEntryResult!10136)

(assert (=> b!1388787 (= e!786780 (Intermediate!10136 false (toIndex!0 (select (arr!45889 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388789 () Bool)

(declare-fun e!786783 () Bool)

(declare-fun lt!610379 () SeekEntryResult!10136)

(assert (=> b!1388789 (= e!786783 (bvsge (x!124679 lt!610379) #b01111111111111111111111111111110))))

(declare-fun b!1388790 () Bool)

(assert (=> b!1388790 (and (bvsge (index!42917 lt!610379) #b00000000000000000000000000000000) (bvslt (index!42917 lt!610379) (size!46440 a!2938)))))

(declare-fun e!786781 () Bool)

(assert (=> b!1388790 (= e!786781 (= (select (arr!45889 a!2938) (index!42917 lt!610379)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388791 () Bool)

(assert (=> b!1388791 (= e!786780 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45889 a!2938) startIndex!16) mask!2987) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2987) (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388792 () Bool)

(declare-fun e!786782 () SeekEntryResult!10136)

(assert (=> b!1388792 (= e!786782 e!786780)))

(declare-fun lt!610378 () (_ BitVec 64))

(declare-fun c!129416 () Bool)

(assert (=> b!1388792 (= c!129416 (or (= lt!610378 (select (arr!45889 a!2938) startIndex!16)) (= (bvadd lt!610378 lt!610378) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1388793 () Bool)

(assert (=> b!1388793 (and (bvsge (index!42917 lt!610379) #b00000000000000000000000000000000) (bvslt (index!42917 lt!610379) (size!46440 a!2938)))))

(declare-fun res!928855 () Bool)

(assert (=> b!1388793 (= res!928855 (= (select (arr!45889 a!2938) (index!42917 lt!610379)) (select (arr!45889 a!2938) startIndex!16)))))

(assert (=> b!1388793 (=> res!928855 e!786781)))

(declare-fun e!786779 () Bool)

(assert (=> b!1388793 (= e!786779 e!786781)))

(declare-fun b!1388794 () Bool)

(assert (=> b!1388794 (= e!786782 (Intermediate!10136 true (toIndex!0 (select (arr!45889 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388795 () Bool)

(assert (=> b!1388795 (= e!786783 e!786779)))

(declare-fun res!928856 () Bool)

(assert (=> b!1388795 (= res!928856 (and ((_ is Intermediate!10136) lt!610379) (not (undefined!10948 lt!610379)) (bvslt (x!124679 lt!610379) #b01111111111111111111111111111110) (bvsge (x!124679 lt!610379) #b00000000000000000000000000000000) (bvsge (x!124679 lt!610379) #b00000000000000000000000000000000)))))

(assert (=> b!1388795 (=> (not res!928856) (not e!786779))))

(declare-fun b!1388788 () Bool)

(assert (=> b!1388788 (and (bvsge (index!42917 lt!610379) #b00000000000000000000000000000000) (bvslt (index!42917 lt!610379) (size!46440 a!2938)))))

(declare-fun res!928857 () Bool)

(assert (=> b!1388788 (= res!928857 (= (select (arr!45889 a!2938) (index!42917 lt!610379)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388788 (=> res!928857 e!786781)))

(declare-fun d!150003 () Bool)

(assert (=> d!150003 e!786783))

(declare-fun c!129415 () Bool)

(assert (=> d!150003 (= c!129415 (and ((_ is Intermediate!10136) lt!610379) (undefined!10948 lt!610379)))))

(assert (=> d!150003 (= lt!610379 e!786782)))

(declare-fun c!129414 () Bool)

(assert (=> d!150003 (= c!129414 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150003 (= lt!610378 (select (arr!45889 a!2938) (toIndex!0 (select (arr!45889 a!2938) startIndex!16) mask!2987)))))

(assert (=> d!150003 (validMask!0 mask!2987)))

(assert (=> d!150003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45889 a!2938) startIndex!16) mask!2987) (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987) lt!610379)))

(assert (= (and d!150003 c!129414) b!1388794))

(assert (= (and d!150003 (not c!129414)) b!1388792))

(assert (= (and b!1388792 c!129416) b!1388787))

(assert (= (and b!1388792 (not c!129416)) b!1388791))

(assert (= (and d!150003 c!129415) b!1388789))

(assert (= (and d!150003 (not c!129415)) b!1388795))

(assert (= (and b!1388795 res!928856) b!1388793))

(assert (= (and b!1388793 (not res!928855)) b!1388788))

(assert (= (and b!1388788 (not res!928857)) b!1388790))

(declare-fun m!1274637 () Bool)

(assert (=> b!1388793 m!1274637))

(assert (=> b!1388790 m!1274637))

(assert (=> b!1388788 m!1274637))

(assert (=> b!1388791 m!1274363))

(declare-fun m!1274639 () Bool)

(assert (=> b!1388791 m!1274639))

(assert (=> b!1388791 m!1274639))

(assert (=> b!1388791 m!1274215))

(declare-fun m!1274641 () Bool)

(assert (=> b!1388791 m!1274641))

(assert (=> d!150003 m!1274363))

(declare-fun m!1274643 () Bool)

(assert (=> d!150003 m!1274643))

(assert (=> d!150003 m!1274211))

(assert (=> d!149909 d!150003))

(declare-fun d!150005 () Bool)

(declare-fun lt!610381 () (_ BitVec 32))

(declare-fun lt!610380 () (_ BitVec 32))

(assert (=> d!150005 (= lt!610381 (bvmul (bvxor lt!610380 (bvlshr lt!610380 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150005 (= lt!610380 ((_ extract 31 0) (bvand (bvxor (select (arr!45889 a!2938) startIndex!16) (bvlshr (select (arr!45889 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150005 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928852 (let ((h!33621 ((_ extract 31 0) (bvand (bvxor (select (arr!45889 a!2938) startIndex!16) (bvlshr (select (arr!45889 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124684 (bvmul (bvxor h!33621 (bvlshr h!33621 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124684 (bvlshr x!124684 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928852 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928852 #b00000000000000000000000000000000))))))

(assert (=> d!150005 (= (toIndex!0 (select (arr!45889 a!2938) startIndex!16) mask!2987) (bvand (bvxor lt!610381 (bvlshr lt!610381 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149909 d!150005))

(assert (=> d!149909 d!149929))

(declare-fun bm!66647 () Bool)

(declare-fun call!66650 () Bool)

(assert (=> bm!66647 (= call!66650 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1388796 () Bool)

(declare-fun e!786785 () Bool)

(declare-fun e!786786 () Bool)

(assert (=> b!1388796 (= e!786785 e!786786)))

(declare-fun lt!610382 () (_ BitVec 64))

(assert (=> b!1388796 (= lt!610382 (select (arr!45889 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610383 () Unit!46320)

(assert (=> b!1388796 (= lt!610383 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610382 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388796 (arrayContainsKey!0 a!2938 lt!610382 #b00000000000000000000000000000000)))

(declare-fun lt!610384 () Unit!46320)

(assert (=> b!1388796 (= lt!610384 lt!610383)))

(declare-fun res!928858 () Bool)

(assert (=> b!1388796 (= res!928858 (= (seekEntryOrOpen!0 (select (arr!45889 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10136 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388796 (=> (not res!928858) (not e!786786))))

(declare-fun b!1388797 () Bool)

(assert (=> b!1388797 (= e!786785 call!66650)))

(declare-fun b!1388799 () Bool)

(declare-fun e!786784 () Bool)

(assert (=> b!1388799 (= e!786784 e!786785)))

(declare-fun c!129417 () Bool)

(assert (=> b!1388799 (= c!129417 (validKeyInArray!0 (select (arr!45889 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1388798 () Bool)

(assert (=> b!1388798 (= e!786786 call!66650)))

(declare-fun d!150007 () Bool)

(declare-fun res!928859 () Bool)

(assert (=> d!150007 (=> res!928859 e!786784)))

(assert (=> d!150007 (= res!928859 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46440 a!2938)))))

(assert (=> d!150007 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987) e!786784)))

(assert (= (and d!150007 (not res!928859)) b!1388799))

(assert (= (and b!1388799 c!129417) b!1388796))

(assert (= (and b!1388799 (not c!129417)) b!1388797))

(assert (= (and b!1388796 res!928858) b!1388798))

(assert (= (or b!1388798 b!1388797) bm!66647))

(declare-fun m!1274645 () Bool)

(assert (=> bm!66647 m!1274645))

(declare-fun m!1274647 () Bool)

(assert (=> b!1388796 m!1274647))

(declare-fun m!1274649 () Bool)

(assert (=> b!1388796 m!1274649))

(declare-fun m!1274651 () Bool)

(assert (=> b!1388796 m!1274651))

(assert (=> b!1388796 m!1274647))

(declare-fun m!1274653 () Bool)

(assert (=> b!1388796 m!1274653))

(assert (=> b!1388799 m!1274647))

(assert (=> b!1388799 m!1274647))

(declare-fun m!1274655 () Bool)

(assert (=> b!1388799 m!1274655))

(assert (=> bm!66624 d!150007))

(declare-fun d!150009 () Bool)

(assert (=> d!150009 (arrayContainsKey!0 lt!610194 lt!610286 #b00000000000000000000000000000000)))

(declare-fun lt!610385 () Unit!46320)

(assert (=> d!150009 (= lt!610385 (choose!13 lt!610194 lt!610286 startIndex!16))))

(assert (=> d!150009 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!150009 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610194 lt!610286 startIndex!16) lt!610385)))

(declare-fun bs!40334 () Bool)

(assert (= bs!40334 d!150009))

(assert (=> bs!40334 m!1274395))

(declare-fun m!1274657 () Bool)

(assert (=> bs!40334 m!1274657))

(assert (=> b!1388595 d!150009))

(declare-fun d!150011 () Bool)

(declare-fun res!928860 () Bool)

(declare-fun e!786787 () Bool)

(assert (=> d!150011 (=> res!928860 e!786787)))

(assert (=> d!150011 (= res!928860 (= (select (arr!45889 lt!610194) #b00000000000000000000000000000000) lt!610286))))

(assert (=> d!150011 (= (arrayContainsKey!0 lt!610194 lt!610286 #b00000000000000000000000000000000) e!786787)))

(declare-fun b!1388800 () Bool)

(declare-fun e!786788 () Bool)

(assert (=> b!1388800 (= e!786787 e!786788)))

(declare-fun res!928861 () Bool)

(assert (=> b!1388800 (=> (not res!928861) (not e!786788))))

(assert (=> b!1388800 (= res!928861 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46440 lt!610194)))))

(declare-fun b!1388801 () Bool)

(assert (=> b!1388801 (= e!786788 (arrayContainsKey!0 lt!610194 lt!610286 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!150011 (not res!928860)) b!1388800))

(assert (= (and b!1388800 res!928861) b!1388801))

(assert (=> d!150011 m!1274599))

(declare-fun m!1274659 () Bool)

(assert (=> b!1388801 m!1274659))

(assert (=> b!1388595 d!150011))

(declare-fun b!1388802 () Bool)

(declare-fun e!786791 () SeekEntryResult!10136)

(declare-fun e!786789 () SeekEntryResult!10136)

(assert (=> b!1388802 (= e!786791 e!786789)))

(declare-fun lt!610387 () (_ BitVec 64))

(declare-fun lt!610388 () SeekEntryResult!10136)

(assert (=> b!1388802 (= lt!610387 (select (arr!45889 lt!610194) (index!42917 lt!610388)))))

(declare-fun c!129419 () Bool)

(assert (=> b!1388802 (= c!129419 (= lt!610387 (select (arr!45889 lt!610194) startIndex!16)))))

(declare-fun e!786790 () SeekEntryResult!10136)

(declare-fun b!1388804 () Bool)

(assert (=> b!1388804 (= e!786790 (seekKeyOrZeroReturnVacant!0 (x!124679 lt!610388) (index!42917 lt!610388) (index!42917 lt!610388) (select (arr!45889 lt!610194) startIndex!16) lt!610194 mask!2987))))

(declare-fun b!1388805 () Bool)

(declare-fun c!129420 () Bool)

(assert (=> b!1388805 (= c!129420 (= lt!610387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388805 (= e!786789 e!786790)))

(declare-fun b!1388806 () Bool)

(assert (=> b!1388806 (= e!786790 (MissingZero!10136 (index!42917 lt!610388)))))

(declare-fun b!1388807 () Bool)

(assert (=> b!1388807 (= e!786789 (Found!10136 (index!42917 lt!610388)))))

(declare-fun d!150013 () Bool)

(declare-fun lt!610386 () SeekEntryResult!10136)

(assert (=> d!150013 (and (or ((_ is Undefined!10136) lt!610386) (not ((_ is Found!10136) lt!610386)) (and (bvsge (index!42916 lt!610386) #b00000000000000000000000000000000) (bvslt (index!42916 lt!610386) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610386) ((_ is Found!10136) lt!610386) (not ((_ is MissingZero!10136) lt!610386)) (and (bvsge (index!42915 lt!610386) #b00000000000000000000000000000000) (bvslt (index!42915 lt!610386) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610386) ((_ is Found!10136) lt!610386) ((_ is MissingZero!10136) lt!610386) (not ((_ is MissingVacant!10136) lt!610386)) (and (bvsge (index!42918 lt!610386) #b00000000000000000000000000000000) (bvslt (index!42918 lt!610386) (size!46440 lt!610194)))) (or ((_ is Undefined!10136) lt!610386) (ite ((_ is Found!10136) lt!610386) (= (select (arr!45889 lt!610194) (index!42916 lt!610386)) (select (arr!45889 lt!610194) startIndex!16)) (ite ((_ is MissingZero!10136) lt!610386) (= (select (arr!45889 lt!610194) (index!42915 lt!610386)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10136) lt!610386) (= (select (arr!45889 lt!610194) (index!42918 lt!610386)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150013 (= lt!610386 e!786791)))

(declare-fun c!129418 () Bool)

(assert (=> d!150013 (= c!129418 (and ((_ is Intermediate!10136) lt!610388) (undefined!10948 lt!610388)))))

(assert (=> d!150013 (= lt!610388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45889 lt!610194) startIndex!16) mask!2987) (select (arr!45889 lt!610194) startIndex!16) lt!610194 mask!2987))))

(assert (=> d!150013 (validMask!0 mask!2987)))

(assert (=> d!150013 (= (seekEntryOrOpen!0 (select (arr!45889 lt!610194) startIndex!16) lt!610194 mask!2987) lt!610386)))

(declare-fun b!1388803 () Bool)

(assert (=> b!1388803 (= e!786791 Undefined!10136)))

(assert (= (and d!150013 c!129418) b!1388803))

(assert (= (and d!150013 (not c!129418)) b!1388802))

(assert (= (and b!1388802 c!129419) b!1388807))

(assert (= (and b!1388802 (not c!129419)) b!1388805))

(assert (= (and b!1388805 c!129420) b!1388806))

(assert (= (and b!1388805 (not c!129420)) b!1388804))

(declare-fun m!1274661 () Bool)

(assert (=> b!1388802 m!1274661))

(assert (=> b!1388804 m!1274387))

(declare-fun m!1274663 () Bool)

(assert (=> b!1388804 m!1274663))

(declare-fun m!1274665 () Bool)

(assert (=> d!150013 m!1274665))

(declare-fun m!1274667 () Bool)

(assert (=> d!150013 m!1274667))

(assert (=> d!150013 m!1274387))

(declare-fun m!1274669 () Bool)

(assert (=> d!150013 m!1274669))

(assert (=> d!150013 m!1274211))

(assert (=> d!150013 m!1274387))

(assert (=> d!150013 m!1274667))

(declare-fun m!1274671 () Bool)

(assert (=> d!150013 m!1274671))

(declare-fun m!1274673 () Bool)

(assert (=> d!150013 m!1274673))

(assert (=> b!1388595 d!150013))

(declare-fun d!150015 () Bool)

(assert (=> d!150015 (arrayContainsKey!0 a!2938 lt!610240 #b00000000000000000000000000000000)))

(declare-fun lt!610389 () Unit!46320)

(assert (=> d!150015 (= lt!610389 (choose!13 a!2938 lt!610240 startIndex!16))))

(assert (=> d!150015 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!150015 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610240 startIndex!16) lt!610389)))

(declare-fun bs!40335 () Bool)

(assert (= bs!40335 d!150015))

(assert (=> bs!40335 m!1274335))

(declare-fun m!1274675 () Bool)

(assert (=> bs!40335 m!1274675))

(assert (=> b!1388536 d!150015))

(declare-fun d!150017 () Bool)

(declare-fun res!928862 () Bool)

(declare-fun e!786792 () Bool)

(assert (=> d!150017 (=> res!928862 e!786792)))

(assert (=> d!150017 (= res!928862 (= (select (arr!45889 a!2938) #b00000000000000000000000000000000) lt!610240))))

(assert (=> d!150017 (= (arrayContainsKey!0 a!2938 lt!610240 #b00000000000000000000000000000000) e!786792)))

(declare-fun b!1388808 () Bool)

(declare-fun e!786793 () Bool)

(assert (=> b!1388808 (= e!786792 e!786793)))

(declare-fun res!928863 () Bool)

(assert (=> b!1388808 (=> (not res!928863) (not e!786793))))

(assert (=> b!1388808 (= res!928863 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46440 a!2938)))))

(declare-fun b!1388809 () Bool)

(assert (=> b!1388809 (= e!786793 (arrayContainsKey!0 a!2938 lt!610240 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!150017 (not res!928862)) b!1388808))

(assert (= (and b!1388808 res!928863) b!1388809))

(assert (=> d!150017 m!1274315))

(declare-fun m!1274677 () Bool)

(assert (=> b!1388809 m!1274677))

(assert (=> b!1388536 d!150017))

(assert (=> b!1388536 d!149909))

(declare-fun b!1388810 () Bool)

(declare-fun e!786794 () SeekEntryResult!10136)

(declare-fun e!786795 () SeekEntryResult!10136)

(assert (=> b!1388810 (= e!786794 e!786795)))

(declare-fun lt!610391 () (_ BitVec 64))

(declare-fun c!129423 () Bool)

(assert (=> b!1388810 (= c!129423 (= lt!610391 (select (arr!45889 a!2938) startIndex!16)))))

(declare-fun b!1388811 () Bool)

(declare-fun e!786796 () SeekEntryResult!10136)

(assert (=> b!1388811 (= e!786796 (MissingVacant!10136 (index!42917 lt!610278)))))

(declare-fun b!1388812 () Bool)

(assert (=> b!1388812 (= e!786795 (Found!10136 (index!42917 lt!610278)))))

(declare-fun b!1388813 () Bool)

(declare-fun c!129421 () Bool)

(assert (=> b!1388813 (= c!129421 (= lt!610391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388813 (= e!786795 e!786796)))

(declare-fun b!1388815 () Bool)

(assert (=> b!1388815 (= e!786796 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124679 lt!610278) #b00000000000000000000000000000001) (nextIndex!0 (index!42917 lt!610278) (bvadd (x!124679 lt!610278) #b00000000000000000000000000000001) mask!2987) (index!42917 lt!610278) (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun d!150019 () Bool)

(declare-fun lt!610390 () SeekEntryResult!10136)

(assert (=> d!150019 (and (or ((_ is Undefined!10136) lt!610390) (not ((_ is Found!10136) lt!610390)) (and (bvsge (index!42916 lt!610390) #b00000000000000000000000000000000) (bvslt (index!42916 lt!610390) (size!46440 a!2938)))) (or ((_ is Undefined!10136) lt!610390) ((_ is Found!10136) lt!610390) (not ((_ is MissingVacant!10136) lt!610390)) (not (= (index!42918 lt!610390) (index!42917 lt!610278))) (and (bvsge (index!42918 lt!610390) #b00000000000000000000000000000000) (bvslt (index!42918 lt!610390) (size!46440 a!2938)))) (or ((_ is Undefined!10136) lt!610390) (ite ((_ is Found!10136) lt!610390) (= (select (arr!45889 a!2938) (index!42916 lt!610390)) (select (arr!45889 a!2938) startIndex!16)) (and ((_ is MissingVacant!10136) lt!610390) (= (index!42918 lt!610390) (index!42917 lt!610278)) (= (select (arr!45889 a!2938) (index!42918 lt!610390)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!150019 (= lt!610390 e!786794)))

(declare-fun c!129422 () Bool)

(assert (=> d!150019 (= c!129422 (bvsge (x!124679 lt!610278) #b01111111111111111111111111111110))))

(assert (=> d!150019 (= lt!610391 (select (arr!45889 a!2938) (index!42917 lt!610278)))))

(assert (=> d!150019 (validMask!0 mask!2987)))

(assert (=> d!150019 (= (seekKeyOrZeroReturnVacant!0 (x!124679 lt!610278) (index!42917 lt!610278) (index!42917 lt!610278) (select (arr!45889 a!2938) startIndex!16) a!2938 mask!2987) lt!610390)))

(declare-fun b!1388814 () Bool)

(assert (=> b!1388814 (= e!786794 Undefined!10136)))

(assert (= (and d!150019 c!129422) b!1388814))

(assert (= (and d!150019 (not c!129422)) b!1388810))

(assert (= (and b!1388810 c!129423) b!1388812))

(assert (= (and b!1388810 (not c!129423)) b!1388813))

(assert (= (and b!1388813 c!129421) b!1388811))

(assert (= (and b!1388813 (not c!129421)) b!1388815))

(declare-fun m!1274679 () Bool)

(assert (=> b!1388815 m!1274679))

(assert (=> b!1388815 m!1274679))

(assert (=> b!1388815 m!1274215))

(declare-fun m!1274681 () Bool)

(assert (=> b!1388815 m!1274681))

(declare-fun m!1274683 () Bool)

(assert (=> d!150019 m!1274683))

(declare-fun m!1274685 () Bool)

(assert (=> d!150019 m!1274685))

(assert (=> d!150019 m!1274357))

(assert (=> d!150019 m!1274211))

(assert (=> b!1388581 d!150019))

(assert (=> b!1388531 d!149977))

(declare-fun bm!66648 () Bool)

(declare-fun call!66651 () Bool)

(assert (=> bm!66648 (= call!66651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1388816 () Bool)

(declare-fun e!786798 () Bool)

(declare-fun e!786799 () Bool)

(assert (=> b!1388816 (= e!786798 e!786799)))

(declare-fun lt!610392 () (_ BitVec 64))

(assert (=> b!1388816 (= lt!610392 (select (arr!45889 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!610393 () Unit!46320)

(assert (=> b!1388816 (= lt!610393 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610392 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1388816 (arrayContainsKey!0 a!2938 lt!610392 #b00000000000000000000000000000000)))

(declare-fun lt!610394 () Unit!46320)

(assert (=> b!1388816 (= lt!610394 lt!610393)))

(declare-fun res!928864 () Bool)

(assert (=> b!1388816 (= res!928864 (= (seekEntryOrOpen!0 (select (arr!45889 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10136 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1388816 (=> (not res!928864) (not e!786799))))

(declare-fun b!1388817 () Bool)

(assert (=> b!1388817 (= e!786798 call!66651)))

(declare-fun b!1388819 () Bool)

(declare-fun e!786797 () Bool)

(assert (=> b!1388819 (= e!786797 e!786798)))

(declare-fun c!129424 () Bool)

(assert (=> b!1388819 (= c!129424 (validKeyInArray!0 (select (arr!45889 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388818 () Bool)

(assert (=> b!1388818 (= e!786799 call!66651)))

(declare-fun d!150021 () Bool)

(declare-fun res!928865 () Bool)

(assert (=> d!150021 (=> res!928865 e!786797)))

(assert (=> d!150021 (= res!928865 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46440 a!2938)))))

(assert (=> d!150021 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987) e!786797)))

(assert (= (and d!150021 (not res!928865)) b!1388819))

(assert (= (and b!1388819 c!129424) b!1388816))

(assert (= (and b!1388819 (not c!129424)) b!1388817))

(assert (= (and b!1388816 res!928864) b!1388818))

(assert (= (or b!1388818 b!1388817) bm!66648))

(declare-fun m!1274687 () Bool)

(assert (=> bm!66648 m!1274687))

(declare-fun m!1274689 () Bool)

(assert (=> b!1388816 m!1274689))

(declare-fun m!1274691 () Bool)

(assert (=> b!1388816 m!1274691))

(declare-fun m!1274693 () Bool)

(assert (=> b!1388816 m!1274693))

(assert (=> b!1388816 m!1274689))

(declare-fun m!1274695 () Bool)

(assert (=> b!1388816 m!1274695))

(assert (=> b!1388819 m!1274689))

(assert (=> b!1388819 m!1274689))

(declare-fun m!1274697 () Bool)

(assert (=> b!1388819 m!1274697))

(assert (=> bm!66620 d!150021))

(declare-fun b!1388820 () Bool)

(declare-fun e!786801 () Bool)

(declare-fun e!786800 () Bool)

(assert (=> b!1388820 (= e!786801 e!786800)))

(declare-fun c!129425 () Bool)

(assert (=> b!1388820 (= c!129425 (validKeyInArray!0 (select (arr!45889 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!66649 () Bool)

(declare-fun call!66652 () Bool)

(assert (=> bm!66649 (= call!66652 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!129425 (Cons!32400 (select (arr!45889 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!129330 (Cons!32400 (select (arr!45889 a!2938) #b00000000000000000000000000000000) Nil!32401) Nil!32401)) (ite c!129330 (Cons!32400 (select (arr!45889 a!2938) #b00000000000000000000000000000000) Nil!32401) Nil!32401))))))

(declare-fun b!1388821 () Bool)

(declare-fun e!786803 () Bool)

(assert (=> b!1388821 (= e!786803 (contains!9787 (ite c!129330 (Cons!32400 (select (arr!45889 a!2938) #b00000000000000000000000000000000) Nil!32401) Nil!32401) (select (arr!45889 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388822 () Bool)

(assert (=> b!1388822 (= e!786800 call!66652)))

(declare-fun b!1388823 () Bool)

(declare-fun e!786802 () Bool)

(assert (=> b!1388823 (= e!786802 e!786801)))

(declare-fun res!928867 () Bool)

(assert (=> b!1388823 (=> (not res!928867) (not e!786801))))

(assert (=> b!1388823 (= res!928867 (not e!786803))))

(declare-fun res!928866 () Bool)

(assert (=> b!1388823 (=> (not res!928866) (not e!786803))))

(assert (=> b!1388823 (= res!928866 (validKeyInArray!0 (select (arr!45889 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388824 () Bool)

(assert (=> b!1388824 (= e!786800 call!66652)))

(declare-fun d!150023 () Bool)

(declare-fun res!928868 () Bool)

(assert (=> d!150023 (=> res!928868 e!786802)))

(assert (=> d!150023 (= res!928868 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46440 a!2938)))))

(assert (=> d!150023 (= (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129330 (Cons!32400 (select (arr!45889 a!2938) #b00000000000000000000000000000000) Nil!32401) Nil!32401)) e!786802)))

(assert (= (and d!150023 (not res!928868)) b!1388823))

(assert (= (and b!1388823 res!928866) b!1388821))

(assert (= (and b!1388823 res!928867) b!1388820))

(assert (= (and b!1388820 c!129425) b!1388824))

(assert (= (and b!1388820 (not c!129425)) b!1388822))

(assert (= (or b!1388824 b!1388822) bm!66649))

(assert (=> b!1388820 m!1274689))

(assert (=> b!1388820 m!1274689))

(assert (=> b!1388820 m!1274697))

(assert (=> bm!66649 m!1274689))

(declare-fun m!1274699 () Bool)

(assert (=> bm!66649 m!1274699))

(assert (=> b!1388821 m!1274689))

(assert (=> b!1388821 m!1274689))

(declare-fun m!1274701 () Bool)

(assert (=> b!1388821 m!1274701))

(assert (=> b!1388823 m!1274689))

(assert (=> b!1388823 m!1274689))

(assert (=> b!1388823 m!1274697))

(assert (=> bm!66623 d!150023))

(declare-fun d!150025 () Bool)

(assert (=> d!150025 (arrayContainsKey!0 a!2938 lt!610234 #b00000000000000000000000000000000)))

(declare-fun lt!610395 () Unit!46320)

(assert (=> d!150025 (= lt!610395 (choose!13 a!2938 lt!610234 #b00000000000000000000000000000000))))

(assert (=> d!150025 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!150025 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610234 #b00000000000000000000000000000000) lt!610395)))

(declare-fun bs!40336 () Bool)

(assert (= bs!40336 d!150025))

(assert (=> bs!40336 m!1274319))

(declare-fun m!1274703 () Bool)

(assert (=> bs!40336 m!1274703))

(assert (=> b!1388517 d!150025))

(declare-fun d!150027 () Bool)

(declare-fun res!928869 () Bool)

(declare-fun e!786804 () Bool)

(assert (=> d!150027 (=> res!928869 e!786804)))

(assert (=> d!150027 (= res!928869 (= (select (arr!45889 a!2938) #b00000000000000000000000000000000) lt!610234))))

(assert (=> d!150027 (= (arrayContainsKey!0 a!2938 lt!610234 #b00000000000000000000000000000000) e!786804)))

(declare-fun b!1388825 () Bool)

(declare-fun e!786805 () Bool)

(assert (=> b!1388825 (= e!786804 e!786805)))

(declare-fun res!928870 () Bool)

(assert (=> b!1388825 (=> (not res!928870) (not e!786805))))

(assert (=> b!1388825 (= res!928870 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46440 a!2938)))))

(declare-fun b!1388826 () Bool)

(assert (=> b!1388826 (= e!786805 (arrayContainsKey!0 a!2938 lt!610234 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!150027 (not res!928869)) b!1388825))

(assert (= (and b!1388825 res!928870) b!1388826))

(assert (=> d!150027 m!1274315))

(declare-fun m!1274705 () Bool)

(assert (=> b!1388826 m!1274705))

(assert (=> b!1388517 d!150027))

(declare-fun b!1388827 () Bool)

(declare-fun e!786808 () SeekEntryResult!10136)

(declare-fun e!786806 () SeekEntryResult!10136)

(assert (=> b!1388827 (= e!786808 e!786806)))

(declare-fun lt!610397 () (_ BitVec 64))

(declare-fun lt!610398 () SeekEntryResult!10136)

(assert (=> b!1388827 (= lt!610397 (select (arr!45889 a!2938) (index!42917 lt!610398)))))

(declare-fun c!129427 () Bool)

(assert (=> b!1388827 (= c!129427 (= lt!610397 (select (arr!45889 a!2938) #b00000000000000000000000000000000)))))

(declare-fun e!786807 () SeekEntryResult!10136)

(declare-fun b!1388829 () Bool)

(assert (=> b!1388829 (= e!786807 (seekKeyOrZeroReturnVacant!0 (x!124679 lt!610398) (index!42917 lt!610398) (index!42917 lt!610398) (select (arr!45889 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(declare-fun b!1388830 () Bool)

(declare-fun c!129428 () Bool)

(assert (=> b!1388830 (= c!129428 (= lt!610397 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388830 (= e!786806 e!786807)))

(declare-fun b!1388831 () Bool)

(assert (=> b!1388831 (= e!786807 (MissingZero!10136 (index!42917 lt!610398)))))

(declare-fun b!1388832 () Bool)

(assert (=> b!1388832 (= e!786806 (Found!10136 (index!42917 lt!610398)))))

(declare-fun d!150029 () Bool)

(declare-fun lt!610396 () SeekEntryResult!10136)

(assert (=> d!150029 (and (or ((_ is Undefined!10136) lt!610396) (not ((_ is Found!10136) lt!610396)) (and (bvsge (index!42916 lt!610396) #b00000000000000000000000000000000) (bvslt (index!42916 lt!610396) (size!46440 a!2938)))) (or ((_ is Undefined!10136) lt!610396) ((_ is Found!10136) lt!610396) (not ((_ is MissingZero!10136) lt!610396)) (and (bvsge (index!42915 lt!610396) #b00000000000000000000000000000000) (bvslt (index!42915 lt!610396) (size!46440 a!2938)))) (or ((_ is Undefined!10136) lt!610396) ((_ is Found!10136) lt!610396) ((_ is MissingZero!10136) lt!610396) (not ((_ is MissingVacant!10136) lt!610396)) (and (bvsge (index!42918 lt!610396) #b00000000000000000000000000000000) (bvslt (index!42918 lt!610396) (size!46440 a!2938)))) (or ((_ is Undefined!10136) lt!610396) (ite ((_ is Found!10136) lt!610396) (= (select (arr!45889 a!2938) (index!42916 lt!610396)) (select (arr!45889 a!2938) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10136) lt!610396) (= (select (arr!45889 a!2938) (index!42915 lt!610396)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10136) lt!610396) (= (select (arr!45889 a!2938) (index!42918 lt!610396)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150029 (= lt!610396 e!786808)))

(declare-fun c!129426 () Bool)

(assert (=> d!150029 (= c!129426 (and ((_ is Intermediate!10136) lt!610398) (undefined!10948 lt!610398)))))

(assert (=> d!150029 (= lt!610398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45889 a!2938) #b00000000000000000000000000000000) mask!2987) (select (arr!45889 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(assert (=> d!150029 (validMask!0 mask!2987)))

(assert (=> d!150029 (= (seekEntryOrOpen!0 (select (arr!45889 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) lt!610396)))

(declare-fun b!1388828 () Bool)

(assert (=> b!1388828 (= e!786808 Undefined!10136)))

(assert (= (and d!150029 c!129426) b!1388828))

(assert (= (and d!150029 (not c!129426)) b!1388827))

(assert (= (and b!1388827 c!129427) b!1388832))

(assert (= (and b!1388827 (not c!129427)) b!1388830))

(assert (= (and b!1388830 c!129428) b!1388831))

(assert (= (and b!1388830 (not c!129428)) b!1388829))

(declare-fun m!1274707 () Bool)

(assert (=> b!1388827 m!1274707))

(assert (=> b!1388829 m!1274315))

(declare-fun m!1274709 () Bool)

(assert (=> b!1388829 m!1274709))

(declare-fun m!1274711 () Bool)

(assert (=> d!150029 m!1274711))

(declare-fun m!1274713 () Bool)

(assert (=> d!150029 m!1274713))

(assert (=> d!150029 m!1274315))

(declare-fun m!1274715 () Bool)

(assert (=> d!150029 m!1274715))

(assert (=> d!150029 m!1274211))

(assert (=> d!150029 m!1274315))

(assert (=> d!150029 m!1274713))

(declare-fun m!1274717 () Bool)

(assert (=> d!150029 m!1274717))

(declare-fun m!1274719 () Bool)

(assert (=> d!150029 m!1274719))

(assert (=> b!1388517 d!150029))

(declare-fun d!150031 () Bool)

(declare-fun lt!610401 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!755 (List!32404) (InoxSet (_ BitVec 64)))

(assert (=> d!150031 (= lt!610401 (select (content!755 Nil!32401) (select (arr!45889 a!2938) #b00000000000000000000000000000000)))))

(declare-fun e!786813 () Bool)

(assert (=> d!150031 (= lt!610401 e!786813)))

(declare-fun res!928875 () Bool)

(assert (=> d!150031 (=> (not res!928875) (not e!786813))))

(assert (=> d!150031 (= res!928875 ((_ is Cons!32400) Nil!32401))))

(assert (=> d!150031 (= (contains!9787 Nil!32401 (select (arr!45889 a!2938) #b00000000000000000000000000000000)) lt!610401)))

(declare-fun b!1388837 () Bool)

(declare-fun e!786814 () Bool)

(assert (=> b!1388837 (= e!786813 e!786814)))

(declare-fun res!928876 () Bool)

(assert (=> b!1388837 (=> res!928876 e!786814)))

(assert (=> b!1388837 (= res!928876 (= (h!33618 Nil!32401) (select (arr!45889 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388838 () Bool)

(assert (=> b!1388838 (= e!786814 (contains!9787 (t!47090 Nil!32401) (select (arr!45889 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!150031 res!928875) b!1388837))

(assert (= (and b!1388837 (not res!928876)) b!1388838))

(declare-fun m!1274721 () Bool)

(assert (=> d!150031 m!1274721))

(assert (=> d!150031 m!1274315))

(declare-fun m!1274723 () Bool)

(assert (=> d!150031 m!1274723))

(assert (=> b!1388838 m!1274315))

(declare-fun m!1274725 () Bool)

(assert (=> b!1388838 m!1274725))

(assert (=> b!1388532 d!150031))

(assert (=> b!1388539 d!149891))

(declare-fun call!66653 () Bool)

(declare-fun bm!66650 () Bool)

(assert (=> bm!66650 (= call!66653 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) mask!2987))))

(declare-fun b!1388839 () Bool)

(declare-fun e!786816 () Bool)

(declare-fun e!786817 () Bool)

(assert (=> b!1388839 (= e!786816 e!786817)))

(declare-fun lt!610402 () (_ BitVec 64))

(assert (=> b!1388839 (= lt!610402 (select (arr!45889 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(declare-fun lt!610403 () Unit!46320)

(assert (=> b!1388839 (= lt!610403 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) lt!610402 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> b!1388839 (arrayContainsKey!0 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) lt!610402 #b00000000000000000000000000000000)))

(declare-fun lt!610404 () Unit!46320)

(assert (=> b!1388839 (= lt!610404 lt!610403)))

(declare-fun res!928877 () Bool)

(assert (=> b!1388839 (= res!928877 (= (seekEntryOrOpen!0 (select (arr!45889 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16)) (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) mask!2987) (Found!10136 (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(assert (=> b!1388839 (=> (not res!928877) (not e!786817))))

(declare-fun b!1388840 () Bool)

(assert (=> b!1388840 (= e!786816 call!66653)))

(declare-fun b!1388842 () Bool)

(declare-fun e!786815 () Bool)

(assert (=> b!1388842 (= e!786815 e!786816)))

(declare-fun c!129429 () Bool)

(assert (=> b!1388842 (= c!129429 (validKeyInArray!0 (select (arr!45889 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1388841 () Bool)

(assert (=> b!1388841 (= e!786817 call!66653)))

(declare-fun d!150033 () Bool)

(declare-fun res!928878 () Bool)

(assert (=> d!150033 (=> res!928878 e!786815)))

(assert (=> d!150033 (= res!928878 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) (size!46440 (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)))))))

(assert (=> d!150033 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!95031 (store (arr!45889 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46440 a!2938)) mask!2987) e!786815)))

(assert (= (and d!150033 (not res!928878)) b!1388842))

(assert (= (and b!1388842 c!129429) b!1388839))

(assert (= (and b!1388842 (not c!129429)) b!1388840))

(assert (= (and b!1388839 res!928877) b!1388841))

(assert (= (or b!1388841 b!1388840) bm!66650))

(declare-fun m!1274727 () Bool)

(assert (=> bm!66650 m!1274727))

(declare-fun m!1274729 () Bool)

(assert (=> b!1388839 m!1274729))

(declare-fun m!1274731 () Bool)

(assert (=> b!1388839 m!1274731))

(declare-fun m!1274733 () Bool)

(assert (=> b!1388839 m!1274733))

(assert (=> b!1388839 m!1274729))

(declare-fun m!1274735 () Bool)

(assert (=> b!1388839 m!1274735))

(assert (=> b!1388842 m!1274729))

(assert (=> b!1388842 m!1274729))

(declare-fun m!1274737 () Bool)

(assert (=> b!1388842 m!1274737))

(assert (=> b!1388607 d!150033))

(declare-fun d!150035 () Bool)

(assert (=> d!150035 (= (validKeyInArray!0 (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16))) (and (not (= (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45889 lt!610194) (bvadd #b00000000000000000000000000000001 startIndex!16)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388604 d!150035))

(check-sat (not b!1388783) (not b!1388816) (not d!149981) (not d!149987) (not d!149983) (not bm!66648) (not b!1388842) (not d!150015) (not b!1388778) (not d!150029) (not bm!66647) (not b!1388740) (not d!150031) (not b!1388796) (not b!1388821) (not bm!66649) (not b!1388752) (not b!1388801) (not b!1388786) (not b!1388799) (not bm!66646) (not d!150009) (not b!1388749) (not bm!66645) (not b!1388733) (not b!1388815) (not b!1388829) (not b!1388838) (not bm!66650) (not b!1388791) (not d!150013) (not d!149993) (not b!1388804) (not d!150003) (not b!1388809) (not b!1388820) (not d!150019) (not b!1388823) (not d!149975) (not b!1388743) (not b!1388826) (not d!149997) (not b!1388839) (not b!1388736) (not d!149979) (not b!1388819) (not d!150025) (not d!149989))
(check-sat)
