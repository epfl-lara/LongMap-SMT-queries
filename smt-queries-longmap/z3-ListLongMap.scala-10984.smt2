; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128600 () Bool)

(assert start!128600)

(declare-fun b!1507637 () Bool)

(declare-fun res!1027960 () Bool)

(declare-fun e!842276 () Bool)

(assert (=> b!1507637 (=> (not res!1027960) (not e!842276))))

(declare-datatypes ((SeekEntryResult!12702 0))(
  ( (MissingZero!12702 (index!53203 (_ BitVec 32))) (Found!12702 (index!53204 (_ BitVec 32))) (Intermediate!12702 (undefined!13514 Bool) (index!53205 (_ BitVec 32)) (x!134962 (_ BitVec 32))) (Undefined!12702) (MissingVacant!12702 (index!53206 (_ BitVec 32))) )
))
(declare-fun lt!654213 () SeekEntryResult!12702)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100534 0))(
  ( (array!100535 (arr!48508 (Array (_ BitVec 32) (_ BitVec 64))) (size!49060 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100534)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100534 (_ BitVec 32)) SeekEntryResult!12702)

(assert (=> b!1507637 (= res!1027960 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48508 a!2804) j!70) a!2804 mask!2512) lt!654213))))

(declare-fun b!1507638 () Bool)

(declare-fun res!1027964 () Bool)

(declare-fun e!842277 () Bool)

(assert (=> b!1507638 (=> (not res!1027964) (not e!842277))))

(declare-datatypes ((List!35069 0))(
  ( (Nil!35066) (Cons!35065 (h!36472 (_ BitVec 64)) (t!49755 List!35069)) )
))
(declare-fun arrayNoDuplicates!0 (array!100534 (_ BitVec 32) List!35069) Bool)

(assert (=> b!1507638 (= res!1027964 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35066))))

(declare-fun b!1507639 () Bool)

(declare-fun res!1027958 () Bool)

(assert (=> b!1507639 (=> (not res!1027958) (not e!842277))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507639 (= res!1027958 (validKeyInArray!0 (select (arr!48508 a!2804) i!961)))))

(declare-fun b!1507640 () Bool)

(declare-fun res!1027959 () Bool)

(assert (=> b!1507640 (=> (not res!1027959) (not e!842277))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507640 (= res!1027959 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49060 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49060 a!2804))))))

(declare-fun res!1027957 () Bool)

(assert (=> start!128600 (=> (not res!1027957) (not e!842277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128600 (= res!1027957 (validMask!0 mask!2512))))

(assert (=> start!128600 e!842277))

(assert (=> start!128600 true))

(declare-fun array_inv!37741 (array!100534) Bool)

(assert (=> start!128600 (array_inv!37741 a!2804)))

(declare-fun b!1507641 () Bool)

(assert (=> b!1507641 (= e!842277 e!842276)))

(declare-fun res!1027962 () Bool)

(assert (=> b!1507641 (=> (not res!1027962) (not e!842276))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507641 (= res!1027962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48508 a!2804) j!70) mask!2512) (select (arr!48508 a!2804) j!70) a!2804 mask!2512) lt!654213))))

(assert (=> b!1507641 (= lt!654213 (Intermediate!12702 false resIndex!21 resX!21))))

(declare-fun b!1507642 () Bool)

(declare-fun res!1027961 () Bool)

