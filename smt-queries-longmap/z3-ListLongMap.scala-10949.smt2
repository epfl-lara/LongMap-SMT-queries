; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128372 () Bool)

(assert start!128372)

(declare-fun b!1506113 () Bool)

(declare-fun res!1025725 () Bool)

(declare-fun e!841994 () Bool)

(assert (=> b!1506113 (=> (not res!1025725) (not e!841994))))

(declare-datatypes ((array!100462 0))(
  ( (array!100463 (arr!48481 (Array (_ BitVec 32) (_ BitVec 64))) (size!49032 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100462)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506113 (= res!1025725 (validKeyInArray!0 (select (arr!48481 a!2850) i!996)))))

(declare-fun b!1506114 () Bool)

(declare-fun res!1025732 () Bool)

(assert (=> b!1506114 (=> (not res!1025732) (not e!841994))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100462 (_ BitVec 32)) Bool)

(assert (=> b!1506114 (= res!1025732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1506115 () Bool)

(declare-fun res!1025731 () Bool)

(assert (=> b!1506115 (=> (not res!1025731) (not e!841994))))

(declare-datatypes ((List!34960 0))(
  ( (Nil!34957) (Cons!34956 (h!36368 (_ BitVec 64)) (t!49646 List!34960)) )
))
(declare-fun arrayNoDuplicates!0 (array!100462 (_ BitVec 32) List!34960) Bool)

(assert (=> b!1506115 (= res!1025731 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34957))))

(declare-fun b!1506116 () Bool)

(declare-fun res!1025727 () Bool)

(assert (=> b!1506116 (=> (not res!1025727) (not e!841994))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1506116 (= res!1025727 (not (= (select (arr!48481 a!2850) index!625) (select (arr!48481 a!2850) j!87))))))

(declare-fun res!1025728 () Bool)

(assert (=> start!128372 (=> (not res!1025728) (not e!841994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128372 (= res!1025728 (validMask!0 mask!2661))))

(assert (=> start!128372 e!841994))

(assert (=> start!128372 true))

(declare-fun array_inv!37762 (array!100462) Bool)

(assert (=> start!128372 (array_inv!37762 a!2850)))

(declare-fun b!1506117 () Bool)

(declare-fun res!1025724 () Bool)

(assert (=> b!1506117 (=> (not res!1025724) (not e!841994))))

(assert (=> b!1506117 (= res!1025724 (validKeyInArray!0 (select (arr!48481 a!2850) j!87)))))

(declare-fun b!1506118 () Bool)

(declare-fun res!1025726 () Bool)

(assert (=> b!1506118 (=> (not res!1025726) (not e!841994))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1506118 (= res!1025726 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49032 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49032 a!2850)) (= (select (arr!48481 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48481 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49032 a!2850))))))

(declare-fun b!1506119 () Bool)

(declare-fun res!1025730 () Bool)

(assert (=> b!1506119 (=> (not res!1025730) (not e!841994))))

(declare-datatypes ((SeekEntryResult!12572 0))(
  ( (MissingZero!12572 (index!52680 (_ BitVec 32))) (Found!12572 (index!52681 (_ BitVec 32))) (Intermediate!12572 (undefined!13384 Bool) (index!52682 (_ BitVec 32)) (x!134559 (_ BitVec 32))) (Undefined!12572) (MissingVacant!12572 (index!52683 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100462 (_ BitVec 32)) SeekEntryResult!12572)

(assert (=> b!1506119 (= res!1025730 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48481 a!2850) j!87) a!2850 mask!2661) (Found!12572 j!87)))))

(declare-fun lt!654322 () (_ BitVec 32))

(declare-fun b!1506120 () Bool)

(assert (=> b!1506120 (= e!841994 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (or (bvslt lt!654322 #b00000000000000000000000000000000) (bvsge lt!654322 (size!49032 a!2850)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506120 (= lt!654322 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1506121 () Bool)

(declare-fun res!1025729 () Bool)

(assert (=> b!1506121 (=> (not res!1025729) (not e!841994))))

(assert (=> b!1506121 (= res!1025729 (and (= (size!49032 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49032 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49032 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!128372 res!1025728) b!1506121))

(assert (= (and b!1506121 res!1025729) b!1506113))

(assert (= (and b!1506113 res!1025725) b!1506117))

(assert (= (and b!1506117 res!1025724) b!1506114))

(assert (= (and b!1506114 res!1025732) b!1506115))

(assert (= (and b!1506115 res!1025731) b!1506118))

(assert (= (and b!1506118 res!1025726) b!1506119))

(assert (= (and b!1506119 res!1025730) b!1506116))

(assert (= (and b!1506116 res!1025727) b!1506120))

(declare-fun m!1389273 () Bool)

(assert (=> b!1506119 m!1389273))

(assert (=> b!1506119 m!1389273))

(declare-fun m!1389275 () Bool)

(assert (=> b!1506119 m!1389275))

(declare-fun m!1389277 () Bool)

(assert (=> b!1506114 m!1389277))

(declare-fun m!1389279 () Bool)

(assert (=> start!128372 m!1389279))

(declare-fun m!1389281 () Bool)

(assert (=> start!128372 m!1389281))

(declare-fun m!1389283 () Bool)

(assert (=> b!1506120 m!1389283))

(declare-fun m!1389285 () Bool)

(assert (=> b!1506118 m!1389285))

(declare-fun m!1389287 () Bool)

(assert (=> b!1506118 m!1389287))

(declare-fun m!1389289 () Bool)

(assert (=> b!1506118 m!1389289))

(declare-fun m!1389291 () Bool)

(assert (=> b!1506116 m!1389291))

(assert (=> b!1506116 m!1389273))

(declare-fun m!1389293 () Bool)

(assert (=> b!1506115 m!1389293))

(declare-fun m!1389295 () Bool)

(assert (=> b!1506113 m!1389295))

(assert (=> b!1506113 m!1389295))

(declare-fun m!1389297 () Bool)

(assert (=> b!1506113 m!1389297))

(assert (=> b!1506117 m!1389273))

(assert (=> b!1506117 m!1389273))

(declare-fun m!1389299 () Bool)

(assert (=> b!1506117 m!1389299))

(check-sat (not b!1506117) (not b!1506115) (not start!128372) (not b!1506120) (not b!1506113) (not b!1506119) (not b!1506114))
(check-sat)
(get-model)

(declare-fun b!1506189 () Bool)

(declare-fun e!842015 () SeekEntryResult!12572)

(assert (=> b!1506189 (= e!842015 Undefined!12572)))

(declare-fun b!1506190 () Bool)

(declare-fun e!842016 () SeekEntryResult!12572)

(assert (=> b!1506190 (= e!842016 (Found!12572 index!625))))

(declare-fun e!842014 () SeekEntryResult!12572)

(declare-fun b!1506191 () Bool)

(assert (=> b!1506191 (= e!842014 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 (bvadd x!647 #b00000000000000000000000000000001) mask!2661) vacantBefore!10 (select (arr!48481 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1506192 () Bool)

(assert (=> b!1506192 (= e!842014 (MissingVacant!12572 vacantBefore!10))))

(declare-fun b!1506193 () Bool)

(declare-fun c!139746 () Bool)

(declare-fun lt!654333 () (_ BitVec 64))

(assert (=> b!1506193 (= c!139746 (= lt!654333 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1506193 (= e!842016 e!842014)))

(declare-fun b!1506188 () Bool)

(assert (=> b!1506188 (= e!842015 e!842016)))

(declare-fun c!139747 () Bool)

(assert (=> b!1506188 (= c!139747 (= lt!654333 (select (arr!48481 a!2850) j!87)))))

(declare-fun lt!654334 () SeekEntryResult!12572)

(declare-fun d!158353 () Bool)

(get-info :version)

(assert (=> d!158353 (and (or ((_ is Undefined!12572) lt!654334) (not ((_ is Found!12572) lt!654334)) (and (bvsge (index!52681 lt!654334) #b00000000000000000000000000000000) (bvslt (index!52681 lt!654334) (size!49032 a!2850)))) (or ((_ is Undefined!12572) lt!654334) ((_ is Found!12572) lt!654334) (not ((_ is MissingVacant!12572) lt!654334)) (not (= (index!52683 lt!654334) vacantBefore!10)) (and (bvsge (index!52683 lt!654334) #b00000000000000000000000000000000) (bvslt (index!52683 lt!654334) (size!49032 a!2850)))) (or ((_ is Undefined!12572) lt!654334) (ite ((_ is Found!12572) lt!654334) (= (select (arr!48481 a!2850) (index!52681 lt!654334)) (select (arr!48481 a!2850) j!87)) (and ((_ is MissingVacant!12572) lt!654334) (= (index!52683 lt!654334) vacantBefore!10) (= (select (arr!48481 a!2850) (index!52683 lt!654334)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!158353 (= lt!654334 e!842015)))

(declare-fun c!139745 () Bool)

(assert (=> d!158353 (= c!139745 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!158353 (= lt!654333 (select (arr!48481 a!2850) index!625))))

(assert (=> d!158353 (validMask!0 mask!2661)))

(assert (=> d!158353 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48481 a!2850) j!87) a!2850 mask!2661) lt!654334)))

(assert (= (and d!158353 c!139745) b!1506189))

(assert (= (and d!158353 (not c!139745)) b!1506188))

(assert (= (and b!1506188 c!139747) b!1506190))

(assert (= (and b!1506188 (not c!139747)) b!1506193))

(assert (= (and b!1506193 c!139746) b!1506192))

(assert (= (and b!1506193 (not c!139746)) b!1506191))

(declare-fun m!1389357 () Bool)

(assert (=> b!1506191 m!1389357))

(assert (=> b!1506191 m!1389357))

(assert (=> b!1506191 m!1389273))

(declare-fun m!1389359 () Bool)

(assert (=> b!1506191 m!1389359))

(declare-fun m!1389361 () Bool)

(assert (=> d!158353 m!1389361))

(declare-fun m!1389363 () Bool)

(assert (=> d!158353 m!1389363))

(assert (=> d!158353 m!1389291))

(assert (=> d!158353 m!1389279))

(assert (=> b!1506119 d!158353))

(declare-fun bm!68228 () Bool)

(declare-fun call!68231 () Bool)

(assert (=> bm!68228 (= call!68231 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun d!158355 () Bool)

(declare-fun res!1025796 () Bool)

(declare-fun e!842029 () Bool)

(assert (=> d!158355 (=> res!1025796 e!842029)))

(assert (=> d!158355 (= res!1025796 (bvsge #b00000000000000000000000000000000 (size!49032 a!2850)))))

(assert (=> d!158355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!842029)))

(declare-fun b!1506210 () Bool)

(declare-fun e!842030 () Bool)

(declare-fun e!842031 () Bool)

(assert (=> b!1506210 (= e!842030 e!842031)))

(declare-fun lt!654347 () (_ BitVec 64))

(assert (=> b!1506210 (= lt!654347 (select (arr!48481 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50195 0))(
  ( (Unit!50196) )
))
(declare-fun lt!654348 () Unit!50195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100462 (_ BitVec 64) (_ BitVec 32)) Unit!50195)

(assert (=> b!1506210 (= lt!654348 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!654347 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1506210 (arrayContainsKey!0 a!2850 lt!654347 #b00000000000000000000000000000000)))

(declare-fun lt!654349 () Unit!50195)

(assert (=> b!1506210 (= lt!654349 lt!654348)))

(declare-fun res!1025795 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100462 (_ BitVec 32)) SeekEntryResult!12572)

(assert (=> b!1506210 (= res!1025795 (= (seekEntryOrOpen!0 (select (arr!48481 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12572 #b00000000000000000000000000000000)))))

(assert (=> b!1506210 (=> (not res!1025795) (not e!842031))))

(declare-fun b!1506211 () Bool)

(assert (=> b!1506211 (= e!842030 call!68231)))

(declare-fun b!1506212 () Bool)

(assert (=> b!1506212 (= e!842031 call!68231)))

(declare-fun b!1506213 () Bool)

(assert (=> b!1506213 (= e!842029 e!842030)))

(declare-fun c!139752 () Bool)

(assert (=> b!1506213 (= c!139752 (validKeyInArray!0 (select (arr!48481 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!158355 (not res!1025796)) b!1506213))

(assert (= (and b!1506213 c!139752) b!1506210))

(assert (= (and b!1506213 (not c!139752)) b!1506211))

(assert (= (and b!1506210 res!1025795) b!1506212))

(assert (= (or b!1506212 b!1506211) bm!68228))

(declare-fun m!1389365 () Bool)

(assert (=> bm!68228 m!1389365))

(declare-fun m!1389367 () Bool)

(assert (=> b!1506210 m!1389367))

(declare-fun m!1389369 () Bool)

(assert (=> b!1506210 m!1389369))

(declare-fun m!1389371 () Bool)

(assert (=> b!1506210 m!1389371))

(assert (=> b!1506210 m!1389367))

(declare-fun m!1389373 () Bool)

(assert (=> b!1506210 m!1389373))

(assert (=> b!1506213 m!1389367))

(assert (=> b!1506213 m!1389367))

(declare-fun m!1389375 () Bool)

(assert (=> b!1506213 m!1389375))

(assert (=> b!1506114 d!158355))

(declare-fun d!158361 () Bool)

(assert (=> d!158361 (= (validKeyInArray!0 (select (arr!48481 a!2850) i!996)) (and (not (= (select (arr!48481 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48481 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506113 d!158361))

(declare-fun d!158363 () Bool)

(assert (=> d!158363 (= (validKeyInArray!0 (select (arr!48481 a!2850) j!87)) (and (not (= (select (arr!48481 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48481 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506117 d!158363))

(declare-fun d!158365 () Bool)

(assert (=> d!158365 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128372 d!158365))

(declare-fun d!158369 () Bool)

(assert (=> d!158369 (= (array_inv!37762 a!2850) (bvsge (size!49032 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128372 d!158369))

(declare-fun bm!68232 () Bool)

(declare-fun call!68235 () Bool)

(declare-fun c!139762 () Bool)

(assert (=> bm!68232 (= call!68235 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139762 (Cons!34956 (select (arr!48481 a!2850) #b00000000000000000000000000000000) Nil!34957) Nil!34957)))))

(declare-fun b!1506240 () Bool)

(declare-fun e!842050 () Bool)

(declare-fun e!842052 () Bool)

(assert (=> b!1506240 (= e!842050 e!842052)))

(declare-fun res!1025806 () Bool)

(assert (=> b!1506240 (=> (not res!1025806) (not e!842052))))

(declare-fun e!842051 () Bool)

(assert (=> b!1506240 (= res!1025806 (not e!842051))))

(declare-fun res!1025807 () Bool)

(assert (=> b!1506240 (=> (not res!1025807) (not e!842051))))

(assert (=> b!1506240 (= res!1025807 (validKeyInArray!0 (select (arr!48481 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!158375 () Bool)

(declare-fun res!1025805 () Bool)

(assert (=> d!158375 (=> res!1025805 e!842050)))

(assert (=> d!158375 (= res!1025805 (bvsge #b00000000000000000000000000000000 (size!49032 a!2850)))))

(assert (=> d!158375 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34957) e!842050)))

(declare-fun b!1506241 () Bool)

(declare-fun contains!9992 (List!34960 (_ BitVec 64)) Bool)

(assert (=> b!1506241 (= e!842051 (contains!9992 Nil!34957 (select (arr!48481 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1506242 () Bool)

(declare-fun e!842049 () Bool)

(assert (=> b!1506242 (= e!842049 call!68235)))

(declare-fun b!1506243 () Bool)

(assert (=> b!1506243 (= e!842049 call!68235)))

(declare-fun b!1506244 () Bool)

(assert (=> b!1506244 (= e!842052 e!842049)))

(assert (=> b!1506244 (= c!139762 (validKeyInArray!0 (select (arr!48481 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!158375 (not res!1025805)) b!1506240))

(assert (= (and b!1506240 res!1025807) b!1506241))

(assert (= (and b!1506240 res!1025806) b!1506244))

(assert (= (and b!1506244 c!139762) b!1506243))

(assert (= (and b!1506244 (not c!139762)) b!1506242))

(assert (= (or b!1506243 b!1506242) bm!68232))

(assert (=> bm!68232 m!1389367))

(declare-fun m!1389389 () Bool)

(assert (=> bm!68232 m!1389389))

(assert (=> b!1506240 m!1389367))

(assert (=> b!1506240 m!1389367))

(assert (=> b!1506240 m!1389375))

(assert (=> b!1506241 m!1389367))

(assert (=> b!1506241 m!1389367))

(declare-fun m!1389391 () Bool)

(assert (=> b!1506241 m!1389391))

(assert (=> b!1506244 m!1389367))

(assert (=> b!1506244 m!1389367))

(assert (=> b!1506244 m!1389375))

(assert (=> b!1506115 d!158375))

(declare-fun d!158379 () Bool)

(declare-fun lt!654359 () (_ BitVec 32))

(assert (=> d!158379 (and (bvsge lt!654359 #b00000000000000000000000000000000) (bvslt lt!654359 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!158379 (= lt!654359 (choose!52 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(assert (=> d!158379 (validMask!0 mask!2661)))

(assert (=> d!158379 (= (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) lt!654359)))

(declare-fun bs!43200 () Bool)

(assert (= bs!43200 d!158379))

(declare-fun m!1389393 () Bool)

(assert (=> bs!43200 m!1389393))

(assert (=> bs!43200 m!1389279))

(assert (=> b!1506120 d!158379))

(check-sat (not d!158379) (not b!1506241) (not b!1506244) (not d!158353) (not bm!68232) (not b!1506240) (not bm!68228) (not b!1506210) (not b!1506191) (not b!1506213))
(check-sat)
