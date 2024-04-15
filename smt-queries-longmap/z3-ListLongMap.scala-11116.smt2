; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129750 () Bool)

(assert start!129750)

(declare-fun lt!659739 () (_ BitVec 64))

(declare-fun e!849234 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101344 0))(
  ( (array!101345 (arr!48904 (Array (_ BitVec 32) (_ BitVec 64))) (size!49456 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101344)

(declare-fun b!1523366 () Bool)

(declare-fun lt!659735 () array!101344)

(declare-datatypes ((SeekEntryResult!13092 0))(
  ( (MissingZero!13092 (index!54763 (_ BitVec 32))) (Found!13092 (index!54764 (_ BitVec 32))) (Intermediate!13092 (undefined!13904 Bool) (index!54765 (_ BitVec 32)) (x!136453 (_ BitVec 32))) (Undefined!13092) (MissingVacant!13092 (index!54766 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101344 (_ BitVec 32)) SeekEntryResult!13092)

(assert (=> b!1523366 (= e!849234 (= (seekEntryOrOpen!0 (select (arr!48904 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!659739 lt!659735 mask!2512)))))

(declare-fun b!1523367 () Bool)

(declare-fun res!1042461 () Bool)

(declare-fun e!849233 () Bool)

(assert (=> b!1523367 (=> (not res!1042461) (not e!849233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101344 (_ BitVec 32)) Bool)

(assert (=> b!1523367 (= res!1042461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523368 () Bool)

(declare-fun res!1042468 () Bool)

(assert (=> b!1523368 (=> (not res!1042468) (not e!849233))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523368 (= res!1042468 (validKeyInArray!0 (select (arr!48904 a!2804) i!961)))))

(declare-fun b!1523369 () Bool)

(declare-fun res!1042465 () Bool)

(declare-fun e!849235 () Bool)

(assert (=> b!1523369 (=> (not res!1042465) (not e!849235))))

(declare-fun lt!659737 () SeekEntryResult!13092)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101344 (_ BitVec 32)) SeekEntryResult!13092)

(assert (=> b!1523369 (= res!1042465 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48904 a!2804) j!70) a!2804 mask!2512) lt!659737))))

(declare-fun b!1523370 () Bool)

(declare-fun e!849231 () Bool)

(assert (=> b!1523370 (= e!849235 e!849231)))

(declare-fun res!1042457 () Bool)

(assert (=> b!1523370 (=> (not res!1042457) (not e!849231))))

(declare-fun lt!659738 () SeekEntryResult!13092)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523370 (= res!1042457 (= lt!659738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!659739 mask!2512) lt!659739 lt!659735 mask!2512)))))

(assert (=> b!1523370 (= lt!659739 (select (store (arr!48904 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1523370 (= lt!659735 (array!101345 (store (arr!48904 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49456 a!2804)))))

(declare-fun b!1523371 () Bool)

(declare-fun res!1042464 () Bool)

(assert (=> b!1523371 (=> (not res!1042464) (not e!849233))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523371 (= res!1042464 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49456 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49456 a!2804))))))

(declare-fun b!1523372 () Bool)

(assert (=> b!1523372 (= e!849231 (not e!849234))))

(declare-fun res!1042466 () Bool)

(assert (=> b!1523372 (=> res!1042466 e!849234)))

(assert (=> b!1523372 (= res!1042466 (or (not (= (select (arr!48904 a!2804) j!70) lt!659739)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48904 a!2804) index!487) (select (arr!48904 a!2804) j!70))) (not (= j!70 index!487))))))

(declare-fun e!849230 () Bool)

(assert (=> b!1523372 e!849230))

(declare-fun res!1042460 () Bool)

(assert (=> b!1523372 (=> (not res!1042460) (not e!849230))))

(assert (=> b!1523372 (= res!1042460 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50807 0))(
  ( (Unit!50808) )
))
(declare-fun lt!659736 () Unit!50807)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50807)

(assert (=> b!1523372 (= lt!659736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523373 () Bool)

(declare-fun res!1042459 () Bool)

(assert (=> b!1523373 (=> (not res!1042459) (not e!849233))))

(declare-datatypes ((List!35465 0))(
  ( (Nil!35462) (Cons!35461 (h!36886 (_ BitVec 64)) (t!50151 List!35465)) )
))
(declare-fun arrayNoDuplicates!0 (array!101344 (_ BitVec 32) List!35465) Bool)

(assert (=> b!1523373 (= res!1042459 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35462))))

(declare-fun b!1523374 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101344 (_ BitVec 32)) SeekEntryResult!13092)

(assert (=> b!1523374 (= e!849230 (= (seekEntry!0 (select (arr!48904 a!2804) j!70) a!2804 mask!2512) (Found!13092 j!70)))))

(declare-fun b!1523375 () Bool)

(assert (=> b!1523375 (= e!849233 e!849235)))

(declare-fun res!1042462 () Bool)

(assert (=> b!1523375 (=> (not res!1042462) (not e!849235))))

(assert (=> b!1523375 (= res!1042462 (= lt!659738 lt!659737))))

(assert (=> b!1523375 (= lt!659737 (Intermediate!13092 false resIndex!21 resX!21))))