(assert (=> b!1507642 (=> (not res!1027961) (not e!842277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100534 (_ BitVec 32)) Bool)

(assert (=> b!1507642 (= res!1027961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507643 () Bool)

(declare-fun res!1027963 () Bool)

(assert (=> b!1507643 (=> (not res!1027963) (not e!842277))))

(assert (=> b!1507643 (= res!1027963 (and (= (size!49060 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49060 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49060 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507644 () Bool)

(declare-fun res!1027956 () Bool)

(assert (=> b!1507644 (=> (not res!1027956) (not e!842277))))

(assert (=> b!1507644 (= res!1027956 (validKeyInArray!0 (select (arr!48508 a!2804) j!70)))))

(declare-fun b!1507645 () Bool)

(assert (=> b!1507645 (= e!842276 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(assert (= (and start!128600 res!1027957) b!1507643))

(assert (= (and b!1507643 res!1027963) b!1507639))

(assert (= (and b!1507639 res!1027958) b!1507644))

(assert (= (and b!1507644 res!1027956) b!1507642))

(assert (= (and b!1507642 res!1027961) b!1507638))

(assert (= (and b!1507638 res!1027964) b!1507640))

(assert (= (and b!1507640 res!1027959) b!1507641))

(assert (= (and b!1507641 res!1027962) b!1507637))

(assert (= (and b!1507637 res!1027960) b!1507645))

(declare-fun m!1389677 () Bool)

(assert (=> b!1507642 m!1389677))

(declare-fun m!1389679 () Bool)

(assert (=> b!1507639 m!1389679))

(assert (=> b!1507639 m!1389679))

(declare-fun m!1389681 () Bool)

(assert (=> b!1507639 m!1389681))

(declare-fun m!1389683 () Bool)

(assert (=> b!1507637 m!1389683))

(assert (=> b!1507637 m!1389683))

(declare-fun m!1389685 () Bool)

(assert (=> b!1507637 m!1389685))

(assert (=> b!1507641 m!1389683))

(assert (=> b!1507641 m!1389683))

(declare-fun m!1389687 () Bool)

(assert (=> b!1507641 m!1389687))

(assert (=> b!1507641 m!1389687))

(assert (=> b!1507641 m!1389683))

(declare-fun m!1389689 () Bool)

(assert (=> b!1507641 m!1389689))

(declare-fun m!1389691 () Bool)

(assert (=> b!1507638 m!1389691))

(assert (=> b!1507644 m!1389683))

(assert (=> b!1507644 m!1389683))

(declare-fun m!1389693 () Bool)

(assert (=> b!1507644 m!1389693))

(declare-fun m!1389695 () Bool)

(assert (=> start!128600 m!1389695))

(declare-fun m!1389697 () Bool)

(assert (=> start!128600 m!1389697))

(check-sat (not b!1507639) (not b!1507637) (not b!1507642) (not b!1507638) (not start!128600) (not b!1507641) (not b!1507644))
(check-sat)
(get-model)

(declare-fun bm!68237 () Bool)

(declare-fun call!68240 () Bool)

(assert (=> bm!68237 (= call!68240 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!158121 () Bool)

(declare-fun res!1028023 () Bool)

(declare-fun e!842302 () Bool)

(assert (=> d!158121 (=> res!1028023 e!842302)))

(assert (=> d!158121 (= res!1028023 (bvsge #b00000000000000000000000000000000 (size!49060 a!2804)))))

(assert (=> d!158121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842302)))

(declare-fun b!1507708 () Bool)

(declare-fun e!842304 () Bool)

(assert (=> b!1507708 (= e!842304 call!68240)))

(declare-fun b!1507709 () Bool)

(declare-fun e!842303 () Bool)

(assert (=> b!1507709 (= e!842303 call!68240)))

(declare-fun b!1507710 () Bool)

(assert (=> b!1507710 (= e!842303 e!842304)))

(declare-fun lt!654228 () (_ BitVec 64))

(assert (=> b!1507710 (= lt!654228 (select (arr!48508 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50173 0))(
  ( (Unit!50174) )
))
(declare-fun lt!654227 () Unit!50173)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100534 (_ BitVec 64) (_ BitVec 32)) Unit!50173)

(assert (=> b!1507710 (= lt!654227 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654228 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507710 (arrayContainsKey!0 a!2804 lt!654228 #b00000000000000000000000000000000)))

(declare-fun lt!654226 () Unit!50173)

(assert (=> b!1507710 (= lt!654226 lt!654227)))

(declare-fun res!1028024 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100534 (_ BitVec 32)) SeekEntryResult!12702)

(assert (=> b!1507710 (= res!1028024 (= (seekEntryOrOpen!0 (select (arr!48508 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12702 #b00000000000000000000000000000000)))))

(assert (=> b!1507710 (=> (not res!1028024) (not e!842304))))

(declare-fun b!1507711 () Bool)

(assert (=> b!1507711 (= e!842302 e!842303)))

(declare-fun c!139384 () Bool)

(assert (=> b!1507711 (= c!139384 (validKeyInArray!0 (select (arr!48508 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158121 (not res!1028023)) b!1507711))

(assert (= (and b!1507711 c!139384) b!1507710))

(assert (= (and b!1507711 (not c!139384)) b!1507709))

(assert (= (and b!1507710 res!1028024) b!1507708))

(assert (= (or b!1507708 b!1507709) bm!68237))

(declare-fun m!1389743 () Bool)

(assert (=> bm!68237 m!1389743))

(declare-fun m!1389745 () Bool)

(assert (=> b!1507710 m!1389745))

(declare-fun m!1389747 () Bool)

(assert (=> b!1507710 m!1389747))

(declare-fun m!1389749 () Bool)

(assert (=> b!1507710 m!1389749))

(assert (=> b!1507710 m!1389745))

(declare-fun m!1389751 () Bool)

(assert (=> b!1507710 m!1389751))

(assert (=> b!1507711 m!1389745))

(assert (=> b!1507711 m!1389745))

(declare-fun m!1389753 () Bool)

(assert (=> b!1507711 m!1389753))

(assert (=> b!1507642 d!158121))

(declare-fun b!1507760 () Bool)

(declare-fun lt!654234 () SeekEntryResult!12702)

(assert (=> b!1507760 (and (bvsge (index!53205 lt!654234) #b00000000000000000000000000000000) (bvslt (index!53205 lt!654234) (size!49060 a!2804)))))

(declare-fun e!842342 () Bool)

(assert (=> b!1507760 (= e!842342 (= (select (arr!48508 a!2804) (index!53205 lt!654234)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507761 () Bool)

(declare-fun e!842340 () Bool)

(assert (=> b!1507761 (= e!842340 (bvsge (x!134962 lt!654234) #b01111111111111111111111111111110))))

(declare-fun e!842343 () SeekEntryResult!12702)

(declare-fun b!1507762 () Bool)

(assert (=> b!1507762 (= e!842343 (Intermediate!12702 true (toIndex!0 (select (arr!48508 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1507763 () Bool)

(assert (=> b!1507763 (and (bvsge (index!53205 lt!654234) #b00000000000000000000000000000000) (bvslt (index!53205 lt!654234) (size!49060 a!2804)))))

(declare-fun res!1028049 () Bool)

(assert (=> b!1507763 (= res!1028049 (= (select (arr!48508 a!2804) (index!53205 lt!654234)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507763 (=> res!1028049 e!842342)))

(declare-fun b!1507765 () Bool)

(declare-fun e!842339 () SeekEntryResult!12702)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507765 (= e!842339 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48508 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48508 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507766 () Bool)

(assert (=> b!1507766 (and (bvsge (index!53205 lt!654234) #b00000000000000000000000000000000) (bvslt (index!53205 lt!654234) (size!49060 a!2804)))))

(declare-fun res!1028051 () Bool)

(assert (=> b!1507766 (= res!1028051 (= (select (arr!48508 a!2804) (index!53205 lt!654234)) (select (arr!48508 a!2804) j!70)))))

(assert (=> b!1507766 (=> res!1028051 e!842342)))

(declare-fun e!842341 () Bool)

(assert (=> b!1507766 (= e!842341 e!842342)))

(declare-fun d!158123 () Bool)

(assert (=> d!158123 e!842340))

(declare-fun c!139398 () Bool)

(get-info :version)

(assert (=> d!158123 (= c!139398 (and ((_ is Intermediate!12702) lt!654234) (undefined!13514 lt!654234)))))

(assert (=> d!158123 (= lt!654234 e!842343)))

(declare-fun c!139397 () Bool)

(assert (=> d!158123 (= c!139397 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!654233 () (_ BitVec 64))

(assert (=> d!158123 (= lt!654233 (select (arr!48508 a!2804) (toIndex!0 (select (arr!48508 a!2804) j!70) mask!2512)))))

(assert (=> d!158123 (validMask!0 mask!2512)))

(assert (=> d!158123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48508 a!2804) j!70) mask!2512) (select (arr!48508 a!2804) j!70) a!2804 mask!2512) lt!654234)))

(declare-fun b!1507764 () Bool)

(assert (=> b!1507764 (= e!842340 e!842341)))

(declare-fun res!1028050 () Bool)

(assert (=> b!1507764 (= res!1028050 (and ((_ is Intermediate!12702) lt!654234) (not (undefined!13514 lt!654234)) (bvslt (x!134962 lt!654234) #b01111111111111111111111111111110) (bvsge (x!134962 lt!654234) #b00000000000000000000000000000000) (bvsge (x!134962 lt!654234) #b00000000000000000000000000000000)))))

(assert (=> b!1507764 (=> (not res!1028050) (not e!842341))))

(declare-fun b!1507767 () Bool)

(assert (=> b!1507767 (= e!842339 (Intermediate!12702 false (toIndex!0 (select (arr!48508 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1507768 () Bool)

(assert (=> b!1507768 (= e!842343 e!842339)))

(declare-fun c!139399 () Bool)

(assert (=> b!1507768 (= c!139399 (or (= lt!654233 (select (arr!48508 a!2804) j!70)) (= (bvadd lt!654233 lt!654233) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!158123 c!139397) b!1507762))

(assert (= (and d!158123 (not c!139397)) b!1507768))

(assert (= (and b!1507768 c!139399) b!1507767))

(assert (= (and b!1507768 (not c!139399)) b!1507765))

(assert (= (and d!158123 c!139398) b!1507761))

(assert (= (and d!158123 (not c!139398)) b!1507764))

(assert (= (and b!1507764 res!1028050) b!1507766))

(assert (= (and b!1507766 (not res!1028051)) b!1507763))

(assert (= (and b!1507763 (not res!1028049)) b!1507760))

(assert (=> d!158123 m!1389687))

(declare-fun m!1389771 () Bool)

(assert (=> d!158123 m!1389771))

(assert (=> d!158123 m!1389695))

(assert (=> b!1507765 m!1389687))

(declare-fun m!1389773 () Bool)

(assert (=> b!1507765 m!1389773))

(assert (=> b!1507765 m!1389773))

(assert (=> b!1507765 m!1389683))

(declare-fun m!1389775 () Bool)

(assert (=> b!1507765 m!1389775))

(declare-fun m!1389777 () Bool)

(assert (=> b!1507760 m!1389777))

(assert (=> b!1507763 m!1389777))

(assert (=> b!1507766 m!1389777))

(assert (=> b!1507641 d!158123))

(declare-fun d!158139 () Bool)

(declare-fun lt!654244 () (_ BitVec 32))

(declare-fun lt!654243 () (_ BitVec 32))

(assert (=> d!158139 (= lt!654244 (bvmul (bvxor lt!654243 (bvlshr lt!654243 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158139 (= lt!654243 ((_ extract 31 0) (bvand (bvxor (select (arr!48508 a!2804) j!70) (bvlshr (select (arr!48508 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158139 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028052 (let ((h!36475 ((_ extract 31 0) (bvand (bvxor (select (arr!48508 a!2804) j!70) (bvlshr (select (arr!48508 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134966 (bvmul (bvxor h!36475 (bvlshr h!36475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134966 (bvlshr x!134966 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028052 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028052 #b00000000000000000000000000000000))))))

(assert (=> d!158139 (= (toIndex!0 (select (arr!48508 a!2804) j!70) mask!2512) (bvand (bvxor lt!654244 (bvlshr lt!654244 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1507641 d!158139))

(declare-fun b!1507815 () Bool)

(declare-fun e!842375 () Bool)

(declare-fun e!842374 () Bool)

(assert (=> b!1507815 (= e!842375 e!842374)))

(declare-fun c!139414 () Bool)

(assert (=> b!1507815 (= c!139414 (validKeyInArray!0 (select (arr!48508 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507816 () Bool)

(declare-fun e!842373 () Bool)

(declare-fun contains!9936 (List!35069 (_ BitVec 64)) Bool)

(assert (=> b!1507816 (= e!842373 (contains!9936 Nil!35066 (select (arr!48508 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68246 () Bool)

(declare-fun call!68249 () Bool)

(assert (=> bm!68246 (= call!68249 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139414 (Cons!35065 (select (arr!48508 a!2804) #b00000000000000000000000000000000) Nil!35066) Nil!35066)))))

(declare-fun d!158145 () Bool)

(declare-fun res!1028072 () Bool)

(declare-fun e!842372 () Bool)

(assert (=> d!158145 (=> res!1028072 e!842372)))

(assert (=> d!158145 (= res!1028072 (bvsge #b00000000000000000000000000000000 (size!49060 a!2804)))))

(assert (=> d!158145 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35066) e!842372)))

(declare-fun b!1507817 () Bool)

(assert (=> b!1507817 (= e!842372 e!842375)))

(declare-fun res!1028073 () Bool)

(assert (=> b!1507817 (=> (not res!1028073) (not e!842375))))

(assert (=> b!1507817 (= res!1028073 (not e!842373))))

(declare-fun res!1028074 () Bool)

(assert (=> b!1507817 (=> (not res!1028074) (not e!842373))))

(assert (=> b!1507817 (= res!1028074 (validKeyInArray!0 (select (arr!48508 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507818 () Bool)

(assert (=> b!1507818 (= e!842374 call!68249)))

(declare-fun b!1507819 () Bool)

(assert (=> b!1507819 (= e!842374 call!68249)))

(assert (= (and d!158145 (not res!1028072)) b!1507817))

(assert (= (and b!1507817 res!1028074) b!1507816))

(assert (= (and b!1507817 res!1028073) b!1507815))

(assert (= (and b!1507815 c!139414) b!1507819))

(assert (= (and b!1507815 (not c!139414)) b!1507818))

(assert (= (or b!1507819 b!1507818) bm!68246))

(assert (=> b!1507815 m!1389745))

(assert (=> b!1507815 m!1389745))

(assert (=> b!1507815 m!1389753))

(assert (=> b!1507816 m!1389745))

(assert (=> b!1507816 m!1389745))

(declare-fun m!1389795 () Bool)

(assert (=> b!1507816 m!1389795))

(assert (=> bm!68246 m!1389745))

(declare-fun m!1389797 () Bool)

(assert (=> bm!68246 m!1389797))

(assert (=> b!1507817 m!1389745))

(assert (=> b!1507817 m!1389745))

(assert (=> b!1507817 m!1389753))

(assert (=> b!1507638 d!158145))

(declare-fun d!158157 () Bool)

(assert (=> d!158157 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128600 d!158157))

(declare-fun d!158159 () Bool)

(assert (=> d!158159 (= (array_inv!37741 a!2804) (bvsge (size!49060 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128600 d!158159))

(declare-fun b!1507859 () Bool)

(declare-fun lt!654271 () SeekEntryResult!12702)

(assert (=> b!1507859 (and (bvsge (index!53205 lt!654271) #b00000000000000000000000000000000) (bvslt (index!53205 lt!654271) (size!49060 a!2804)))))

(declare-fun e!842403 () Bool)

(assert (=> b!1507859 (= e!842403 (= (select (arr!48508 a!2804) (index!53205 lt!654271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507860 () Bool)

(declare-fun e!842401 () Bool)

(assert (=> b!1507860 (= e!842401 (bvsge (x!134962 lt!654271) #b01111111111111111111111111111110))))

(declare-fun b!1507861 () Bool)

(declare-fun e!842404 () SeekEntryResult!12702)

(assert (=> b!1507861 (= e!842404 (Intermediate!12702 true index!487 x!534))))

(declare-fun b!1507862 () Bool)

(assert (=> b!1507862 (and (bvsge (index!53205 lt!654271) #b00000000000000000000000000000000) (bvslt (index!53205 lt!654271) (size!49060 a!2804)))))

(declare-fun res!1028090 () Bool)

(assert (=> b!1507862 (= res!1028090 (= (select (arr!48508 a!2804) (index!53205 lt!654271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507862 (=> res!1028090 e!842403)))

(declare-fun e!842400 () SeekEntryResult!12702)

(declare-fun b!1507864 () Bool)

(assert (=> b!1507864 (= e!842400 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48508 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507865 () Bool)

(assert (=> b!1507865 (and (bvsge (index!53205 lt!654271) #b00000000000000000000000000000000) (bvslt (index!53205 lt!654271) (size!49060 a!2804)))))

(declare-fun res!1028092 () Bool)

(assert (=> b!1507865 (= res!1028092 (= (select (arr!48508 a!2804) (index!53205 lt!654271)) (select (arr!48508 a!2804) j!70)))))

(assert (=> b!1507865 (=> res!1028092 e!842403)))

(declare-fun e!842402 () Bool)

(assert (=> b!1507865 (= e!842402 e!842403)))

(declare-fun d!158163 () Bool)

(assert (=> d!158163 e!842401))

(declare-fun c!139428 () Bool)

(assert (=> d!158163 (= c!139428 (and ((_ is Intermediate!12702) lt!654271) (undefined!13514 lt!654271)))))

(assert (=> d!158163 (= lt!654271 e!842404)))

(declare-fun c!139427 () Bool)

(assert (=> d!158163 (= c!139427 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!654270 () (_ BitVec 64))

(assert (=> d!158163 (= lt!654270 (select (arr!48508 a!2804) index!487))))

(assert (=> d!158163 (validMask!0 mask!2512)))

(assert (=> d!158163 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48508 a!2804) j!70) a!2804 mask!2512) lt!654271)))

(declare-fun b!1507863 () Bool)

(assert (=> b!1507863 (= e!842401 e!842402)))

(declare-fun res!1028091 () Bool)

(assert (=> b!1507863 (= res!1028091 (and ((_ is Intermediate!12702) lt!654271) (not (undefined!13514 lt!654271)) (bvslt (x!134962 lt!654271) #b01111111111111111111111111111110) (bvsge (x!134962 lt!654271) #b00000000000000000000000000000000) (bvsge (x!134962 lt!654271) x!534)))))

(assert (=> b!1507863 (=> (not res!1028091) (not e!842402))))

(declare-fun b!1507866 () Bool)

(assert (=> b!1507866 (= e!842400 (Intermediate!12702 false index!487 x!534))))

(declare-fun b!1507867 () Bool)

(assert (=> b!1507867 (= e!842404 e!842400)))

(declare-fun c!139429 () Bool)

(assert (=> b!1507867 (= c!139429 (or (= lt!654270 (select (arr!48508 a!2804) j!70)) (= (bvadd lt!654270 lt!654270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!158163 c!139427) b!1507861))

(assert (= (and d!158163 (not c!139427)) b!1507867))

(assert (= (and b!1507867 c!139429) b!1507866))

(assert (= (and b!1507867 (not c!139429)) b!1507864))

(assert (= (and d!158163 c!139428) b!1507860))

(assert (= (and d!158163 (not c!139428)) b!1507863))

(assert (= (and b!1507863 res!1028091) b!1507865))

(assert (= (and b!1507865 (not res!1028092)) b!1507862))

(assert (= (and b!1507862 (not res!1028090)) b!1507859))

(declare-fun m!1389815 () Bool)

(assert (=> d!158163 m!1389815))

(assert (=> d!158163 m!1389695))

(declare-fun m!1389817 () Bool)

(assert (=> b!1507864 m!1389817))

(assert (=> b!1507864 m!1389817))

(assert (=> b!1507864 m!1389683))

(declare-fun m!1389819 () Bool)

(assert (=> b!1507864 m!1389819))

(declare-fun m!1389821 () Bool)

(assert (=> b!1507859 m!1389821))

(assert (=> b!1507862 m!1389821))

(assert (=> b!1507865 m!1389821))

(assert (=> b!1507637 d!158163))

(declare-fun d!158165 () Bool)

(assert (=> d!158165 (= (validKeyInArray!0 (select (arr!48508 a!2804) i!961)) (and (not (= (select (arr!48508 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48508 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507639 d!158165))

(declare-fun d!158167 () Bool)

(assert (=> d!158167 (= (validKeyInArray!0 (select (arr!48508 a!2804) j!70)) (and (not (= (select (arr!48508 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48508 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507644 d!158167))

(check-sat (not b!1507816) (not b!1507817) (not b!1507711) (not b!1507710) (not b!1507815) (not d!158123) (not b!1507864) (not bm!68237) (not b!1507765) (not d!158163) (not bm!68246))
(check-sat)
