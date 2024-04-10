; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130372 () Bool)

(assert start!130372)

(declare-fun b!1530462 () Bool)

(declare-fun res!1047993 () Bool)

(declare-fun e!852814 () Bool)

(assert (=> b!1530462 (=> (not res!1047993) (not e!852814))))

(declare-datatypes ((array!101665 0))(
  ( (array!101666 (arr!49056 (Array (_ BitVec 32) (_ BitVec 64))) (size!49606 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101665)

(declare-datatypes ((List!35539 0))(
  ( (Nil!35536) (Cons!35535 (h!36974 (_ BitVec 64)) (t!50233 List!35539)) )
))
(declare-fun arrayNoDuplicates!0 (array!101665 (_ BitVec 32) List!35539) Bool)

(assert (=> b!1530462 (= res!1047993 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35536))))

(declare-fun b!1530463 () Bool)

(declare-fun res!1047996 () Bool)

(assert (=> b!1530463 (=> (not res!1047996) (not e!852814))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530463 (= res!1047996 (validKeyInArray!0 (select (arr!49056 a!2804) j!70)))))

(declare-fun b!1530464 () Bool)

(declare-fun res!1047991 () Bool)

(declare-fun e!852816 () Bool)

(assert (=> b!1530464 (=> (not res!1047991) (not e!852816))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13221 0))(
  ( (MissingZero!13221 (index!55279 (_ BitVec 32))) (Found!13221 (index!55280 (_ BitVec 32))) (Intermediate!13221 (undefined!14033 Bool) (index!55281 (_ BitVec 32)) (x!136965 (_ BitVec 32))) (Undefined!13221) (MissingVacant!13221 (index!55282 (_ BitVec 32))) )
))
(declare-fun lt!662827 () SeekEntryResult!13221)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101665 (_ BitVec 32)) SeekEntryResult!13221)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530464 (= res!1047991 (= lt!662827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101666 (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804)) mask!2512)))))

(declare-fun b!1530465 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!852813 () Bool)

(declare-fun lt!662825 () (_ BitVec 32))

