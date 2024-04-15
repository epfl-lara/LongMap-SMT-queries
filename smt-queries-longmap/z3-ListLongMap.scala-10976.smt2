; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128468 () Bool)

(assert start!128468)

(declare-fun b!1506647 () Bool)

(declare-fun e!841851 () Bool)

(declare-fun e!841849 () Bool)

(assert (=> b!1506647 (= e!841851 e!841849)))

(declare-fun res!1027181 () Bool)

(assert (=> b!1506647 (=> (not res!1027181) (not e!841849))))

(declare-datatypes ((SeekEntryResult!12678 0))(
  ( (MissingZero!12678 (index!53107 (_ BitVec 32))) (Found!12678 (index!53108 (_ BitVec 32))) (Intermediate!12678 (undefined!13490 Bool) (index!53109 (_ BitVec 32)) (x!134862 (_ BitVec 32))) (Undefined!12678) (MissingVacant!12678 (index!53110 (_ BitVec 32))) )
))
(declare-fun lt!653994 () SeekEntryResult!12678)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100480 0))(
  ( (array!100481 (arr!48484 (Array (_ BitVec 32) (_ BitVec 64))) (size!49036 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100480)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100480 (_ BitVec 32)) SeekEntryResult!12678)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506647 (= res!1027181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48484 a!2804) j!70) mask!2512) (select (arr!48484 a!2804) j!70) a!2804 mask!2512) lt!653994))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1506647 (= lt!653994 (Intermediate!12678 false resIndex!21 resX!21))))

(declare-fun b!1506648 () Bool)

(declare-fun res!1027180 () Bool)

(assert (=> b!1506648 (=> (not res!1027180) (not e!841851))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506648 (= res!1027180 (and (= (size!49036 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49036 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49036 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506650 () Bool)

(declare-fun res!1027183 () Bool)

(assert (=> b!1506650 (=> (not res!1027183) (not e!841851))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506650 (= res!1027183 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49036 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49036 a!2804))))))

(declare-fun b!1506651 () Bool)

(declare-fun res!1027177 () Bool)

(assert (=> b!1506651 (=> (not res!1027177) (not e!841851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506651 (= res!1027177 (validKeyInArray!0 (select (arr!48484 a!2804) j!70)))))

(declare-fun b!1506652 () Bool)

(declare-fun res!1027176 () Bool)

(assert (=> b!1506652 (=> (not res!1027176) (not e!841851))))

(assert (=> b!1506652 (= res!1027176 (validKeyInArray!0 (select (arr!48484 a!2804) i!961)))))

(declare-fun b!1506653 () Bool)

(declare-fun res!1027179 () Bool)

(assert (=> b!1506653 (=> (not res!1027179) (not e!841849))))

(assert (=> b!1506653 (= res!1027179 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48484 a!2804) j!70) a!2804 mask!2512) lt!653994))))

(declare-fun res!1027184 () Bool)

