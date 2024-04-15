; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128534 () Bool)

(assert start!128534)

(declare-fun b!1507142 () Bool)

(declare-fun res!1027566 () Bool)

(declare-fun e!842062 () Bool)

(assert (=> b!1507142 (=> (not res!1027566) (not e!842062))))

(declare-datatypes ((array!100507 0))(
  ( (array!100508 (arr!48496 (Array (_ BitVec 32) (_ BitVec 64))) (size!49048 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100507)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507142 (= res!1027566 (validKeyInArray!0 (select (arr!48496 a!2804) i!961)))))

(declare-fun b!1507143 () Bool)

(declare-fun e!842063 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!654102 () (_ BitVec 32))

(assert (=> b!1507143 (= e!842063 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654102 #b00000000000000000000000000000000) (bvsge lt!654102 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun res!1027567 () Bool)

(assert (=> start!128534 (=> (not res!1027567) (not e!842062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128534 (= res!1027567 (validMask!0 mask!2512))))

(assert (=> start!128534 e!842062))

(assert (=> start!128534 true))

(declare-fun array_inv!37729 (array!100507) Bool)

(assert (=> start!128534 (array_inv!37729 a!2804)))

(declare-fun b!1507144 () Bool)

(declare-fun res!1027568 () Bool)

(assert (=> b!1507144 (=> (not res!1027568) (not e!842062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100507 (_ BitVec 32)) Bool)

(assert (=> b!1507144 (= res!1027568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507145 () Bool)

(assert (=> b!1507145 (= e!842062 e!842063)))

(declare-fun res!1027571 () Bool)

(assert (=> b!1507145 (=> (not res!1027571) (not e!842063))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12690 0))(
  ( (MissingZero!12690 (index!53155 (_ BitVec 32))) (Found!12690 (index!53156 (_ BitVec 32))) (Intermediate!12690 (undefined!13502 Bool) (index!53157 (_ BitVec 32)) (x!134912 (_ BitVec 32))) (Undefined!12690) (MissingVacant!12690 (index!53158 (_ BitVec 32))) )
))
(declare-fun lt!654101 () SeekEntryResult!12690)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100507 (_ BitVec 32)) SeekEntryResult!12690)

(assert (=> b!1507145 (= res!1027571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!654102 (select (arr!48496 a!2804) j!70) a!2804 mask!2512) lt!654101))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507145 (= lt!654101 (Intermediate!12690 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507145 (= lt!654102 (toIndex!0 (select (arr!48496 a!2804) j!70) mask!2512))))

(declare-fun b!1507146 () Bool)

(declare-fun res!1027569 () Bool)

(assert (=> b!1507146 (=> (not res!1027569) (not e!842062))))

(assert (=> b!1507146 (= res!1027569 (and (= (size!49048 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49048 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49048 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507147 () Bool)

(declare-fun res!1027572 () Bool)

(assert (=> b!1507147 (=> (not res!1027572) (not e!842063))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507147 (= res!1027572 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48496 a!2804) j!70) a!2804 mask!2512) lt!654101))))

(declare-fun b!1507148 () Bool)

(declare-fun res!1027574 () Bool)

(assert (=> b!1507148 (=> (not res!1027574) (not e!842062))))

(assert (=> b!1507148 (= res!1027574 (validKeyInArray!0 (select (arr!48496 a!2804) j!70)))))

(declare-fun b!1507149 () Bool)

(declare-fun res!1027570 () Bool)

(assert (=> b!1507149 (=> (not res!1027570) (not e!842062))))

(declare-datatypes ((List!35057 0))(
  ( (Nil!35054) (Cons!35053 (h!36457 (_ BitVec 64)) (t!49743 List!35057)) )
))
(declare-fun arrayNoDuplicates!0 (array!100507 (_ BitVec 32) List!35057) Bool)

(assert (=> b!1507149 (= res!1027570 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35054))))

(declare-fun b!1507150 () Bool)

(declare-fun res!1027573 () Bool)

(assert (=> b!1507150 (=> (not res!1027573) (not e!842062))))

(assert (=> b!1507150 (= res!1027573 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49048 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49048 a!2804))))))

(assert (= (and start!128534 res!1027567) b!1507146))

(assert (= (and b!1507146 res!1027569) b!1507142))

(assert (= (and b!1507142 res!1027566) b!1507148))

(assert (= (and b!1507148 res!1027574) b!1507144))

(assert (= (and b!1507144 res!1027568) b!1507149))

(assert (= (and b!1507149 res!1027570) b!1507150))

(assert (= (and b!1507150 res!1027573) b!1507145))

(assert (= (and b!1507145 res!1027571) b!1507147))

(assert (= (and b!1507147 res!1027572) b!1507143))

(declare-fun m!1389317 () Bool)

(assert (=> b!1507147 m!1389317))

(assert (=> b!1507147 m!1389317))

(declare-fun m!1389319 () Bool)

(assert (=> b!1507147 m!1389319))

(assert (=> b!1507145 m!1389317))

(assert (=> b!1507145 m!1389317))

(declare-fun m!1389321 () Bool)

(assert (=> b!1507145 m!1389321))

(assert (=> b!1507145 m!1389317))

(declare-fun m!1389323 () Bool)

(assert (=> b!1507145 m!1389323))

(declare-fun m!1389325 () Bool)

(assert (=> b!1507144 m!1389325))

(assert (=> b!1507148 m!1389317))

(assert (=> b!1507148 m!1389317))

(declare-fun m!1389327 () Bool)

(assert (=> b!1507148 m!1389327))

(declare-fun m!1389329 () Bool)

(assert (=> b!1507142 m!1389329))

(assert (=> b!1507142 m!1389329))

(declare-fun m!1389331 () Bool)

(assert (=> b!1507142 m!1389331))

(declare-fun m!1389333 () Bool)

(assert (=> start!128534 m!1389333))

(declare-fun m!1389335 () Bool)

(assert (=> start!128534 m!1389335))

(declare-fun m!1389337 () Bool)

(assert (=> b!1507149 m!1389337))

(check-sat (not b!1507148) (not start!128534) (not b!1507145) (not b!1507142) (not b!1507144) (not b!1507147) (not b!1507149))
(check-sat)
(get-model)

(declare-fun d!158059 () Bool)

(assert (=> d!158059 (= (validKeyInArray!0 (select (arr!48496 a!2804) j!70)) (and (not (= (select (arr!48496 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48496 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507148 d!158059))

(declare-fun b!1507215 () Bool)

(declare-fun e!842092 () Bool)

(declare-fun contains!9932 (List!35057 (_ BitVec 64)) Bool)

(assert (=> b!1507215 (= e!842092 (contains!9932 Nil!35054 (select (arr!48496 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68219 () Bool)

(declare-fun call!68222 () Bool)

(declare-fun c!139330 () Bool)

(assert (=> bm!68219 (= call!68222 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139330 (Cons!35053 (select (arr!48496 a!2804) #b00000000000000000000000000000000) Nil!35054) Nil!35054)))))

(declare-fun b!1507216 () Bool)

(declare-fun e!842093 () Bool)

(assert (=> b!1507216 (= e!842093 call!68222)))

(declare-fun b!1507217 () Bool)

(assert (=> b!1507217 (= e!842093 call!68222)))

(declare-fun b!1507218 () Bool)

(declare-fun e!842091 () Bool)

(declare-fun e!842094 () Bool)

(assert (=> b!1507218 (= e!842091 e!842094)))

(declare-fun res!1027637 () Bool)

(assert (=> b!1507218 (=> (not res!1027637) (not e!842094))))

(assert (=> b!1507218 (= res!1027637 (not e!842092))))

(declare-fun res!1027636 () Bool)

(assert (=> b!1507218 (=> (not res!1027636) (not e!842092))))

(assert (=> b!1507218 (= res!1027636 (validKeyInArray!0 (select (arr!48496 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507219 () Bool)

(assert (=> b!1507219 (= e!842094 e!842093)))

(assert (=> b!1507219 (= c!139330 (validKeyInArray!0 (select (arr!48496 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158061 () Bool)

(declare-fun res!1027635 () Bool)

(assert (=> d!158061 (=> res!1027635 e!842091)))

(assert (=> d!158061 (= res!1027635 (bvsge #b00000000000000000000000000000000 (size!49048 a!2804)))))

(assert (=> d!158061 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35054) e!842091)))

(assert (= (and d!158061 (not res!1027635)) b!1507218))

(assert (= (and b!1507218 res!1027636) b!1507215))

(assert (= (and b!1507218 res!1027637) b!1507219))

(assert (= (and b!1507219 c!139330) b!1507216))

(assert (= (and b!1507219 (not c!139330)) b!1507217))

(assert (= (or b!1507216 b!1507217) bm!68219))

(declare-fun m!1389383 () Bool)

(assert (=> b!1507215 m!1389383))

(assert (=> b!1507215 m!1389383))

(declare-fun m!1389385 () Bool)

(assert (=> b!1507215 m!1389385))

(assert (=> bm!68219 m!1389383))

(declare-fun m!1389387 () Bool)

(assert (=> bm!68219 m!1389387))

(assert (=> b!1507218 m!1389383))

(assert (=> b!1507218 m!1389383))

(declare-fun m!1389389 () Bool)

(assert (=> b!1507218 m!1389389))

(assert (=> b!1507219 m!1389383))

(assert (=> b!1507219 m!1389383))

(assert (=> b!1507219 m!1389389))

(assert (=> b!1507149 d!158061))

(declare-fun b!1507238 () Bool)

(declare-fun e!842106 () SeekEntryResult!12690)

(declare-fun e!842108 () SeekEntryResult!12690)

(assert (=> b!1507238 (= e!842106 e!842108)))

(declare-fun lt!654119 () (_ BitVec 64))

(declare-fun c!139339 () Bool)

(assert (=> b!1507238 (= c!139339 (or (= lt!654119 (select (arr!48496 a!2804) j!70)) (= (bvadd lt!654119 lt!654119) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507239 () Bool)

(assert (=> b!1507239 (= e!842106 (Intermediate!12690 true index!487 x!534))))

(declare-fun b!1507240 () Bool)

(declare-fun lt!654120 () SeekEntryResult!12690)

(assert (=> b!1507240 (and (bvsge (index!53157 lt!654120) #b00000000000000000000000000000000) (bvslt (index!53157 lt!654120) (size!49048 a!2804)))))

(declare-fun res!1027646 () Bool)

(assert (=> b!1507240 (= res!1027646 (= (select (arr!48496 a!2804) (index!53157 lt!654120)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842105 () Bool)

(assert (=> b!1507240 (=> res!1027646 e!842105)))

(declare-fun b!1507241 () Bool)

(declare-fun e!842107 () Bool)

(declare-fun e!842109 () Bool)

(assert (=> b!1507241 (= e!842107 e!842109)))

(declare-fun res!1027644 () Bool)

(get-info :version)

(assert (=> b!1507241 (= res!1027644 (and ((_ is Intermediate!12690) lt!654120) (not (undefined!13502 lt!654120)) (bvslt (x!134912 lt!654120) #b01111111111111111111111111111110) (bvsge (x!134912 lt!654120) #b00000000000000000000000000000000) (bvsge (x!134912 lt!654120) x!534)))))

(assert (=> b!1507241 (=> (not res!1027644) (not e!842109))))

(declare-fun b!1507242 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507242 (= e!842108 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48496 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!158063 () Bool)

(assert (=> d!158063 e!842107))

(declare-fun c!139338 () Bool)

(assert (=> d!158063 (= c!139338 (and ((_ is Intermediate!12690) lt!654120) (undefined!13502 lt!654120)))))

(assert (=> d!158063 (= lt!654120 e!842106)))

(declare-fun c!139337 () Bool)

(assert (=> d!158063 (= c!139337 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158063 (= lt!654119 (select (arr!48496 a!2804) index!487))))

(assert (=> d!158063 (validMask!0 mask!2512)))

(assert (=> d!158063 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48496 a!2804) j!70) a!2804 mask!2512) lt!654120)))

(declare-fun b!1507243 () Bool)

(assert (=> b!1507243 (= e!842108 (Intermediate!12690 false index!487 x!534))))

(declare-fun b!1507244 () Bool)

(assert (=> b!1507244 (and (bvsge (index!53157 lt!654120) #b00000000000000000000000000000000) (bvslt (index!53157 lt!654120) (size!49048 a!2804)))))

(declare-fun res!1027645 () Bool)

(assert (=> b!1507244 (= res!1027645 (= (select (arr!48496 a!2804) (index!53157 lt!654120)) (select (arr!48496 a!2804) j!70)))))

(assert (=> b!1507244 (=> res!1027645 e!842105)))

(assert (=> b!1507244 (= e!842109 e!842105)))

(declare-fun b!1507245 () Bool)

(assert (=> b!1507245 (and (bvsge (index!53157 lt!654120) #b00000000000000000000000000000000) (bvslt (index!53157 lt!654120) (size!49048 a!2804)))))

(assert (=> b!1507245 (= e!842105 (= (select (arr!48496 a!2804) (index!53157 lt!654120)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507246 () Bool)

(assert (=> b!1507246 (= e!842107 (bvsge (x!134912 lt!654120) #b01111111111111111111111111111110))))

(assert (= (and d!158063 c!139337) b!1507239))

(assert (= (and d!158063 (not c!139337)) b!1507238))

(assert (= (and b!1507238 c!139339) b!1507243))

(assert (= (and b!1507238 (not c!139339)) b!1507242))

(assert (= (and d!158063 c!139338) b!1507246))

(assert (= (and d!158063 (not c!139338)) b!1507241))

(assert (= (and b!1507241 res!1027644) b!1507244))

(assert (= (and b!1507244 (not res!1027645)) b!1507240))

(assert (= (and b!1507240 (not res!1027646)) b!1507245))

(declare-fun m!1389391 () Bool)

(assert (=> b!1507240 m!1389391))

(declare-fun m!1389393 () Bool)

(assert (=> b!1507242 m!1389393))

(assert (=> b!1507242 m!1389393))

(assert (=> b!1507242 m!1389317))

(declare-fun m!1389395 () Bool)

(assert (=> b!1507242 m!1389395))

(assert (=> b!1507244 m!1389391))

(declare-fun m!1389397 () Bool)

(assert (=> d!158063 m!1389397))

(assert (=> d!158063 m!1389333))

(assert (=> b!1507245 m!1389391))

(assert (=> b!1507147 d!158063))

(declare-fun d!158065 () Bool)

(assert (=> d!158065 (= (validKeyInArray!0 (select (arr!48496 a!2804) i!961)) (and (not (= (select (arr!48496 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48496 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507142 d!158065))

(declare-fun b!1507270 () Bool)

(declare-fun e!842130 () Bool)

(declare-fun call!68228 () Bool)

(assert (=> b!1507270 (= e!842130 call!68228)))

(declare-fun b!1507271 () Bool)

(declare-fun e!842128 () Bool)

(assert (=> b!1507271 (= e!842128 e!842130)))

(declare-fun c!139345 () Bool)

(assert (=> b!1507271 (= c!139345 (validKeyInArray!0 (select (arr!48496 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507272 () Bool)

(declare-fun e!842129 () Bool)

(assert (=> b!1507272 (= e!842130 e!842129)))

(declare-fun lt!654128 () (_ BitVec 64))

(assert (=> b!1507272 (= lt!654128 (select (arr!48496 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50167 0))(
  ( (Unit!50168) )
))
(declare-fun lt!654127 () Unit!50167)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100507 (_ BitVec 64) (_ BitVec 32)) Unit!50167)

(assert (=> b!1507272 (= lt!654127 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654128 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507272 (arrayContainsKey!0 a!2804 lt!654128 #b00000000000000000000000000000000)))

(declare-fun lt!654129 () Unit!50167)

(assert (=> b!1507272 (= lt!654129 lt!654127)))

(declare-fun res!1027661 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100507 (_ BitVec 32)) SeekEntryResult!12690)

(assert (=> b!1507272 (= res!1027661 (= (seekEntryOrOpen!0 (select (arr!48496 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12690 #b00000000000000000000000000000000)))))

(assert (=> b!1507272 (=> (not res!1027661) (not e!842129))))

(declare-fun b!1507273 () Bool)

(assert (=> b!1507273 (= e!842129 call!68228)))

(declare-fun d!158067 () Bool)

(declare-fun res!1027660 () Bool)

(assert (=> d!158067 (=> res!1027660 e!842128)))

(assert (=> d!158067 (= res!1027660 (bvsge #b00000000000000000000000000000000 (size!49048 a!2804)))))

(assert (=> d!158067 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842128)))

(declare-fun bm!68225 () Bool)

(assert (=> bm!68225 (= call!68228 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158067 (not res!1027660)) b!1507271))

(assert (= (and b!1507271 c!139345) b!1507272))

(assert (= (and b!1507271 (not c!139345)) b!1507270))

(assert (= (and b!1507272 res!1027661) b!1507273))

(assert (= (or b!1507273 b!1507270) bm!68225))

(assert (=> b!1507271 m!1389383))

(assert (=> b!1507271 m!1389383))

(assert (=> b!1507271 m!1389389))

(assert (=> b!1507272 m!1389383))

(declare-fun m!1389407 () Bool)

(assert (=> b!1507272 m!1389407))

(declare-fun m!1389409 () Bool)

(assert (=> b!1507272 m!1389409))

(assert (=> b!1507272 m!1389383))

(declare-fun m!1389411 () Bool)

(assert (=> b!1507272 m!1389411))

(declare-fun m!1389413 () Bool)

(assert (=> bm!68225 m!1389413))

(assert (=> b!1507144 d!158067))

(declare-fun d!158075 () Bool)

(assert (=> d!158075 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128534 d!158075))

(declare-fun d!158083 () Bool)

(assert (=> d!158083 (= (array_inv!37729 a!2804) (bvsge (size!49048 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128534 d!158083))

(declare-fun b!1507286 () Bool)

(declare-fun e!842141 () SeekEntryResult!12690)

(declare-fun e!842143 () SeekEntryResult!12690)

(assert (=> b!1507286 (= e!842141 e!842143)))

(declare-fun lt!654139 () (_ BitVec 64))

(declare-fun c!139351 () Bool)

(assert (=> b!1507286 (= c!139351 (or (= lt!654139 (select (arr!48496 a!2804) j!70)) (= (bvadd lt!654139 lt!654139) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507287 () Bool)

(assert (=> b!1507287 (= e!842141 (Intermediate!12690 true lt!654102 #b00000000000000000000000000000000))))

(declare-fun b!1507288 () Bool)

(declare-fun lt!654140 () SeekEntryResult!12690)

(assert (=> b!1507288 (and (bvsge (index!53157 lt!654140) #b00000000000000000000000000000000) (bvslt (index!53157 lt!654140) (size!49048 a!2804)))))

(declare-fun res!1027670 () Bool)

(assert (=> b!1507288 (= res!1027670 (= (select (arr!48496 a!2804) (index!53157 lt!654140)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842140 () Bool)

(assert (=> b!1507288 (=> res!1027670 e!842140)))

(declare-fun b!1507289 () Bool)

(declare-fun e!842142 () Bool)

(declare-fun e!842144 () Bool)

(assert (=> b!1507289 (= e!842142 e!842144)))

(declare-fun res!1027668 () Bool)

(assert (=> b!1507289 (= res!1027668 (and ((_ is Intermediate!12690) lt!654140) (not (undefined!13502 lt!654140)) (bvslt (x!134912 lt!654140) #b01111111111111111111111111111110) (bvsge (x!134912 lt!654140) #b00000000000000000000000000000000) (bvsge (x!134912 lt!654140) #b00000000000000000000000000000000)))))

(assert (=> b!1507289 (=> (not res!1027668) (not e!842144))))

(declare-fun b!1507290 () Bool)

(assert (=> b!1507290 (= e!842143 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!654102 #b00000000000000000000000000000000 mask!2512) (select (arr!48496 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!158085 () Bool)

(assert (=> d!158085 e!842142))

(declare-fun c!139350 () Bool)

(assert (=> d!158085 (= c!139350 (and ((_ is Intermediate!12690) lt!654140) (undefined!13502 lt!654140)))))

(assert (=> d!158085 (= lt!654140 e!842141)))

(declare-fun c!139349 () Bool)

(assert (=> d!158085 (= c!139349 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158085 (= lt!654139 (select (arr!48496 a!2804) lt!654102))))

(assert (=> d!158085 (validMask!0 mask!2512)))

(assert (=> d!158085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!654102 (select (arr!48496 a!2804) j!70) a!2804 mask!2512) lt!654140)))

(declare-fun b!1507291 () Bool)

(assert (=> b!1507291 (= e!842143 (Intermediate!12690 false lt!654102 #b00000000000000000000000000000000))))

(declare-fun b!1507292 () Bool)

(assert (=> b!1507292 (and (bvsge (index!53157 lt!654140) #b00000000000000000000000000000000) (bvslt (index!53157 lt!654140) (size!49048 a!2804)))))

(declare-fun res!1027669 () Bool)

(assert (=> b!1507292 (= res!1027669 (= (select (arr!48496 a!2804) (index!53157 lt!654140)) (select (arr!48496 a!2804) j!70)))))

(assert (=> b!1507292 (=> res!1027669 e!842140)))

(assert (=> b!1507292 (= e!842144 e!842140)))

(declare-fun b!1507293 () Bool)

(assert (=> b!1507293 (and (bvsge (index!53157 lt!654140) #b00000000000000000000000000000000) (bvslt (index!53157 lt!654140) (size!49048 a!2804)))))

(assert (=> b!1507293 (= e!842140 (= (select (arr!48496 a!2804) (index!53157 lt!654140)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507294 () Bool)

(assert (=> b!1507294 (= e!842142 (bvsge (x!134912 lt!654140) #b01111111111111111111111111111110))))

(assert (= (and d!158085 c!139349) b!1507287))

(assert (= (and d!158085 (not c!139349)) b!1507286))

(assert (= (and b!1507286 c!139351) b!1507291))

(assert (= (and b!1507286 (not c!139351)) b!1507290))

(assert (= (and d!158085 c!139350) b!1507294))

(assert (= (and d!158085 (not c!139350)) b!1507289))

(assert (= (and b!1507289 res!1027668) b!1507292))

(assert (= (and b!1507292 (not res!1027669)) b!1507288))

(assert (= (and b!1507288 (not res!1027670)) b!1507293))

(declare-fun m!1389423 () Bool)

(assert (=> b!1507288 m!1389423))

(declare-fun m!1389425 () Bool)

(assert (=> b!1507290 m!1389425))

(assert (=> b!1507290 m!1389425))

(assert (=> b!1507290 m!1389317))

(declare-fun m!1389427 () Bool)

(assert (=> b!1507290 m!1389427))

(assert (=> b!1507292 m!1389423))

(declare-fun m!1389429 () Bool)

(assert (=> d!158085 m!1389429))

(assert (=> d!158085 m!1389333))

(assert (=> b!1507293 m!1389423))

(assert (=> b!1507145 d!158085))

(declare-fun d!158087 () Bool)

(declare-fun lt!654146 () (_ BitVec 32))

(declare-fun lt!654145 () (_ BitVec 32))

(assert (=> d!158087 (= lt!654146 (bvmul (bvxor lt!654145 (bvlshr lt!654145 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158087 (= lt!654145 ((_ extract 31 0) (bvand (bvxor (select (arr!48496 a!2804) j!70) (bvlshr (select (arr!48496 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158087 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1027671 (let ((h!36460 ((_ extract 31 0) (bvand (bvxor (select (arr!48496 a!2804) j!70) (bvlshr (select (arr!48496 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134916 (bvmul (bvxor h!36460 (bvlshr h!36460 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134916 (bvlshr x!134916 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1027671 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1027671 #b00000000000000000000000000000000))))))

(assert (=> d!158087 (= (toIndex!0 (select (arr!48496 a!2804) j!70) mask!2512) (bvand (bvxor lt!654146 (bvlshr lt!654146 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1507145 d!158087))

(check-sat (not bm!68219) (not d!158063) (not b!1507218) (not b!1507242) (not b!1507219) (not b!1507215) (not b!1507272) (not b!1507290) (not d!158085) (not b!1507271) (not bm!68225))
(check-sat)