(assert (=> b!1530465 (= e!852813 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (and (bvsge lt!662825 #b00000000000000000000000000000000) (bvslt lt!662825 (size!49606 a!2804)))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530465 (= lt!662825 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530466 () Bool)

(declare-fun e!852817 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101665 (_ BitVec 32)) SeekEntryResult!13221)

(assert (=> b!1530466 (= e!852817 (= (seekEntry!0 (select (arr!49056 a!2804) j!70) a!2804 mask!2512) (Found!13221 j!70)))))

(declare-fun b!1530467 () Bool)

(declare-fun res!1047988 () Bool)

(assert (=> b!1530467 (=> (not res!1047988) (not e!852814))))

(assert (=> b!1530467 (= res!1047988 (validKeyInArray!0 (select (arr!49056 a!2804) i!961)))))

(declare-fun b!1530468 () Bool)

(assert (=> b!1530468 (= e!852814 e!852816)))

(declare-fun res!1047987 () Bool)

(assert (=> b!1530468 (=> (not res!1047987) (not e!852816))))

(declare-fun lt!662826 () SeekEntryResult!13221)

(assert (=> b!1530468 (= res!1047987 (= lt!662827 lt!662826))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530468 (= lt!662826 (Intermediate!13221 false resIndex!21 resX!21))))

(assert (=> b!1530468 (= lt!662827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49056 a!2804) j!70) mask!2512) (select (arr!49056 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1047990 () Bool)

(assert (=> start!130372 (=> (not res!1047990) (not e!852814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130372 (= res!1047990 (validMask!0 mask!2512))))

(assert (=> start!130372 e!852814))

(assert (=> start!130372 true))

(declare-fun array_inv!38084 (array!101665) Bool)

(assert (=> start!130372 (array_inv!38084 a!2804)))

(declare-fun b!1530469 () Bool)

(declare-fun res!1047994 () Bool)

(assert (=> b!1530469 (=> (not res!1047994) (not e!852814))))

(assert (=> b!1530469 (= res!1047994 (and (= (size!49606 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49606 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49606 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530470 () Bool)

(declare-fun res!1047989 () Bool)

(assert (=> b!1530470 (=> (not res!1047989) (not e!852814))))

(assert (=> b!1530470 (= res!1047989 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49606 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49606 a!2804))))))

(declare-fun b!1530471 () Bool)

(declare-fun res!1047986 () Bool)

(assert (=> b!1530471 (=> (not res!1047986) (not e!852814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101665 (_ BitVec 32)) Bool)

(assert (=> b!1530471 (= res!1047986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530472 () Bool)

(declare-fun res!1047995 () Bool)

(assert (=> b!1530472 (=> (not res!1047995) (not e!852816))))

(assert (=> b!1530472 (= res!1047995 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49056 a!2804) j!70) a!2804 mask!2512) lt!662826))))

(declare-fun b!1530473 () Bool)

(assert (=> b!1530473 (= e!852816 (not e!852813))))

(declare-fun res!1047997 () Bool)

(assert (=> b!1530473 (=> res!1047997 e!852813)))

(assert (=> b!1530473 (= res!1047997 (or (not (= (select (arr!49056 a!2804) j!70) (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530473 e!852817))

(declare-fun res!1047992 () Bool)

(assert (=> b!1530473 (=> (not res!1047992) (not e!852817))))

(assert (=> b!1530473 (= res!1047992 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51226 0))(
  ( (Unit!51227) )
))
(declare-fun lt!662824 () Unit!51226)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51226)

(assert (=> b!1530473 (= lt!662824 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130372 res!1047990) b!1530469))

(assert (= (and b!1530469 res!1047994) b!1530467))

(assert (= (and b!1530467 res!1047988) b!1530463))

(assert (= (and b!1530463 res!1047996) b!1530471))

(assert (= (and b!1530471 res!1047986) b!1530462))

(assert (= (and b!1530462 res!1047993) b!1530470))

(assert (= (and b!1530470 res!1047989) b!1530468))

(assert (= (and b!1530468 res!1047987) b!1530472))

(assert (= (and b!1530472 res!1047995) b!1530464))

(assert (= (and b!1530464 res!1047991) b!1530473))

(assert (= (and b!1530473 res!1047992) b!1530466))

(assert (= (and b!1530473 (not res!1047997)) b!1530465))

(declare-fun m!1413335 () Bool)

(assert (=> b!1530465 m!1413335))

(declare-fun m!1413337 () Bool)

(assert (=> b!1530463 m!1413337))

(assert (=> b!1530463 m!1413337))

(declare-fun m!1413339 () Bool)

(assert (=> b!1530463 m!1413339))

(declare-fun m!1413341 () Bool)

(assert (=> b!1530471 m!1413341))

(assert (=> b!1530466 m!1413337))

(assert (=> b!1530466 m!1413337))

(declare-fun m!1413343 () Bool)

(assert (=> b!1530466 m!1413343))

(declare-fun m!1413345 () Bool)

(assert (=> b!1530464 m!1413345))

(declare-fun m!1413347 () Bool)

(assert (=> b!1530464 m!1413347))

(assert (=> b!1530464 m!1413347))

(declare-fun m!1413349 () Bool)

(assert (=> b!1530464 m!1413349))

(assert (=> b!1530464 m!1413349))

(assert (=> b!1530464 m!1413347))

(declare-fun m!1413351 () Bool)

(assert (=> b!1530464 m!1413351))

(declare-fun m!1413353 () Bool)

(assert (=> b!1530462 m!1413353))

(assert (=> b!1530472 m!1413337))

(assert (=> b!1530472 m!1413337))

(declare-fun m!1413355 () Bool)

(assert (=> b!1530472 m!1413355))

(assert (=> b!1530473 m!1413337))

(declare-fun m!1413357 () Bool)

(assert (=> b!1530473 m!1413357))

(assert (=> b!1530473 m!1413345))

(assert (=> b!1530473 m!1413347))

(declare-fun m!1413359 () Bool)

(assert (=> b!1530473 m!1413359))

(assert (=> b!1530468 m!1413337))

(assert (=> b!1530468 m!1413337))

(declare-fun m!1413361 () Bool)

(assert (=> b!1530468 m!1413361))

(assert (=> b!1530468 m!1413361))

(assert (=> b!1530468 m!1413337))

(declare-fun m!1413363 () Bool)

(assert (=> b!1530468 m!1413363))

(declare-fun m!1413365 () Bool)

(assert (=> b!1530467 m!1413365))

(assert (=> b!1530467 m!1413365))

(declare-fun m!1413367 () Bool)

(assert (=> b!1530467 m!1413367))

(declare-fun m!1413369 () Bool)

(assert (=> start!130372 m!1413369))

(declare-fun m!1413371 () Bool)

(assert (=> start!130372 m!1413371))

(check-sat (not b!1530463) (not b!1530465) (not b!1530466) (not b!1530464) (not b!1530462) (not b!1530473) (not b!1530467) (not b!1530472) (not b!1530471) (not b!1530468) (not start!130372))
(check-sat)
(get-model)

(declare-fun d!159831 () Bool)

(assert (=> d!159831 (= (validKeyInArray!0 (select (arr!49056 a!2804) j!70)) (and (not (= (select (arr!49056 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49056 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530463 d!159831))

(declare-fun b!1530518 () Bool)

(declare-fun e!852841 () Bool)

(declare-fun e!852839 () Bool)

(assert (=> b!1530518 (= e!852841 e!852839)))

(declare-fun lt!662846 () (_ BitVec 64))

(assert (=> b!1530518 (= lt!662846 (select (arr!49056 a!2804) j!70))))

(declare-fun lt!662848 () Unit!51226)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101665 (_ BitVec 64) (_ BitVec 32)) Unit!51226)

(assert (=> b!1530518 (= lt!662848 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662846 j!70))))

(declare-fun arrayContainsKey!0 (array!101665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1530518 (arrayContainsKey!0 a!2804 lt!662846 #b00000000000000000000000000000000)))

(declare-fun lt!662847 () Unit!51226)

(assert (=> b!1530518 (= lt!662847 lt!662848)))

(declare-fun res!1048038 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101665 (_ BitVec 32)) SeekEntryResult!13221)

(assert (=> b!1530518 (= res!1048038 (= (seekEntryOrOpen!0 (select (arr!49056 a!2804) j!70) a!2804 mask!2512) (Found!13221 j!70)))))

(assert (=> b!1530518 (=> (not res!1048038) (not e!852839))))

(declare-fun b!1530519 () Bool)

(declare-fun call!68514 () Bool)

(assert (=> b!1530519 (= e!852841 call!68514)))

(declare-fun b!1530520 () Bool)

(declare-fun e!852840 () Bool)

(assert (=> b!1530520 (= e!852840 e!852841)))

(declare-fun c!140795 () Bool)

(assert (=> b!1530520 (= c!140795 (validKeyInArray!0 (select (arr!49056 a!2804) j!70)))))

(declare-fun b!1530521 () Bool)

(assert (=> b!1530521 (= e!852839 call!68514)))

(declare-fun bm!68511 () Bool)

(assert (=> bm!68511 (= call!68514 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159833 () Bool)

(declare-fun res!1048039 () Bool)

(assert (=> d!159833 (=> res!1048039 e!852840)))

(assert (=> d!159833 (= res!1048039 (bvsge j!70 (size!49606 a!2804)))))

(assert (=> d!159833 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!852840)))

(assert (= (and d!159833 (not res!1048039)) b!1530520))

(assert (= (and b!1530520 c!140795) b!1530518))

(assert (= (and b!1530520 (not c!140795)) b!1530519))

(assert (= (and b!1530518 res!1048038) b!1530521))

(assert (= (or b!1530521 b!1530519) bm!68511))

(assert (=> b!1530518 m!1413337))

(declare-fun m!1413411 () Bool)

(assert (=> b!1530518 m!1413411))

(declare-fun m!1413413 () Bool)

(assert (=> b!1530518 m!1413413))

(assert (=> b!1530518 m!1413337))

(declare-fun m!1413415 () Bool)

(assert (=> b!1530518 m!1413415))

(assert (=> b!1530520 m!1413337))

(assert (=> b!1530520 m!1413337))

(assert (=> b!1530520 m!1413339))

(declare-fun m!1413417 () Bool)

(assert (=> bm!68511 m!1413417))

(assert (=> b!1530473 d!159833))

(declare-fun d!159835 () Bool)

(assert (=> d!159835 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!662851 () Unit!51226)

(declare-fun choose!38 (array!101665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51226)

(assert (=> d!159835 (= lt!662851 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159835 (validMask!0 mask!2512)))

(assert (=> d!159835 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!662851)))

(declare-fun bs!43885 () Bool)

(assert (= bs!43885 d!159835))

(assert (=> bs!43885 m!1413359))

(declare-fun m!1413419 () Bool)

(assert (=> bs!43885 m!1413419))

(assert (=> bs!43885 m!1413369))

(assert (=> b!1530473 d!159835))

(declare-fun b!1530561 () Bool)

(declare-fun lt!662863 () SeekEntryResult!13221)

(assert (=> b!1530561 (and (bvsge (index!55281 lt!662863) #b00000000000000000000000000000000) (bvslt (index!55281 lt!662863) (size!49606 (array!101666 (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804)))))))

(declare-fun res!1048060 () Bool)

(assert (=> b!1530561 (= res!1048060 (= (select (arr!49056 (array!101666 (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804))) (index!55281 lt!662863)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852870 () Bool)

(assert (=> b!1530561 (=> res!1048060 e!852870)))

(declare-fun b!1530562 () Bool)

(declare-fun e!852873 () Bool)

(declare-fun e!852871 () Bool)

(assert (=> b!1530562 (= e!852873 e!852871)))

(declare-fun res!1048061 () Bool)

(get-info :version)

(assert (=> b!1530562 (= res!1048061 (and ((_ is Intermediate!13221) lt!662863) (not (undefined!14033 lt!662863)) (bvslt (x!136965 lt!662863) #b01111111111111111111111111111110) (bvsge (x!136965 lt!662863) #b00000000000000000000000000000000) (bvsge (x!136965 lt!662863) #b00000000000000000000000000000000)))))

(assert (=> b!1530562 (=> (not res!1048061) (not e!852871))))

(declare-fun b!1530563 () Bool)

(declare-fun e!852872 () SeekEntryResult!13221)

(assert (=> b!1530563 (= e!852872 (Intermediate!13221 false (toIndex!0 (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun e!852874 () SeekEntryResult!13221)

(declare-fun b!1530564 () Bool)

(assert (=> b!1530564 (= e!852874 (Intermediate!13221 true (toIndex!0 (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159837 () Bool)

(assert (=> d!159837 e!852873))

(declare-fun c!140807 () Bool)

(assert (=> d!159837 (= c!140807 (and ((_ is Intermediate!13221) lt!662863) (undefined!14033 lt!662863)))))

(assert (=> d!159837 (= lt!662863 e!852874)))

(declare-fun c!140808 () Bool)

(assert (=> d!159837 (= c!140808 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!662862 () (_ BitVec 64))

(assert (=> d!159837 (= lt!662862 (select (arr!49056 (array!101666 (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804))) (toIndex!0 (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159837 (validMask!0 mask!2512)))

(assert (=> d!159837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101666 (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804)) mask!2512) lt!662863)))

(declare-fun b!1530565 () Bool)

(assert (=> b!1530565 (= e!852873 (bvsge (x!136965 lt!662863) #b01111111111111111111111111111110))))

(declare-fun b!1530566 () Bool)

(assert (=> b!1530566 (= e!852874 e!852872)))

(declare-fun c!140809 () Bool)

(assert (=> b!1530566 (= c!140809 (or (= lt!662862 (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!662862 lt!662862) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530567 () Bool)

(assert (=> b!1530567 (and (bvsge (index!55281 lt!662863) #b00000000000000000000000000000000) (bvslt (index!55281 lt!662863) (size!49606 (array!101666 (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804)))))))

(assert (=> b!1530567 (= e!852870 (= (select (arr!49056 (array!101666 (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804))) (index!55281 lt!662863)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530568 () Bool)

(assert (=> b!1530568 (= e!852872 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101666 (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804)) mask!2512))))

(declare-fun b!1530569 () Bool)

(assert (=> b!1530569 (and (bvsge (index!55281 lt!662863) #b00000000000000000000000000000000) (bvslt (index!55281 lt!662863) (size!49606 (array!101666 (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804)))))))

(declare-fun res!1048059 () Bool)

(assert (=> b!1530569 (= res!1048059 (= (select (arr!49056 (array!101666 (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804))) (index!55281 lt!662863)) (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1530569 (=> res!1048059 e!852870)))

(assert (=> b!1530569 (= e!852871 e!852870)))

(assert (= (and d!159837 c!140808) b!1530564))

(assert (= (and d!159837 (not c!140808)) b!1530566))

(assert (= (and b!1530566 c!140809) b!1530563))

(assert (= (and b!1530566 (not c!140809)) b!1530568))

(assert (= (and d!159837 c!140807) b!1530565))

(assert (= (and d!159837 (not c!140807)) b!1530562))

(assert (= (and b!1530562 res!1048061) b!1530569))

(assert (= (and b!1530569 (not res!1048059)) b!1530561))

(assert (= (and b!1530561 (not res!1048060)) b!1530567))

(declare-fun m!1413429 () Bool)

(assert (=> b!1530569 m!1413429))

(assert (=> b!1530561 m!1413429))

(assert (=> b!1530568 m!1413349))

(declare-fun m!1413431 () Bool)

(assert (=> b!1530568 m!1413431))

(assert (=> b!1530568 m!1413431))

(assert (=> b!1530568 m!1413347))

(declare-fun m!1413433 () Bool)

(assert (=> b!1530568 m!1413433))

(assert (=> d!159837 m!1413349))

(declare-fun m!1413435 () Bool)

(assert (=> d!159837 m!1413435))

(assert (=> d!159837 m!1413369))

(assert (=> b!1530567 m!1413429))

(assert (=> b!1530464 d!159837))

(declare-fun d!159845 () Bool)

(declare-fun lt!662872 () (_ BitVec 32))

(declare-fun lt!662871 () (_ BitVec 32))

(assert (=> d!159845 (= lt!662872 (bvmul (bvxor lt!662871 (bvlshr lt!662871 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159845 (= lt!662871 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159845 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048062 (let ((h!36976 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136968 (bvmul (bvxor h!36976 (bvlshr h!36976 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136968 (bvlshr x!136968 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048062 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048062 #b00000000000000000000000000000000))))))

(assert (=> d!159845 (= (toIndex!0 (select (store (arr!49056 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!662872 (bvlshr lt!662872 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530464 d!159845))

(declare-fun b!1530576 () Bool)

(declare-fun e!852880 () Bool)

(declare-fun e!852878 () Bool)

(assert (=> b!1530576 (= e!852880 e!852878)))

(declare-fun lt!662873 () (_ BitVec 64))

(assert (=> b!1530576 (= lt!662873 (select (arr!49056 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!662875 () Unit!51226)

(assert (=> b!1530576 (= lt!662875 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662873 #b00000000000000000000000000000000))))

(assert (=> b!1530576 (arrayContainsKey!0 a!2804 lt!662873 #b00000000000000000000000000000000)))

(declare-fun lt!662874 () Unit!51226)

(assert (=> b!1530576 (= lt!662874 lt!662875)))

(declare-fun res!1048065 () Bool)

(assert (=> b!1530576 (= res!1048065 (= (seekEntryOrOpen!0 (select (arr!49056 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13221 #b00000000000000000000000000000000)))))

(assert (=> b!1530576 (=> (not res!1048065) (not e!852878))))

(declare-fun b!1530577 () Bool)

(declare-fun call!68521 () Bool)

(assert (=> b!1530577 (= e!852880 call!68521)))

(declare-fun b!1530578 () Bool)

(declare-fun e!852879 () Bool)

(assert (=> b!1530578 (= e!852879 e!852880)))

(declare-fun c!140811 () Bool)

(assert (=> b!1530578 (= c!140811 (validKeyInArray!0 (select (arr!49056 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530579 () Bool)

(assert (=> b!1530579 (= e!852878 call!68521)))

(declare-fun bm!68518 () Bool)

(assert (=> bm!68518 (= call!68521 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159853 () Bool)

(declare-fun res!1048066 () Bool)

(assert (=> d!159853 (=> res!1048066 e!852879)))

(assert (=> d!159853 (= res!1048066 (bvsge #b00000000000000000000000000000000 (size!49606 a!2804)))))

(assert (=> d!159853 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!852879)))

(assert (= (and d!159853 (not res!1048066)) b!1530578))

(assert (= (and b!1530578 c!140811) b!1530576))

(assert (= (and b!1530578 (not c!140811)) b!1530577))

(assert (= (and b!1530576 res!1048065) b!1530579))

(assert (= (or b!1530579 b!1530577) bm!68518))

(declare-fun m!1413445 () Bool)

(assert (=> b!1530576 m!1413445))

(declare-fun m!1413447 () Bool)

(assert (=> b!1530576 m!1413447))

(declare-fun m!1413449 () Bool)

(assert (=> b!1530576 m!1413449))

(assert (=> b!1530576 m!1413445))

(declare-fun m!1413451 () Bool)

(assert (=> b!1530576 m!1413451))

(assert (=> b!1530578 m!1413445))

(assert (=> b!1530578 m!1413445))

(declare-fun m!1413453 () Bool)

(assert (=> b!1530578 m!1413453))

(declare-fun m!1413455 () Bool)

(assert (=> bm!68518 m!1413455))

(assert (=> b!1530471 d!159853))

(declare-fun bm!68521 () Bool)

(declare-fun call!68524 () Bool)

(declare-fun c!140814 () Bool)

(assert (=> bm!68521 (= call!68524 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140814 (Cons!35535 (select (arr!49056 a!2804) #b00000000000000000000000000000000) Nil!35536) Nil!35536)))))

(declare-fun b!1530590 () Bool)

(declare-fun e!852890 () Bool)

(declare-fun e!852892 () Bool)

(assert (=> b!1530590 (= e!852890 e!852892)))

(declare-fun res!1048074 () Bool)

(assert (=> b!1530590 (=> (not res!1048074) (not e!852892))))

(declare-fun e!852889 () Bool)

(assert (=> b!1530590 (= res!1048074 (not e!852889))))

(declare-fun res!1048073 () Bool)

(assert (=> b!1530590 (=> (not res!1048073) (not e!852889))))

(assert (=> b!1530590 (= res!1048073 (validKeyInArray!0 (select (arr!49056 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530591 () Bool)

(declare-fun e!852891 () Bool)

(assert (=> b!1530591 (= e!852892 e!852891)))

(assert (=> b!1530591 (= c!140814 (validKeyInArray!0 (select (arr!49056 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530592 () Bool)

(assert (=> b!1530592 (= e!852891 call!68524)))

(declare-fun d!159855 () Bool)

(declare-fun res!1048075 () Bool)

(assert (=> d!159855 (=> res!1048075 e!852890)))

(assert (=> d!159855 (= res!1048075 (bvsge #b00000000000000000000000000000000 (size!49606 a!2804)))))

(assert (=> d!159855 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35536) e!852890)))

(declare-fun b!1530593 () Bool)

(declare-fun contains!10000 (List!35539 (_ BitVec 64)) Bool)

(assert (=> b!1530593 (= e!852889 (contains!10000 Nil!35536 (select (arr!49056 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530594 () Bool)

(assert (=> b!1530594 (= e!852891 call!68524)))

(assert (= (and d!159855 (not res!1048075)) b!1530590))

(assert (= (and b!1530590 res!1048073) b!1530593))

(assert (= (and b!1530590 res!1048074) b!1530591))

(assert (= (and b!1530591 c!140814) b!1530594))

(assert (= (and b!1530591 (not c!140814)) b!1530592))

(assert (= (or b!1530594 b!1530592) bm!68521))

(assert (=> bm!68521 m!1413445))

(declare-fun m!1413461 () Bool)

(assert (=> bm!68521 m!1413461))

(assert (=> b!1530590 m!1413445))

(assert (=> b!1530590 m!1413445))

(assert (=> b!1530590 m!1413453))

(assert (=> b!1530591 m!1413445))

(assert (=> b!1530591 m!1413445))

(assert (=> b!1530591 m!1413453))

(assert (=> b!1530593 m!1413445))

(assert (=> b!1530593 m!1413445))

(declare-fun m!1413463 () Bool)

(assert (=> b!1530593 m!1413463))

(assert (=> b!1530462 d!159855))

(declare-fun b!1530595 () Bool)

(declare-fun lt!662883 () SeekEntryResult!13221)

(assert (=> b!1530595 (and (bvsge (index!55281 lt!662883) #b00000000000000000000000000000000) (bvslt (index!55281 lt!662883) (size!49606 a!2804)))))

(declare-fun res!1048077 () Bool)

(assert (=> b!1530595 (= res!1048077 (= (select (arr!49056 a!2804) (index!55281 lt!662883)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852893 () Bool)

(assert (=> b!1530595 (=> res!1048077 e!852893)))

(declare-fun b!1530596 () Bool)

(declare-fun e!852896 () Bool)

(declare-fun e!852894 () Bool)

(assert (=> b!1530596 (= e!852896 e!852894)))

(declare-fun res!1048078 () Bool)

(assert (=> b!1530596 (= res!1048078 (and ((_ is Intermediate!13221) lt!662883) (not (undefined!14033 lt!662883)) (bvslt (x!136965 lt!662883) #b01111111111111111111111111111110) (bvsge (x!136965 lt!662883) #b00000000000000000000000000000000) (bvsge (x!136965 lt!662883) x!534)))))

(assert (=> b!1530596 (=> (not res!1048078) (not e!852894))))

(declare-fun b!1530597 () Bool)

(declare-fun e!852895 () SeekEntryResult!13221)

(assert (=> b!1530597 (= e!852895 (Intermediate!13221 false index!487 x!534))))

(declare-fun b!1530598 () Bool)

(declare-fun e!852897 () SeekEntryResult!13221)

(assert (=> b!1530598 (= e!852897 (Intermediate!13221 true index!487 x!534))))

(declare-fun d!159863 () Bool)

(assert (=> d!159863 e!852896))

(declare-fun c!140815 () Bool)

(assert (=> d!159863 (= c!140815 (and ((_ is Intermediate!13221) lt!662883) (undefined!14033 lt!662883)))))

(assert (=> d!159863 (= lt!662883 e!852897)))

(declare-fun c!140816 () Bool)

(assert (=> d!159863 (= c!140816 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!662882 () (_ BitVec 64))

(assert (=> d!159863 (= lt!662882 (select (arr!49056 a!2804) index!487))))

(assert (=> d!159863 (validMask!0 mask!2512)))

(assert (=> d!159863 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49056 a!2804) j!70) a!2804 mask!2512) lt!662883)))

(declare-fun b!1530599 () Bool)

(assert (=> b!1530599 (= e!852896 (bvsge (x!136965 lt!662883) #b01111111111111111111111111111110))))

(declare-fun b!1530600 () Bool)

(assert (=> b!1530600 (= e!852897 e!852895)))

(declare-fun c!140817 () Bool)

(assert (=> b!1530600 (= c!140817 (or (= lt!662882 (select (arr!49056 a!2804) j!70)) (= (bvadd lt!662882 lt!662882) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530601 () Bool)

(assert (=> b!1530601 (and (bvsge (index!55281 lt!662883) #b00000000000000000000000000000000) (bvslt (index!55281 lt!662883) (size!49606 a!2804)))))

(assert (=> b!1530601 (= e!852893 (= (select (arr!49056 a!2804) (index!55281 lt!662883)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530602 () Bool)

(assert (=> b!1530602 (= e!852895 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49056 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530603 () Bool)

(assert (=> b!1530603 (and (bvsge (index!55281 lt!662883) #b00000000000000000000000000000000) (bvslt (index!55281 lt!662883) (size!49606 a!2804)))))

(declare-fun res!1048076 () Bool)

(assert (=> b!1530603 (= res!1048076 (= (select (arr!49056 a!2804) (index!55281 lt!662883)) (select (arr!49056 a!2804) j!70)))))

(assert (=> b!1530603 (=> res!1048076 e!852893)))

(assert (=> b!1530603 (= e!852894 e!852893)))

(assert (= (and d!159863 c!140816) b!1530598))

(assert (= (and d!159863 (not c!140816)) b!1530600))

(assert (= (and b!1530600 c!140817) b!1530597))

(assert (= (and b!1530600 (not c!140817)) b!1530602))

(assert (= (and d!159863 c!140815) b!1530599))

(assert (= (and d!159863 (not c!140815)) b!1530596))

(assert (= (and b!1530596 res!1048078) b!1530603))

(assert (= (and b!1530603 (not res!1048076)) b!1530595))

(assert (= (and b!1530595 (not res!1048077)) b!1530601))

(declare-fun m!1413465 () Bool)

(assert (=> b!1530603 m!1413465))

(assert (=> b!1530595 m!1413465))

(assert (=> b!1530602 m!1413335))

(assert (=> b!1530602 m!1413335))

(assert (=> b!1530602 m!1413337))

(declare-fun m!1413467 () Bool)

(assert (=> b!1530602 m!1413467))

(declare-fun m!1413469 () Bool)

(assert (=> d!159863 m!1413469))

(assert (=> d!159863 m!1413369))

(assert (=> b!1530601 m!1413465))

(assert (=> b!1530472 d!159863))

(declare-fun b!1530604 () Bool)

(declare-fun lt!662885 () SeekEntryResult!13221)

(assert (=> b!1530604 (and (bvsge (index!55281 lt!662885) #b00000000000000000000000000000000) (bvslt (index!55281 lt!662885) (size!49606 a!2804)))))

(declare-fun res!1048080 () Bool)

(assert (=> b!1530604 (= res!1048080 (= (select (arr!49056 a!2804) (index!55281 lt!662885)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852898 () Bool)

(assert (=> b!1530604 (=> res!1048080 e!852898)))

(declare-fun b!1530605 () Bool)

(declare-fun e!852901 () Bool)

(declare-fun e!852899 () Bool)

(assert (=> b!1530605 (= e!852901 e!852899)))

(declare-fun res!1048081 () Bool)

(assert (=> b!1530605 (= res!1048081 (and ((_ is Intermediate!13221) lt!662885) (not (undefined!14033 lt!662885)) (bvslt (x!136965 lt!662885) #b01111111111111111111111111111110) (bvsge (x!136965 lt!662885) #b00000000000000000000000000000000) (bvsge (x!136965 lt!662885) #b00000000000000000000000000000000)))))

(assert (=> b!1530605 (=> (not res!1048081) (not e!852899))))

(declare-fun e!852900 () SeekEntryResult!13221)

(declare-fun b!1530606 () Bool)

(assert (=> b!1530606 (= e!852900 (Intermediate!13221 false (toIndex!0 (select (arr!49056 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun e!852902 () SeekEntryResult!13221)

(declare-fun b!1530607 () Bool)

(assert (=> b!1530607 (= e!852902 (Intermediate!13221 true (toIndex!0 (select (arr!49056 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159865 () Bool)

(assert (=> d!159865 e!852901))

(declare-fun c!140818 () Bool)

(assert (=> d!159865 (= c!140818 (and ((_ is Intermediate!13221) lt!662885) (undefined!14033 lt!662885)))))

(assert (=> d!159865 (= lt!662885 e!852902)))

(declare-fun c!140819 () Bool)

(assert (=> d!159865 (= c!140819 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!662884 () (_ BitVec 64))

(assert (=> d!159865 (= lt!662884 (select (arr!49056 a!2804) (toIndex!0 (select (arr!49056 a!2804) j!70) mask!2512)))))

(assert (=> d!159865 (validMask!0 mask!2512)))

(assert (=> d!159865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49056 a!2804) j!70) mask!2512) (select (arr!49056 a!2804) j!70) a!2804 mask!2512) lt!662885)))

(declare-fun b!1530608 () Bool)

(assert (=> b!1530608 (= e!852901 (bvsge (x!136965 lt!662885) #b01111111111111111111111111111110))))

(declare-fun b!1530609 () Bool)

(assert (=> b!1530609 (= e!852902 e!852900)))

(declare-fun c!140820 () Bool)

(assert (=> b!1530609 (= c!140820 (or (= lt!662884 (select (arr!49056 a!2804) j!70)) (= (bvadd lt!662884 lt!662884) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530610 () Bool)

(assert (=> b!1530610 (and (bvsge (index!55281 lt!662885) #b00000000000000000000000000000000) (bvslt (index!55281 lt!662885) (size!49606 a!2804)))))

(assert (=> b!1530610 (= e!852898 (= (select (arr!49056 a!2804) (index!55281 lt!662885)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530611 () Bool)

(assert (=> b!1530611 (= e!852900 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49056 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49056 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530612 () Bool)

(assert (=> b!1530612 (and (bvsge (index!55281 lt!662885) #b00000000000000000000000000000000) (bvslt (index!55281 lt!662885) (size!49606 a!2804)))))

(declare-fun res!1048079 () Bool)

(assert (=> b!1530612 (= res!1048079 (= (select (arr!49056 a!2804) (index!55281 lt!662885)) (select (arr!49056 a!2804) j!70)))))

(assert (=> b!1530612 (=> res!1048079 e!852898)))

(assert (=> b!1530612 (= e!852899 e!852898)))

(assert (= (and d!159865 c!140819) b!1530607))

(assert (= (and d!159865 (not c!140819)) b!1530609))

(assert (= (and b!1530609 c!140820) b!1530606))

(assert (= (and b!1530609 (not c!140820)) b!1530611))

(assert (= (and d!159865 c!140818) b!1530608))

(assert (= (and d!159865 (not c!140818)) b!1530605))

(assert (= (and b!1530605 res!1048081) b!1530612))

(assert (= (and b!1530612 (not res!1048079)) b!1530604))

(assert (= (and b!1530604 (not res!1048080)) b!1530610))

(declare-fun m!1413471 () Bool)

(assert (=> b!1530612 m!1413471))

(assert (=> b!1530604 m!1413471))

(assert (=> b!1530611 m!1413361))

(declare-fun m!1413473 () Bool)

(assert (=> b!1530611 m!1413473))

(assert (=> b!1530611 m!1413473))

(assert (=> b!1530611 m!1413337))

(declare-fun m!1413475 () Bool)

(assert (=> b!1530611 m!1413475))

(assert (=> d!159865 m!1413361))

(declare-fun m!1413477 () Bool)

(assert (=> d!159865 m!1413477))

(assert (=> d!159865 m!1413369))

(assert (=> b!1530610 m!1413471))

(assert (=> b!1530468 d!159865))

(declare-fun d!159867 () Bool)

(declare-fun lt!662887 () (_ BitVec 32))

(declare-fun lt!662886 () (_ BitVec 32))

(assert (=> d!159867 (= lt!662887 (bvmul (bvxor lt!662886 (bvlshr lt!662886 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159867 (= lt!662886 ((_ extract 31 0) (bvand (bvxor (select (arr!49056 a!2804) j!70) (bvlshr (select (arr!49056 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159867 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048062 (let ((h!36976 ((_ extract 31 0) (bvand (bvxor (select (arr!49056 a!2804) j!70) (bvlshr (select (arr!49056 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136968 (bvmul (bvxor h!36976 (bvlshr h!36976 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136968 (bvlshr x!136968 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048062 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048062 #b00000000000000000000000000000000))))))

(assert (=> d!159867 (= (toIndex!0 (select (arr!49056 a!2804) j!70) mask!2512) (bvand (bvxor lt!662887 (bvlshr lt!662887 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530468 d!159867))

(declare-fun d!159869 () Bool)

(assert (=> d!159869 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130372 d!159869))

(declare-fun d!159873 () Bool)

(assert (=> d!159873 (= (array_inv!38084 a!2804) (bvsge (size!49606 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130372 d!159873))

(declare-fun b!1530722 () Bool)

(declare-fun e!852967 () SeekEntryResult!13221)

(assert (=> b!1530722 (= e!852967 Undefined!13221)))

(declare-fun b!1530723 () Bool)

(declare-fun e!852968 () SeekEntryResult!13221)

(declare-fun lt!662942 () SeekEntryResult!13221)

(assert (=> b!1530723 (= e!852968 (Found!13221 (index!55281 lt!662942)))))

(declare-fun b!1530724 () Bool)

(declare-fun c!140858 () Bool)

(declare-fun lt!662944 () (_ BitVec 64))

(assert (=> b!1530724 (= c!140858 (= lt!662944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852966 () SeekEntryResult!13221)

(assert (=> b!1530724 (= e!852968 e!852966)))

(declare-fun d!159875 () Bool)

(declare-fun lt!662945 () SeekEntryResult!13221)

(assert (=> d!159875 (and (or ((_ is MissingVacant!13221) lt!662945) (not ((_ is Found!13221) lt!662945)) (and (bvsge (index!55280 lt!662945) #b00000000000000000000000000000000) (bvslt (index!55280 lt!662945) (size!49606 a!2804)))) (not ((_ is MissingVacant!13221) lt!662945)) (or (not ((_ is Found!13221) lt!662945)) (= (select (arr!49056 a!2804) (index!55280 lt!662945)) (select (arr!49056 a!2804) j!70))))))

(assert (=> d!159875 (= lt!662945 e!852967)))

(declare-fun c!140860 () Bool)

(assert (=> d!159875 (= c!140860 (and ((_ is Intermediate!13221) lt!662942) (undefined!14033 lt!662942)))))

(assert (=> d!159875 (= lt!662942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49056 a!2804) j!70) mask!2512) (select (arr!49056 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159875 (validMask!0 mask!2512)))

(assert (=> d!159875 (= (seekEntry!0 (select (arr!49056 a!2804) j!70) a!2804 mask!2512) lt!662945)))

(declare-fun b!1530725 () Bool)

(declare-fun lt!662943 () SeekEntryResult!13221)

(assert (=> b!1530725 (= e!852966 (ite ((_ is MissingVacant!13221) lt!662943) (MissingZero!13221 (index!55282 lt!662943)) lt!662943))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101665 (_ BitVec 32)) SeekEntryResult!13221)

(assert (=> b!1530725 (= lt!662943 (seekKeyOrZeroReturnVacant!0 (x!136965 lt!662942) (index!55281 lt!662942) (index!55281 lt!662942) (select (arr!49056 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530726 () Bool)

(assert (=> b!1530726 (= e!852967 e!852968)))

(assert (=> b!1530726 (= lt!662944 (select (arr!49056 a!2804) (index!55281 lt!662942)))))

(declare-fun c!140859 () Bool)

(assert (=> b!1530726 (= c!140859 (= lt!662944 (select (arr!49056 a!2804) j!70)))))

(declare-fun b!1530727 () Bool)

(assert (=> b!1530727 (= e!852966 (MissingZero!13221 (index!55281 lt!662942)))))

(assert (= (and d!159875 c!140860) b!1530722))

(assert (= (and d!159875 (not c!140860)) b!1530726))

(assert (= (and b!1530726 c!140859) b!1530723))

(assert (= (and b!1530726 (not c!140859)) b!1530724))

(assert (= (and b!1530724 c!140858) b!1530727))

(assert (= (and b!1530724 (not c!140858)) b!1530725))

(declare-fun m!1413537 () Bool)

(assert (=> d!159875 m!1413537))

(assert (=> d!159875 m!1413337))

(assert (=> d!159875 m!1413361))

(assert (=> d!159875 m!1413361))

(assert (=> d!159875 m!1413337))

(assert (=> d!159875 m!1413363))

(assert (=> d!159875 m!1413369))

(assert (=> b!1530725 m!1413337))

(declare-fun m!1413541 () Bool)

(assert (=> b!1530725 m!1413541))

(declare-fun m!1413547 () Bool)

(assert (=> b!1530726 m!1413547))

(assert (=> b!1530466 d!159875))

(declare-fun d!159899 () Bool)

(declare-fun lt!662951 () (_ BitVec 32))

(assert (=> d!159899 (and (bvsge lt!662951 #b00000000000000000000000000000000) (bvslt lt!662951 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159899 (= lt!662951 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159899 (validMask!0 mask!2512)))

(assert (=> d!159899 (= (nextIndex!0 index!487 x!534 mask!2512) lt!662951)))

(declare-fun bs!43888 () Bool)

(assert (= bs!43888 d!159899))

(declare-fun m!1413551 () Bool)

(assert (=> bs!43888 m!1413551))

(assert (=> bs!43888 m!1413369))

(assert (=> b!1530465 d!159899))

(declare-fun d!159903 () Bool)

(assert (=> d!159903 (= (validKeyInArray!0 (select (arr!49056 a!2804) i!961)) (and (not (= (select (arr!49056 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49056 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530467 d!159903))

(check-sat (not b!1530518) (not b!1530576) (not d!159875) (not d!159863) (not b!1530593) (not b!1530590) (not b!1530611) (not d!159865) (not b!1530578) (not d!159899) (not b!1530591) (not b!1530725) (not bm!68521) (not b!1530520) (not b!1530602) (not bm!68511) (not d!159837) (not bm!68518) (not d!159835) (not b!1530568))
(check-sat)
