; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129436 () Bool)

(assert start!129436)

(declare-fun b!1520173 () Bool)

(declare-fun res!1039771 () Bool)

(declare-fun e!847972 () Bool)

(assert (=> b!1520173 (=> (not res!1039771) (not e!847972))))

(declare-datatypes ((SeekEntryResult!13013 0))(
  ( (MissingZero!13013 (index!54447 (_ BitVec 32))) (Found!13013 (index!54448 (_ BitVec 32))) (Intermediate!13013 (undefined!13825 Bool) (index!54449 (_ BitVec 32)) (x!136125 (_ BitVec 32))) (Undefined!13013) (MissingVacant!13013 (index!54450 (_ BitVec 32))) )
))
(declare-fun lt!658962 () SeekEntryResult!13013)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101213 0))(
  ( (array!101214 (arr!48842 (Array (_ BitVec 32) (_ BitVec 64))) (size!49392 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101213 (_ BitVec 32)) SeekEntryResult!13013)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520173 (= res!1039771 (= lt!658962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101214 (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804)) mask!2512)))))

(declare-fun e!847973 () Bool)

(declare-fun b!1520174 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101213 (_ BitVec 32)) SeekEntryResult!13013)

(assert (=> b!1520174 (= e!847973 (= (seekEntry!0 (select (arr!48842 a!2804) j!70) a!2804 mask!2512) (Found!13013 j!70)))))

(declare-fun b!1520175 () Bool)

(declare-fun res!1039765 () Bool)

(declare-fun e!847974 () Bool)

(assert (=> b!1520175 (=> (not res!1039765) (not e!847974))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1520175 (= res!1039765 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49392 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49392 a!2804))))))

(declare-fun b!1520176 () Bool)

(declare-fun res!1039769 () Bool)

(assert (=> b!1520176 (=> (not res!1039769) (not e!847972))))

(declare-fun lt!658961 () SeekEntryResult!13013)

(assert (=> b!1520176 (= res!1039769 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48842 a!2804) j!70) a!2804 mask!2512) lt!658961))))

(declare-fun res!1039767 () Bool)

