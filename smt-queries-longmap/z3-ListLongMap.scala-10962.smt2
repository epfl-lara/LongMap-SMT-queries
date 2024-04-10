; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128372 () Bool)

(assert start!128372)

(declare-fun b!1505928 () Bool)

(declare-fun res!1026324 () Bool)

(declare-fun e!841680 () Bool)

(assert (=> b!1505928 (=> (not res!1026324) (not e!841680))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100444 0))(
  ( (array!100445 (arr!48468 (Array (_ BitVec 32) (_ BitVec 64))) (size!49018 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100444)

(assert (=> b!1505928 (= res!1026324 (and (= (size!49018 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49018 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49018 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1026320 () Bool)

(assert (=> start!128372 (=> (not res!1026320) (not e!841680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128372 (= res!1026320 (validMask!0 mask!2512))))

(assert (=> start!128372 e!841680))

(assert (=> start!128372 true))

(declare-fun array_inv!37496 (array!100444) Bool)

(assert (=> start!128372 (array_inv!37496 a!2804)))

(declare-fun b!1505929 () Bool)

(declare-fun res!1026322 () Bool)

(assert (=> b!1505929 (=> (not res!1026322) (not e!841680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100444 (_ BitVec 32)) Bool)

(assert (=> b!1505929 (= res!1026322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505930 () Bool)

(declare-fun res!1026325 () Bool)

(assert (=> b!1505930 (=> (not res!1026325) (not e!841680))))

(declare-datatypes ((List!34951 0))(
  ( (Nil!34948) (Cons!34947 (h!36344 (_ BitVec 64)) (t!49645 List!34951)) )
))
(declare-fun arrayNoDuplicates!0 (array!100444 (_ BitVec 32) List!34951) Bool)

(assert (=> b!1505930 (= res!1026325 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34948))))

(declare-fun b!1505931 () Bool)

(declare-fun res!1026321 () Bool)

(assert (=> b!1505931 (=> (not res!1026321) (not e!841680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505931 (= res!1026321 (validKeyInArray!0 (select (arr!48468 a!2804) j!70)))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1505932 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1505932 (= e!841680 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49018 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49018 a!2804)) (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(declare-fun b!1505933 () Bool)

(declare-fun res!1026323 () Bool)

(assert (=> b!1505933 (=> (not res!1026323) (not e!841680))))

(assert (=> b!1505933 (= res!1026323 (validKeyInArray!0 (select (arr!48468 a!2804) i!961)))))

(assert (= (and start!128372 res!1026320) b!1505928))

(assert (= (and b!1505928 res!1026324) b!1505933))

(assert (= (and b!1505933 res!1026323) b!1505931))

(assert (= (and b!1505931 res!1026321) b!1505929))

(assert (= (and b!1505929 res!1026322) b!1505930))

(assert (= (and b!1505930 res!1026325) b!1505932))

(declare-fun m!1388987 () Bool)

(assert (=> b!1505930 m!1388987))

(declare-fun m!1388989 () Bool)

(assert (=> b!1505931 m!1388989))

(assert (=> b!1505931 m!1388989))

(declare-fun m!1388991 () Bool)

(assert (=> b!1505931 m!1388991))

(declare-fun m!1388993 () Bool)

(assert (=> b!1505933 m!1388993))

(assert (=> b!1505933 m!1388993))

(declare-fun m!1388995 () Bool)

(assert (=> b!1505933 m!1388995))

(declare-fun m!1388997 () Bool)

(assert (=> start!128372 m!1388997))

(declare-fun m!1388999 () Bool)

(assert (=> start!128372 m!1388999))

(declare-fun m!1389001 () Bool)

(assert (=> b!1505929 m!1389001))

(check-sat (not b!1505930) (not b!1505933) (not b!1505931) (not start!128372) (not b!1505929))
(check-sat)
(get-model)

(declare-fun d!158153 () Bool)

(assert (=> d!158153 (= (validKeyInArray!0 (select (arr!48468 a!2804) j!70)) (and (not (= (select (arr!48468 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48468 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505931 d!158153))

(declare-fun b!1505960 () Bool)

(declare-fun e!841695 () Bool)

(declare-fun call!68205 () Bool)

(assert (=> b!1505960 (= e!841695 call!68205)))

(declare-fun b!1505961 () Bool)

(declare-fun e!841696 () Bool)

(assert (=> b!1505961 (= e!841696 call!68205)))

(declare-fun b!1505962 () Bool)

(assert (=> b!1505962 (= e!841696 e!841695)))

(declare-fun lt!654122 () (_ BitVec 64))

(assert (=> b!1505962 (= lt!654122 (select (arr!48468 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50314 0))(
  ( (Unit!50315) )
))
(declare-fun lt!654123 () Unit!50314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100444 (_ BitVec 64) (_ BitVec 32)) Unit!50314)

(assert (=> b!1505962 (= lt!654123 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654122 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505962 (arrayContainsKey!0 a!2804 lt!654122 #b00000000000000000000000000000000)))

(declare-fun lt!654124 () Unit!50314)

(assert (=> b!1505962 (= lt!654124 lt!654123)))

(declare-fun res!1026349 () Bool)

(declare-datatypes ((SeekEntryResult!12654 0))(
  ( (MissingZero!12654 (index!53011 (_ BitVec 32))) (Found!12654 (index!53012 (_ BitVec 32))) (Intermediate!12654 (undefined!13466 Bool) (index!53013 (_ BitVec 32)) (x!134729 (_ BitVec 32))) (Undefined!12654) (MissingVacant!12654 (index!53014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100444 (_ BitVec 32)) SeekEntryResult!12654)

(assert (=> b!1505962 (= res!1026349 (= (seekEntryOrOpen!0 (select (arr!48468 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12654 #b00000000000000000000000000000000)))))

(assert (=> b!1505962 (=> (not res!1026349) (not e!841695))))

(declare-fun bm!68202 () Bool)

(assert (=> bm!68202 (= call!68205 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505963 () Bool)

(declare-fun e!841694 () Bool)

(assert (=> b!1505963 (= e!841694 e!841696)))

(declare-fun c!139340 () Bool)

(assert (=> b!1505963 (= c!139340 (validKeyInArray!0 (select (arr!48468 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158155 () Bool)

(declare-fun res!1026348 () Bool)

(assert (=> d!158155 (=> res!1026348 e!841694)))

(assert (=> d!158155 (= res!1026348 (bvsge #b00000000000000000000000000000000 (size!49018 a!2804)))))

(assert (=> d!158155 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841694)))

(assert (= (and d!158155 (not res!1026348)) b!1505963))

(assert (= (and b!1505963 c!139340) b!1505962))

(assert (= (and b!1505963 (not c!139340)) b!1505961))

(assert (= (and b!1505962 res!1026349) b!1505960))

(assert (= (or b!1505960 b!1505961) bm!68202))

(declare-fun m!1389019 () Bool)

(assert (=> b!1505962 m!1389019))

(declare-fun m!1389021 () Bool)

(assert (=> b!1505962 m!1389021))

(declare-fun m!1389023 () Bool)

(assert (=> b!1505962 m!1389023))

(assert (=> b!1505962 m!1389019))

(declare-fun m!1389025 () Bool)

(assert (=> b!1505962 m!1389025))

(declare-fun m!1389027 () Bool)

(assert (=> bm!68202 m!1389027))

(assert (=> b!1505963 m!1389019))

(assert (=> b!1505963 m!1389019))

(declare-fun m!1389029 () Bool)

(assert (=> b!1505963 m!1389029))

(assert (=> b!1505929 d!158155))

(declare-fun b!1505974 () Bool)

(declare-fun e!841705 () Bool)

(declare-fun call!68208 () Bool)

(assert (=> b!1505974 (= e!841705 call!68208)))

(declare-fun bm!68205 () Bool)

(declare-fun c!139343 () Bool)

(assert (=> bm!68205 (= call!68208 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139343 (Cons!34947 (select (arr!48468 a!2804) #b00000000000000000000000000000000) Nil!34948) Nil!34948)))))

(declare-fun d!158157 () Bool)

(declare-fun res!1026358 () Bool)

(declare-fun e!841708 () Bool)

(assert (=> d!158157 (=> res!1026358 e!841708)))

(assert (=> d!158157 (= res!1026358 (bvsge #b00000000000000000000000000000000 (size!49018 a!2804)))))

(assert (=> d!158157 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34948) e!841708)))

(declare-fun b!1505975 () Bool)

(declare-fun e!841706 () Bool)

(assert (=> b!1505975 (= e!841708 e!841706)))

(declare-fun res!1026357 () Bool)

(assert (=> b!1505975 (=> (not res!1026357) (not e!841706))))

(declare-fun e!841707 () Bool)

(assert (=> b!1505975 (= res!1026357 (not e!841707))))

(declare-fun res!1026356 () Bool)

(assert (=> b!1505975 (=> (not res!1026356) (not e!841707))))

(assert (=> b!1505975 (= res!1026356 (validKeyInArray!0 (select (arr!48468 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505976 () Bool)

(assert (=> b!1505976 (= e!841705 call!68208)))

(declare-fun b!1505977 () Bool)

(assert (=> b!1505977 (= e!841706 e!841705)))

(assert (=> b!1505977 (= c!139343 (validKeyInArray!0 (select (arr!48468 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505978 () Bool)

(declare-fun contains!9961 (List!34951 (_ BitVec 64)) Bool)

(assert (=> b!1505978 (= e!841707 (contains!9961 Nil!34948 (select (arr!48468 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158157 (not res!1026358)) b!1505975))

(assert (= (and b!1505975 res!1026356) b!1505978))

(assert (= (and b!1505975 res!1026357) b!1505977))

(assert (= (and b!1505977 c!139343) b!1505974))

(assert (= (and b!1505977 (not c!139343)) b!1505976))

(assert (= (or b!1505974 b!1505976) bm!68205))

(assert (=> bm!68205 m!1389019))

(declare-fun m!1389031 () Bool)

(assert (=> bm!68205 m!1389031))

(assert (=> b!1505975 m!1389019))

(assert (=> b!1505975 m!1389019))

(assert (=> b!1505975 m!1389029))

(assert (=> b!1505977 m!1389019))

(assert (=> b!1505977 m!1389019))

(assert (=> b!1505977 m!1389029))

(assert (=> b!1505978 m!1389019))

(assert (=> b!1505978 m!1389019))

(declare-fun m!1389033 () Bool)

(assert (=> b!1505978 m!1389033))

(assert (=> b!1505930 d!158157))

(declare-fun d!158165 () Bool)

(assert (=> d!158165 (= (validKeyInArray!0 (select (arr!48468 a!2804) i!961)) (and (not (= (select (arr!48468 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48468 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505933 d!158165))

(declare-fun d!158167 () Bool)

(assert (=> d!158167 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128372 d!158167))

(declare-fun d!158173 () Bool)

(assert (=> d!158173 (= (array_inv!37496 a!2804) (bvsge (size!49018 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128372 d!158173))

(check-sat (not b!1505962) (not bm!68202) (not b!1505975) (not b!1505963) (not b!1505977) (not bm!68205) (not b!1505978))
(check-sat)