(assert (=> b!1523375 (= lt!659738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48904 a!2804) j!70) mask!2512) (select (arr!48904 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523376 () Bool)

(declare-fun res!1042463 () Bool)

(assert (=> b!1523376 (=> (not res!1042463) (not e!849233))))

(assert (=> b!1523376 (= res!1042463 (and (= (size!49456 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49456 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49456 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1042458 () Bool)

(assert (=> start!129750 (=> (not res!1042458) (not e!849233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129750 (= res!1042458 (validMask!0 mask!2512))))

(assert (=> start!129750 e!849233))

(assert (=> start!129750 true))

(declare-fun array_inv!38137 (array!101344) Bool)

(assert (=> start!129750 (array_inv!38137 a!2804)))

(declare-fun b!1523377 () Bool)

(declare-fun res!1042467 () Bool)

(assert (=> b!1523377 (=> (not res!1042467) (not e!849233))))

(assert (=> b!1523377 (= res!1042467 (validKeyInArray!0 (select (arr!48904 a!2804) j!70)))))

(assert (= (and start!129750 res!1042458) b!1523376))

(assert (= (and b!1523376 res!1042463) b!1523368))

(assert (= (and b!1523368 res!1042468) b!1523377))

(assert (= (and b!1523377 res!1042467) b!1523367))

(assert (= (and b!1523367 res!1042461) b!1523373))

(assert (= (and b!1523373 res!1042459) b!1523371))

(assert (= (and b!1523371 res!1042464) b!1523375))

(assert (= (and b!1523375 res!1042462) b!1523369))

(assert (= (and b!1523369 res!1042465) b!1523370))

(assert (= (and b!1523370 res!1042457) b!1523372))

(assert (= (and b!1523372 res!1042460) b!1523374))

(assert (= (and b!1523372 (not res!1042466)) b!1523366))

(declare-fun m!1405925 () Bool)

(assert (=> b!1523367 m!1405925))

(declare-fun m!1405927 () Bool)

(assert (=> b!1523375 m!1405927))

(assert (=> b!1523375 m!1405927))

(declare-fun m!1405929 () Bool)

(assert (=> b!1523375 m!1405929))

(assert (=> b!1523375 m!1405929))

(assert (=> b!1523375 m!1405927))

(declare-fun m!1405931 () Bool)

(assert (=> b!1523375 m!1405931))

(assert (=> b!1523372 m!1405927))

(declare-fun m!1405933 () Bool)

(assert (=> b!1523372 m!1405933))

(declare-fun m!1405935 () Bool)

(assert (=> b!1523372 m!1405935))

(declare-fun m!1405937 () Bool)

(assert (=> b!1523372 m!1405937))

(declare-fun m!1405939 () Bool)

(assert (=> b!1523373 m!1405939))

(assert (=> b!1523369 m!1405927))

(assert (=> b!1523369 m!1405927))

(declare-fun m!1405941 () Bool)

(assert (=> b!1523369 m!1405941))

(declare-fun m!1405943 () Bool)

(assert (=> start!129750 m!1405943))

(declare-fun m!1405945 () Bool)

(assert (=> start!129750 m!1405945))

(declare-fun m!1405947 () Bool)

(assert (=> b!1523370 m!1405947))

(assert (=> b!1523370 m!1405947))

(declare-fun m!1405949 () Bool)

(assert (=> b!1523370 m!1405949))

(declare-fun m!1405951 () Bool)

(assert (=> b!1523370 m!1405951))

(declare-fun m!1405953 () Bool)

(assert (=> b!1523370 m!1405953))

(assert (=> b!1523374 m!1405927))

(assert (=> b!1523374 m!1405927))

(declare-fun m!1405955 () Bool)

(assert (=> b!1523374 m!1405955))

(declare-fun m!1405957 () Bool)

(assert (=> b!1523368 m!1405957))

(assert (=> b!1523368 m!1405957))

(declare-fun m!1405959 () Bool)

(assert (=> b!1523368 m!1405959))

(assert (=> b!1523377 m!1405927))

(assert (=> b!1523377 m!1405927))

(declare-fun m!1405961 () Bool)

(assert (=> b!1523377 m!1405961))

(assert (=> b!1523366 m!1405927))

(assert (=> b!1523366 m!1405927))

(declare-fun m!1405963 () Bool)

(assert (=> b!1523366 m!1405963))

(declare-fun m!1405965 () Bool)

(assert (=> b!1523366 m!1405965))

(check-sat (not b!1523377) (not start!129750) (not b!1523366) (not b!1523367) (not b!1523369) (not b!1523368) (not b!1523370) (not b!1523375) (not b!1523372) (not b!1523374) (not b!1523373))
(check-sat)
(get-model)

(declare-fun b!1523468 () Bool)

(declare-fun e!849284 () SeekEntryResult!13092)

(assert (=> b!1523468 (= e!849284 (Intermediate!13092 false (toIndex!0 lt!659739 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1523469 () Bool)

(declare-fun lt!659775 () SeekEntryResult!13092)

(assert (=> b!1523469 (and (bvsge (index!54765 lt!659775) #b00000000000000000000000000000000) (bvslt (index!54765 lt!659775) (size!49456 lt!659735)))))

(declare-fun res!1042549 () Bool)

(assert (=> b!1523469 (= res!1042549 (= (select (arr!48904 lt!659735) (index!54765 lt!659775)) lt!659739))))

(declare-fun e!849286 () Bool)

(assert (=> b!1523469 (=> res!1042549 e!849286)))

(declare-fun e!849283 () Bool)

(assert (=> b!1523469 (= e!849283 e!849286)))

(declare-fun d!158995 () Bool)

(declare-fun e!849285 () Bool)

(assert (=> d!158995 e!849285))

(declare-fun c!140011 () Bool)

(get-info :version)

(assert (=> d!158995 (= c!140011 (and ((_ is Intermediate!13092) lt!659775) (undefined!13904 lt!659775)))))

(declare-fun e!849282 () SeekEntryResult!13092)

(assert (=> d!158995 (= lt!659775 e!849282)))

(declare-fun c!140013 () Bool)

(assert (=> d!158995 (= c!140013 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659774 () (_ BitVec 64))

(assert (=> d!158995 (= lt!659774 (select (arr!48904 lt!659735) (toIndex!0 lt!659739 mask!2512)))))

(assert (=> d!158995 (validMask!0 mask!2512)))

(assert (=> d!158995 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!659739 mask!2512) lt!659739 lt!659735 mask!2512) lt!659775)))

(declare-fun b!1523470 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523470 (= e!849284 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!659739 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!659739 lt!659735 mask!2512))))

(declare-fun b!1523471 () Bool)

(assert (=> b!1523471 (and (bvsge (index!54765 lt!659775) #b00000000000000000000000000000000) (bvslt (index!54765 lt!659775) (size!49456 lt!659735)))))

(assert (=> b!1523471 (= e!849286 (= (select (arr!48904 lt!659735) (index!54765 lt!659775)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1523472 () Bool)

(assert (=> b!1523472 (= e!849282 e!849284)))

(declare-fun c!140012 () Bool)

(assert (=> b!1523472 (= c!140012 (or (= lt!659774 lt!659739) (= (bvadd lt!659774 lt!659774) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1523473 () Bool)

(assert (=> b!1523473 (= e!849285 (bvsge (x!136453 lt!659775) #b01111111111111111111111111111110))))

(declare-fun b!1523474 () Bool)

(assert (=> b!1523474 (and (bvsge (index!54765 lt!659775) #b00000000000000000000000000000000) (bvslt (index!54765 lt!659775) (size!49456 lt!659735)))))

(declare-fun res!1042547 () Bool)

(assert (=> b!1523474 (= res!1042547 (= (select (arr!48904 lt!659735) (index!54765 lt!659775)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523474 (=> res!1042547 e!849286)))

(declare-fun b!1523475 () Bool)

(assert (=> b!1523475 (= e!849285 e!849283)))

(declare-fun res!1042548 () Bool)

(assert (=> b!1523475 (= res!1042548 (and ((_ is Intermediate!13092) lt!659775) (not (undefined!13904 lt!659775)) (bvslt (x!136453 lt!659775) #b01111111111111111111111111111110) (bvsge (x!136453 lt!659775) #b00000000000000000000000000000000) (bvsge (x!136453 lt!659775) #b00000000000000000000000000000000)))))

(assert (=> b!1523475 (=> (not res!1042548) (not e!849283))))

(declare-fun b!1523476 () Bool)

(assert (=> b!1523476 (= e!849282 (Intermediate!13092 true (toIndex!0 lt!659739 mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!158995 c!140013) b!1523476))

(assert (= (and d!158995 (not c!140013)) b!1523472))

(assert (= (and b!1523472 c!140012) b!1523468))

(assert (= (and b!1523472 (not c!140012)) b!1523470))

(assert (= (and d!158995 c!140011) b!1523473))

(assert (= (and d!158995 (not c!140011)) b!1523475))

(assert (= (and b!1523475 res!1042548) b!1523469))

(assert (= (and b!1523469 (not res!1042549)) b!1523474))

(assert (= (and b!1523474 (not res!1042547)) b!1523471))

(declare-fun m!1406051 () Bool)

(assert (=> b!1523471 m!1406051))

(assert (=> b!1523469 m!1406051))

(assert (=> d!158995 m!1405947))

(declare-fun m!1406053 () Bool)

(assert (=> d!158995 m!1406053))

(assert (=> d!158995 m!1405943))

(assert (=> b!1523474 m!1406051))

(assert (=> b!1523470 m!1405947))

(declare-fun m!1406055 () Bool)

(assert (=> b!1523470 m!1406055))

(assert (=> b!1523470 m!1406055))

(declare-fun m!1406057 () Bool)

(assert (=> b!1523470 m!1406057))

(assert (=> b!1523370 d!158995))

(declare-fun d!158997 () Bool)

(declare-fun lt!659781 () (_ BitVec 32))

(declare-fun lt!659780 () (_ BitVec 32))

(assert (=> d!158997 (= lt!659781 (bvmul (bvxor lt!659780 (bvlshr lt!659780 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158997 (= lt!659780 ((_ extract 31 0) (bvand (bvxor lt!659739 (bvlshr lt!659739 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158997 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1042550 (let ((h!36889 ((_ extract 31 0) (bvand (bvxor lt!659739 (bvlshr lt!659739 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136457 (bvmul (bvxor h!36889 (bvlshr h!36889 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136457 (bvlshr x!136457 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1042550 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1042550 #b00000000000000000000000000000000))))))

(assert (=> d!158997 (= (toIndex!0 lt!659739 mask!2512) (bvand (bvxor lt!659781 (bvlshr lt!659781 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1523370 d!158997))

(declare-fun b!1523477 () Bool)

(declare-fun e!849289 () SeekEntryResult!13092)

(assert (=> b!1523477 (= e!849289 (Intermediate!13092 false (toIndex!0 (select (arr!48904 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1523478 () Bool)

(declare-fun lt!659783 () SeekEntryResult!13092)

(assert (=> b!1523478 (and (bvsge (index!54765 lt!659783) #b00000000000000000000000000000000) (bvslt (index!54765 lt!659783) (size!49456 a!2804)))))

(declare-fun res!1042553 () Bool)

(assert (=> b!1523478 (= res!1042553 (= (select (arr!48904 a!2804) (index!54765 lt!659783)) (select (arr!48904 a!2804) j!70)))))

(declare-fun e!849291 () Bool)

(assert (=> b!1523478 (=> res!1042553 e!849291)))

(declare-fun e!849288 () Bool)

(assert (=> b!1523478 (= e!849288 e!849291)))

(declare-fun d!159001 () Bool)

(declare-fun e!849290 () Bool)

(assert (=> d!159001 e!849290))

(declare-fun c!140014 () Bool)

(assert (=> d!159001 (= c!140014 (and ((_ is Intermediate!13092) lt!659783) (undefined!13904 lt!659783)))))

(declare-fun e!849287 () SeekEntryResult!13092)

(assert (=> d!159001 (= lt!659783 e!849287)))

(declare-fun c!140016 () Bool)

(assert (=> d!159001 (= c!140016 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659782 () (_ BitVec 64))

(assert (=> d!159001 (= lt!659782 (select (arr!48904 a!2804) (toIndex!0 (select (arr!48904 a!2804) j!70) mask!2512)))))

(assert (=> d!159001 (validMask!0 mask!2512)))

(assert (=> d!159001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48904 a!2804) j!70) mask!2512) (select (arr!48904 a!2804) j!70) a!2804 mask!2512) lt!659783)))

(declare-fun b!1523479 () Bool)

(assert (=> b!1523479 (= e!849289 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48904 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48904 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523480 () Bool)

(assert (=> b!1523480 (and (bvsge (index!54765 lt!659783) #b00000000000000000000000000000000) (bvslt (index!54765 lt!659783) (size!49456 a!2804)))))

(assert (=> b!1523480 (= e!849291 (= (select (arr!48904 a!2804) (index!54765 lt!659783)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1523481 () Bool)

(assert (=> b!1523481 (= e!849287 e!849289)))

(declare-fun c!140015 () Bool)

(assert (=> b!1523481 (= c!140015 (or (= lt!659782 (select (arr!48904 a!2804) j!70)) (= (bvadd lt!659782 lt!659782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1523482 () Bool)

(assert (=> b!1523482 (= e!849290 (bvsge (x!136453 lt!659783) #b01111111111111111111111111111110))))

(declare-fun b!1523483 () Bool)

(assert (=> b!1523483 (and (bvsge (index!54765 lt!659783) #b00000000000000000000000000000000) (bvslt (index!54765 lt!659783) (size!49456 a!2804)))))

(declare-fun res!1042551 () Bool)

(assert (=> b!1523483 (= res!1042551 (= (select (arr!48904 a!2804) (index!54765 lt!659783)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523483 (=> res!1042551 e!849291)))

(declare-fun b!1523484 () Bool)

(assert (=> b!1523484 (= e!849290 e!849288)))

(declare-fun res!1042552 () Bool)

(assert (=> b!1523484 (= res!1042552 (and ((_ is Intermediate!13092) lt!659783) (not (undefined!13904 lt!659783)) (bvslt (x!136453 lt!659783) #b01111111111111111111111111111110) (bvsge (x!136453 lt!659783) #b00000000000000000000000000000000) (bvsge (x!136453 lt!659783) #b00000000000000000000000000000000)))))

(assert (=> b!1523484 (=> (not res!1042552) (not e!849288))))

(declare-fun b!1523485 () Bool)

(assert (=> b!1523485 (= e!849287 (Intermediate!13092 true (toIndex!0 (select (arr!48904 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159001 c!140016) b!1523485))

(assert (= (and d!159001 (not c!140016)) b!1523481))

(assert (= (and b!1523481 c!140015) b!1523477))

(assert (= (and b!1523481 (not c!140015)) b!1523479))

(assert (= (and d!159001 c!140014) b!1523482))

(assert (= (and d!159001 (not c!140014)) b!1523484))

(assert (= (and b!1523484 res!1042552) b!1523478))

(assert (= (and b!1523478 (not res!1042553)) b!1523483))

(assert (= (and b!1523483 (not res!1042551)) b!1523480))

(declare-fun m!1406059 () Bool)

(assert (=> b!1523480 m!1406059))

(assert (=> b!1523478 m!1406059))

(assert (=> d!159001 m!1405929))

(declare-fun m!1406061 () Bool)

(assert (=> d!159001 m!1406061))

(assert (=> d!159001 m!1405943))

(assert (=> b!1523483 m!1406059))

(assert (=> b!1523479 m!1405929))

(declare-fun m!1406063 () Bool)

(assert (=> b!1523479 m!1406063))

(assert (=> b!1523479 m!1406063))

(assert (=> b!1523479 m!1405927))

(declare-fun m!1406065 () Bool)

(assert (=> b!1523479 m!1406065))

(assert (=> b!1523375 d!159001))

(declare-fun d!159003 () Bool)

(declare-fun lt!659785 () (_ BitVec 32))

(declare-fun lt!659784 () (_ BitVec 32))

(assert (=> d!159003 (= lt!659785 (bvmul (bvxor lt!659784 (bvlshr lt!659784 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159003 (= lt!659784 ((_ extract 31 0) (bvand (bvxor (select (arr!48904 a!2804) j!70) (bvlshr (select (arr!48904 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159003 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1042550 (let ((h!36889 ((_ extract 31 0) (bvand (bvxor (select (arr!48904 a!2804) j!70) (bvlshr (select (arr!48904 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136457 (bvmul (bvxor h!36889 (bvlshr h!36889 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136457 (bvlshr x!136457 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1042550 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1042550 #b00000000000000000000000000000000))))))

(assert (=> d!159003 (= (toIndex!0 (select (arr!48904 a!2804) j!70) mask!2512) (bvand (bvxor lt!659785 (bvlshr lt!659785 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1523375 d!159003))

(declare-fun b!1523486 () Bool)

(declare-fun e!849294 () SeekEntryResult!13092)

(assert (=> b!1523486 (= e!849294 (Intermediate!13092 false index!487 x!534))))

(declare-fun b!1523487 () Bool)

(declare-fun lt!659787 () SeekEntryResult!13092)

(assert (=> b!1523487 (and (bvsge (index!54765 lt!659787) #b00000000000000000000000000000000) (bvslt (index!54765 lt!659787) (size!49456 a!2804)))))

(declare-fun res!1042556 () Bool)

(assert (=> b!1523487 (= res!1042556 (= (select (arr!48904 a!2804) (index!54765 lt!659787)) (select (arr!48904 a!2804) j!70)))))

(declare-fun e!849296 () Bool)

(assert (=> b!1523487 (=> res!1042556 e!849296)))

(declare-fun e!849293 () Bool)

(assert (=> b!1523487 (= e!849293 e!849296)))

(declare-fun d!159005 () Bool)

(declare-fun e!849295 () Bool)

(assert (=> d!159005 e!849295))

(declare-fun c!140017 () Bool)

(assert (=> d!159005 (= c!140017 (and ((_ is Intermediate!13092) lt!659787) (undefined!13904 lt!659787)))))

(declare-fun e!849292 () SeekEntryResult!13092)

(assert (=> d!159005 (= lt!659787 e!849292)))

(declare-fun c!140019 () Bool)

(assert (=> d!159005 (= c!140019 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!659786 () (_ BitVec 64))

(assert (=> d!159005 (= lt!659786 (select (arr!48904 a!2804) index!487))))

(assert (=> d!159005 (validMask!0 mask!2512)))

(assert (=> d!159005 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48904 a!2804) j!70) a!2804 mask!2512) lt!659787)))

(declare-fun b!1523488 () Bool)

(assert (=> b!1523488 (= e!849294 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48904 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523489 () Bool)

(assert (=> b!1523489 (and (bvsge (index!54765 lt!659787) #b00000000000000000000000000000000) (bvslt (index!54765 lt!659787) (size!49456 a!2804)))))

(assert (=> b!1523489 (= e!849296 (= (select (arr!48904 a!2804) (index!54765 lt!659787)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1523490 () Bool)

(assert (=> b!1523490 (= e!849292 e!849294)))

(declare-fun c!140018 () Bool)

(assert (=> b!1523490 (= c!140018 (or (= lt!659786 (select (arr!48904 a!2804) j!70)) (= (bvadd lt!659786 lt!659786) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1523491 () Bool)

(assert (=> b!1523491 (= e!849295 (bvsge (x!136453 lt!659787) #b01111111111111111111111111111110))))

(declare-fun b!1523492 () Bool)

(assert (=> b!1523492 (and (bvsge (index!54765 lt!659787) #b00000000000000000000000000000000) (bvslt (index!54765 lt!659787) (size!49456 a!2804)))))

(declare-fun res!1042554 () Bool)

(assert (=> b!1523492 (= res!1042554 (= (select (arr!48904 a!2804) (index!54765 lt!659787)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523492 (=> res!1042554 e!849296)))

(declare-fun b!1523493 () Bool)

(assert (=> b!1523493 (= e!849295 e!849293)))

(declare-fun res!1042555 () Bool)

(assert (=> b!1523493 (= res!1042555 (and ((_ is Intermediate!13092) lt!659787) (not (undefined!13904 lt!659787)) (bvslt (x!136453 lt!659787) #b01111111111111111111111111111110) (bvsge (x!136453 lt!659787) #b00000000000000000000000000000000) (bvsge (x!136453 lt!659787) x!534)))))

(assert (=> b!1523493 (=> (not res!1042555) (not e!849293))))

(declare-fun b!1523494 () Bool)

(assert (=> b!1523494 (= e!849292 (Intermediate!13092 true index!487 x!534))))

(assert (= (and d!159005 c!140019) b!1523494))

(assert (= (and d!159005 (not c!140019)) b!1523490))

(assert (= (and b!1523490 c!140018) b!1523486))

(assert (= (and b!1523490 (not c!140018)) b!1523488))

(assert (= (and d!159005 c!140017) b!1523491))

(assert (= (and d!159005 (not c!140017)) b!1523493))

(assert (= (and b!1523493 res!1042555) b!1523487))

(assert (= (and b!1523487 (not res!1042556)) b!1523492))

(assert (= (and b!1523492 (not res!1042554)) b!1523489))

(declare-fun m!1406067 () Bool)

(assert (=> b!1523489 m!1406067))

(assert (=> b!1523487 m!1406067))

(assert (=> d!159005 m!1405933))

(assert (=> d!159005 m!1405943))

(assert (=> b!1523492 m!1406067))

(declare-fun m!1406069 () Bool)

(assert (=> b!1523488 m!1406069))

(assert (=> b!1523488 m!1406069))

(assert (=> b!1523488 m!1405927))

(declare-fun m!1406071 () Bool)

(assert (=> b!1523488 m!1406071))

(assert (=> b!1523369 d!159005))

(declare-fun b!1523515 () Bool)

(declare-fun e!849307 () SeekEntryResult!13092)

(declare-fun lt!659801 () SeekEntryResult!13092)

(assert (=> b!1523515 (= e!849307 (Found!13092 (index!54765 lt!659801)))))

(declare-fun b!1523516 () Bool)

(declare-fun c!140031 () Bool)

(declare-fun lt!659802 () (_ BitVec 64))

(assert (=> b!1523516 (= c!140031 (= lt!659802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849309 () SeekEntryResult!13092)

(assert (=> b!1523516 (= e!849307 e!849309)))

(declare-fun d!159007 () Bool)

(declare-fun lt!659800 () SeekEntryResult!13092)

(assert (=> d!159007 (and (or ((_ is MissingVacant!13092) lt!659800) (not ((_ is Found!13092) lt!659800)) (and (bvsge (index!54764 lt!659800) #b00000000000000000000000000000000) (bvslt (index!54764 lt!659800) (size!49456 a!2804)))) (not ((_ is MissingVacant!13092) lt!659800)) (or (not ((_ is Found!13092) lt!659800)) (= (select (arr!48904 a!2804) (index!54764 lt!659800)) (select (arr!48904 a!2804) j!70))))))

(declare-fun e!849308 () SeekEntryResult!13092)

(assert (=> d!159007 (= lt!659800 e!849308)))

(declare-fun c!140030 () Bool)

(assert (=> d!159007 (= c!140030 (and ((_ is Intermediate!13092) lt!659801) (undefined!13904 lt!659801)))))

(assert (=> d!159007 (= lt!659801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48904 a!2804) j!70) mask!2512) (select (arr!48904 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159007 (validMask!0 mask!2512)))

(assert (=> d!159007 (= (seekEntry!0 (select (arr!48904 a!2804) j!70) a!2804 mask!2512) lt!659800)))

(declare-fun b!1523517 () Bool)

(assert (=> b!1523517 (= e!849308 e!849307)))

(assert (=> b!1523517 (= lt!659802 (select (arr!48904 a!2804) (index!54765 lt!659801)))))

(declare-fun c!140032 () Bool)

(assert (=> b!1523517 (= c!140032 (= lt!659802 (select (arr!48904 a!2804) j!70)))))

(declare-fun b!1523518 () Bool)

(assert (=> b!1523518 (= e!849309 (MissingZero!13092 (index!54765 lt!659801)))))

(declare-fun b!1523519 () Bool)

(declare-fun lt!659803 () SeekEntryResult!13092)

(assert (=> b!1523519 (= e!849309 (ite ((_ is MissingVacant!13092) lt!659803) (MissingZero!13092 (index!54766 lt!659803)) lt!659803))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101344 (_ BitVec 32)) SeekEntryResult!13092)

(assert (=> b!1523519 (= lt!659803 (seekKeyOrZeroReturnVacant!0 (x!136453 lt!659801) (index!54765 lt!659801) (index!54765 lt!659801) (select (arr!48904 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523520 () Bool)

(assert (=> b!1523520 (= e!849308 Undefined!13092)))

(assert (= (and d!159007 c!140030) b!1523520))

(assert (= (and d!159007 (not c!140030)) b!1523517))

(assert (= (and b!1523517 c!140032) b!1523515))

(assert (= (and b!1523517 (not c!140032)) b!1523516))

(assert (= (and b!1523516 c!140031) b!1523518))

(assert (= (and b!1523516 (not c!140031)) b!1523519))

(declare-fun m!1406073 () Bool)

(assert (=> d!159007 m!1406073))

(assert (=> d!159007 m!1405927))

(assert (=> d!159007 m!1405929))

(assert (=> d!159007 m!1405929))

(assert (=> d!159007 m!1405927))

(assert (=> d!159007 m!1405931))

(assert (=> d!159007 m!1405943))

(declare-fun m!1406075 () Bool)

(assert (=> b!1523517 m!1406075))

(assert (=> b!1523519 m!1405927))

(declare-fun m!1406077 () Bool)

(assert (=> b!1523519 m!1406077))

(assert (=> b!1523374 d!159007))

(declare-fun d!159013 () Bool)

(assert (=> d!159013 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129750 d!159013))

(declare-fun d!159017 () Bool)

(assert (=> d!159017 (= (array_inv!38137 a!2804) (bvsge (size!49456 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129750 d!159017))

(declare-fun d!159019 () Bool)

(assert (=> d!159019 (= (validKeyInArray!0 (select (arr!48904 a!2804) i!961)) (and (not (= (select (arr!48904 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48904 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1523368 d!159019))

(declare-fun bm!68371 () Bool)

(declare-fun call!68374 () Bool)

(declare-fun c!140040 () Bool)

(assert (=> bm!68371 (= call!68374 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140040 (Cons!35461 (select (arr!48904 a!2804) #b00000000000000000000000000000000) Nil!35462) Nil!35462)))))

(declare-fun b!1523550 () Bool)

(declare-fun e!849331 () Bool)

(assert (=> b!1523550 (= e!849331 call!68374)))

(declare-fun b!1523551 () Bool)

(assert (=> b!1523551 (= e!849331 call!68374)))

(declare-fun d!159021 () Bool)

(declare-fun res!1042572 () Bool)

(declare-fun e!849332 () Bool)

(assert (=> d!159021 (=> res!1042572 e!849332)))

(assert (=> d!159021 (= res!1042572 (bvsge #b00000000000000000000000000000000 (size!49456 a!2804)))))

(assert (=> d!159021 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35462) e!849332)))

(declare-fun b!1523552 () Bool)

(declare-fun e!849329 () Bool)

(declare-fun contains!9953 (List!35465 (_ BitVec 64)) Bool)

(assert (=> b!1523552 (= e!849329 (contains!9953 Nil!35462 (select (arr!48904 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1523553 () Bool)

(declare-fun e!849330 () Bool)

(assert (=> b!1523553 (= e!849330 e!849331)))

(assert (=> b!1523553 (= c!140040 (validKeyInArray!0 (select (arr!48904 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1523554 () Bool)

(assert (=> b!1523554 (= e!849332 e!849330)))

(declare-fun res!1042573 () Bool)

(assert (=> b!1523554 (=> (not res!1042573) (not e!849330))))

(assert (=> b!1523554 (= res!1042573 (not e!849329))))

(declare-fun res!1042574 () Bool)

(assert (=> b!1523554 (=> (not res!1042574) (not e!849329))))

(assert (=> b!1523554 (= res!1042574 (validKeyInArray!0 (select (arr!48904 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159021 (not res!1042572)) b!1523554))

(assert (= (and b!1523554 res!1042574) b!1523552))

(assert (= (and b!1523554 res!1042573) b!1523553))

(assert (= (and b!1523553 c!140040) b!1523551))

(assert (= (and b!1523553 (not c!140040)) b!1523550))

(assert (= (or b!1523551 b!1523550) bm!68371))

(declare-fun m!1406085 () Bool)

(assert (=> bm!68371 m!1406085))

(declare-fun m!1406087 () Bool)

(assert (=> bm!68371 m!1406087))

(assert (=> b!1523552 m!1406085))

(assert (=> b!1523552 m!1406085))

(declare-fun m!1406089 () Bool)

(assert (=> b!1523552 m!1406089))

(assert (=> b!1523553 m!1406085))

(assert (=> b!1523553 m!1406085))

(declare-fun m!1406091 () Bool)

(assert (=> b!1523553 m!1406091))

(assert (=> b!1523554 m!1406085))

(assert (=> b!1523554 m!1406085))

(assert (=> b!1523554 m!1406091))

(assert (=> b!1523373 d!159021))

(declare-fun b!1523563 () Bool)

(declare-fun e!849340 () Bool)

(declare-fun call!68377 () Bool)

(assert (=> b!1523563 (= e!849340 call!68377)))

(declare-fun b!1523564 () Bool)

(declare-fun e!849341 () Bool)

(assert (=> b!1523564 (= e!849341 e!849340)))

(declare-fun c!140043 () Bool)

(assert (=> b!1523564 (= c!140043 (validKeyInArray!0 (select (arr!48904 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1523565 () Bool)

(declare-fun e!849339 () Bool)

(assert (=> b!1523565 (= e!849339 call!68377)))

(declare-fun b!1523566 () Bool)

(assert (=> b!1523566 (= e!849340 e!849339)))

(declare-fun lt!659812 () (_ BitVec 64))

(assert (=> b!1523566 (= lt!659812 (select (arr!48904 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659813 () Unit!50807)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101344 (_ BitVec 64) (_ BitVec 32)) Unit!50807)

(assert (=> b!1523566 (= lt!659813 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659812 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1523566 (arrayContainsKey!0 a!2804 lt!659812 #b00000000000000000000000000000000)))

(declare-fun lt!659814 () Unit!50807)

(assert (=> b!1523566 (= lt!659814 lt!659813)))

(declare-fun res!1042580 () Bool)

(assert (=> b!1523566 (= res!1042580 (= (seekEntryOrOpen!0 (select (arr!48904 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13092 #b00000000000000000000000000000000)))))

(assert (=> b!1523566 (=> (not res!1042580) (not e!849339))))

(declare-fun d!159027 () Bool)

(declare-fun res!1042579 () Bool)

(assert (=> d!159027 (=> res!1042579 e!849341)))

(assert (=> d!159027 (= res!1042579 (bvsge #b00000000000000000000000000000000 (size!49456 a!2804)))))

(assert (=> d!159027 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!849341)))

(declare-fun bm!68374 () Bool)

(assert (=> bm!68374 (= call!68377 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159027 (not res!1042579)) b!1523564))

(assert (= (and b!1523564 c!140043) b!1523566))

(assert (= (and b!1523564 (not c!140043)) b!1523563))

(assert (= (and b!1523566 res!1042580) b!1523565))

(assert (= (or b!1523565 b!1523563) bm!68374))

(assert (=> b!1523564 m!1406085))

(assert (=> b!1523564 m!1406085))

(assert (=> b!1523564 m!1406091))

(assert (=> b!1523566 m!1406085))

(declare-fun m!1406093 () Bool)

(assert (=> b!1523566 m!1406093))

(declare-fun m!1406095 () Bool)

(assert (=> b!1523566 m!1406095))

(assert (=> b!1523566 m!1406085))

(declare-fun m!1406097 () Bool)

(assert (=> b!1523566 m!1406097))

(declare-fun m!1406099 () Bool)

(assert (=> bm!68374 m!1406099))

(assert (=> b!1523367 d!159027))

(declare-fun b!1523567 () Bool)

(declare-fun e!849343 () Bool)

(declare-fun call!68378 () Bool)

(assert (=> b!1523567 (= e!849343 call!68378)))

(declare-fun b!1523568 () Bool)

(declare-fun e!849344 () Bool)

(assert (=> b!1523568 (= e!849344 e!849343)))

(declare-fun c!140044 () Bool)

(assert (=> b!1523568 (= c!140044 (validKeyInArray!0 (select (arr!48904 a!2804) j!70)))))

(declare-fun b!1523569 () Bool)

(declare-fun e!849342 () Bool)

(assert (=> b!1523569 (= e!849342 call!68378)))

(declare-fun b!1523570 () Bool)

(assert (=> b!1523570 (= e!849343 e!849342)))

(declare-fun lt!659815 () (_ BitVec 64))

(assert (=> b!1523570 (= lt!659815 (select (arr!48904 a!2804) j!70))))

(declare-fun lt!659816 () Unit!50807)

(assert (=> b!1523570 (= lt!659816 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659815 j!70))))

(assert (=> b!1523570 (arrayContainsKey!0 a!2804 lt!659815 #b00000000000000000000000000000000)))

(declare-fun lt!659817 () Unit!50807)

(assert (=> b!1523570 (= lt!659817 lt!659816)))

(declare-fun res!1042582 () Bool)

(assert (=> b!1523570 (= res!1042582 (= (seekEntryOrOpen!0 (select (arr!48904 a!2804) j!70) a!2804 mask!2512) (Found!13092 j!70)))))

(assert (=> b!1523570 (=> (not res!1042582) (not e!849342))))

(declare-fun d!159029 () Bool)

(declare-fun res!1042581 () Bool)

(assert (=> d!159029 (=> res!1042581 e!849344)))

(assert (=> d!159029 (= res!1042581 (bvsge j!70 (size!49456 a!2804)))))

(assert (=> d!159029 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!849344)))

(declare-fun bm!68375 () Bool)

(assert (=> bm!68375 (= call!68378 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159029 (not res!1042581)) b!1523568))

(assert (= (and b!1523568 c!140044) b!1523570))

(assert (= (and b!1523568 (not c!140044)) b!1523567))

(assert (= (and b!1523570 res!1042582) b!1523569))

(assert (= (or b!1523569 b!1523567) bm!68375))

(assert (=> b!1523568 m!1405927))

(assert (=> b!1523568 m!1405927))

(assert (=> b!1523568 m!1405961))

(assert (=> b!1523570 m!1405927))

(declare-fun m!1406101 () Bool)

(assert (=> b!1523570 m!1406101))

(declare-fun m!1406103 () Bool)

(assert (=> b!1523570 m!1406103))

(assert (=> b!1523570 m!1405927))

(assert (=> b!1523570 m!1405963))

(declare-fun m!1406105 () Bool)

(assert (=> bm!68375 m!1406105))

(assert (=> b!1523372 d!159029))

(declare-fun d!159031 () Bool)

(assert (=> d!159031 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659824 () Unit!50807)

(declare-fun choose!38 (array!101344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50807)

(assert (=> d!159031 (= lt!659824 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159031 (validMask!0 mask!2512)))

(assert (=> d!159031 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659824)))

(declare-fun bs!43695 () Bool)

(assert (= bs!43695 d!159031))

(assert (=> bs!43695 m!1405935))

(declare-fun m!1406107 () Bool)

(assert (=> bs!43695 m!1406107))

(assert (=> bs!43695 m!1405943))

(assert (=> b!1523372 d!159031))

(declare-fun d!159033 () Bool)

(assert (=> d!159033 (= (validKeyInArray!0 (select (arr!48904 a!2804) j!70)) (and (not (= (select (arr!48904 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48904 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1523377 d!159033))

(declare-fun b!1523643 () Bool)

(declare-fun e!849385 () SeekEntryResult!13092)

(declare-fun lt!659852 () SeekEntryResult!13092)

(assert (=> b!1523643 (= e!849385 (MissingZero!13092 (index!54765 lt!659852)))))

(declare-fun b!1523644 () Bool)

(assert (=> b!1523644 (= e!849385 (seekKeyOrZeroReturnVacant!0 (x!136453 lt!659852) (index!54765 lt!659852) (index!54765 lt!659852) (select (arr!48904 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523645 () Bool)

(declare-fun e!849383 () SeekEntryResult!13092)

(assert (=> b!1523645 (= e!849383 Undefined!13092)))

(declare-fun b!1523646 () Bool)

(declare-fun e!849384 () SeekEntryResult!13092)

(assert (=> b!1523646 (= e!849383 e!849384)))

(declare-fun lt!659851 () (_ BitVec 64))

(assert (=> b!1523646 (= lt!659851 (select (arr!48904 a!2804) (index!54765 lt!659852)))))

(declare-fun c!140075 () Bool)

(assert (=> b!1523646 (= c!140075 (= lt!659851 (select (arr!48904 a!2804) j!70)))))

(declare-fun b!1523647 () Bool)

(declare-fun c!140077 () Bool)

(assert (=> b!1523647 (= c!140077 (= lt!659851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523647 (= e!849384 e!849385)))

(declare-fun b!1523648 () Bool)

(assert (=> b!1523648 (= e!849384 (Found!13092 (index!54765 lt!659852)))))

(declare-fun d!159035 () Bool)

(declare-fun lt!659853 () SeekEntryResult!13092)

(assert (=> d!159035 (and (or ((_ is Undefined!13092) lt!659853) (not ((_ is Found!13092) lt!659853)) (and (bvsge (index!54764 lt!659853) #b00000000000000000000000000000000) (bvslt (index!54764 lt!659853) (size!49456 a!2804)))) (or ((_ is Undefined!13092) lt!659853) ((_ is Found!13092) lt!659853) (not ((_ is MissingZero!13092) lt!659853)) (and (bvsge (index!54763 lt!659853) #b00000000000000000000000000000000) (bvslt (index!54763 lt!659853) (size!49456 a!2804)))) (or ((_ is Undefined!13092) lt!659853) ((_ is Found!13092) lt!659853) ((_ is MissingZero!13092) lt!659853) (not ((_ is MissingVacant!13092) lt!659853)) (and (bvsge (index!54766 lt!659853) #b00000000000000000000000000000000) (bvslt (index!54766 lt!659853) (size!49456 a!2804)))) (or ((_ is Undefined!13092) lt!659853) (ite ((_ is Found!13092) lt!659853) (= (select (arr!48904 a!2804) (index!54764 lt!659853)) (select (arr!48904 a!2804) j!70)) (ite ((_ is MissingZero!13092) lt!659853) (= (select (arr!48904 a!2804) (index!54763 lt!659853)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13092) lt!659853) (= (select (arr!48904 a!2804) (index!54766 lt!659853)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159035 (= lt!659853 e!849383)))

(declare-fun c!140076 () Bool)

(assert (=> d!159035 (= c!140076 (and ((_ is Intermediate!13092) lt!659852) (undefined!13904 lt!659852)))))

(assert (=> d!159035 (= lt!659852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48904 a!2804) j!70) mask!2512) (select (arr!48904 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159035 (validMask!0 mask!2512)))

(assert (=> d!159035 (= (seekEntryOrOpen!0 (select (arr!48904 a!2804) j!70) a!2804 mask!2512) lt!659853)))

(assert (= (and d!159035 c!140076) b!1523645))

(assert (= (and d!159035 (not c!140076)) b!1523646))

(assert (= (and b!1523646 c!140075) b!1523648))

(assert (= (and b!1523646 (not c!140075)) b!1523647))

(assert (= (and b!1523647 c!140077) b!1523643))

(assert (= (and b!1523647 (not c!140077)) b!1523644))

(assert (=> b!1523644 m!1405927))

(declare-fun m!1406143 () Bool)

(assert (=> b!1523644 m!1406143))

(declare-fun m!1406145 () Bool)

(assert (=> b!1523646 m!1406145))

(assert (=> d!159035 m!1405927))

(assert (=> d!159035 m!1405929))

(declare-fun m!1406147 () Bool)

(assert (=> d!159035 m!1406147))

(assert (=> d!159035 m!1405943))

(declare-fun m!1406149 () Bool)

(assert (=> d!159035 m!1406149))

(assert (=> d!159035 m!1405929))

(assert (=> d!159035 m!1405927))

(assert (=> d!159035 m!1405931))

(declare-fun m!1406151 () Bool)

(assert (=> d!159035 m!1406151))

(assert (=> b!1523366 d!159035))

(declare-fun b!1523649 () Bool)

(declare-fun e!849388 () SeekEntryResult!13092)

(declare-fun lt!659857 () SeekEntryResult!13092)

(assert (=> b!1523649 (= e!849388 (MissingZero!13092 (index!54765 lt!659857)))))

(declare-fun b!1523650 () Bool)

(assert (=> b!1523650 (= e!849388 (seekKeyOrZeroReturnVacant!0 (x!136453 lt!659857) (index!54765 lt!659857) (index!54765 lt!659857) lt!659739 lt!659735 mask!2512))))

(declare-fun b!1523651 () Bool)

(declare-fun e!849386 () SeekEntryResult!13092)

(assert (=> b!1523651 (= e!849386 Undefined!13092)))

(declare-fun b!1523652 () Bool)

(declare-fun e!849387 () SeekEntryResult!13092)

(assert (=> b!1523652 (= e!849386 e!849387)))

(declare-fun lt!659856 () (_ BitVec 64))

(assert (=> b!1523652 (= lt!659856 (select (arr!48904 lt!659735) (index!54765 lt!659857)))))

(declare-fun c!140078 () Bool)

(assert (=> b!1523652 (= c!140078 (= lt!659856 lt!659739))))

(declare-fun b!1523653 () Bool)

(declare-fun c!140080 () Bool)

(assert (=> b!1523653 (= c!140080 (= lt!659856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523653 (= e!849387 e!849388)))

(declare-fun b!1523654 () Bool)

(assert (=> b!1523654 (= e!849387 (Found!13092 (index!54765 lt!659857)))))

(declare-fun d!159047 () Bool)

(declare-fun lt!659858 () SeekEntryResult!13092)

(assert (=> d!159047 (and (or ((_ is Undefined!13092) lt!659858) (not ((_ is Found!13092) lt!659858)) (and (bvsge (index!54764 lt!659858) #b00000000000000000000000000000000) (bvslt (index!54764 lt!659858) (size!49456 lt!659735)))) (or ((_ is Undefined!13092) lt!659858) ((_ is Found!13092) lt!659858) (not ((_ is MissingZero!13092) lt!659858)) (and (bvsge (index!54763 lt!659858) #b00000000000000000000000000000000) (bvslt (index!54763 lt!659858) (size!49456 lt!659735)))) (or ((_ is Undefined!13092) lt!659858) ((_ is Found!13092) lt!659858) ((_ is MissingZero!13092) lt!659858) (not ((_ is MissingVacant!13092) lt!659858)) (and (bvsge (index!54766 lt!659858) #b00000000000000000000000000000000) (bvslt (index!54766 lt!659858) (size!49456 lt!659735)))) (or ((_ is Undefined!13092) lt!659858) (ite ((_ is Found!13092) lt!659858) (= (select (arr!48904 lt!659735) (index!54764 lt!659858)) lt!659739) (ite ((_ is MissingZero!13092) lt!659858) (= (select (arr!48904 lt!659735) (index!54763 lt!659858)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13092) lt!659858) (= (select (arr!48904 lt!659735) (index!54766 lt!659858)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159047 (= lt!659858 e!849386)))

(declare-fun c!140079 () Bool)

(assert (=> d!159047 (= c!140079 (and ((_ is Intermediate!13092) lt!659857) (undefined!13904 lt!659857)))))

(assert (=> d!159047 (= lt!659857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!659739 mask!2512) lt!659739 lt!659735 mask!2512))))

(assert (=> d!159047 (validMask!0 mask!2512)))

(assert (=> d!159047 (= (seekEntryOrOpen!0 lt!659739 lt!659735 mask!2512) lt!659858)))

(assert (= (and d!159047 c!140079) b!1523651))

(assert (= (and d!159047 (not c!140079)) b!1523652))

(assert (= (and b!1523652 c!140078) b!1523654))

(assert (= (and b!1523652 (not c!140078)) b!1523653))

(assert (= (and b!1523653 c!140080) b!1523649))

(assert (= (and b!1523653 (not c!140080)) b!1523650))

(declare-fun m!1406153 () Bool)

(assert (=> b!1523650 m!1406153))

(declare-fun m!1406155 () Bool)

(assert (=> b!1523652 m!1406155))

(assert (=> d!159047 m!1405947))

(declare-fun m!1406157 () Bool)

(assert (=> d!159047 m!1406157))

(assert (=> d!159047 m!1405943))

(declare-fun m!1406159 () Bool)

(assert (=> d!159047 m!1406159))

(assert (=> d!159047 m!1405947))

(assert (=> d!159047 m!1405949))

(declare-fun m!1406161 () Bool)

(assert (=> d!159047 m!1406161))

(assert (=> b!1523366 d!159047))

(check-sat (not b!1523553) (not b!1523552) (not b!1523519) (not d!159005) (not b!1523488) (not b!1523570) (not b!1523479) (not d!159031) (not d!159007) (not d!159035) (not bm!68375) (not b!1523650) (not bm!68374) (not b!1523554) (not b!1523564) (not bm!68371) (not b!1523644) (not d!159001) (not d!158995) (not d!159047) (not b!1523470) (not b!1523566) (not b!1523568))
(check-sat)