(assert (=> start!129436 (=> (not res!1039767) (not e!847974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129436 (= res!1039767 (validMask!0 mask!2512))))

(assert (=> start!129436 e!847974))

(assert (=> start!129436 true))

(declare-fun array_inv!37870 (array!101213) Bool)

(assert (=> start!129436 (array_inv!37870 a!2804)))

(declare-fun b!1520177 () Bool)

(declare-fun res!1039766 () Bool)

(assert (=> b!1520177 (=> (not res!1039766) (not e!847974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101213 (_ BitVec 32)) Bool)

(assert (=> b!1520177 (= res!1039766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520178 () Bool)

(declare-fun res!1039764 () Bool)

(assert (=> b!1520178 (=> (not res!1039764) (not e!847974))))

(declare-datatypes ((List!35325 0))(
  ( (Nil!35322) (Cons!35321 (h!36736 (_ BitVec 64)) (t!50019 List!35325)) )
))
(declare-fun arrayNoDuplicates!0 (array!101213 (_ BitVec 32) List!35325) Bool)

(assert (=> b!1520178 (= res!1039764 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35322))))

(declare-fun b!1520179 () Bool)

(declare-fun res!1039762 () Bool)

(assert (=> b!1520179 (=> (not res!1039762) (not e!847974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520179 (= res!1039762 (validKeyInArray!0 (select (arr!48842 a!2804) i!961)))))

(declare-fun b!1520180 () Bool)

(assert (=> b!1520180 (= e!847972 (not (or (not (= (select (arr!48842 a!2804) j!70) (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48842 a!2804) index!487) (select (arr!48842 a!2804) j!70))) (= j!70 index!487))))))

(assert (=> b!1520180 e!847973))

(declare-fun res!1039761 () Bool)

(assert (=> b!1520180 (=> (not res!1039761) (not e!847973))))

(assert (=> b!1520180 (= res!1039761 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50894 0))(
  ( (Unit!50895) )
))
(declare-fun lt!658963 () Unit!50894)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50894)

(assert (=> b!1520180 (= lt!658963 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520181 () Bool)

(declare-fun res!1039768 () Bool)

(assert (=> b!1520181 (=> (not res!1039768) (not e!847974))))

(assert (=> b!1520181 (= res!1039768 (validKeyInArray!0 (select (arr!48842 a!2804) j!70)))))

(declare-fun b!1520182 () Bool)

(declare-fun res!1039763 () Bool)

(assert (=> b!1520182 (=> (not res!1039763) (not e!847974))))

(assert (=> b!1520182 (= res!1039763 (and (= (size!49392 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49392 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49392 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520183 () Bool)

(assert (=> b!1520183 (= e!847974 e!847972)))

(declare-fun res!1039770 () Bool)

(assert (=> b!1520183 (=> (not res!1039770) (not e!847972))))

(assert (=> b!1520183 (= res!1039770 (= lt!658962 lt!658961))))

(assert (=> b!1520183 (= lt!658961 (Intermediate!13013 false resIndex!21 resX!21))))

(assert (=> b!1520183 (= lt!658962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48842 a!2804) j!70) mask!2512) (select (arr!48842 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129436 res!1039767) b!1520182))

(assert (= (and b!1520182 res!1039763) b!1520179))

(assert (= (and b!1520179 res!1039762) b!1520181))

(assert (= (and b!1520181 res!1039768) b!1520177))

(assert (= (and b!1520177 res!1039766) b!1520178))

(assert (= (and b!1520178 res!1039764) b!1520175))

(assert (= (and b!1520175 res!1039765) b!1520183))

(assert (= (and b!1520183 res!1039770) b!1520176))

(assert (= (and b!1520176 res!1039769) b!1520173))

(assert (= (and b!1520173 res!1039771) b!1520180))

(assert (= (and b!1520180 res!1039761) b!1520174))

(declare-fun m!1403507 () Bool)

(assert (=> b!1520181 m!1403507))

(assert (=> b!1520181 m!1403507))

(declare-fun m!1403509 () Bool)

(assert (=> b!1520181 m!1403509))

(assert (=> b!1520183 m!1403507))

(assert (=> b!1520183 m!1403507))

(declare-fun m!1403511 () Bool)

(assert (=> b!1520183 m!1403511))

(assert (=> b!1520183 m!1403511))

(assert (=> b!1520183 m!1403507))

(declare-fun m!1403513 () Bool)

(assert (=> b!1520183 m!1403513))

(declare-fun m!1403515 () Bool)

(assert (=> b!1520173 m!1403515))

(declare-fun m!1403517 () Bool)

(assert (=> b!1520173 m!1403517))

(assert (=> b!1520173 m!1403517))

(declare-fun m!1403519 () Bool)

(assert (=> b!1520173 m!1403519))

(assert (=> b!1520173 m!1403519))

(assert (=> b!1520173 m!1403517))

(declare-fun m!1403521 () Bool)

(assert (=> b!1520173 m!1403521))

(declare-fun m!1403523 () Bool)

(assert (=> b!1520179 m!1403523))

(assert (=> b!1520179 m!1403523))

(declare-fun m!1403525 () Bool)

(assert (=> b!1520179 m!1403525))

(assert (=> b!1520176 m!1403507))

(assert (=> b!1520176 m!1403507))

(declare-fun m!1403527 () Bool)

(assert (=> b!1520176 m!1403527))

(assert (=> b!1520180 m!1403507))

(declare-fun m!1403529 () Bool)

(assert (=> b!1520180 m!1403529))

(assert (=> b!1520180 m!1403515))

(declare-fun m!1403531 () Bool)

(assert (=> b!1520180 m!1403531))

(assert (=> b!1520180 m!1403517))

(declare-fun m!1403533 () Bool)

(assert (=> b!1520180 m!1403533))

(declare-fun m!1403535 () Bool)

(assert (=> b!1520178 m!1403535))

(declare-fun m!1403537 () Bool)

(assert (=> b!1520177 m!1403537))

(assert (=> b!1520174 m!1403507))

(assert (=> b!1520174 m!1403507))

(declare-fun m!1403539 () Bool)

(assert (=> b!1520174 m!1403539))

(declare-fun m!1403541 () Bool)

(assert (=> start!129436 m!1403541))

(declare-fun m!1403543 () Bool)

(assert (=> start!129436 m!1403543))

(push 1)

(assert (not b!1520178))

(assert (not b!1520173))

(assert (not b!1520174))

(assert (not b!1520179))

(assert (not b!1520177))

(assert (not b!1520181))

(assert (not b!1520176))

(assert (not b!1520183))

(assert (not start!129436))

(assert (not b!1520180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158867 () Bool)

(assert (=> d!158867 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129436 d!158867))

(declare-fun d!158873 () Bool)

(assert (=> d!158873 (= (array_inv!37870 a!2804) (bvsge (size!49392 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129436 d!158873))

(declare-fun b!1520373 () Bool)

(declare-fun lt!659021 () SeekEntryResult!13013)

(assert (=> b!1520373 (and (bvsge (index!54449 lt!659021) #b00000000000000000000000000000000) (bvslt (index!54449 lt!659021) (size!49392 a!2804)))))

(declare-fun e!848081 () Bool)

(assert (=> b!1520373 (= e!848081 (= (select (arr!48842 a!2804) (index!54449 lt!659021)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520374 () Bool)

(assert (=> b!1520374 (and (bvsge (index!54449 lt!659021) #b00000000000000000000000000000000) (bvslt (index!54449 lt!659021) (size!49392 a!2804)))))

(declare-fun res!1039890 () Bool)

(assert (=> b!1520374 (= res!1039890 (= (select (arr!48842 a!2804) (index!54449 lt!659021)) (select (arr!48842 a!2804) j!70)))))

(assert (=> b!1520374 (=> res!1039890 e!848081)))

(declare-fun e!848082 () Bool)

(assert (=> b!1520374 (= e!848082 e!848081)))

(declare-fun d!158875 () Bool)

(declare-fun e!848080 () Bool)

(assert (=> d!158875 e!848080))

(declare-fun c!139787 () Bool)

(assert (=> d!158875 (= c!139787 (and (is-Intermediate!13013 lt!659021) (undefined!13825 lt!659021)))))

(declare-fun e!848078 () SeekEntryResult!13013)

(assert (=> d!158875 (= lt!659021 e!848078)))

(declare-fun c!139786 () Bool)

(assert (=> d!158875 (= c!139786 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!659020 () (_ BitVec 64))

(assert (=> d!158875 (= lt!659020 (select (arr!48842 a!2804) index!487))))

(assert (=> d!158875 (validMask!0 mask!2512)))

(assert (=> d!158875 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48842 a!2804) j!70) a!2804 mask!2512) lt!659021)))

(declare-fun b!1520375 () Bool)

(assert (=> b!1520375 (and (bvsge (index!54449 lt!659021) #b00000000000000000000000000000000) (bvslt (index!54449 lt!659021) (size!49392 a!2804)))))

(declare-fun res!1039891 () Bool)

(assert (=> b!1520375 (= res!1039891 (= (select (arr!48842 a!2804) (index!54449 lt!659021)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520375 (=> res!1039891 e!848081)))

(declare-fun b!1520376 () Bool)

(assert (=> b!1520376 (= e!848080 e!848082)))

(declare-fun res!1039892 () Bool)

(assert (=> b!1520376 (= res!1039892 (and (is-Intermediate!13013 lt!659021) (not (undefined!13825 lt!659021)) (bvslt (x!136125 lt!659021) #b01111111111111111111111111111110) (bvsge (x!136125 lt!659021) #b00000000000000000000000000000000) (bvsge (x!136125 lt!659021) x!534)))))

(assert (=> b!1520376 (=> (not res!1039892) (not e!848082))))

(declare-fun b!1520377 () Bool)

(assert (=> b!1520377 (= e!848078 (Intermediate!13013 true index!487 x!534))))

(declare-fun b!1520378 () Bool)

(declare-fun e!848079 () SeekEntryResult!13013)

(assert (=> b!1520378 (= e!848078 e!848079)))

(declare-fun c!139785 () Bool)

(assert (=> b!1520378 (= c!139785 (or (= lt!659020 (select (arr!48842 a!2804) j!70)) (= (bvadd lt!659020 lt!659020) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520379 () Bool)

(assert (=> b!1520379 (= e!848079 (Intermediate!13013 false index!487 x!534))))

(declare-fun b!1520380 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520380 (= e!848079 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48842 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520381 () Bool)

(assert (=> b!1520381 (= e!848080 (bvsge (x!136125 lt!659021) #b01111111111111111111111111111110))))

(assert (= (and d!158875 c!139786) b!1520377))

(assert (= (and d!158875 (not c!139786)) b!1520378))

(assert (= (and b!1520378 c!139785) b!1520379))

(assert (= (and b!1520378 (not c!139785)) b!1520380))

(assert (= (and d!158875 c!139787) b!1520381))

(assert (= (and d!158875 (not c!139787)) b!1520376))

(assert (= (and b!1520376 res!1039892) b!1520374))

(assert (= (and b!1520374 (not res!1039890)) b!1520375))

(assert (= (and b!1520375 (not res!1039891)) b!1520373))

(declare-fun m!1403669 () Bool)

(assert (=> b!1520373 m!1403669))

(assert (=> b!1520374 m!1403669))

(assert (=> b!1520375 m!1403669))

(assert (=> d!158875 m!1403531))

(assert (=> d!158875 m!1403541))

(declare-fun m!1403671 () Bool)

(assert (=> b!1520380 m!1403671))

(assert (=> b!1520380 m!1403671))

(assert (=> b!1520380 m!1403507))

(declare-fun m!1403673 () Bool)

(assert (=> b!1520380 m!1403673))

(assert (=> b!1520176 d!158875))

(declare-fun d!158895 () Bool)

(assert (=> d!158895 (= (validKeyInArray!0 (select (arr!48842 a!2804) j!70)) (and (not (= (select (arr!48842 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48842 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520181 d!158895))

(declare-fun bm!68346 () Bool)

(declare-fun call!68349 () Bool)

(assert (=> bm!68346 (= call!68349 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520419 () Bool)

(declare-fun e!848107 () Bool)

(declare-fun e!848108 () Bool)

(assert (=> b!1520419 (= e!848107 e!848108)))

(declare-fun lt!659046 () (_ BitVec 64))

(assert (=> b!1520419 (= lt!659046 (select (arr!48842 a!2804) j!70))))

(declare-fun lt!659044 () Unit!50894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101213 (_ BitVec 64) (_ BitVec 32)) Unit!50894)

(assert (=> b!1520419 (= lt!659044 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659046 j!70))))

(declare-fun arrayContainsKey!0 (array!101213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1520419 (arrayContainsKey!0 a!2804 lt!659046 #b00000000000000000000000000000000)))

(declare-fun lt!659045 () Unit!50894)

(assert (=> b!1520419 (= lt!659045 lt!659044)))

(declare-fun res!1039905 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101213 (_ BitVec 32)) SeekEntryResult!13013)

(assert (=> b!1520419 (= res!1039905 (= (seekEntryOrOpen!0 (select (arr!48842 a!2804) j!70) a!2804 mask!2512) (Found!13013 j!70)))))

(assert (=> b!1520419 (=> (not res!1039905) (not e!848108))))

(declare-fun d!158897 () Bool)

(declare-fun res!1039904 () Bool)

(declare-fun e!848106 () Bool)

(assert (=> d!158897 (=> res!1039904 e!848106)))

(assert (=> d!158897 (= res!1039904 (bvsge j!70 (size!49392 a!2804)))))

(assert (=> d!158897 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848106)))

(declare-fun b!1520420 () Bool)

(assert (=> b!1520420 (= e!848106 e!848107)))

(declare-fun c!139801 () Bool)

(assert (=> b!1520420 (= c!139801 (validKeyInArray!0 (select (arr!48842 a!2804) j!70)))))

(declare-fun b!1520421 () Bool)

(assert (=> b!1520421 (= e!848107 call!68349)))

(declare-fun b!1520422 () Bool)

(assert (=> b!1520422 (= e!848108 call!68349)))

(assert (= (and d!158897 (not res!1039904)) b!1520420))

(assert (= (and b!1520420 c!139801) b!1520419))

(assert (= (and b!1520420 (not c!139801)) b!1520421))

(assert (= (and b!1520419 res!1039905) b!1520422))

(assert (= (or b!1520422 b!1520421) bm!68346))

(declare-fun m!1403681 () Bool)

(assert (=> bm!68346 m!1403681))

(assert (=> b!1520419 m!1403507))

(declare-fun m!1403683 () Bool)

(assert (=> b!1520419 m!1403683))

(declare-fun m!1403685 () Bool)

(assert (=> b!1520419 m!1403685))

(assert (=> b!1520419 m!1403507))

(declare-fun m!1403687 () Bool)

(assert (=> b!1520419 m!1403687))

(assert (=> b!1520420 m!1403507))

(assert (=> b!1520420 m!1403507))

(assert (=> b!1520420 m!1403509))

(assert (=> b!1520180 d!158897))

(declare-fun d!158903 () Bool)

(assert (=> d!158903 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659056 () Unit!50894)

(declare-fun choose!38 (array!101213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50894)

(assert (=> d!158903 (= lt!659056 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158903 (validMask!0 mask!2512)))

(assert (=> d!158903 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659056)))

(declare-fun bs!43634 () Bool)

(assert (= bs!43634 d!158903))

(assert (=> bs!43634 m!1403533))

(declare-fun m!1403703 () Bool)

(assert (=> bs!43634 m!1403703))

(assert (=> bs!43634 m!1403541))

(assert (=> b!1520180 d!158903))

(declare-fun b!1520462 () Bool)

(declare-fun e!848133 () SeekEntryResult!13013)

(assert (=> b!1520462 (= e!848133 Undefined!13013)))

(declare-fun b!1520463 () Bool)

(declare-fun e!848134 () SeekEntryResult!13013)

(assert (=> b!1520463 (= e!848133 e!848134)))

(declare-fun lt!659076 () (_ BitVec 64))

(declare-fun lt!659077 () SeekEntryResult!13013)

(assert (=> b!1520463 (= lt!659076 (select (arr!48842 a!2804) (index!54449 lt!659077)))))

(declare-fun c!139817 () Bool)

(assert (=> b!1520463 (= c!139817 (= lt!659076 (select (arr!48842 a!2804) j!70)))))

(declare-fun b!1520464 () Bool)

(declare-fun e!848132 () SeekEntryResult!13013)

(declare-fun lt!659079 () SeekEntryResult!13013)

(assert (=> b!1520464 (= e!848132 (ite (is-MissingVacant!13013 lt!659079) (MissingZero!13013 (index!54450 lt!659079)) lt!659079))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101213 (_ BitVec 32)) SeekEntryResult!13013)

(assert (=> b!1520464 (= lt!659079 (seekKeyOrZeroReturnVacant!0 (x!136125 lt!659077) (index!54449 lt!659077) (index!54449 lt!659077) (select (arr!48842 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!158909 () Bool)

(declare-fun lt!659078 () SeekEntryResult!13013)

(assert (=> d!158909 (and (or (is-MissingVacant!13013 lt!659078) (not (is-Found!13013 lt!659078)) (and (bvsge (index!54448 lt!659078) #b00000000000000000000000000000000) (bvslt (index!54448 lt!659078) (size!49392 a!2804)))) (not (is-MissingVacant!13013 lt!659078)) (or (not (is-Found!13013 lt!659078)) (= (select (arr!48842 a!2804) (index!54448 lt!659078)) (select (arr!48842 a!2804) j!70))))))

(assert (=> d!158909 (= lt!659078 e!848133)))

(declare-fun c!139818 () Bool)

(assert (=> d!158909 (= c!139818 (and (is-Intermediate!13013 lt!659077) (undefined!13825 lt!659077)))))

(assert (=> d!158909 (= lt!659077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48842 a!2804) j!70) mask!2512) (select (arr!48842 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158909 (validMask!0 mask!2512)))

(assert (=> d!158909 (= (seekEntry!0 (select (arr!48842 a!2804) j!70) a!2804 mask!2512) lt!659078)))

(declare-fun b!1520465 () Bool)

(assert (=> b!1520465 (= e!848132 (MissingZero!13013 (index!54449 lt!659077)))))

(declare-fun b!1520466 () Bool)

(assert (=> b!1520466 (= e!848134 (Found!13013 (index!54449 lt!659077)))))

(declare-fun b!1520467 () Bool)

(declare-fun c!139819 () Bool)

(assert (=> b!1520467 (= c!139819 (= lt!659076 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520467 (= e!848134 e!848132)))

(assert (= (and d!158909 c!139818) b!1520462))

(assert (= (and d!158909 (not c!139818)) b!1520463))

(assert (= (and b!1520463 c!139817) b!1520466))

(assert (= (and b!1520463 (not c!139817)) b!1520467))

(assert (= (and b!1520467 c!139819) b!1520465))

(assert (= (and b!1520467 (not c!139819)) b!1520464))

(declare-fun m!1403731 () Bool)

(assert (=> b!1520463 m!1403731))

(assert (=> b!1520464 m!1403507))

(declare-fun m!1403733 () Bool)

(assert (=> b!1520464 m!1403733))

(declare-fun m!1403735 () Bool)

(assert (=> d!158909 m!1403735))

(assert (=> d!158909 m!1403507))

(assert (=> d!158909 m!1403511))

(assert (=> d!158909 m!1403511))

(assert (=> d!158909 m!1403507))

(assert (=> d!158909 m!1403513))

(assert (=> d!158909 m!1403541))

(assert (=> b!1520174 d!158909))

(declare-fun d!158925 () Bool)

(assert (=> d!158925 (= (validKeyInArray!0 (select (arr!48842 a!2804) i!961)) (and (not (= (select (arr!48842 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48842 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520179 d!158925))

(declare-fun b!1520468 () Bool)

(declare-fun lt!659081 () SeekEntryResult!13013)

(assert (=> b!1520468 (and (bvsge (index!54449 lt!659081) #b00000000000000000000000000000000) (bvslt (index!54449 lt!659081) (size!49392 (array!101214 (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804)))))))

(declare-fun e!848138 () Bool)

(assert (=> b!1520468 (= e!848138 (= (select (arr!48842 (array!101214 (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804))) (index!54449 lt!659081)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520469 () Bool)

(assert (=> b!1520469 (and (bvsge (index!54449 lt!659081) #b00000000000000000000000000000000) (bvslt (index!54449 lt!659081) (size!49392 (array!101214 (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804)))))))

(declare-fun res!1039916 () Bool)

(assert (=> b!1520469 (= res!1039916 (= (select (arr!48842 (array!101214 (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804))) (index!54449 lt!659081)) (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1520469 (=> res!1039916 e!848138)))

(declare-fun e!848139 () Bool)

(assert (=> b!1520469 (= e!848139 e!848138)))

(declare-fun d!158927 () Bool)

(declare-fun e!848137 () Bool)

(assert (=> d!158927 e!848137))

(declare-fun c!139822 () Bool)

(assert (=> d!158927 (= c!139822 (and (is-Intermediate!13013 lt!659081) (undefined!13825 lt!659081)))))

(declare-fun e!848135 () SeekEntryResult!13013)

(assert (=> d!158927 (= lt!659081 e!848135)))

(declare-fun c!139821 () Bool)

(assert (=> d!158927 (= c!139821 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659080 () (_ BitVec 64))

(assert (=> d!158927 (= lt!659080 (select (arr!48842 (array!101214 (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804))) (toIndex!0 (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158927 (validMask!0 mask!2512)))

(assert (=> d!158927 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101214 (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804)) mask!2512) lt!659081)))

(declare-fun b!1520470 () Bool)

(assert (=> b!1520470 (and (bvsge (index!54449 lt!659081) #b00000000000000000000000000000000) (bvslt (index!54449 lt!659081) (size!49392 (array!101214 (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804)))))))

(declare-fun res!1039917 () Bool)

(assert (=> b!1520470 (= res!1039917 (= (select (arr!48842 (array!101214 (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804))) (index!54449 lt!659081)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520470 (=> res!1039917 e!848138)))

(declare-fun b!1520471 () Bool)

(assert (=> b!1520471 (= e!848137 e!848139)))

(declare-fun res!1039918 () Bool)

(assert (=> b!1520471 (= res!1039918 (and (is-Intermediate!13013 lt!659081) (not (undefined!13825 lt!659081)) (bvslt (x!136125 lt!659081) #b01111111111111111111111111111110) (bvsge (x!136125 lt!659081) #b00000000000000000000000000000000) (bvsge (x!136125 lt!659081) #b00000000000000000000000000000000)))))

(assert (=> b!1520471 (=> (not res!1039918) (not e!848139))))

(declare-fun b!1520472 () Bool)

(assert (=> b!1520472 (= e!848135 (Intermediate!13013 true (toIndex!0 (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520473 () Bool)

(declare-fun e!848136 () SeekEntryResult!13013)

(assert (=> b!1520473 (= e!848135 e!848136)))

(declare-fun c!139820 () Bool)

(assert (=> b!1520473 (= c!139820 (or (= lt!659080 (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659080 lt!659080) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520474 () Bool)

(assert (=> b!1520474 (= e!848136 (Intermediate!13013 false (toIndex!0 (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520475 () Bool)

(assert (=> b!1520475 (= e!848136 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101214 (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804)) mask!2512))))

(declare-fun b!1520476 () Bool)

(assert (=> b!1520476 (= e!848137 (bvsge (x!136125 lt!659081) #b01111111111111111111111111111110))))

(assert (= (and d!158927 c!139821) b!1520472))

(assert (= (and d!158927 (not c!139821)) b!1520473))

(assert (= (and b!1520473 c!139820) b!1520474))

(assert (= (and b!1520473 (not c!139820)) b!1520475))

(assert (= (and d!158927 c!139822) b!1520476))

(assert (= (and d!158927 (not c!139822)) b!1520471))

(assert (= (and b!1520471 res!1039918) b!1520469))

(assert (= (and b!1520469 (not res!1039916)) b!1520470))

(assert (= (and b!1520470 (not res!1039917)) b!1520468))

(declare-fun m!1403737 () Bool)

(assert (=> b!1520468 m!1403737))

(assert (=> b!1520469 m!1403737))

(assert (=> b!1520470 m!1403737))

(assert (=> d!158927 m!1403519))

(declare-fun m!1403739 () Bool)

(assert (=> d!158927 m!1403739))

(assert (=> d!158927 m!1403541))

(assert (=> b!1520475 m!1403519))

(declare-fun m!1403741 () Bool)

(assert (=> b!1520475 m!1403741))

(assert (=> b!1520475 m!1403741))

(assert (=> b!1520475 m!1403517))

(declare-fun m!1403743 () Bool)

(assert (=> b!1520475 m!1403743))

(assert (=> b!1520173 d!158927))

(declare-fun d!158929 () Bool)

(declare-fun lt!659093 () (_ BitVec 32))

(declare-fun lt!659092 () (_ BitVec 32))

(assert (=> d!158929 (= lt!659093 (bvmul (bvxor lt!659092 (bvlshr lt!659092 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158929 (= lt!659092 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158929 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039919 (let ((h!36741 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136133 (bvmul (bvxor h!36741 (bvlshr h!36741 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136133 (bvlshr x!136133 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039919 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039919 #b00000000000000000000000000000000))))))

(assert (=> d!158929 (= (toIndex!0 (select (store (arr!48842 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659093 (bvlshr lt!659093 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520173 d!158929))

(declare-fun b!1520487 () Bool)

(declare-fun e!848149 () Bool)

(declare-fun e!848151 () Bool)

(assert (=> b!1520487 (= e!848149 e!848151)))

(declare-fun c!139825 () Bool)

(assert (=> b!1520487 (= c!139825 (validKeyInArray!0 (select (arr!48842 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68354 () Bool)

(declare-fun call!68357 () Bool)

(assert (=> bm!68354 (= call!68357 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139825 (Cons!35321 (select (arr!48842 a!2804) #b00000000000000000000000000000000) Nil!35322) Nil!35322)))))

(declare-fun b!1520488 () Bool)

(assert (=> b!1520488 (= e!848151 call!68357)))

(declare-fun d!158933 () Bool)

(declare-fun res!1039926 () Bool)

(declare-fun e!848148 () Bool)

(assert (=> d!158933 (=> res!1039926 e!848148)))

(assert (=> d!158933 (= res!1039926 (bvsge #b00000000000000000000000000000000 (size!49392 a!2804)))))

(assert (=> d!158933 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35322) e!848148)))

(declare-fun b!1520489 () Bool)

(declare-fun e!848150 () Bool)

(declare-fun contains!9981 (List!35325 (_ BitVec 64)) Bool)

(assert (=> b!1520489 (= e!848150 (contains!9981 Nil!35322 (select (arr!48842 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520490 () Bool)

(assert (=> b!1520490 (= e!848148 e!848149)))

(declare-fun res!1039928 () Bool)

(assert (=> b!1520490 (=> (not res!1039928) (not e!848149))))

(assert (=> b!1520490 (= res!1039928 (not e!848150))))

(declare-fun res!1039927 () Bool)

(assert (=> b!1520490 (=> (not res!1039927) (not e!848150))))

(assert (=> b!1520490 (= res!1039927 (validKeyInArray!0 (select (arr!48842 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520491 () Bool)

(assert (=> b!1520491 (= e!848151 call!68357)))

(assert (= (and d!158933 (not res!1039926)) b!1520490))

(assert (= (and b!1520490 res!1039927) b!1520489))

(assert (= (and b!1520490 res!1039928) b!1520487))

(assert (= (and b!1520487 c!139825) b!1520491))

(assert (= (and b!1520487 (not c!139825)) b!1520488))

(assert (= (or b!1520491 b!1520488) bm!68354))

(declare-fun m!1403745 () Bool)

(assert (=> b!1520487 m!1403745))

(assert (=> b!1520487 m!1403745))

(declare-fun m!1403747 () Bool)

(assert (=> b!1520487 m!1403747))

(assert (=> bm!68354 m!1403745))

(declare-fun m!1403749 () Bool)

(assert (=> bm!68354 m!1403749))

(assert (=> b!1520489 m!1403745))

(assert (=> b!1520489 m!1403745))

(declare-fun m!1403751 () Bool)

(assert (=> b!1520489 m!1403751))

(assert (=> b!1520490 m!1403745))

(assert (=> b!1520490 m!1403745))

(assert (=> b!1520490 m!1403747))

(assert (=> b!1520178 d!158933))

(declare-fun b!1520492 () Bool)

(declare-fun lt!659095 () SeekEntryResult!13013)

(assert (=> b!1520492 (and (bvsge (index!54449 lt!659095) #b00000000000000000000000000000000) (bvslt (index!54449 lt!659095) (size!49392 a!2804)))))

(declare-fun e!848155 () Bool)

(assert (=> b!1520492 (= e!848155 (= (select (arr!48842 a!2804) (index!54449 lt!659095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520493 () Bool)

(assert (=> b!1520493 (and (bvsge (index!54449 lt!659095) #b00000000000000000000000000000000) (bvslt (index!54449 lt!659095) (size!49392 a!2804)))))

(declare-fun res!1039929 () Bool)

(assert (=> b!1520493 (= res!1039929 (= (select (arr!48842 a!2804) (index!54449 lt!659095)) (select (arr!48842 a!2804) j!70)))))

(assert (=> b!1520493 (=> res!1039929 e!848155)))

(declare-fun e!848156 () Bool)

(assert (=> b!1520493 (= e!848156 e!848155)))

(declare-fun d!158935 () Bool)

(declare-fun e!848154 () Bool)

(assert (=> d!158935 e!848154))

(declare-fun c!139828 () Bool)

(assert (=> d!158935 (= c!139828 (and (is-Intermediate!13013 lt!659095) (undefined!13825 lt!659095)))))

(declare-fun e!848152 () SeekEntryResult!13013)

(assert (=> d!158935 (= lt!659095 e!848152)))

(declare-fun c!139827 () Bool)

(assert (=> d!158935 (= c!139827 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659094 () (_ BitVec 64))

(assert (=> d!158935 (= lt!659094 (select (arr!48842 a!2804) (toIndex!0 (select (arr!48842 a!2804) j!70) mask!2512)))))

(assert (=> d!158935 (validMask!0 mask!2512)))

(assert (=> d!158935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48842 a!2804) j!70) mask!2512) (select (arr!48842 a!2804) j!70) a!2804 mask!2512) lt!659095)))

(declare-fun b!1520494 () Bool)

(assert (=> b!1520494 (and (bvsge (index!54449 lt!659095) #b00000000000000000000000000000000) (bvslt (index!54449 lt!659095) (size!49392 a!2804)))))

(declare-fun res!1039930 () Bool)

(assert (=> b!1520494 (= res!1039930 (= (select (arr!48842 a!2804) (index!54449 lt!659095)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520494 (=> res!1039930 e!848155)))

(declare-fun b!1520495 () Bool)

(assert (=> b!1520495 (= e!848154 e!848156)))

(declare-fun res!1039931 () Bool)

(assert (=> b!1520495 (= res!1039931 (and (is-Intermediate!13013 lt!659095) (not (undefined!13825 lt!659095)) (bvslt (x!136125 lt!659095) #b01111111111111111111111111111110) (bvsge (x!136125 lt!659095) #b00000000000000000000000000000000) (bvsge (x!136125 lt!659095) #b00000000000000000000000000000000)))))

(assert (=> b!1520495 (=> (not res!1039931) (not e!848156))))

(declare-fun b!1520496 () Bool)

(assert (=> b!1520496 (= e!848152 (Intermediate!13013 true (toIndex!0 (select (arr!48842 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520497 () Bool)

(declare-fun e!848153 () SeekEntryResult!13013)

(assert (=> b!1520497 (= e!848152 e!848153)))

(declare-fun c!139826 () Bool)

(assert (=> b!1520497 (= c!139826 (or (= lt!659094 (select (arr!48842 a!2804) j!70)) (= (bvadd lt!659094 lt!659094) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520498 () Bool)

(assert (=> b!1520498 (= e!848153 (Intermediate!13013 false (toIndex!0 (select (arr!48842 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520499 () Bool)

(assert (=> b!1520499 (= e!848153 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48842 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48842 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520500 () Bool)

(assert (=> b!1520500 (= e!848154 (bvsge (x!136125 lt!659095) #b01111111111111111111111111111110))))

(assert (= (and d!158935 c!139827) b!1520496))

(assert (= (and d!158935 (not c!139827)) b!1520497))

(assert (= (and b!1520497 c!139826) b!1520498))

(assert (= (and b!1520497 (not c!139826)) b!1520499))

(assert (= (and d!158935 c!139828) b!1520500))

(assert (= (and d!158935 (not c!139828)) b!1520495))

(assert (= (and b!1520495 res!1039931) b!1520493))

(assert (= (and b!1520493 (not res!1039929)) b!1520494))

(assert (= (and b!1520494 (not res!1039930)) b!1520492))

(declare-fun m!1403753 () Bool)

(assert (=> b!1520492 m!1403753))

(assert (=> b!1520493 m!1403753))

(assert (=> b!1520494 m!1403753))

(assert (=> d!158935 m!1403511))

(declare-fun m!1403755 () Bool)

(assert (=> d!158935 m!1403755))

(assert (=> d!158935 m!1403541))

(assert (=> b!1520499 m!1403511))

(declare-fun m!1403757 () Bool)

(assert (=> b!1520499 m!1403757))

(assert (=> b!1520499 m!1403757))

(assert (=> b!1520499 m!1403507))

(declare-fun m!1403759 () Bool)

(assert (=> b!1520499 m!1403759))

(assert (=> b!1520183 d!158935))

(declare-fun d!158937 () Bool)

(declare-fun lt!659101 () (_ BitVec 32))

(declare-fun lt!659100 () (_ BitVec 32))

(assert (=> d!158937 (= lt!659101 (bvmul (bvxor lt!659100 (bvlshr lt!659100 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158937 (= lt!659100 ((_ extract 31 0) (bvand (bvxor (select (arr!48842 a!2804) j!70) (bvlshr (select (arr!48842 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158937 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039919 (let ((h!36741 ((_ extract 31 0) (bvand (bvxor (select (arr!48842 a!2804) j!70) (bvlshr (select (arr!48842 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136133 (bvmul (bvxor h!36741 (bvlshr h!36741 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136133 (bvlshr x!136133 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039919 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039919 #b00000000000000000000000000000000))))))

(assert (=> d!158937 (= (toIndex!0 (select (arr!48842 a!2804) j!70) mask!2512) (bvand (bvxor lt!659101 (bvlshr lt!659101 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520183 d!158937))

(declare-fun bm!68355 () Bool)

(declare-fun call!68358 () Bool)

(assert (=> bm!68355 (= call!68358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520513 () Bool)

(declare-fun e!848164 () Bool)

(declare-fun e!848165 () Bool)

(assert (=> b!1520513 (= e!848164 e!848165)))

(declare-fun lt!659108 () (_ BitVec 64))

(assert (=> b!1520513 (= lt!659108 (select (arr!48842 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659106 () Unit!50894)

(assert (=> b!1520513 (= lt!659106 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659108 #b00000000000000000000000000000000))))

(assert (=> b!1520513 (arrayContainsKey!0 a!2804 lt!659108 #b00000000000000000000000000000000)))

(declare-fun lt!659107 () Unit!50894)

(assert (=> b!1520513 (= lt!659107 lt!659106)))

(declare-fun res!1039933 () Bool)

(assert (=> b!1520513 (= res!1039933 (= (seekEntryOrOpen!0 (select (arr!48842 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13013 #b00000000000000000000000000000000)))))

(assert (=> b!1520513 (=> (not res!1039933) (not e!848165))))

(declare-fun d!158939 () Bool)

(declare-fun res!1039932 () Bool)

(declare-fun e!848163 () Bool)

(assert (=> d!158939 (=> res!1039932 e!848163)))

(assert (=> d!158939 (= res!1039932 (bvsge #b00000000000000000000000000000000 (size!49392 a!2804)))))

(assert (=> d!158939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!848163)))

(declare-fun b!1520514 () Bool)

(assert (=> b!1520514 (= e!848163 e!848164)))

(declare-fun c!139835 () Bool)

(assert (=> b!1520514 (= c!139835 (validKeyInArray!0 (select (arr!48842 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520515 () Bool)

(assert (=> b!1520515 (= e!848164 call!68358)))

(declare-fun b!1520516 () Bool)

(assert (=> b!1520516 (= e!848165 call!68358)))

(assert (= (and d!158939 (not res!1039932)) b!1520514))

(assert (= (and b!1520514 c!139835) b!1520513))

(assert (= (and b!1520514 (not c!139835)) b!1520515))

(assert (= (and b!1520513 res!1039933) b!1520516))

(assert (= (or b!1520516 b!1520515) bm!68355))

(declare-fun m!1403761 () Bool)

(assert (=> bm!68355 m!1403761))

