; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129482 () Bool)

(assert start!129482)

(declare-fun b!1518111 () Bool)

(declare-fun res!1036843 () Bool)

(declare-fun e!847221 () Bool)

(assert (=> b!1518111 (=> (not res!1036843) (not e!847221))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101152 0))(
  ( (array!101153 (arr!48808 (Array (_ BitVec 32) (_ BitVec 64))) (size!49359 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101152)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518111 (= res!1036843 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49359 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49359 a!2804))))))

(declare-fun b!1518112 () Bool)

(declare-fun e!847224 () Bool)

(assert (=> b!1518112 (= e!847221 e!847224)))

(declare-fun res!1036844 () Bool)

(assert (=> b!1518112 (=> (not res!1036844) (not e!847224))))

(declare-datatypes ((SeekEntryResult!12872 0))(
  ( (MissingZero!12872 (index!53883 (_ BitVec 32))) (Found!12872 (index!53884 (_ BitVec 32))) (Intermediate!12872 (undefined!13684 Bool) (index!53885 (_ BitVec 32)) (x!135779 (_ BitVec 32))) (Undefined!12872) (MissingVacant!12872 (index!53886 (_ BitVec 32))) )
))
(declare-fun lt!658011 () SeekEntryResult!12872)

(declare-fun lt!658012 () SeekEntryResult!12872)

(assert (=> b!1518112 (= res!1036844 (= lt!658011 lt!658012))))