(assert (=> start!128468 (=> (not res!1027184) (not e!841851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128468 (= res!1027184 (validMask!0 mask!2512))))

(assert (=> start!128468 e!841851))

(assert (=> start!128468 true))

(declare-fun array_inv!37717 (array!100480) Bool)

(assert (=> start!128468 (array_inv!37717 a!2804)))

(declare-fun b!1506649 () Bool)

(declare-fun res!1027178 () Bool)

(assert (=> b!1506649 (=> (not res!1027178) (not e!841851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100480 (_ BitVec 32)) Bool)

(assert (=> b!1506649 (= res!1027178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506654 () Bool)

(declare-fun res!1027182 () Bool)

(assert (=> b!1506654 (=> (not res!1027182) (not e!841851))))

(declare-datatypes ((List!35045 0))(
  ( (Nil!35042) (Cons!35041 (h!36442 (_ BitVec 64)) (t!49731 List!35045)) )
))
(declare-fun arrayNoDuplicates!0 (array!100480 (_ BitVec 32) List!35045) Bool)

(assert (=> b!1506654 (= res!1027182 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35042))))

(declare-fun b!1506655 () Bool)

(assert (=> b!1506655 (= e!841849 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(assert (= (and start!128468 res!1027184) b!1506648))

(assert (= (and b!1506648 res!1027180) b!1506652))

(assert (= (and b!1506652 res!1027176) b!1506651))

(assert (= (and b!1506651 res!1027177) b!1506649))

(assert (= (and b!1506649 res!1027178) b!1506654))

(assert (= (and b!1506654 res!1027182) b!1506650))

(assert (= (and b!1506650 res!1027183) b!1506647))

(assert (= (and b!1506647 res!1027181) b!1506653))

(assert (= (and b!1506653 res!1027179) b!1506655))

(declare-fun m!1388957 () Bool)

(assert (=> b!1506647 m!1388957))

(assert (=> b!1506647 m!1388957))

(declare-fun m!1388959 () Bool)

(assert (=> b!1506647 m!1388959))

(assert (=> b!1506647 m!1388959))

(assert (=> b!1506647 m!1388957))

(declare-fun m!1388961 () Bool)

(assert (=> b!1506647 m!1388961))

(assert (=> b!1506651 m!1388957))

(assert (=> b!1506651 m!1388957))

(declare-fun m!1388963 () Bool)

(assert (=> b!1506651 m!1388963))

(declare-fun m!1388965 () Bool)

(assert (=> b!1506652 m!1388965))

(assert (=> b!1506652 m!1388965))

(declare-fun m!1388967 () Bool)

(assert (=> b!1506652 m!1388967))

(declare-fun m!1388969 () Bool)

(assert (=> start!128468 m!1388969))

(declare-fun m!1388971 () Bool)

(assert (=> start!128468 m!1388971))

(declare-fun m!1388973 () Bool)

(assert (=> b!1506654 m!1388973))

(declare-fun m!1388975 () Bool)

(assert (=> b!1506649 m!1388975))

(assert (=> b!1506653 m!1388957))

(assert (=> b!1506653 m!1388957))

(declare-fun m!1388977 () Bool)

(assert (=> b!1506653 m!1388977))

(check-sat (not start!128468) (not b!1506647) (not b!1506654) (not b!1506652) (not b!1506649) (not b!1506653) (not b!1506651))
(check-sat)
(get-model)

(declare-fun d!157997 () Bool)

(assert (=> d!157997 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128468 d!157997))

(declare-fun d!157999 () Bool)

(assert (=> d!157999 (= (array_inv!37717 a!2804) (bvsge (size!49036 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128468 d!157999))

(declare-fun e!841895 () SeekEntryResult!12678)

(declare-fun b!1506743 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506743 (= e!841895 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48484 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506744 () Bool)

(declare-fun e!841892 () Bool)

(declare-fun e!841894 () Bool)

(assert (=> b!1506744 (= e!841892 e!841894)))

(declare-fun res!1027255 () Bool)

(declare-fun lt!654005 () SeekEntryResult!12678)

(get-info :version)

(assert (=> b!1506744 (= res!1027255 (and ((_ is Intermediate!12678) lt!654005) (not (undefined!13490 lt!654005)) (bvslt (x!134862 lt!654005) #b01111111111111111111111111111110) (bvsge (x!134862 lt!654005) #b00000000000000000000000000000000) (bvsge (x!134862 lt!654005) x!534)))))

(assert (=> b!1506744 (=> (not res!1027255) (not e!841894))))

(declare-fun b!1506745 () Bool)

(assert (=> b!1506745 (= e!841892 (bvsge (x!134862 lt!654005) #b01111111111111111111111111111110))))

(declare-fun b!1506746 () Bool)

(declare-fun e!841896 () SeekEntryResult!12678)

(assert (=> b!1506746 (= e!841896 (Intermediate!12678 true index!487 x!534))))

(declare-fun d!158001 () Bool)

(assert (=> d!158001 e!841892))

(declare-fun c!139285 () Bool)

(assert (=> d!158001 (= c!139285 (and ((_ is Intermediate!12678) lt!654005) (undefined!13490 lt!654005)))))

(assert (=> d!158001 (= lt!654005 e!841896)))

(declare-fun c!139283 () Bool)

(assert (=> d!158001 (= c!139283 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!654006 () (_ BitVec 64))

(assert (=> d!158001 (= lt!654006 (select (arr!48484 a!2804) index!487))))

(assert (=> d!158001 (validMask!0 mask!2512)))

(assert (=> d!158001 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48484 a!2804) j!70) a!2804 mask!2512) lt!654005)))

(declare-fun b!1506747 () Bool)

(assert (=> b!1506747 (= e!841895 (Intermediate!12678 false index!487 x!534))))

(declare-fun b!1506748 () Bool)

(assert (=> b!1506748 (= e!841896 e!841895)))

(declare-fun c!139284 () Bool)

(assert (=> b!1506748 (= c!139284 (or (= lt!654006 (select (arr!48484 a!2804) j!70)) (= (bvadd lt!654006 lt!654006) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1506749 () Bool)

(assert (=> b!1506749 (and (bvsge (index!53109 lt!654005) #b00000000000000000000000000000000) (bvslt (index!53109 lt!654005) (size!49036 a!2804)))))

(declare-fun res!1027256 () Bool)

(assert (=> b!1506749 (= res!1027256 (= (select (arr!48484 a!2804) (index!53109 lt!654005)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841893 () Bool)

(assert (=> b!1506749 (=> res!1027256 e!841893)))

(declare-fun b!1506750 () Bool)

(assert (=> b!1506750 (and (bvsge (index!53109 lt!654005) #b00000000000000000000000000000000) (bvslt (index!53109 lt!654005) (size!49036 a!2804)))))

(assert (=> b!1506750 (= e!841893 (= (select (arr!48484 a!2804) (index!53109 lt!654005)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1506751 () Bool)

(assert (=> b!1506751 (and (bvsge (index!53109 lt!654005) #b00000000000000000000000000000000) (bvslt (index!53109 lt!654005) (size!49036 a!2804)))))

(declare-fun res!1027254 () Bool)

(assert (=> b!1506751 (= res!1027254 (= (select (arr!48484 a!2804) (index!53109 lt!654005)) (select (arr!48484 a!2804) j!70)))))

(assert (=> b!1506751 (=> res!1027254 e!841893)))

(assert (=> b!1506751 (= e!841894 e!841893)))

(assert (= (and d!158001 c!139283) b!1506746))

(assert (= (and d!158001 (not c!139283)) b!1506748))

(assert (= (and b!1506748 c!139284) b!1506747))

(assert (= (and b!1506748 (not c!139284)) b!1506743))

(assert (= (and d!158001 c!139285) b!1506745))

(assert (= (and d!158001 (not c!139285)) b!1506744))

(assert (= (and b!1506744 res!1027255) b!1506751))

(assert (= (and b!1506751 (not res!1027254)) b!1506749))

(assert (= (and b!1506749 (not res!1027256)) b!1506750))

(declare-fun m!1389031 () Bool)

(assert (=> b!1506751 m!1389031))

(declare-fun m!1389033 () Bool)

(assert (=> d!158001 m!1389033))

(assert (=> d!158001 m!1388969))

(assert (=> b!1506749 m!1389031))

(declare-fun m!1389035 () Bool)

(assert (=> b!1506743 m!1389035))

(assert (=> b!1506743 m!1389035))

(assert (=> b!1506743 m!1388957))

(declare-fun m!1389037 () Bool)

(assert (=> b!1506743 m!1389037))

(assert (=> b!1506750 m!1389031))

(assert (=> b!1506653 d!158001))

(declare-fun d!158023 () Bool)

(declare-fun res!1027268 () Bool)

(declare-fun e!841911 () Bool)

(assert (=> d!158023 (=> res!1027268 e!841911)))

(assert (=> d!158023 (= res!1027268 (bvsge #b00000000000000000000000000000000 (size!49036 a!2804)))))

(assert (=> d!158023 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35042) e!841911)))

(declare-fun b!1506770 () Bool)

(declare-fun e!841913 () Bool)

(declare-fun call!68209 () Bool)

(assert (=> b!1506770 (= e!841913 call!68209)))

(declare-fun b!1506771 () Bool)

(assert (=> b!1506771 (= e!841913 call!68209)))

(declare-fun b!1506772 () Bool)

(declare-fun e!841914 () Bool)

(assert (=> b!1506772 (= e!841911 e!841914)))

(declare-fun res!1027269 () Bool)

(assert (=> b!1506772 (=> (not res!1027269) (not e!841914))))

(declare-fun e!841912 () Bool)

(assert (=> b!1506772 (= res!1027269 (not e!841912))))

(declare-fun res!1027267 () Bool)

(assert (=> b!1506772 (=> (not res!1027267) (not e!841912))))

(assert (=> b!1506772 (= res!1027267 (validKeyInArray!0 (select (arr!48484 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506773 () Bool)

(assert (=> b!1506773 (= e!841914 e!841913)))

(declare-fun c!139290 () Bool)

(assert (=> b!1506773 (= c!139290 (validKeyInArray!0 (select (arr!48484 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506774 () Bool)

(declare-fun contains!9930 (List!35045 (_ BitVec 64)) Bool)

(assert (=> b!1506774 (= e!841912 (contains!9930 Nil!35042 (select (arr!48484 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68206 () Bool)

(assert (=> bm!68206 (= call!68209 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139290 (Cons!35041 (select (arr!48484 a!2804) #b00000000000000000000000000000000) Nil!35042) Nil!35042)))))

(assert (= (and d!158023 (not res!1027268)) b!1506772))

(assert (= (and b!1506772 res!1027267) b!1506774))

(assert (= (and b!1506772 res!1027269) b!1506773))

(assert (= (and b!1506773 c!139290) b!1506770))

(assert (= (and b!1506773 (not c!139290)) b!1506771))

(assert (= (or b!1506770 b!1506771) bm!68206))

(declare-fun m!1389039 () Bool)

(assert (=> b!1506772 m!1389039))

(assert (=> b!1506772 m!1389039))

(declare-fun m!1389041 () Bool)

(assert (=> b!1506772 m!1389041))

(assert (=> b!1506773 m!1389039))

(assert (=> b!1506773 m!1389039))

(assert (=> b!1506773 m!1389041))

(assert (=> b!1506774 m!1389039))

(assert (=> b!1506774 m!1389039))

(declare-fun m!1389043 () Bool)

(assert (=> b!1506774 m!1389043))

(assert (=> bm!68206 m!1389039))

(declare-fun m!1389045 () Bool)

(assert (=> bm!68206 m!1389045))

(assert (=> b!1506654 d!158023))

(declare-fun b!1506814 () Bool)

(declare-fun e!841939 () Bool)

(declare-fun e!841940 () Bool)

(assert (=> b!1506814 (= e!841939 e!841940)))

(declare-fun c!139303 () Bool)

(assert (=> b!1506814 (= c!139303 (validKeyInArray!0 (select (arr!48484 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506815 () Bool)

(declare-fun e!841941 () Bool)

(declare-fun call!68213 () Bool)

(assert (=> b!1506815 (= e!841941 call!68213)))

(declare-fun b!1506816 () Bool)

(assert (=> b!1506816 (= e!841940 call!68213)))

(declare-fun b!1506817 () Bool)

(assert (=> b!1506817 (= e!841940 e!841941)))

(declare-fun lt!654028 () (_ BitVec 64))

(assert (=> b!1506817 (= lt!654028 (select (arr!48484 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50163 0))(
  ( (Unit!50164) )
))
(declare-fun lt!654030 () Unit!50163)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100480 (_ BitVec 64) (_ BitVec 32)) Unit!50163)

(assert (=> b!1506817 (= lt!654030 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654028 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1506817 (arrayContainsKey!0 a!2804 lt!654028 #b00000000000000000000000000000000)))

(declare-fun lt!654029 () Unit!50163)

(assert (=> b!1506817 (= lt!654029 lt!654030)))

(declare-fun res!1027287 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100480 (_ BitVec 32)) SeekEntryResult!12678)

(assert (=> b!1506817 (= res!1027287 (= (seekEntryOrOpen!0 (select (arr!48484 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12678 #b00000000000000000000000000000000)))))

(assert (=> b!1506817 (=> (not res!1027287) (not e!841941))))

(declare-fun bm!68210 () Bool)

(assert (=> bm!68210 (= call!68213 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!158025 () Bool)

(declare-fun res!1027286 () Bool)

(assert (=> d!158025 (=> res!1027286 e!841939)))

(assert (=> d!158025 (= res!1027286 (bvsge #b00000000000000000000000000000000 (size!49036 a!2804)))))

(assert (=> d!158025 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841939)))

(assert (= (and d!158025 (not res!1027286)) b!1506814))

(assert (= (and b!1506814 c!139303) b!1506817))

(assert (= (and b!1506814 (not c!139303)) b!1506816))

(assert (= (and b!1506817 res!1027287) b!1506815))

(assert (= (or b!1506815 b!1506816) bm!68210))

(assert (=> b!1506814 m!1389039))

(assert (=> b!1506814 m!1389039))

(assert (=> b!1506814 m!1389041))

(assert (=> b!1506817 m!1389039))

(declare-fun m!1389063 () Bool)

(assert (=> b!1506817 m!1389063))

(declare-fun m!1389065 () Bool)

(assert (=> b!1506817 m!1389065))

(assert (=> b!1506817 m!1389039))

(declare-fun m!1389067 () Bool)

(assert (=> b!1506817 m!1389067))

(declare-fun m!1389069 () Bool)

(assert (=> bm!68210 m!1389069))

(assert (=> b!1506649 d!158025))

(declare-fun d!158033 () Bool)

(assert (=> d!158033 (= (validKeyInArray!0 (select (arr!48484 a!2804) j!70)) (and (not (= (select (arr!48484 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48484 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506651 d!158033))

(declare-fun d!158035 () Bool)

(assert (=> d!158035 (= (validKeyInArray!0 (select (arr!48484 a!2804) i!961)) (and (not (= (select (arr!48484 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48484 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506652 d!158035))

(declare-fun e!841945 () SeekEntryResult!12678)

(declare-fun b!1506818 () Bool)

(assert (=> b!1506818 (= e!841945 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48484 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48484 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506819 () Bool)

(declare-fun e!841942 () Bool)

(declare-fun e!841944 () Bool)

(assert (=> b!1506819 (= e!841942 e!841944)))

(declare-fun res!1027289 () Bool)

(declare-fun lt!654031 () SeekEntryResult!12678)

(assert (=> b!1506819 (= res!1027289 (and ((_ is Intermediate!12678) lt!654031) (not (undefined!13490 lt!654031)) (bvslt (x!134862 lt!654031) #b01111111111111111111111111111110) (bvsge (x!134862 lt!654031) #b00000000000000000000000000000000) (bvsge (x!134862 lt!654031) #b00000000000000000000000000000000)))))

(assert (=> b!1506819 (=> (not res!1027289) (not e!841944))))

(declare-fun b!1506820 () Bool)

(assert (=> b!1506820 (= e!841942 (bvsge (x!134862 lt!654031) #b01111111111111111111111111111110))))

(declare-fun b!1506821 () Bool)

(declare-fun e!841946 () SeekEntryResult!12678)

(assert (=> b!1506821 (= e!841946 (Intermediate!12678 true (toIndex!0 (select (arr!48484 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!158037 () Bool)

(assert (=> d!158037 e!841942))

(declare-fun c!139306 () Bool)

(assert (=> d!158037 (= c!139306 (and ((_ is Intermediate!12678) lt!654031) (undefined!13490 lt!654031)))))

(assert (=> d!158037 (= lt!654031 e!841946)))

(declare-fun c!139304 () Bool)

(assert (=> d!158037 (= c!139304 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!654032 () (_ BitVec 64))

(assert (=> d!158037 (= lt!654032 (select (arr!48484 a!2804) (toIndex!0 (select (arr!48484 a!2804) j!70) mask!2512)))))

(assert (=> d!158037 (validMask!0 mask!2512)))

(assert (=> d!158037 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48484 a!2804) j!70) mask!2512) (select (arr!48484 a!2804) j!70) a!2804 mask!2512) lt!654031)))

(declare-fun b!1506822 () Bool)

(assert (=> b!1506822 (= e!841945 (Intermediate!12678 false (toIndex!0 (select (arr!48484 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1506823 () Bool)

(assert (=> b!1506823 (= e!841946 e!841945)))

(declare-fun c!139305 () Bool)

(assert (=> b!1506823 (= c!139305 (or (= lt!654032 (select (arr!48484 a!2804) j!70)) (= (bvadd lt!654032 lt!654032) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1506824 () Bool)

(assert (=> b!1506824 (and (bvsge (index!53109 lt!654031) #b00000000000000000000000000000000) (bvslt (index!53109 lt!654031) (size!49036 a!2804)))))

(declare-fun res!1027290 () Bool)

(assert (=> b!1506824 (= res!1027290 (= (select (arr!48484 a!2804) (index!53109 lt!654031)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841943 () Bool)

(assert (=> b!1506824 (=> res!1027290 e!841943)))

(declare-fun b!1506825 () Bool)

(assert (=> b!1506825 (and (bvsge (index!53109 lt!654031) #b00000000000000000000000000000000) (bvslt (index!53109 lt!654031) (size!49036 a!2804)))))

(assert (=> b!1506825 (= e!841943 (= (select (arr!48484 a!2804) (index!53109 lt!654031)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1506826 () Bool)

(assert (=> b!1506826 (and (bvsge (index!53109 lt!654031) #b00000000000000000000000000000000) (bvslt (index!53109 lt!654031) (size!49036 a!2804)))))

(declare-fun res!1027288 () Bool)

(assert (=> b!1506826 (= res!1027288 (= (select (arr!48484 a!2804) (index!53109 lt!654031)) (select (arr!48484 a!2804) j!70)))))

(assert (=> b!1506826 (=> res!1027288 e!841943)))

(assert (=> b!1506826 (= e!841944 e!841943)))

(assert (= (and d!158037 c!139304) b!1506821))

(assert (= (and d!158037 (not c!139304)) b!1506823))

(assert (= (and b!1506823 c!139305) b!1506822))

(assert (= (and b!1506823 (not c!139305)) b!1506818))

(assert (= (and d!158037 c!139306) b!1506820))

(assert (= (and d!158037 (not c!139306)) b!1506819))

(assert (= (and b!1506819 res!1027289) b!1506826))

(assert (= (and b!1506826 (not res!1027288)) b!1506824))

(assert (= (and b!1506824 (not res!1027290)) b!1506825))

(declare-fun m!1389071 () Bool)

(assert (=> b!1506826 m!1389071))

(assert (=> d!158037 m!1388959))

(declare-fun m!1389073 () Bool)

(assert (=> d!158037 m!1389073))

(assert (=> d!158037 m!1388969))

(assert (=> b!1506824 m!1389071))

(assert (=> b!1506818 m!1388959))

(declare-fun m!1389075 () Bool)

(assert (=> b!1506818 m!1389075))

(assert (=> b!1506818 m!1389075))

(assert (=> b!1506818 m!1388957))

(declare-fun m!1389077 () Bool)

(assert (=> b!1506818 m!1389077))

(assert (=> b!1506825 m!1389071))

(assert (=> b!1506647 d!158037))

(declare-fun d!158039 () Bool)

(declare-fun lt!654050 () (_ BitVec 32))

(declare-fun lt!654049 () (_ BitVec 32))

(assert (=> d!158039 (= lt!654050 (bvmul (bvxor lt!654049 (bvlshr lt!654049 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158039 (= lt!654049 ((_ extract 31 0) (bvand (bvxor (select (arr!48484 a!2804) j!70) (bvlshr (select (arr!48484 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158039 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1027291 (let ((h!36446 ((_ extract 31 0) (bvand (bvxor (select (arr!48484 a!2804) j!70) (bvlshr (select (arr!48484 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134868 (bvmul (bvxor h!36446 (bvlshr h!36446 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134868 (bvlshr x!134868 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1027291 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1027291 #b00000000000000000000000000000000))))))

(assert (=> d!158039 (= (toIndex!0 (select (arr!48484 a!2804) j!70) mask!2512) (bvand (bvxor lt!654050 (bvlshr lt!654050 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1506647 d!158039))

(check-sat (not d!158037) (not d!158001) (not b!1506818) (not b!1506814) (not b!1506772) (not b!1506773) (not b!1506774) (not b!1506743) (not bm!68210) (not bm!68206) (not b!1506817))
(check-sat)
