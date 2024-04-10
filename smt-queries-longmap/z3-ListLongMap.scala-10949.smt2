; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128072 () Bool)

(assert start!128072)

(declare-fun b!1504308 () Bool)

(declare-fun res!1025098 () Bool)

(declare-fun e!840864 () Bool)

(assert (=> b!1504308 (=> (not res!1025098) (not e!840864))))

(declare-datatypes ((array!100348 0))(
  ( (array!100349 (arr!48429 (Array (_ BitVec 32) (_ BitVec 64))) (size!48979 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100348)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504308 (= res!1025098 (not (= (select (arr!48429 a!2850) index!625) (select (arr!48429 a!2850) j!87))))))

(declare-fun b!1504309 () Bool)

(declare-fun res!1025104 () Bool)

(assert (=> b!1504309 (=> (not res!1025104) (not e!840864))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100348 (_ BitVec 32)) Bool)

(assert (=> b!1504309 (= res!1025104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653662 () (_ BitVec 32))

(declare-fun b!1504310 () Bool)

(assert (=> b!1504310 (= e!840864 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (or (bvslt lt!653662 #b00000000000000000000000000000000) (bvsge lt!653662 (size!48979 a!2850)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504310 (= lt!653662 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1025097 () Bool)

(assert (=> start!128072 (=> (not res!1025097) (not e!840864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128072 (= res!1025097 (validMask!0 mask!2661))))

(assert (=> start!128072 e!840864))

(assert (=> start!128072 true))

(declare-fun array_inv!37457 (array!100348) Bool)

(assert (=> start!128072 (array_inv!37457 a!2850)))

(declare-fun b!1504311 () Bool)

(declare-fun res!1025103 () Bool)

(assert (=> b!1504311 (=> (not res!1025103) (not e!840864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504311 (= res!1025103 (validKeyInArray!0 (select (arr!48429 a!2850) j!87)))))

(declare-fun b!1504312 () Bool)

(declare-fun res!1025099 () Bool)

(assert (=> b!1504312 (=> (not res!1025099) (not e!840864))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1504312 (= res!1025099 (validKeyInArray!0 (select (arr!48429 a!2850) i!996)))))

(declare-fun b!1504313 () Bool)

(declare-fun res!1025101 () Bool)

(assert (=> b!1504313 (=> (not res!1025101) (not e!840864))))

(assert (=> b!1504313 (= res!1025101 (and (= (size!48979 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48979 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48979 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504314 () Bool)

(declare-fun res!1025102 () Bool)

(assert (=> b!1504314 (=> (not res!1025102) (not e!840864))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12627 0))(
  ( (MissingZero!12627 (index!52900 (_ BitVec 32))) (Found!12627 (index!52901 (_ BitVec 32))) (Intermediate!12627 (undefined!13439 Bool) (index!52902 (_ BitVec 32)) (x!134577 (_ BitVec 32))) (Undefined!12627) (MissingVacant!12627 (index!52903 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100348 (_ BitVec 32)) SeekEntryResult!12627)

(assert (=> b!1504314 (= res!1025102 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48429 a!2850) j!87) a!2850 mask!2661) (Found!12627 j!87)))))

(declare-fun b!1504315 () Bool)

(declare-fun res!1025096 () Bool)

(assert (=> b!1504315 (=> (not res!1025096) (not e!840864))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504315 (= res!1025096 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48979 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48979 a!2850)) (= (select (arr!48429 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48429 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48979 a!2850))))))

(declare-fun b!1504316 () Bool)

(declare-fun res!1025100 () Bool)

(assert (=> b!1504316 (=> (not res!1025100) (not e!840864))))

(declare-datatypes ((List!34921 0))(
  ( (Nil!34918) (Cons!34917 (h!36314 (_ BitVec 64)) (t!49615 List!34921)) )
))
(declare-fun arrayNoDuplicates!0 (array!100348 (_ BitVec 32) List!34921) Bool)

(assert (=> b!1504316 (= res!1025100 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34918))))

(assert (= (and start!128072 res!1025097) b!1504313))

(assert (= (and b!1504313 res!1025101) b!1504312))

(assert (= (and b!1504312 res!1025099) b!1504311))

(assert (= (and b!1504311 res!1025103) b!1504309))

(assert (= (and b!1504309 res!1025104) b!1504316))

(assert (= (and b!1504316 res!1025100) b!1504315))

(assert (= (and b!1504315 res!1025096) b!1504314))

(assert (= (and b!1504314 res!1025102) b!1504308))

(assert (= (and b!1504308 res!1025098) b!1504310))

(declare-fun m!1387523 () Bool)

(assert (=> b!1504309 m!1387523))

(declare-fun m!1387525 () Bool)

(assert (=> b!1504310 m!1387525))

(declare-fun m!1387527 () Bool)

(assert (=> b!1504308 m!1387527))

(declare-fun m!1387529 () Bool)

(assert (=> b!1504308 m!1387529))

(assert (=> b!1504311 m!1387529))

(assert (=> b!1504311 m!1387529))

(declare-fun m!1387531 () Bool)

(assert (=> b!1504311 m!1387531))

(assert (=> b!1504314 m!1387529))

(assert (=> b!1504314 m!1387529))

(declare-fun m!1387533 () Bool)

(assert (=> b!1504314 m!1387533))

(declare-fun m!1387535 () Bool)

(assert (=> b!1504316 m!1387535))

(declare-fun m!1387537 () Bool)

(assert (=> b!1504312 m!1387537))

(assert (=> b!1504312 m!1387537))

(declare-fun m!1387539 () Bool)

(assert (=> b!1504312 m!1387539))

(declare-fun m!1387541 () Bool)

(assert (=> start!128072 m!1387541))

(declare-fun m!1387543 () Bool)

(assert (=> start!128072 m!1387543))

(declare-fun m!1387545 () Bool)

(assert (=> b!1504315 m!1387545))

(declare-fun m!1387547 () Bool)

(assert (=> b!1504315 m!1387547))

(declare-fun m!1387549 () Bool)

(assert (=> b!1504315 m!1387549))

(check-sat (not start!128072) (not b!1504309) (not b!1504311) (not b!1504314) (not b!1504310) (not b!1504316) (not b!1504312))
(check-sat)
(get-model)

(declare-fun b!1504356 () Bool)

(declare-fun e!840878 () SeekEntryResult!12627)

(assert (=> b!1504356 (= e!840878 (MissingVacant!12627 vacantBefore!10))))

(declare-fun b!1504357 () Bool)

(declare-fun e!840879 () SeekEntryResult!12627)

(assert (=> b!1504357 (= e!840879 Undefined!12627)))

(declare-fun b!1504358 () Bool)

(declare-fun c!139148 () Bool)

(declare-fun lt!653670 () (_ BitVec 64))

(assert (=> b!1504358 (= c!139148 (= lt!653670 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840880 () SeekEntryResult!12627)

(assert (=> b!1504358 (= e!840880 e!840878)))

(declare-fun b!1504360 () Bool)

(assert (=> b!1504360 (= e!840878 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48429 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504361 () Bool)

(assert (=> b!1504361 (= e!840880 (Found!12627 index!625))))

(declare-fun b!1504359 () Bool)

(assert (=> b!1504359 (= e!840879 e!840880)))

(declare-fun c!139146 () Bool)

(assert (=> b!1504359 (= c!139146 (= lt!653670 (select (arr!48429 a!2850) j!87)))))

(declare-fun d!157839 () Bool)

(declare-fun lt!653671 () SeekEntryResult!12627)

(get-info :version)

(assert (=> d!157839 (and (or ((_ is Undefined!12627) lt!653671) (not ((_ is Found!12627) lt!653671)) (and (bvsge (index!52901 lt!653671) #b00000000000000000000000000000000) (bvslt (index!52901 lt!653671) (size!48979 a!2850)))) (or ((_ is Undefined!12627) lt!653671) ((_ is Found!12627) lt!653671) (not ((_ is MissingVacant!12627) lt!653671)) (not (= (index!52903 lt!653671) vacantBefore!10)) (and (bvsge (index!52903 lt!653671) #b00000000000000000000000000000000) (bvslt (index!52903 lt!653671) (size!48979 a!2850)))) (or ((_ is Undefined!12627) lt!653671) (ite ((_ is Found!12627) lt!653671) (= (select (arr!48429 a!2850) (index!52901 lt!653671)) (select (arr!48429 a!2850) j!87)) (and ((_ is MissingVacant!12627) lt!653671) (= (index!52903 lt!653671) vacantBefore!10) (= (select (arr!48429 a!2850) (index!52903 lt!653671)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157839 (= lt!653671 e!840879)))

(declare-fun c!139147 () Bool)

(assert (=> d!157839 (= c!139147 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157839 (= lt!653670 (select (arr!48429 a!2850) index!625))))

(assert (=> d!157839 (validMask!0 mask!2661)))

(assert (=> d!157839 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48429 a!2850) j!87) a!2850 mask!2661) lt!653671)))

(assert (= (and d!157839 c!139147) b!1504357))

(assert (= (and d!157839 (not c!139147)) b!1504359))

(assert (= (and b!1504359 c!139146) b!1504361))

(assert (= (and b!1504359 (not c!139146)) b!1504358))

(assert (= (and b!1504358 c!139148) b!1504356))

(assert (= (and b!1504358 (not c!139148)) b!1504360))

(assert (=> b!1504360 m!1387525))

(assert (=> b!1504360 m!1387525))

(assert (=> b!1504360 m!1387529))

(declare-fun m!1387579 () Bool)

(assert (=> b!1504360 m!1387579))

(declare-fun m!1387581 () Bool)

(assert (=> d!157839 m!1387581))

(declare-fun m!1387583 () Bool)

(assert (=> d!157839 m!1387583))

(assert (=> d!157839 m!1387527))

(assert (=> d!157839 m!1387541))

(assert (=> b!1504314 d!157839))

(declare-fun d!157841 () Bool)

(assert (=> d!157841 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128072 d!157841))

(declare-fun d!157853 () Bool)

(assert (=> d!157853 (= (array_inv!37457 a!2850) (bvsge (size!48979 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128072 d!157853))

(declare-fun d!157855 () Bool)

(assert (=> d!157855 (= (validKeyInArray!0 (select (arr!48429 a!2850) i!996)) (and (not (= (select (arr!48429 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48429 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504312 d!157855))

(declare-fun bm!68127 () Bool)

(declare-fun call!68130 () Bool)

(declare-fun c!139157 () Bool)

(assert (=> bm!68127 (= call!68130 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139157 (Cons!34917 (select (arr!48429 a!2850) #b00000000000000000000000000000000) Nil!34918) Nil!34918)))))

(declare-fun d!157857 () Bool)

(declare-fun res!1025154 () Bool)

(declare-fun e!840911 () Bool)

(assert (=> d!157857 (=> res!1025154 e!840911)))

(assert (=> d!157857 (= res!1025154 (bvsge #b00000000000000000000000000000000 (size!48979 a!2850)))))

(assert (=> d!157857 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34918) e!840911)))

(declare-fun b!1504399 () Bool)

(declare-fun e!840913 () Bool)

(assert (=> b!1504399 (= e!840911 e!840913)))

(declare-fun res!1025153 () Bool)

(assert (=> b!1504399 (=> (not res!1025153) (not e!840913))))

(declare-fun e!840912 () Bool)

(assert (=> b!1504399 (= res!1025153 (not e!840912))))

(declare-fun res!1025155 () Bool)

(assert (=> b!1504399 (=> (not res!1025155) (not e!840912))))

(assert (=> b!1504399 (= res!1025155 (validKeyInArray!0 (select (arr!48429 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504400 () Bool)

(declare-fun contains!9949 (List!34921 (_ BitVec 64)) Bool)

(assert (=> b!1504400 (= e!840912 (contains!9949 Nil!34918 (select (arr!48429 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504401 () Bool)

(declare-fun e!840910 () Bool)

(assert (=> b!1504401 (= e!840910 call!68130)))

(declare-fun b!1504402 () Bool)

(assert (=> b!1504402 (= e!840913 e!840910)))

(assert (=> b!1504402 (= c!139157 (validKeyInArray!0 (select (arr!48429 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504403 () Bool)

(assert (=> b!1504403 (= e!840910 call!68130)))

(assert (= (and d!157857 (not res!1025154)) b!1504399))

(assert (= (and b!1504399 res!1025155) b!1504400))

(assert (= (and b!1504399 res!1025153) b!1504402))

(assert (= (and b!1504402 c!139157) b!1504401))

(assert (= (and b!1504402 (not c!139157)) b!1504403))

(assert (= (or b!1504401 b!1504403) bm!68127))

(declare-fun m!1387607 () Bool)

(assert (=> bm!68127 m!1387607))

(declare-fun m!1387609 () Bool)

(assert (=> bm!68127 m!1387609))

(assert (=> b!1504399 m!1387607))

(assert (=> b!1504399 m!1387607))

(declare-fun m!1387611 () Bool)

(assert (=> b!1504399 m!1387611))

(assert (=> b!1504400 m!1387607))

(assert (=> b!1504400 m!1387607))

(declare-fun m!1387613 () Bool)

(assert (=> b!1504400 m!1387613))

(assert (=> b!1504402 m!1387607))

(assert (=> b!1504402 m!1387607))

(assert (=> b!1504402 m!1387611))

(assert (=> b!1504316 d!157857))

(declare-fun d!157863 () Bool)

(assert (=> d!157863 (= (validKeyInArray!0 (select (arr!48429 a!2850) j!87)) (and (not (= (select (arr!48429 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48429 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504311 d!157863))

(declare-fun b!1504424 () Bool)

(declare-fun e!840931 () Bool)

(declare-fun call!68136 () Bool)

(assert (=> b!1504424 (= e!840931 call!68136)))

(declare-fun b!1504425 () Bool)

(declare-fun e!840929 () Bool)

(assert (=> b!1504425 (= e!840929 call!68136)))

(declare-fun b!1504426 () Bool)

(assert (=> b!1504426 (= e!840931 e!840929)))

(declare-fun lt!653701 () (_ BitVec 64))

(assert (=> b!1504426 (= lt!653701 (select (arr!48429 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50266 0))(
  ( (Unit!50267) )
))
(declare-fun lt!653699 () Unit!50266)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100348 (_ BitVec 64) (_ BitVec 32)) Unit!50266)

(assert (=> b!1504426 (= lt!653699 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653701 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1504426 (arrayContainsKey!0 a!2850 lt!653701 #b00000000000000000000000000000000)))

(declare-fun lt!653700 () Unit!50266)

(assert (=> b!1504426 (= lt!653700 lt!653699)))

(declare-fun res!1025167 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100348 (_ BitVec 32)) SeekEntryResult!12627)

(assert (=> b!1504426 (= res!1025167 (= (seekEntryOrOpen!0 (select (arr!48429 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12627 #b00000000000000000000000000000000)))))

(assert (=> b!1504426 (=> (not res!1025167) (not e!840929))))

(declare-fun b!1504427 () Bool)

(declare-fun e!840930 () Bool)

(assert (=> b!1504427 (= e!840930 e!840931)))

(declare-fun c!139163 () Bool)

(assert (=> b!1504427 (= c!139163 (validKeyInArray!0 (select (arr!48429 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!157865 () Bool)

(declare-fun res!1025166 () Bool)

(assert (=> d!157865 (=> res!1025166 e!840930)))

(assert (=> d!157865 (= res!1025166 (bvsge #b00000000000000000000000000000000 (size!48979 a!2850)))))

(assert (=> d!157865 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840930)))

(declare-fun bm!68133 () Bool)

(assert (=> bm!68133 (= call!68136 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(assert (= (and d!157865 (not res!1025166)) b!1504427))

(assert (= (and b!1504427 c!139163) b!1504426))

(assert (= (and b!1504427 (not c!139163)) b!1504424))

(assert (= (and b!1504426 res!1025167) b!1504425))

(assert (= (or b!1504425 b!1504424) bm!68133))

(assert (=> b!1504426 m!1387607))

(declare-fun m!1387623 () Bool)

(assert (=> b!1504426 m!1387623))

(declare-fun m!1387625 () Bool)

(assert (=> b!1504426 m!1387625))

(assert (=> b!1504426 m!1387607))

(declare-fun m!1387627 () Bool)

(assert (=> b!1504426 m!1387627))

(assert (=> b!1504427 m!1387607))

(assert (=> b!1504427 m!1387607))

(assert (=> b!1504427 m!1387611))

(declare-fun m!1387629 () Bool)

(assert (=> bm!68133 m!1387629))

(assert (=> b!1504309 d!157865))

(declare-fun d!157875 () Bool)

(declare-fun lt!653704 () (_ BitVec 32))

(assert (=> d!157875 (and (bvsge lt!653704 #b00000000000000000000000000000000) (bvslt lt!653704 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157875 (= lt!653704 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157875 (validMask!0 mask!2661)))

(assert (=> d!157875 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653704)))

(declare-fun bs!43196 () Bool)

(assert (= bs!43196 d!157875))

(declare-fun m!1387631 () Bool)

(assert (=> bs!43196 m!1387631))

(assert (=> bs!43196 m!1387541))

(assert (=> b!1504310 d!157875))

(check-sat (not bm!68133) (not b!1504402) (not b!1504427) (not b!1504360) (not b!1504426) (not b!1504400) (not b!1504399) (not bm!68127) (not d!157875) (not d!157839))
(check-sat)