(assert (=> b!1518112 (= lt!658012 (Intermediate!12872 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!12872)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518112 (= lt!658011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48808 a!2804) j!70) mask!2512) (select (arr!48808 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1036839 () Bool)

(assert (=> start!129482 (=> (not res!1036839) (not e!847221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129482 (= res!1036839 (validMask!0 mask!2512))))

(assert (=> start!129482 e!847221))

(assert (=> start!129482 true))

(declare-fun array_inv!38089 (array!101152) Bool)

(assert (=> start!129482 (array_inv!38089 a!2804)))

(declare-fun b!1518113 () Bool)

(declare-fun res!1036838 () Bool)

(assert (=> b!1518113 (=> (not res!1036838) (not e!847221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518113 (= res!1036838 (validKeyInArray!0 (select (arr!48808 a!2804) j!70)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun b!1518114 () Bool)

(assert (=> b!1518114 (= e!847224 (not (or (not (= (select (arr!48808 a!2804) j!70) (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000)))))))

(declare-fun e!847223 () Bool)

(assert (=> b!1518114 e!847223))

(declare-fun res!1036840 () Bool)

(assert (=> b!1518114 (=> (not res!1036840) (not e!847223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101152 (_ BitVec 32)) Bool)

(assert (=> b!1518114 (= res!1036840 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50647 0))(
  ( (Unit!50648) )
))
(declare-fun lt!658010 () Unit!50647)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50647)

(assert (=> b!1518114 (= lt!658010 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518115 () Bool)

(declare-fun res!1036846 () Bool)

(assert (=> b!1518115 (=> (not res!1036846) (not e!847221))))

(assert (=> b!1518115 (= res!1036846 (validKeyInArray!0 (select (arr!48808 a!2804) i!961)))))

(declare-fun b!1518116 () Bool)

(declare-fun res!1036837 () Bool)

(assert (=> b!1518116 (=> (not res!1036837) (not e!847221))))

(assert (=> b!1518116 (= res!1036837 (and (= (size!49359 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49359 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49359 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518117 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!12872)

(assert (=> b!1518117 (= e!847223 (= (seekEntry!0 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) (Found!12872 j!70)))))

(declare-fun b!1518118 () Bool)

(declare-fun res!1036842 () Bool)

(assert (=> b!1518118 (=> (not res!1036842) (not e!847221))))

(assert (=> b!1518118 (= res!1036842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518119 () Bool)

(declare-fun res!1036845 () Bool)

(assert (=> b!1518119 (=> (not res!1036845) (not e!847221))))

(declare-datatypes ((List!35278 0))(
  ( (Nil!35275) (Cons!35274 (h!36701 (_ BitVec 64)) (t!49964 List!35278)) )
))
(declare-fun arrayNoDuplicates!0 (array!101152 (_ BitVec 32) List!35278) Bool)

(assert (=> b!1518119 (= res!1036845 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35275))))

(declare-fun b!1518120 () Bool)

(declare-fun res!1036847 () Bool)

(assert (=> b!1518120 (=> (not res!1036847) (not e!847224))))

(assert (=> b!1518120 (= res!1036847 (= lt!658011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101153 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804)) mask!2512)))))

(declare-fun b!1518121 () Bool)

(declare-fun res!1036841 () Bool)

(assert (=> b!1518121 (=> (not res!1036841) (not e!847224))))

(assert (=> b!1518121 (= res!1036841 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) lt!658012))))

(assert (= (and start!129482 res!1036839) b!1518116))

(assert (= (and b!1518116 res!1036837) b!1518115))

(assert (= (and b!1518115 res!1036846) b!1518113))

(assert (= (and b!1518113 res!1036838) b!1518118))

(assert (= (and b!1518118 res!1036842) b!1518119))

(assert (= (and b!1518119 res!1036845) b!1518111))

(assert (= (and b!1518111 res!1036843) b!1518112))

(assert (= (and b!1518112 res!1036844) b!1518121))

(assert (= (and b!1518121 res!1036841) b!1518120))

(assert (= (and b!1518120 res!1036847) b!1518114))

(assert (= (and b!1518114 res!1036840) b!1518117))

(declare-fun m!1401333 () Bool)

(assert (=> b!1518120 m!1401333))

(declare-fun m!1401335 () Bool)

(assert (=> b!1518120 m!1401335))

(assert (=> b!1518120 m!1401335))

(declare-fun m!1401337 () Bool)

(assert (=> b!1518120 m!1401337))

(assert (=> b!1518120 m!1401337))

(assert (=> b!1518120 m!1401335))

(declare-fun m!1401339 () Bool)

(assert (=> b!1518120 m!1401339))

(declare-fun m!1401341 () Bool)

(assert (=> b!1518113 m!1401341))

(assert (=> b!1518113 m!1401341))

(declare-fun m!1401343 () Bool)

(assert (=> b!1518113 m!1401343))

(declare-fun m!1401345 () Bool)

(assert (=> start!129482 m!1401345))

(declare-fun m!1401347 () Bool)

(assert (=> start!129482 m!1401347))

(assert (=> b!1518121 m!1401341))

(assert (=> b!1518121 m!1401341))

(declare-fun m!1401349 () Bool)

(assert (=> b!1518121 m!1401349))

(assert (=> b!1518112 m!1401341))

(assert (=> b!1518112 m!1401341))

(declare-fun m!1401351 () Bool)

(assert (=> b!1518112 m!1401351))

(assert (=> b!1518112 m!1401351))

(assert (=> b!1518112 m!1401341))

(declare-fun m!1401353 () Bool)

(assert (=> b!1518112 m!1401353))

(declare-fun m!1401355 () Bool)

(assert (=> b!1518115 m!1401355))

(assert (=> b!1518115 m!1401355))

(declare-fun m!1401357 () Bool)

(assert (=> b!1518115 m!1401357))

(declare-fun m!1401359 () Bool)

(assert (=> b!1518119 m!1401359))

(declare-fun m!1401361 () Bool)

(assert (=> b!1518118 m!1401361))

(assert (=> b!1518114 m!1401341))

(declare-fun m!1401363 () Bool)

(assert (=> b!1518114 m!1401363))

(assert (=> b!1518114 m!1401333))

(assert (=> b!1518114 m!1401335))

(declare-fun m!1401365 () Bool)

(assert (=> b!1518114 m!1401365))

(assert (=> b!1518117 m!1401341))

(assert (=> b!1518117 m!1401341))

(declare-fun m!1401367 () Bool)

(assert (=> b!1518117 m!1401367))

(check-sat (not b!1518120) (not b!1518114) (not b!1518112) (not b!1518115) (not start!129482) (not b!1518118) (not b!1518121) (not b!1518113) (not b!1518119) (not b!1518117))
(check-sat)
(get-model)

(declare-fun d!159159 () Bool)

(assert (=> d!159159 (= (validKeyInArray!0 (select (arr!48808 a!2804) j!70)) (and (not (= (select (arr!48808 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48808 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1518113 d!159159))

(declare-fun b!1518196 () Bool)

(declare-fun e!847257 () Bool)

(declare-fun call!68418 () Bool)

(assert (=> b!1518196 (= e!847257 call!68418)))

(declare-fun b!1518197 () Bool)

(declare-fun e!847256 () Bool)

(assert (=> b!1518197 (= e!847256 e!847257)))

(declare-fun lt!658037 () (_ BitVec 64))

(assert (=> b!1518197 (= lt!658037 (select (arr!48808 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!658038 () Unit!50647)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101152 (_ BitVec 64) (_ BitVec 32)) Unit!50647)

(assert (=> b!1518197 (= lt!658038 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658037 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1518197 (arrayContainsKey!0 a!2804 lt!658037 #b00000000000000000000000000000000)))

(declare-fun lt!658039 () Unit!50647)

(assert (=> b!1518197 (= lt!658039 lt!658038)))

(declare-fun res!1036919 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!12872)

(assert (=> b!1518197 (= res!1036919 (= (seekEntryOrOpen!0 (select (arr!48808 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12872 #b00000000000000000000000000000000)))))

(assert (=> b!1518197 (=> (not res!1036919) (not e!847257))))

(declare-fun b!1518198 () Bool)

(declare-fun e!847255 () Bool)

(assert (=> b!1518198 (= e!847255 e!847256)))

(declare-fun c!140191 () Bool)

(assert (=> b!1518198 (= c!140191 (validKeyInArray!0 (select (arr!48808 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1518199 () Bool)

(assert (=> b!1518199 (= e!847256 call!68418)))

(declare-fun d!159161 () Bool)

(declare-fun res!1036918 () Bool)

(assert (=> d!159161 (=> res!1036918 e!847255)))

(assert (=> d!159161 (= res!1036918 (bvsge #b00000000000000000000000000000000 (size!49359 a!2804)))))

(assert (=> d!159161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!847255)))

(declare-fun bm!68415 () Bool)

(assert (=> bm!68415 (= call!68418 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159161 (not res!1036918)) b!1518198))

(assert (= (and b!1518198 c!140191) b!1518197))

(assert (= (and b!1518198 (not c!140191)) b!1518199))

(assert (= (and b!1518197 res!1036919) b!1518196))

(assert (= (or b!1518196 b!1518199) bm!68415))

(declare-fun m!1401441 () Bool)

(assert (=> b!1518197 m!1401441))

(declare-fun m!1401443 () Bool)

(assert (=> b!1518197 m!1401443))

(declare-fun m!1401445 () Bool)

(assert (=> b!1518197 m!1401445))

(assert (=> b!1518197 m!1401441))

(declare-fun m!1401447 () Bool)

(assert (=> b!1518197 m!1401447))

(assert (=> b!1518198 m!1401441))

(assert (=> b!1518198 m!1401441))

(declare-fun m!1401449 () Bool)

(assert (=> b!1518198 m!1401449))

(declare-fun m!1401451 () Bool)

(assert (=> bm!68415 m!1401451))

(assert (=> b!1518118 d!159161))

(declare-fun d!159163 () Bool)

(assert (=> d!159163 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129482 d!159163))

(declare-fun d!159167 () Bool)

(assert (=> d!159167 (= (array_inv!38089 a!2804) (bvsge (size!49359 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129482 d!159167))

(declare-fun b!1518200 () Bool)

(declare-fun e!847260 () Bool)

(declare-fun call!68419 () Bool)

(assert (=> b!1518200 (= e!847260 call!68419)))

(declare-fun b!1518201 () Bool)

(declare-fun e!847259 () Bool)

(assert (=> b!1518201 (= e!847259 e!847260)))

(declare-fun lt!658040 () (_ BitVec 64))

(assert (=> b!1518201 (= lt!658040 (select (arr!48808 a!2804) j!70))))

(declare-fun lt!658041 () Unit!50647)

(assert (=> b!1518201 (= lt!658041 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658040 j!70))))

(assert (=> b!1518201 (arrayContainsKey!0 a!2804 lt!658040 #b00000000000000000000000000000000)))

(declare-fun lt!658042 () Unit!50647)

(assert (=> b!1518201 (= lt!658042 lt!658041)))

(declare-fun res!1036921 () Bool)

(assert (=> b!1518201 (= res!1036921 (= (seekEntryOrOpen!0 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) (Found!12872 j!70)))))

(assert (=> b!1518201 (=> (not res!1036921) (not e!847260))))

(declare-fun b!1518202 () Bool)

(declare-fun e!847258 () Bool)

(assert (=> b!1518202 (= e!847258 e!847259)))

(declare-fun c!140192 () Bool)

(assert (=> b!1518202 (= c!140192 (validKeyInArray!0 (select (arr!48808 a!2804) j!70)))))

(declare-fun b!1518203 () Bool)

(assert (=> b!1518203 (= e!847259 call!68419)))

(declare-fun d!159169 () Bool)

(declare-fun res!1036920 () Bool)

(assert (=> d!159169 (=> res!1036920 e!847258)))

(assert (=> d!159169 (= res!1036920 (bvsge j!70 (size!49359 a!2804)))))

(assert (=> d!159169 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!847258)))

(declare-fun bm!68416 () Bool)

(assert (=> bm!68416 (= call!68419 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159169 (not res!1036920)) b!1518202))

(assert (= (and b!1518202 c!140192) b!1518201))

(assert (= (and b!1518202 (not c!140192)) b!1518203))

(assert (= (and b!1518201 res!1036921) b!1518200))

(assert (= (or b!1518200 b!1518203) bm!68416))

(assert (=> b!1518201 m!1401341))

(declare-fun m!1401453 () Bool)

(assert (=> b!1518201 m!1401453))

(declare-fun m!1401455 () Bool)

(assert (=> b!1518201 m!1401455))

(assert (=> b!1518201 m!1401341))

(declare-fun m!1401457 () Bool)

(assert (=> b!1518201 m!1401457))

(assert (=> b!1518202 m!1401341))

(assert (=> b!1518202 m!1401341))

(assert (=> b!1518202 m!1401343))

(declare-fun m!1401459 () Bool)

(assert (=> bm!68416 m!1401459))

(assert (=> b!1518114 d!159169))

(declare-fun d!159171 () Bool)

(assert (=> d!159171 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!658045 () Unit!50647)

(declare-fun choose!38 (array!101152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50647)

(assert (=> d!159171 (= lt!658045 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159171 (validMask!0 mask!2512)))

(assert (=> d!159171 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!658045)))

(declare-fun bs!43536 () Bool)

(assert (= bs!43536 d!159171))

(assert (=> bs!43536 m!1401365))

(declare-fun m!1401461 () Bool)

(assert (=> bs!43536 m!1401461))

(assert (=> bs!43536 m!1401345))

(assert (=> b!1518114 d!159171))

(declare-fun b!1518255 () Bool)

(declare-fun e!847293 () SeekEntryResult!12872)

(declare-fun lt!658069 () SeekEntryResult!12872)

(get-info :version)

(assert (=> b!1518255 (= e!847293 (ite ((_ is MissingVacant!12872) lt!658069) (MissingZero!12872 (index!53886 lt!658069)) lt!658069))))

(declare-fun lt!658070 () SeekEntryResult!12872)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!12872)

(assert (=> b!1518255 (= lt!658069 (seekKeyOrZeroReturnVacant!0 (x!135779 lt!658070) (index!53885 lt!658070) (index!53885 lt!658070) (select (arr!48808 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518256 () Bool)

(assert (=> b!1518256 (= e!847293 (MissingZero!12872 (index!53885 lt!658070)))))

(declare-fun b!1518257 () Bool)

(declare-fun e!847292 () SeekEntryResult!12872)

(assert (=> b!1518257 (= e!847292 (Found!12872 (index!53885 lt!658070)))))

(declare-fun d!159175 () Bool)

(declare-fun lt!658072 () SeekEntryResult!12872)

(assert (=> d!159175 (and (or ((_ is MissingVacant!12872) lt!658072) (not ((_ is Found!12872) lt!658072)) (and (bvsge (index!53884 lt!658072) #b00000000000000000000000000000000) (bvslt (index!53884 lt!658072) (size!49359 a!2804)))) (not ((_ is MissingVacant!12872) lt!658072)) (or (not ((_ is Found!12872) lt!658072)) (= (select (arr!48808 a!2804) (index!53884 lt!658072)) (select (arr!48808 a!2804) j!70))))))

(declare-fun e!847291 () SeekEntryResult!12872)

(assert (=> d!159175 (= lt!658072 e!847291)))

(declare-fun c!140211 () Bool)

(assert (=> d!159175 (= c!140211 (and ((_ is Intermediate!12872) lt!658070) (undefined!13684 lt!658070)))))

(assert (=> d!159175 (= lt!658070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48808 a!2804) j!70) mask!2512) (select (arr!48808 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159175 (validMask!0 mask!2512)))

(assert (=> d!159175 (= (seekEntry!0 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) lt!658072)))

(declare-fun b!1518258 () Bool)

(declare-fun c!140213 () Bool)

(declare-fun lt!658071 () (_ BitVec 64))

(assert (=> b!1518258 (= c!140213 (= lt!658071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1518258 (= e!847292 e!847293)))

(declare-fun b!1518259 () Bool)

(assert (=> b!1518259 (= e!847291 Undefined!12872)))

(declare-fun b!1518260 () Bool)

(assert (=> b!1518260 (= e!847291 e!847292)))

(assert (=> b!1518260 (= lt!658071 (select (arr!48808 a!2804) (index!53885 lt!658070)))))

(declare-fun c!140212 () Bool)

(assert (=> b!1518260 (= c!140212 (= lt!658071 (select (arr!48808 a!2804) j!70)))))

(assert (= (and d!159175 c!140211) b!1518259))

(assert (= (and d!159175 (not c!140211)) b!1518260))

(assert (= (and b!1518260 c!140212) b!1518257))

(assert (= (and b!1518260 (not c!140212)) b!1518258))

(assert (= (and b!1518258 c!140213) b!1518256))

(assert (= (and b!1518258 (not c!140213)) b!1518255))

(assert (=> b!1518255 m!1401341))

(declare-fun m!1401483 () Bool)

(assert (=> b!1518255 m!1401483))

(declare-fun m!1401485 () Bool)

(assert (=> d!159175 m!1401485))

(assert (=> d!159175 m!1401341))

(assert (=> d!159175 m!1401351))

(assert (=> d!159175 m!1401351))

(assert (=> d!159175 m!1401341))

(assert (=> d!159175 m!1401353))

(assert (=> d!159175 m!1401345))

(declare-fun m!1401487 () Bool)

(assert (=> b!1518260 m!1401487))

(assert (=> b!1518117 d!159175))

(declare-fun e!847330 () SeekEntryResult!12872)

(declare-fun b!1518318 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518318 (= e!847330 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48808 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48808 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518319 () Bool)

(declare-fun e!847332 () SeekEntryResult!12872)

(assert (=> b!1518319 (= e!847332 e!847330)))

(declare-fun c!140232 () Bool)

(declare-fun lt!658105 () (_ BitVec 64))

(assert (=> b!1518319 (= c!140232 (or (= lt!658105 (select (arr!48808 a!2804) j!70)) (= (bvadd lt!658105 lt!658105) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1518320 () Bool)

(declare-fun lt!658104 () SeekEntryResult!12872)

(assert (=> b!1518320 (and (bvsge (index!53885 lt!658104) #b00000000000000000000000000000000) (bvslt (index!53885 lt!658104) (size!49359 a!2804)))))

(declare-fun e!847328 () Bool)

(assert (=> b!1518320 (= e!847328 (= (select (arr!48808 a!2804) (index!53885 lt!658104)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1518321 () Bool)

(assert (=> b!1518321 (and (bvsge (index!53885 lt!658104) #b00000000000000000000000000000000) (bvslt (index!53885 lt!658104) (size!49359 a!2804)))))

(declare-fun res!1036960 () Bool)

(assert (=> b!1518321 (= res!1036960 (= (select (arr!48808 a!2804) (index!53885 lt!658104)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1518321 (=> res!1036960 e!847328)))

(declare-fun b!1518322 () Bool)

(declare-fun e!847329 () Bool)

(declare-fun e!847331 () Bool)

(assert (=> b!1518322 (= e!847329 e!847331)))

(declare-fun res!1036961 () Bool)

(assert (=> b!1518322 (= res!1036961 (and ((_ is Intermediate!12872) lt!658104) (not (undefined!13684 lt!658104)) (bvslt (x!135779 lt!658104) #b01111111111111111111111111111110) (bvsge (x!135779 lt!658104) #b00000000000000000000000000000000) (bvsge (x!135779 lt!658104) #b00000000000000000000000000000000)))))

(assert (=> b!1518322 (=> (not res!1036961) (not e!847331))))

(declare-fun b!1518323 () Bool)

(assert (=> b!1518323 (and (bvsge (index!53885 lt!658104) #b00000000000000000000000000000000) (bvslt (index!53885 lt!658104) (size!49359 a!2804)))))

(declare-fun res!1036962 () Bool)

(assert (=> b!1518323 (= res!1036962 (= (select (arr!48808 a!2804) (index!53885 lt!658104)) (select (arr!48808 a!2804) j!70)))))

(assert (=> b!1518323 (=> res!1036962 e!847328)))

(assert (=> b!1518323 (= e!847331 e!847328)))

(declare-fun b!1518324 () Bool)

(assert (=> b!1518324 (= e!847330 (Intermediate!12872 false (toIndex!0 (select (arr!48808 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159183 () Bool)

(assert (=> d!159183 e!847329))

(declare-fun c!140233 () Bool)

(assert (=> d!159183 (= c!140233 (and ((_ is Intermediate!12872) lt!658104) (undefined!13684 lt!658104)))))

(assert (=> d!159183 (= lt!658104 e!847332)))

(declare-fun c!140234 () Bool)

(assert (=> d!159183 (= c!140234 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159183 (= lt!658105 (select (arr!48808 a!2804) (toIndex!0 (select (arr!48808 a!2804) j!70) mask!2512)))))

(assert (=> d!159183 (validMask!0 mask!2512)))

(assert (=> d!159183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48808 a!2804) j!70) mask!2512) (select (arr!48808 a!2804) j!70) a!2804 mask!2512) lt!658104)))

(declare-fun b!1518325 () Bool)

(assert (=> b!1518325 (= e!847329 (bvsge (x!135779 lt!658104) #b01111111111111111111111111111110))))

(declare-fun b!1518326 () Bool)

(assert (=> b!1518326 (= e!847332 (Intermediate!12872 true (toIndex!0 (select (arr!48808 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159183 c!140234) b!1518326))

(assert (= (and d!159183 (not c!140234)) b!1518319))

(assert (= (and b!1518319 c!140232) b!1518324))

(assert (= (and b!1518319 (not c!140232)) b!1518318))

(assert (= (and d!159183 c!140233) b!1518325))

(assert (= (and d!159183 (not c!140233)) b!1518322))

(assert (= (and b!1518322 res!1036961) b!1518323))

(assert (= (and b!1518323 (not res!1036962)) b!1518321))

(assert (= (and b!1518321 (not res!1036960)) b!1518320))

(assert (=> b!1518318 m!1401351))

(declare-fun m!1401509 () Bool)

(assert (=> b!1518318 m!1401509))

(assert (=> b!1518318 m!1401509))

(assert (=> b!1518318 m!1401341))

(declare-fun m!1401511 () Bool)

(assert (=> b!1518318 m!1401511))

(assert (=> d!159183 m!1401351))

(declare-fun m!1401513 () Bool)

(assert (=> d!159183 m!1401513))

(assert (=> d!159183 m!1401345))

(declare-fun m!1401515 () Bool)

(assert (=> b!1518321 m!1401515))

(assert (=> b!1518320 m!1401515))

(assert (=> b!1518323 m!1401515))

(assert (=> b!1518112 d!159183))

(declare-fun d!159193 () Bool)

(declare-fun lt!658111 () (_ BitVec 32))

(declare-fun lt!658110 () (_ BitVec 32))

(assert (=> d!159193 (= lt!658111 (bvmul (bvxor lt!658110 (bvlshr lt!658110 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159193 (= lt!658110 ((_ extract 31 0) (bvand (bvxor (select (arr!48808 a!2804) j!70) (bvlshr (select (arr!48808 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159193 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1036963 (let ((h!36706 ((_ extract 31 0) (bvand (bvxor (select (arr!48808 a!2804) j!70) (bvlshr (select (arr!48808 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135787 (bvmul (bvxor h!36706 (bvlshr h!36706 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135787 (bvlshr x!135787 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1036963 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1036963 #b00000000000000000000000000000000))))))

(assert (=> d!159193 (= (toIndex!0 (select (arr!48808 a!2804) j!70) mask!2512) (bvand (bvxor lt!658111 (bvlshr lt!658111 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1518112 d!159193))

(declare-fun d!159199 () Bool)

(declare-fun res!1036972 () Bool)

(declare-fun e!847344 () Bool)

(assert (=> d!159199 (=> res!1036972 e!847344)))

(assert (=> d!159199 (= res!1036972 (bvsge #b00000000000000000000000000000000 (size!49359 a!2804)))))

(assert (=> d!159199 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35275) e!847344)))

(declare-fun b!1518341 () Bool)

(declare-fun e!847345 () Bool)

(assert (=> b!1518341 (= e!847344 e!847345)))

(declare-fun res!1036973 () Bool)

(assert (=> b!1518341 (=> (not res!1036973) (not e!847345))))

(declare-fun e!847346 () Bool)

(assert (=> b!1518341 (= res!1036973 (not e!847346))))

(declare-fun res!1036974 () Bool)

(assert (=> b!1518341 (=> (not res!1036974) (not e!847346))))

(assert (=> b!1518341 (= res!1036974 (validKeyInArray!0 (select (arr!48808 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1518342 () Bool)

(declare-fun e!847347 () Bool)

(declare-fun call!68429 () Bool)

(assert (=> b!1518342 (= e!847347 call!68429)))

(declare-fun b!1518343 () Bool)

(assert (=> b!1518343 (= e!847347 call!68429)))

(declare-fun bm!68426 () Bool)

(declare-fun c!140238 () Bool)

(assert (=> bm!68426 (= call!68429 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140238 (Cons!35274 (select (arr!48808 a!2804) #b00000000000000000000000000000000) Nil!35275) Nil!35275)))))

(declare-fun b!1518344 () Bool)

(assert (=> b!1518344 (= e!847345 e!847347)))

(assert (=> b!1518344 (= c!140238 (validKeyInArray!0 (select (arr!48808 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1518345 () Bool)

(declare-fun contains!10021 (List!35278 (_ BitVec 64)) Bool)

(assert (=> b!1518345 (= e!847346 (contains!10021 Nil!35275 (select (arr!48808 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159199 (not res!1036972)) b!1518341))

(assert (= (and b!1518341 res!1036974) b!1518345))

(assert (= (and b!1518341 res!1036973) b!1518344))

(assert (= (and b!1518344 c!140238) b!1518342))

(assert (= (and b!1518344 (not c!140238)) b!1518343))

(assert (= (or b!1518342 b!1518343) bm!68426))

(assert (=> b!1518341 m!1401441))

(assert (=> b!1518341 m!1401441))

(assert (=> b!1518341 m!1401449))

(assert (=> bm!68426 m!1401441))

(declare-fun m!1401525 () Bool)

(assert (=> bm!68426 m!1401525))

(assert (=> b!1518344 m!1401441))

(assert (=> b!1518344 m!1401441))

(assert (=> b!1518344 m!1401449))

(assert (=> b!1518345 m!1401441))

(assert (=> b!1518345 m!1401441))

(declare-fun m!1401527 () Bool)

(assert (=> b!1518345 m!1401527))

(assert (=> b!1518119 d!159199))

(declare-fun b!1518346 () Bool)

(declare-fun e!847350 () SeekEntryResult!12872)

(assert (=> b!1518346 (= e!847350 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101153 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804)) mask!2512))))

(declare-fun b!1518347 () Bool)

(declare-fun e!847352 () SeekEntryResult!12872)

(assert (=> b!1518347 (= e!847352 e!847350)))

(declare-fun c!140239 () Bool)

(declare-fun lt!658118 () (_ BitVec 64))

(assert (=> b!1518347 (= c!140239 (or (= lt!658118 (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!658118 lt!658118) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1518348 () Bool)

(declare-fun lt!658117 () SeekEntryResult!12872)

(assert (=> b!1518348 (and (bvsge (index!53885 lt!658117) #b00000000000000000000000000000000) (bvslt (index!53885 lt!658117) (size!49359 (array!101153 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804)))))))

(declare-fun e!847348 () Bool)

(assert (=> b!1518348 (= e!847348 (= (select (arr!48808 (array!101153 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804))) (index!53885 lt!658117)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1518349 () Bool)

(assert (=> b!1518349 (and (bvsge (index!53885 lt!658117) #b00000000000000000000000000000000) (bvslt (index!53885 lt!658117) (size!49359 (array!101153 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804)))))))

(declare-fun res!1036975 () Bool)

(assert (=> b!1518349 (= res!1036975 (= (select (arr!48808 (array!101153 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804))) (index!53885 lt!658117)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1518349 (=> res!1036975 e!847348)))

(declare-fun b!1518350 () Bool)

(declare-fun e!847349 () Bool)

(declare-fun e!847351 () Bool)

(assert (=> b!1518350 (= e!847349 e!847351)))

(declare-fun res!1036976 () Bool)

(assert (=> b!1518350 (= res!1036976 (and ((_ is Intermediate!12872) lt!658117) (not (undefined!13684 lt!658117)) (bvslt (x!135779 lt!658117) #b01111111111111111111111111111110) (bvsge (x!135779 lt!658117) #b00000000000000000000000000000000) (bvsge (x!135779 lt!658117) #b00000000000000000000000000000000)))))

(assert (=> b!1518350 (=> (not res!1036976) (not e!847351))))

(declare-fun b!1518351 () Bool)

(assert (=> b!1518351 (and (bvsge (index!53885 lt!658117) #b00000000000000000000000000000000) (bvslt (index!53885 lt!658117) (size!49359 (array!101153 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804)))))))

(declare-fun res!1036977 () Bool)

(assert (=> b!1518351 (= res!1036977 (= (select (arr!48808 (array!101153 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804))) (index!53885 lt!658117)) (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1518351 (=> res!1036977 e!847348)))

(assert (=> b!1518351 (= e!847351 e!847348)))

(declare-fun b!1518352 () Bool)

(assert (=> b!1518352 (= e!847350 (Intermediate!12872 false (toIndex!0 (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159207 () Bool)

(assert (=> d!159207 e!847349))

(declare-fun c!140240 () Bool)

(assert (=> d!159207 (= c!140240 (and ((_ is Intermediate!12872) lt!658117) (undefined!13684 lt!658117)))))

(assert (=> d!159207 (= lt!658117 e!847352)))

(declare-fun c!140241 () Bool)

(assert (=> d!159207 (= c!140241 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159207 (= lt!658118 (select (arr!48808 (array!101153 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804))) (toIndex!0 (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159207 (validMask!0 mask!2512)))

(assert (=> d!159207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101153 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804)) mask!2512) lt!658117)))

(declare-fun b!1518353 () Bool)

(assert (=> b!1518353 (= e!847349 (bvsge (x!135779 lt!658117) #b01111111111111111111111111111110))))

(declare-fun b!1518354 () Bool)

(assert (=> b!1518354 (= e!847352 (Intermediate!12872 true (toIndex!0 (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159207 c!140241) b!1518354))

(assert (= (and d!159207 (not c!140241)) b!1518347))

(assert (= (and b!1518347 c!140239) b!1518352))

(assert (= (and b!1518347 (not c!140239)) b!1518346))

(assert (= (and d!159207 c!140240) b!1518353))

(assert (= (and d!159207 (not c!140240)) b!1518350))

(assert (= (and b!1518350 res!1036976) b!1518351))

(assert (= (and b!1518351 (not res!1036977)) b!1518349))

(assert (= (and b!1518349 (not res!1036975)) b!1518348))

(assert (=> b!1518346 m!1401337))

(declare-fun m!1401531 () Bool)

(assert (=> b!1518346 m!1401531))

(assert (=> b!1518346 m!1401531))

(assert (=> b!1518346 m!1401335))

(declare-fun m!1401533 () Bool)

(assert (=> b!1518346 m!1401533))

(assert (=> d!159207 m!1401337))

(declare-fun m!1401535 () Bool)

(assert (=> d!159207 m!1401535))

(assert (=> d!159207 m!1401345))

(declare-fun m!1401537 () Bool)

(assert (=> b!1518349 m!1401537))

(assert (=> b!1518348 m!1401537))

(assert (=> b!1518351 m!1401537))

(assert (=> b!1518120 d!159207))

(declare-fun d!159211 () Bool)

(declare-fun lt!658121 () (_ BitVec 32))

(declare-fun lt!658120 () (_ BitVec 32))

(assert (=> d!159211 (= lt!658121 (bvmul (bvxor lt!658120 (bvlshr lt!658120 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159211 (= lt!658120 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159211 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1036963 (let ((h!36706 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135787 (bvmul (bvxor h!36706 (bvlshr h!36706 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135787 (bvlshr x!135787 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1036963 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1036963 #b00000000000000000000000000000000))))))

(assert (=> d!159211 (= (toIndex!0 (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!658121 (bvlshr lt!658121 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1518120 d!159211))

(declare-fun d!159213 () Bool)

(assert (=> d!159213 (= (validKeyInArray!0 (select (arr!48808 a!2804) i!961)) (and (not (= (select (arr!48808 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48808 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1518115 d!159213))

(declare-fun b!1518357 () Bool)

(declare-fun e!847355 () SeekEntryResult!12872)

(assert (=> b!1518357 (= e!847355 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48808 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518358 () Bool)

(declare-fun e!847357 () SeekEntryResult!12872)

(assert (=> b!1518358 (= e!847357 e!847355)))

(declare-fun lt!658127 () (_ BitVec 64))

(declare-fun c!140242 () Bool)

(assert (=> b!1518358 (= c!140242 (or (= lt!658127 (select (arr!48808 a!2804) j!70)) (= (bvadd lt!658127 lt!658127) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1518359 () Bool)

(declare-fun lt!658126 () SeekEntryResult!12872)

(assert (=> b!1518359 (and (bvsge (index!53885 lt!658126) #b00000000000000000000000000000000) (bvslt (index!53885 lt!658126) (size!49359 a!2804)))))

(declare-fun e!847353 () Bool)

(assert (=> b!1518359 (= e!847353 (= (select (arr!48808 a!2804) (index!53885 lt!658126)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1518360 () Bool)

(assert (=> b!1518360 (and (bvsge (index!53885 lt!658126) #b00000000000000000000000000000000) (bvslt (index!53885 lt!658126) (size!49359 a!2804)))))

(declare-fun res!1036978 () Bool)

(assert (=> b!1518360 (= res!1036978 (= (select (arr!48808 a!2804) (index!53885 lt!658126)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1518360 (=> res!1036978 e!847353)))

(declare-fun b!1518361 () Bool)

(declare-fun e!847354 () Bool)

(declare-fun e!847356 () Bool)

(assert (=> b!1518361 (= e!847354 e!847356)))

(declare-fun res!1036979 () Bool)

(assert (=> b!1518361 (= res!1036979 (and ((_ is Intermediate!12872) lt!658126) (not (undefined!13684 lt!658126)) (bvslt (x!135779 lt!658126) #b01111111111111111111111111111110) (bvsge (x!135779 lt!658126) #b00000000000000000000000000000000) (bvsge (x!135779 lt!658126) x!534)))))

(assert (=> b!1518361 (=> (not res!1036979) (not e!847356))))

(declare-fun b!1518362 () Bool)

(assert (=> b!1518362 (and (bvsge (index!53885 lt!658126) #b00000000000000000000000000000000) (bvslt (index!53885 lt!658126) (size!49359 a!2804)))))

(declare-fun res!1036980 () Bool)

(assert (=> b!1518362 (= res!1036980 (= (select (arr!48808 a!2804) (index!53885 lt!658126)) (select (arr!48808 a!2804) j!70)))))

(assert (=> b!1518362 (=> res!1036980 e!847353)))

(assert (=> b!1518362 (= e!847356 e!847353)))

(declare-fun b!1518363 () Bool)

(assert (=> b!1518363 (= e!847355 (Intermediate!12872 false index!487 x!534))))

(declare-fun d!159215 () Bool)

(assert (=> d!159215 e!847354))

(declare-fun c!140243 () Bool)

(assert (=> d!159215 (= c!140243 (and ((_ is Intermediate!12872) lt!658126) (undefined!13684 lt!658126)))))

(assert (=> d!159215 (= lt!658126 e!847357)))

(declare-fun c!140244 () Bool)

(assert (=> d!159215 (= c!140244 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159215 (= lt!658127 (select (arr!48808 a!2804) index!487))))

(assert (=> d!159215 (validMask!0 mask!2512)))

(assert (=> d!159215 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) lt!658126)))

(declare-fun b!1518364 () Bool)

(assert (=> b!1518364 (= e!847354 (bvsge (x!135779 lt!658126) #b01111111111111111111111111111110))))

(declare-fun b!1518365 () Bool)

(assert (=> b!1518365 (= e!847357 (Intermediate!12872 true index!487 x!534))))

(assert (= (and d!159215 c!140244) b!1518365))

(assert (= (and d!159215 (not c!140244)) b!1518358))

(assert (= (and b!1518358 c!140242) b!1518363))

(assert (= (and b!1518358 (not c!140242)) b!1518357))

(assert (= (and d!159215 c!140243) b!1518364))

(assert (= (and d!159215 (not c!140243)) b!1518361))

(assert (= (and b!1518361 res!1036979) b!1518362))

(assert (= (and b!1518362 (not res!1036980)) b!1518360))

(assert (= (and b!1518360 (not res!1036978)) b!1518359))

(declare-fun m!1401539 () Bool)

(assert (=> b!1518357 m!1401539))

(assert (=> b!1518357 m!1401539))

(assert (=> b!1518357 m!1401341))

(declare-fun m!1401541 () Bool)

(assert (=> b!1518357 m!1401541))

(declare-fun m!1401543 () Bool)

(assert (=> d!159215 m!1401543))

(assert (=> d!159215 m!1401345))

(declare-fun m!1401545 () Bool)

(assert (=> b!1518360 m!1401545))

(assert (=> b!1518359 m!1401545))

(assert (=> b!1518362 m!1401545))

(assert (=> b!1518121 d!159215))

(check-sat (not d!159183) (not d!159207) (not d!159171) (not b!1518197) (not b!1518341) (not b!1518345) (not bm!68426) (not b!1518344) (not b!1518255) (not b!1518346) (not b!1518198) (not b!1518357) (not b!1518202) (not bm!68415) (not d!159175) (not b!1518201) (not d!159215) (not bm!68416) (not b!1518318))
(check-sat)
