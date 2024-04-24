; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119474 () Bool)

(assert start!119474)

(declare-fun b!1392180 () Bool)

(declare-fun res!931511 () Bool)

(declare-fun e!788460 () Bool)

(assert (=> b!1392180 (=> (not res!931511) (not e!788460))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95282 0))(
  ( (array!95283 (arr!46003 (Array (_ BitVec 32) (_ BitVec 64))) (size!46554 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95282)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1392180 (= res!931511 (and (= (size!46554 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46554 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46554 a!2901)) (not (= i!1037 j!112))))))

(declare-datatypes ((SeekEntryResult!10223 0))(
  ( (MissingZero!10223 (index!43263 (_ BitVec 32))) (Found!10223 (index!43264 (_ BitVec 32))) (Intermediate!10223 (undefined!11035 Bool) (index!43265 (_ BitVec 32)) (x!125094 (_ BitVec 32))) (Undefined!10223) (MissingVacant!10223 (index!43266 (_ BitVec 32))) )
))
(declare-fun lt!611440 () SeekEntryResult!10223)

(declare-fun lt!611439 () (_ BitVec 32))

(declare-fun b!1392181 () Bool)

(get-info :version)

(assert (=> b!1392181 (= e!788460 (not (or (not ((_ is Intermediate!10223) lt!611440)) (undefined!11035 lt!611440) (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!611439 #b00000000000000000000000000000000) (bvslt lt!611439 (bvadd #b00000000000000000000000000000001 mask!2840))))))))

(declare-fun e!788461 () Bool)

(assert (=> b!1392181 e!788461))

(declare-fun res!931516 () Bool)

(assert (=> b!1392181 (=> (not res!931516) (not e!788461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95282 (_ BitVec 32)) Bool)

(assert (=> b!1392181 (= res!931516 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46477 0))(
  ( (Unit!46478) )
))
(declare-fun lt!611441 () Unit!46477)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46477)

(assert (=> b!1392181 (= lt!611441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95282 (_ BitVec 32)) SeekEntryResult!10223)

(assert (=> b!1392181 (= lt!611440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!611439 (select (arr!46003 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392181 (= lt!611439 (toIndex!0 (select (arr!46003 a!2901) j!112) mask!2840))))

(declare-fun b!1392182 () Bool)

(declare-fun res!931514 () Bool)

(assert (=> b!1392182 (=> (not res!931514) (not e!788460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392182 (= res!931514 (validKeyInArray!0 (select (arr!46003 a!2901) j!112)))))

(declare-fun res!931515 () Bool)

(assert (=> start!119474 (=> (not res!931515) (not e!788460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119474 (= res!931515 (validMask!0 mask!2840))))

(assert (=> start!119474 e!788460))

(assert (=> start!119474 true))

(declare-fun array_inv!35284 (array!95282) Bool)

(assert (=> start!119474 (array_inv!35284 a!2901)))

(declare-fun b!1392183 () Bool)

(declare-fun res!931510 () Bool)

(assert (=> b!1392183 (=> (not res!931510) (not e!788460))))

(assert (=> b!1392183 (= res!931510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392184 () Bool)

(declare-fun res!931512 () Bool)

(assert (=> b!1392184 (=> (not res!931512) (not e!788460))))

(declare-datatypes ((List!32509 0))(
  ( (Nil!32506) (Cons!32505 (h!33734 (_ BitVec 64)) (t!47195 List!32509)) )
))
(declare-fun arrayNoDuplicates!0 (array!95282 (_ BitVec 32) List!32509) Bool)

(assert (=> b!1392184 (= res!931512 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32506))))

(declare-fun b!1392185 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95282 (_ BitVec 32)) SeekEntryResult!10223)

(assert (=> b!1392185 (= e!788461 (= (seekEntryOrOpen!0 (select (arr!46003 a!2901) j!112) a!2901 mask!2840) (Found!10223 j!112)))))

(declare-fun b!1392186 () Bool)

(declare-fun res!931513 () Bool)

(assert (=> b!1392186 (=> (not res!931513) (not e!788460))))

(assert (=> b!1392186 (= res!931513 (validKeyInArray!0 (select (arr!46003 a!2901) i!1037)))))

(assert (= (and start!119474 res!931515) b!1392180))

(assert (= (and b!1392180 res!931511) b!1392186))

(assert (= (and b!1392186 res!931513) b!1392182))

(assert (= (and b!1392182 res!931514) b!1392183))

(assert (= (and b!1392183 res!931510) b!1392184))

(assert (= (and b!1392184 res!931512) b!1392181))

(assert (= (and b!1392181 res!931516) b!1392185))

(declare-fun m!1278247 () Bool)

(assert (=> b!1392184 m!1278247))

(declare-fun m!1278249 () Bool)

(assert (=> b!1392185 m!1278249))

(assert (=> b!1392185 m!1278249))

(declare-fun m!1278251 () Bool)

(assert (=> b!1392185 m!1278251))

(assert (=> b!1392182 m!1278249))

(assert (=> b!1392182 m!1278249))

(declare-fun m!1278253 () Bool)

(assert (=> b!1392182 m!1278253))

(assert (=> b!1392181 m!1278249))

(declare-fun m!1278255 () Bool)

(assert (=> b!1392181 m!1278255))

(assert (=> b!1392181 m!1278249))

(declare-fun m!1278257 () Bool)

(assert (=> b!1392181 m!1278257))

(declare-fun m!1278259 () Bool)

(assert (=> b!1392181 m!1278259))

(assert (=> b!1392181 m!1278249))

(declare-fun m!1278261 () Bool)

(assert (=> b!1392181 m!1278261))

(declare-fun m!1278263 () Bool)

(assert (=> b!1392183 m!1278263))

(declare-fun m!1278265 () Bool)

(assert (=> b!1392186 m!1278265))

(assert (=> b!1392186 m!1278265))

(declare-fun m!1278267 () Bool)

(assert (=> b!1392186 m!1278267))

(declare-fun m!1278269 () Bool)

(assert (=> start!119474 m!1278269))

(declare-fun m!1278271 () Bool)

(assert (=> start!119474 m!1278271))

(check-sat (not b!1392181) (not b!1392184) (not start!119474) (not b!1392185) (not b!1392186) (not b!1392183) (not b!1392182))
(check-sat)
(get-model)

(declare-fun d!150617 () Bool)

(assert (=> d!150617 (= (validKeyInArray!0 (select (arr!46003 a!2901) j!112)) (and (not (= (select (arr!46003 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46003 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392182 d!150617))

(declare-fun b!1392239 () Bool)

(declare-fun e!788490 () Bool)

(declare-fun call!66780 () Bool)

(assert (=> b!1392239 (= e!788490 call!66780)))

(declare-fun bm!66777 () Bool)

(declare-fun c!129790 () Bool)

(assert (=> bm!66777 (= call!66780 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129790 (Cons!32505 (select (arr!46003 a!2901) #b00000000000000000000000000000000) Nil!32506) Nil!32506)))))

(declare-fun b!1392240 () Bool)

(assert (=> b!1392240 (= e!788490 call!66780)))

(declare-fun b!1392241 () Bool)

(declare-fun e!788489 () Bool)

(declare-fun contains!9805 (List!32509 (_ BitVec 64)) Bool)

(assert (=> b!1392241 (= e!788489 (contains!9805 Nil!32506 (select (arr!46003 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150619 () Bool)

(declare-fun res!931567 () Bool)

(declare-fun e!788492 () Bool)

(assert (=> d!150619 (=> res!931567 e!788492)))

(assert (=> d!150619 (= res!931567 (bvsge #b00000000000000000000000000000000 (size!46554 a!2901)))))

(assert (=> d!150619 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32506) e!788492)))

(declare-fun b!1392242 () Bool)

(declare-fun e!788491 () Bool)

(assert (=> b!1392242 (= e!788491 e!788490)))

(assert (=> b!1392242 (= c!129790 (validKeyInArray!0 (select (arr!46003 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392243 () Bool)

(assert (=> b!1392243 (= e!788492 e!788491)))

(declare-fun res!931565 () Bool)

(assert (=> b!1392243 (=> (not res!931565) (not e!788491))))

(assert (=> b!1392243 (= res!931565 (not e!788489))))

(declare-fun res!931566 () Bool)

(assert (=> b!1392243 (=> (not res!931566) (not e!788489))))

(assert (=> b!1392243 (= res!931566 (validKeyInArray!0 (select (arr!46003 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150619 (not res!931567)) b!1392243))

(assert (= (and b!1392243 res!931566) b!1392241))

(assert (= (and b!1392243 res!931565) b!1392242))

(assert (= (and b!1392242 c!129790) b!1392240))

(assert (= (and b!1392242 (not c!129790)) b!1392239))

(assert (= (or b!1392240 b!1392239) bm!66777))

(declare-fun m!1278325 () Bool)

(assert (=> bm!66777 m!1278325))

(declare-fun m!1278327 () Bool)

(assert (=> bm!66777 m!1278327))

(assert (=> b!1392241 m!1278325))

(assert (=> b!1392241 m!1278325))

(declare-fun m!1278329 () Bool)

(assert (=> b!1392241 m!1278329))

(assert (=> b!1392242 m!1278325))

(assert (=> b!1392242 m!1278325))

(declare-fun m!1278331 () Bool)

(assert (=> b!1392242 m!1278331))

(assert (=> b!1392243 m!1278325))

(assert (=> b!1392243 m!1278325))

(assert (=> b!1392243 m!1278331))

(assert (=> b!1392184 d!150619))

(declare-fun d!150623 () Bool)

(declare-fun res!931579 () Bool)

(declare-fun e!788509 () Bool)

(assert (=> d!150623 (=> res!931579 e!788509)))

(assert (=> d!150623 (= res!931579 (bvsge #b00000000000000000000000000000000 (size!46554 a!2901)))))

(assert (=> d!150623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788509)))

(declare-fun b!1392264 () Bool)

(declare-fun e!788508 () Bool)

(assert (=> b!1392264 (= e!788509 e!788508)))

(declare-fun c!129796 () Bool)

(assert (=> b!1392264 (= c!129796 (validKeyInArray!0 (select (arr!46003 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392265 () Bool)

(declare-fun call!66786 () Bool)

(assert (=> b!1392265 (= e!788508 call!66786)))

(declare-fun b!1392266 () Bool)

(declare-fun e!788510 () Bool)

(assert (=> b!1392266 (= e!788508 e!788510)))

(declare-fun lt!611476 () (_ BitVec 64))

(assert (=> b!1392266 (= lt!611476 (select (arr!46003 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611475 () Unit!46477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95282 (_ BitVec 64) (_ BitVec 32)) Unit!46477)

(assert (=> b!1392266 (= lt!611475 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611476 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1392266 (arrayContainsKey!0 a!2901 lt!611476 #b00000000000000000000000000000000)))

(declare-fun lt!611477 () Unit!46477)

(assert (=> b!1392266 (= lt!611477 lt!611475)))

(declare-fun res!931578 () Bool)

(assert (=> b!1392266 (= res!931578 (= (seekEntryOrOpen!0 (select (arr!46003 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10223 #b00000000000000000000000000000000)))))

(assert (=> b!1392266 (=> (not res!931578) (not e!788510))))

(declare-fun bm!66783 () Bool)

(assert (=> bm!66783 (= call!66786 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392267 () Bool)

(assert (=> b!1392267 (= e!788510 call!66786)))

(assert (= (and d!150623 (not res!931579)) b!1392264))

(assert (= (and b!1392264 c!129796) b!1392266))

(assert (= (and b!1392264 (not c!129796)) b!1392265))

(assert (= (and b!1392266 res!931578) b!1392267))

(assert (= (or b!1392267 b!1392265) bm!66783))

(assert (=> b!1392264 m!1278325))

(assert (=> b!1392264 m!1278325))

(assert (=> b!1392264 m!1278331))

(assert (=> b!1392266 m!1278325))

(declare-fun m!1278339 () Bool)

(assert (=> b!1392266 m!1278339))

(declare-fun m!1278341 () Bool)

(assert (=> b!1392266 m!1278341))

(assert (=> b!1392266 m!1278325))

(declare-fun m!1278343 () Bool)

(assert (=> b!1392266 m!1278343))

(declare-fun m!1278345 () Bool)

(assert (=> bm!66783 m!1278345))

(assert (=> b!1392183 d!150623))

(declare-fun b!1392326 () Bool)

(declare-fun lt!611501 () SeekEntryResult!10223)

(declare-fun e!788544 () SeekEntryResult!10223)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95282 (_ BitVec 32)) SeekEntryResult!10223)

(assert (=> b!1392326 (= e!788544 (seekKeyOrZeroReturnVacant!0 (x!125094 lt!611501) (index!43265 lt!611501) (index!43265 lt!611501) (select (arr!46003 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392327 () Bool)

(declare-fun e!788546 () SeekEntryResult!10223)

(assert (=> b!1392327 (= e!788546 Undefined!10223)))

(declare-fun b!1392328 () Bool)

(assert (=> b!1392328 (= e!788544 (MissingZero!10223 (index!43265 lt!611501)))))

(declare-fun b!1392330 () Bool)

(declare-fun e!788545 () SeekEntryResult!10223)

(assert (=> b!1392330 (= e!788545 (Found!10223 (index!43265 lt!611501)))))

(declare-fun b!1392331 () Bool)

(assert (=> b!1392331 (= e!788546 e!788545)))

(declare-fun lt!611502 () (_ BitVec 64))

(assert (=> b!1392331 (= lt!611502 (select (arr!46003 a!2901) (index!43265 lt!611501)))))

(declare-fun c!129820 () Bool)

(assert (=> b!1392331 (= c!129820 (= lt!611502 (select (arr!46003 a!2901) j!112)))))

(declare-fun d!150629 () Bool)

(declare-fun lt!611500 () SeekEntryResult!10223)

(assert (=> d!150629 (and (or ((_ is Undefined!10223) lt!611500) (not ((_ is Found!10223) lt!611500)) (and (bvsge (index!43264 lt!611500) #b00000000000000000000000000000000) (bvslt (index!43264 lt!611500) (size!46554 a!2901)))) (or ((_ is Undefined!10223) lt!611500) ((_ is Found!10223) lt!611500) (not ((_ is MissingZero!10223) lt!611500)) (and (bvsge (index!43263 lt!611500) #b00000000000000000000000000000000) (bvslt (index!43263 lt!611500) (size!46554 a!2901)))) (or ((_ is Undefined!10223) lt!611500) ((_ is Found!10223) lt!611500) ((_ is MissingZero!10223) lt!611500) (not ((_ is MissingVacant!10223) lt!611500)) (and (bvsge (index!43266 lt!611500) #b00000000000000000000000000000000) (bvslt (index!43266 lt!611500) (size!46554 a!2901)))) (or ((_ is Undefined!10223) lt!611500) (ite ((_ is Found!10223) lt!611500) (= (select (arr!46003 a!2901) (index!43264 lt!611500)) (select (arr!46003 a!2901) j!112)) (ite ((_ is MissingZero!10223) lt!611500) (= (select (arr!46003 a!2901) (index!43263 lt!611500)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10223) lt!611500) (= (select (arr!46003 a!2901) (index!43266 lt!611500)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150629 (= lt!611500 e!788546)))

(declare-fun c!129821 () Bool)

(assert (=> d!150629 (= c!129821 (and ((_ is Intermediate!10223) lt!611501) (undefined!11035 lt!611501)))))

(assert (=> d!150629 (= lt!611501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46003 a!2901) j!112) mask!2840) (select (arr!46003 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150629 (validMask!0 mask!2840)))

(assert (=> d!150629 (= (seekEntryOrOpen!0 (select (arr!46003 a!2901) j!112) a!2901 mask!2840) lt!611500)))

(declare-fun b!1392329 () Bool)

(declare-fun c!129822 () Bool)

(assert (=> b!1392329 (= c!129822 (= lt!611502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392329 (= e!788545 e!788544)))

(assert (= (and d!150629 c!129821) b!1392327))

(assert (= (and d!150629 (not c!129821)) b!1392331))

(assert (= (and b!1392331 c!129820) b!1392330))

(assert (= (and b!1392331 (not c!129820)) b!1392329))

(assert (= (and b!1392329 c!129822) b!1392328))

(assert (= (and b!1392329 (not c!129822)) b!1392326))

(assert (=> b!1392326 m!1278249))

(declare-fun m!1278361 () Bool)

(assert (=> b!1392326 m!1278361))

(declare-fun m!1278363 () Bool)

(assert (=> b!1392331 m!1278363))

(declare-fun m!1278365 () Bool)

(assert (=> d!150629 m!1278365))

(assert (=> d!150629 m!1278255))

(assert (=> d!150629 m!1278249))

(declare-fun m!1278367 () Bool)

(assert (=> d!150629 m!1278367))

(assert (=> d!150629 m!1278269))

(declare-fun m!1278369 () Bool)

(assert (=> d!150629 m!1278369))

(declare-fun m!1278371 () Bool)

(assert (=> d!150629 m!1278371))

(assert (=> d!150629 m!1278249))

(assert (=> d!150629 m!1278255))

(assert (=> b!1392185 d!150629))

(declare-fun d!150637 () Bool)

(assert (=> d!150637 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119474 d!150637))

(declare-fun d!150647 () Bool)

(assert (=> d!150647 (= (array_inv!35284 a!2901) (bvsge (size!46554 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119474 d!150647))

(declare-fun d!150649 () Bool)

(declare-fun res!931606 () Bool)

(declare-fun e!788566 () Bool)

(assert (=> d!150649 (=> res!931606 e!788566)))

(assert (=> d!150649 (= res!931606 (bvsge j!112 (size!46554 a!2901)))))

(assert (=> d!150649 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788566)))

(declare-fun b!1392358 () Bool)

(declare-fun e!788565 () Bool)

(assert (=> b!1392358 (= e!788566 e!788565)))

(declare-fun c!129830 () Bool)

(assert (=> b!1392358 (= c!129830 (validKeyInArray!0 (select (arr!46003 a!2901) j!112)))))

(declare-fun b!1392359 () Bool)

(declare-fun call!66793 () Bool)

(assert (=> b!1392359 (= e!788565 call!66793)))

(declare-fun b!1392360 () Bool)

(declare-fun e!788567 () Bool)

(assert (=> b!1392360 (= e!788565 e!788567)))

(declare-fun lt!611521 () (_ BitVec 64))

(assert (=> b!1392360 (= lt!611521 (select (arr!46003 a!2901) j!112))))

(declare-fun lt!611520 () Unit!46477)

(assert (=> b!1392360 (= lt!611520 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611521 j!112))))

(assert (=> b!1392360 (arrayContainsKey!0 a!2901 lt!611521 #b00000000000000000000000000000000)))

(declare-fun lt!611522 () Unit!46477)

(assert (=> b!1392360 (= lt!611522 lt!611520)))

(declare-fun res!931605 () Bool)

(assert (=> b!1392360 (= res!931605 (= (seekEntryOrOpen!0 (select (arr!46003 a!2901) j!112) a!2901 mask!2840) (Found!10223 j!112)))))

(assert (=> b!1392360 (=> (not res!931605) (not e!788567))))

(declare-fun bm!66790 () Bool)

(assert (=> bm!66790 (= call!66793 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392361 () Bool)

(assert (=> b!1392361 (= e!788567 call!66793)))

(assert (= (and d!150649 (not res!931606)) b!1392358))

(assert (= (and b!1392358 c!129830) b!1392360))

(assert (= (and b!1392358 (not c!129830)) b!1392359))

(assert (= (and b!1392360 res!931605) b!1392361))

(assert (= (or b!1392361 b!1392359) bm!66790))

(assert (=> b!1392358 m!1278249))

(assert (=> b!1392358 m!1278249))

(assert (=> b!1392358 m!1278253))

(assert (=> b!1392360 m!1278249))

(declare-fun m!1278401 () Bool)

(assert (=> b!1392360 m!1278401))

(declare-fun m!1278403 () Bool)

(assert (=> b!1392360 m!1278403))

(assert (=> b!1392360 m!1278249))

(assert (=> b!1392360 m!1278251))

(declare-fun m!1278405 () Bool)

(assert (=> bm!66790 m!1278405))

(assert (=> b!1392181 d!150649))

(declare-fun d!150651 () Bool)

(assert (=> d!150651 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611528 () Unit!46477)

(declare-fun choose!38 (array!95282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46477)

(assert (=> d!150651 (= lt!611528 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150651 (validMask!0 mask!2840)))

(assert (=> d!150651 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611528)))

(declare-fun bs!40475 () Bool)

(assert (= bs!40475 d!150651))

(assert (=> bs!40475 m!1278257))

(declare-fun m!1278419 () Bool)

(assert (=> bs!40475 m!1278419))

(assert (=> bs!40475 m!1278269))

(assert (=> b!1392181 d!150651))

(declare-fun b!1392403 () Bool)

(declare-fun e!788598 () Bool)

(declare-fun e!788597 () Bool)

(assert (=> b!1392403 (= e!788598 e!788597)))

(declare-fun res!931626 () Bool)

(declare-fun lt!611540 () SeekEntryResult!10223)

(assert (=> b!1392403 (= res!931626 (and ((_ is Intermediate!10223) lt!611540) (not (undefined!11035 lt!611540)) (bvslt (x!125094 lt!611540) #b01111111111111111111111111111110) (bvsge (x!125094 lt!611540) #b00000000000000000000000000000000) (bvsge (x!125094 lt!611540) #b00000000000000000000000000000000)))))

(assert (=> b!1392403 (=> (not res!931626) (not e!788597))))

(declare-fun d!150657 () Bool)

(assert (=> d!150657 e!788598))

(declare-fun c!129843 () Bool)

(assert (=> d!150657 (= c!129843 (and ((_ is Intermediate!10223) lt!611540) (undefined!11035 lt!611540)))))

(declare-fun e!788600 () SeekEntryResult!10223)

(assert (=> d!150657 (= lt!611540 e!788600)))

(declare-fun c!129844 () Bool)

(assert (=> d!150657 (= c!129844 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!611539 () (_ BitVec 64))

(assert (=> d!150657 (= lt!611539 (select (arr!46003 a!2901) lt!611439))))

(assert (=> d!150657 (validMask!0 mask!2840)))

(assert (=> d!150657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!611439 (select (arr!46003 a!2901) j!112) a!2901 mask!2840) lt!611540)))

(declare-fun b!1392404 () Bool)

(assert (=> b!1392404 (= e!788600 (Intermediate!10223 true lt!611439 #b00000000000000000000000000000000))))

(declare-fun b!1392405 () Bool)

(declare-fun e!788599 () SeekEntryResult!10223)

(assert (=> b!1392405 (= e!788599 (Intermediate!10223 false lt!611439 #b00000000000000000000000000000000))))

(declare-fun b!1392406 () Bool)

(assert (=> b!1392406 (and (bvsge (index!43265 lt!611540) #b00000000000000000000000000000000) (bvslt (index!43265 lt!611540) (size!46554 a!2901)))))

(declare-fun e!788596 () Bool)

(assert (=> b!1392406 (= e!788596 (= (select (arr!46003 a!2901) (index!43265 lt!611540)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1392407 () Bool)

(assert (=> b!1392407 (= e!788598 (bvsge (x!125094 lt!611540) #b01111111111111111111111111111110))))

(declare-fun b!1392408 () Bool)

(assert (=> b!1392408 (and (bvsge (index!43265 lt!611540) #b00000000000000000000000000000000) (bvslt (index!43265 lt!611540) (size!46554 a!2901)))))

(declare-fun res!931627 () Bool)

(assert (=> b!1392408 (= res!931627 (= (select (arr!46003 a!2901) (index!43265 lt!611540)) (select (arr!46003 a!2901) j!112)))))

(assert (=> b!1392408 (=> res!931627 e!788596)))

(assert (=> b!1392408 (= e!788597 e!788596)))

(declare-fun b!1392409 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392409 (= e!788599 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!611439 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46003 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392410 () Bool)

(assert (=> b!1392410 (and (bvsge (index!43265 lt!611540) #b00000000000000000000000000000000) (bvslt (index!43265 lt!611540) (size!46554 a!2901)))))

(declare-fun res!931628 () Bool)

(assert (=> b!1392410 (= res!931628 (= (select (arr!46003 a!2901) (index!43265 lt!611540)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392410 (=> res!931628 e!788596)))

(declare-fun b!1392411 () Bool)

(assert (=> b!1392411 (= e!788600 e!788599)))

(declare-fun c!129842 () Bool)

(assert (=> b!1392411 (= c!129842 (or (= lt!611539 (select (arr!46003 a!2901) j!112)) (= (bvadd lt!611539 lt!611539) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!150657 c!129844) b!1392404))

(assert (= (and d!150657 (not c!129844)) b!1392411))

(assert (= (and b!1392411 c!129842) b!1392405))

(assert (= (and b!1392411 (not c!129842)) b!1392409))

(assert (= (and d!150657 c!129843) b!1392407))

(assert (= (and d!150657 (not c!129843)) b!1392403))

(assert (= (and b!1392403 res!931626) b!1392408))

(assert (= (and b!1392408 (not res!931627)) b!1392410))

(assert (= (and b!1392410 (not res!931628)) b!1392406))

(declare-fun m!1278429 () Bool)

(assert (=> b!1392408 m!1278429))

(declare-fun m!1278431 () Bool)

(assert (=> b!1392409 m!1278431))

(assert (=> b!1392409 m!1278431))

(assert (=> b!1392409 m!1278249))

(declare-fun m!1278433 () Bool)

(assert (=> b!1392409 m!1278433))

(declare-fun m!1278435 () Bool)

(assert (=> d!150657 m!1278435))

(assert (=> d!150657 m!1278269))

(assert (=> b!1392406 m!1278429))

(assert (=> b!1392410 m!1278429))

(assert (=> b!1392181 d!150657))

(declare-fun d!150675 () Bool)

(declare-fun lt!611546 () (_ BitVec 32))

(declare-fun lt!611545 () (_ BitVec 32))

(assert (=> d!150675 (= lt!611546 (bvmul (bvxor lt!611545 (bvlshr lt!611545 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150675 (= lt!611545 ((_ extract 31 0) (bvand (bvxor (select (arr!46003 a!2901) j!112) (bvlshr (select (arr!46003 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150675 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931629 (let ((h!33738 ((_ extract 31 0) (bvand (bvxor (select (arr!46003 a!2901) j!112) (bvlshr (select (arr!46003 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125100 (bvmul (bvxor h!33738 (bvlshr h!33738 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125100 (bvlshr x!125100 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931629 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931629 #b00000000000000000000000000000000))))))

(assert (=> d!150675 (= (toIndex!0 (select (arr!46003 a!2901) j!112) mask!2840) (bvand (bvxor lt!611546 (bvlshr lt!611546 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392181 d!150675))

(declare-fun d!150677 () Bool)

(assert (=> d!150677 (= (validKeyInArray!0 (select (arr!46003 a!2901) i!1037)) (and (not (= (select (arr!46003 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46003 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392186 d!150677))

(check-sat (not b!1392241) (not d!150629) (not b!1392243) (not b!1392360) (not b!1392409) (not b!1392326) (not d!150651) (not bm!66777) (not bm!66790) (not b!1392264) (not b!1392358) (not d!150657) (not b!1392266) (not bm!66783) (not b!1392242))
(check-sat)
