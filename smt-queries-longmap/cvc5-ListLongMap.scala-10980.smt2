; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128586 () Bool)

(assert start!128586)

(declare-fun b!1507482 () Bool)

(declare-fun res!1027701 () Bool)

(declare-fun e!842278 () Bool)

(assert (=> b!1507482 (=> (not res!1027701) (not e!842278))))

(declare-datatypes ((SeekEntryResult!12692 0))(
  ( (MissingZero!12692 (index!53163 (_ BitVec 32))) (Found!12692 (index!53164 (_ BitVec 32))) (Intermediate!12692 (undefined!13504 Bool) (index!53165 (_ BitVec 32)) (x!134920 (_ BitVec 32))) (Undefined!12692) (MissingVacant!12692 (index!53166 (_ BitVec 32))) )
))
(declare-fun lt!654396 () SeekEntryResult!12692)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100559 0))(
  ( (array!100560 (arr!48521 (Array (_ BitVec 32) (_ BitVec 64))) (size!49071 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100559)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100559 (_ BitVec 32)) SeekEntryResult!12692)

(assert (=> b!1507482 (= res!1027701 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48521 a!2804) j!70) a!2804 mask!2512) lt!654396))))

(declare-fun b!1507483 () Bool)

(declare-fun res!1027703 () Bool)

(declare-fun e!842277 () Bool)

(assert (=> b!1507483 (=> (not res!1027703) (not e!842277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100559 (_ BitVec 32)) Bool)

(assert (=> b!1507483 (= res!1027703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507484 () Bool)

(declare-fun res!1027700 () Bool)

(assert (=> b!1507484 (=> (not res!1027700) (not e!842277))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507484 (= res!1027700 (and (= (size!49071 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49071 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49071 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507485 () Bool)

(assert (=> b!1507485 (= e!842277 e!842278)))

(declare-fun res!1027705 () Bool)

(assert (=> b!1507485 (=> (not res!1027705) (not e!842278))))

(declare-fun lt!654397 () (_ BitVec 32))

(assert (=> b!1507485 (= res!1027705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!654397 (select (arr!48521 a!2804) j!70) a!2804 mask!2512) lt!654396))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507485 (= lt!654396 (Intermediate!12692 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507485 (= lt!654397 (toIndex!0 (select (arr!48521 a!2804) j!70) mask!2512))))

(declare-fun res!1027706 () Bool)

(assert (=> start!128586 (=> (not res!1027706) (not e!842277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128586 (= res!1027706 (validMask!0 mask!2512))))

(assert (=> start!128586 e!842277))

(assert (=> start!128586 true))

(declare-fun array_inv!37549 (array!100559) Bool)

(assert (=> start!128586 (array_inv!37549 a!2804)))

(declare-fun b!1507486 () Bool)

(declare-fun res!1027708 () Bool)

(assert (=> b!1507486 (=> (not res!1027708) (not e!842277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507486 (= res!1027708 (validKeyInArray!0 (select (arr!48521 a!2804) i!961)))))

(declare-fun b!1507487 () Bool)

(declare-fun res!1027704 () Bool)

(assert (=> b!1507487 (=> (not res!1027704) (not e!842277))))

(assert (=> b!1507487 (= res!1027704 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49071 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49071 a!2804))))))

(declare-fun b!1507488 () Bool)

(assert (=> b!1507488 (= e!842278 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654397 #b00000000000000000000000000000000) (bvsge lt!654397 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun b!1507489 () Bool)

(declare-fun res!1027707 () Bool)

(assert (=> b!1507489 (=> (not res!1027707) (not e!842277))))

(declare-datatypes ((List!35004 0))(
  ( (Nil!35001) (Cons!35000 (h!36403 (_ BitVec 64)) (t!49698 List!35004)) )
))
(declare-fun arrayNoDuplicates!0 (array!100559 (_ BitVec 32) List!35004) Bool)

(assert (=> b!1507489 (= res!1027707 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35001))))

(declare-fun b!1507490 () Bool)

(declare-fun res!1027702 () Bool)

(assert (=> b!1507490 (=> (not res!1027702) (not e!842277))))

(assert (=> b!1507490 (= res!1027702 (validKeyInArray!0 (select (arr!48521 a!2804) j!70)))))

(assert (= (and start!128586 res!1027706) b!1507484))

(assert (= (and b!1507484 res!1027700) b!1507486))

(assert (= (and b!1507486 res!1027708) b!1507490))

(assert (= (and b!1507490 res!1027702) b!1507483))

(assert (= (and b!1507483 res!1027703) b!1507489))

(assert (= (and b!1507489 res!1027707) b!1507487))

(assert (= (and b!1507487 res!1027704) b!1507485))

(assert (= (and b!1507485 res!1027705) b!1507482))

(assert (= (and b!1507482 res!1027701) b!1507488))

(declare-fun m!1390225 () Bool)

(assert (=> b!1507486 m!1390225))

(assert (=> b!1507486 m!1390225))

(declare-fun m!1390227 () Bool)

(assert (=> b!1507486 m!1390227))

(declare-fun m!1390229 () Bool)

(assert (=> b!1507483 m!1390229))

(declare-fun m!1390231 () Bool)

(assert (=> b!1507489 m!1390231))

(declare-fun m!1390233 () Bool)

(assert (=> b!1507482 m!1390233))

(assert (=> b!1507482 m!1390233))

(declare-fun m!1390235 () Bool)

(assert (=> b!1507482 m!1390235))

(assert (=> b!1507485 m!1390233))

(assert (=> b!1507485 m!1390233))

(declare-fun m!1390237 () Bool)

(assert (=> b!1507485 m!1390237))

(assert (=> b!1507485 m!1390233))

(declare-fun m!1390239 () Bool)

(assert (=> b!1507485 m!1390239))

(declare-fun m!1390241 () Bool)

(assert (=> start!128586 m!1390241))

(declare-fun m!1390243 () Bool)

(assert (=> start!128586 m!1390243))

(assert (=> b!1507490 m!1390233))

(assert (=> b!1507490 m!1390233))

(declare-fun m!1390245 () Bool)

(assert (=> b!1507490 m!1390245))

(push 1)

(assert (not b!1507489))

(assert (not b!1507485))

(assert (not start!128586))

(assert (not b!1507483))

(assert (not b!1507486))

(assert (not b!1507482))

(assert (not b!1507490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158325 () Bool)

(assert (=> d!158325 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128586 d!158325))

(declare-fun d!158329 () Bool)

(assert (=> d!158329 (= (array_inv!37549 a!2804) (bvsge (size!49071 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128586 d!158329))

(declare-fun b!1507638 () Bool)

(declare-fun e!842361 () Bool)

(declare-fun lt!654447 () SeekEntryResult!12692)

(assert (=> b!1507638 (= e!842361 (bvsge (x!134920 lt!654447) #b01111111111111111111111111111110))))

(declare-fun d!158331 () Bool)

(assert (=> d!158331 e!842361))

(declare-fun c!139455 () Bool)

(assert (=> d!158331 (= c!139455 (and (is-Intermediate!12692 lt!654447) (undefined!13504 lt!654447)))))

(declare-fun e!842358 () SeekEntryResult!12692)

(assert (=> d!158331 (= lt!654447 e!842358)))

(declare-fun c!139456 () Bool)

(assert (=> d!158331 (= c!139456 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!654446 () (_ BitVec 64))

(assert (=> d!158331 (= lt!654446 (select (arr!48521 a!2804) lt!654397))))

(assert (=> d!158331 (validMask!0 mask!2512)))

(assert (=> d!158331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!654397 (select (arr!48521 a!2804) j!70) a!2804 mask!2512) lt!654447)))

(declare-fun b!1507639 () Bool)

(declare-fun e!842359 () SeekEntryResult!12692)

(assert (=> b!1507639 (= e!842358 e!842359)))

(declare-fun c!139457 () Bool)

(assert (=> b!1507639 (= c!139457 (or (= lt!654446 (select (arr!48521 a!2804) j!70)) (= (bvadd lt!654446 lt!654446) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507640 () Bool)

(assert (=> b!1507640 (and (bvsge (index!53165 lt!654447) #b00000000000000000000000000000000) (bvslt (index!53165 lt!654447) (size!49071 a!2804)))))

(declare-fun e!842357 () Bool)

(assert (=> b!1507640 (= e!842357 (= (select (arr!48521 a!2804) (index!53165 lt!654447)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507641 () Bool)

(assert (=> b!1507641 (= e!842359 (Intermediate!12692 false lt!654397 #b00000000000000000000000000000000))))

(declare-fun b!1507642 () Bool)

(declare-fun e!842360 () Bool)

(assert (=> b!1507642 (= e!842361 e!842360)))

(declare-fun res!1027803 () Bool)

(assert (=> b!1507642 (= res!1027803 (and (is-Intermediate!12692 lt!654447) (not (undefined!13504 lt!654447)) (bvslt (x!134920 lt!654447) #b01111111111111111111111111111110) (bvsge (x!134920 lt!654447) #b00000000000000000000000000000000) (bvsge (x!134920 lt!654447) #b00000000000000000000000000000000)))))

(assert (=> b!1507642 (=> (not res!1027803) (not e!842360))))

(declare-fun b!1507643 () Bool)

(assert (=> b!1507643 (and (bvsge (index!53165 lt!654447) #b00000000000000000000000000000000) (bvslt (index!53165 lt!654447) (size!49071 a!2804)))))

(declare-fun res!1027804 () Bool)

(assert (=> b!1507643 (= res!1027804 (= (select (arr!48521 a!2804) (index!53165 lt!654447)) (select (arr!48521 a!2804) j!70)))))

(assert (=> b!1507643 (=> res!1027804 e!842357)))

(assert (=> b!1507643 (= e!842360 e!842357)))

(declare-fun b!1507644 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507644 (= e!842359 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!654397 #b00000000000000000000000000000000 mask!2512) (select (arr!48521 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507645 () Bool)

(assert (=> b!1507645 (= e!842358 (Intermediate!12692 true lt!654397 #b00000000000000000000000000000000))))

(declare-fun b!1507646 () Bool)

(assert (=> b!1507646 (and (bvsge (index!53165 lt!654447) #b00000000000000000000000000000000) (bvslt (index!53165 lt!654447) (size!49071 a!2804)))))

(declare-fun res!1027805 () Bool)

(assert (=> b!1507646 (= res!1027805 (= (select (arr!48521 a!2804) (index!53165 lt!654447)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507646 (=> res!1027805 e!842357)))

(assert (= (and d!158331 c!139456) b!1507645))

(assert (= (and d!158331 (not c!139456)) b!1507639))

(assert (= (and b!1507639 c!139457) b!1507641))

(assert (= (and b!1507639 (not c!139457)) b!1507644))

(assert (= (and d!158331 c!139455) b!1507638))

(assert (= (and d!158331 (not c!139455)) b!1507642))

(assert (= (and b!1507642 res!1027803) b!1507643))

(assert (= (and b!1507643 (not res!1027804)) b!1507646))

(assert (= (and b!1507646 (not res!1027805)) b!1507640))

(declare-fun m!1390335 () Bool)

(assert (=> b!1507644 m!1390335))

(assert (=> b!1507644 m!1390335))

(assert (=> b!1507644 m!1390233))

(declare-fun m!1390337 () Bool)

(assert (=> b!1507644 m!1390337))

(declare-fun m!1390339 () Bool)

(assert (=> b!1507640 m!1390339))

(declare-fun m!1390341 () Bool)

(assert (=> d!158331 m!1390341))

(assert (=> d!158331 m!1390241))

(assert (=> b!1507643 m!1390339))

(assert (=> b!1507646 m!1390339))

(assert (=> b!1507485 d!158331))

(declare-fun d!158349 () Bool)

(declare-fun lt!654453 () (_ BitVec 32))

(declare-fun lt!654452 () (_ BitVec 32))

(assert (=> d!158349 (= lt!654453 (bvmul (bvxor lt!654452 (bvlshr lt!654452 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158349 (= lt!654452 ((_ extract 31 0) (bvand (bvxor (select (arr!48521 a!2804) j!70) (bvlshr (select (arr!48521 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158349 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1027806 (let ((h!36407 ((_ extract 31 0) (bvand (bvxor (select (arr!48521 a!2804) j!70) (bvlshr (select (arr!48521 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134926 (bvmul (bvxor h!36407 (bvlshr h!36407 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134926 (bvlshr x!134926 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1027806 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1027806 #b00000000000000000000000000000000))))))

(assert (=> d!158349 (= (toIndex!0 (select (arr!48521 a!2804) j!70) mask!2512) (bvand (bvxor lt!654453 (bvlshr lt!654453 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1507485 d!158349))

(declare-fun d!158351 () Bool)

(assert (=> d!158351 (= (validKeyInArray!0 (select (arr!48521 a!2804) j!70)) (and (not (= (select (arr!48521 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48521 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507490 d!158351))

(declare-fun d!158353 () Bool)

(assert (=> d!158353 (= (validKeyInArray!0 (select (arr!48521 a!2804) i!961)) (and (not (= (select (arr!48521 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48521 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507486 d!158353))

(declare-fun b!1507647 () Bool)

(declare-fun e!842366 () Bool)

(declare-fun lt!654455 () SeekEntryResult!12692)

(assert (=> b!1507647 (= e!842366 (bvsge (x!134920 lt!654455) #b01111111111111111111111111111110))))

(declare-fun d!158355 () Bool)

(assert (=> d!158355 e!842366))

(declare-fun c!139458 () Bool)

(assert (=> d!158355 (= c!139458 (and (is-Intermediate!12692 lt!654455) (undefined!13504 lt!654455)))))

(declare-fun e!842363 () SeekEntryResult!12692)

(assert (=> d!158355 (= lt!654455 e!842363)))

(declare-fun c!139459 () Bool)

(assert (=> d!158355 (= c!139459 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!654454 () (_ BitVec 64))

(assert (=> d!158355 (= lt!654454 (select (arr!48521 a!2804) index!487))))

(assert (=> d!158355 (validMask!0 mask!2512)))

(assert (=> d!158355 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48521 a!2804) j!70) a!2804 mask!2512) lt!654455)))

(declare-fun b!1507648 () Bool)

(declare-fun e!842364 () SeekEntryResult!12692)

(assert (=> b!1507648 (= e!842363 e!842364)))

(declare-fun c!139460 () Bool)

(assert (=> b!1507648 (= c!139460 (or (= lt!654454 (select (arr!48521 a!2804) j!70)) (= (bvadd lt!654454 lt!654454) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507649 () Bool)

(assert (=> b!1507649 (and (bvsge (index!53165 lt!654455) #b00000000000000000000000000000000) (bvslt (index!53165 lt!654455) (size!49071 a!2804)))))

(declare-fun e!842362 () Bool)

(assert (=> b!1507649 (= e!842362 (= (select (arr!48521 a!2804) (index!53165 lt!654455)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507650 () Bool)

(assert (=> b!1507650 (= e!842364 (Intermediate!12692 false index!487 x!534))))

(declare-fun b!1507651 () Bool)

(declare-fun e!842365 () Bool)

(assert (=> b!1507651 (= e!842366 e!842365)))

(declare-fun res!1027807 () Bool)

(assert (=> b!1507651 (= res!1027807 (and (is-Intermediate!12692 lt!654455) (not (undefined!13504 lt!654455)) (bvslt (x!134920 lt!654455) #b01111111111111111111111111111110) (bvsge (x!134920 lt!654455) #b00000000000000000000000000000000) (bvsge (x!134920 lt!654455) x!534)))))

(assert (=> b!1507651 (=> (not res!1027807) (not e!842365))))

(declare-fun b!1507652 () Bool)

(assert (=> b!1507652 (and (bvsge (index!53165 lt!654455) #b00000000000000000000000000000000) (bvslt (index!53165 lt!654455) (size!49071 a!2804)))))

(declare-fun res!1027808 () Bool)

(assert (=> b!1507652 (= res!1027808 (= (select (arr!48521 a!2804) (index!53165 lt!654455)) (select (arr!48521 a!2804) j!70)))))

(assert (=> b!1507652 (=> res!1027808 e!842362)))

(assert (=> b!1507652 (= e!842365 e!842362)))

(declare-fun b!1507653 () Bool)

(assert (=> b!1507653 (= e!842364 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48521 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507654 () Bool)

(assert (=> b!1507654 (= e!842363 (Intermediate!12692 true index!487 x!534))))

(declare-fun b!1507655 () Bool)

(assert (=> b!1507655 (and (bvsge (index!53165 lt!654455) #b00000000000000000000000000000000) (bvslt (index!53165 lt!654455) (size!49071 a!2804)))))

(declare-fun res!1027809 () Bool)

(assert (=> b!1507655 (= res!1027809 (= (select (arr!48521 a!2804) (index!53165 lt!654455)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507655 (=> res!1027809 e!842362)))

(assert (= (and d!158355 c!139459) b!1507654))

(assert (= (and d!158355 (not c!139459)) b!1507648))

(assert (= (and b!1507648 c!139460) b!1507650))

(assert (= (and b!1507648 (not c!139460)) b!1507653))

(assert (= (and d!158355 c!139458) b!1507647))

(assert (= (and d!158355 (not c!139458)) b!1507651))

(assert (= (and b!1507651 res!1027807) b!1507652))

(assert (= (and b!1507652 (not res!1027808)) b!1507655))

(assert (= (and b!1507655 (not res!1027809)) b!1507649))

(declare-fun m!1390343 () Bool)

(assert (=> b!1507653 m!1390343))

(assert (=> b!1507653 m!1390343))

(assert (=> b!1507653 m!1390233))

(declare-fun m!1390345 () Bool)

(assert (=> b!1507653 m!1390345))

(declare-fun m!1390347 () Bool)

(assert (=> b!1507649 m!1390347))

(declare-fun m!1390349 () Bool)

(assert (=> d!158355 m!1390349))

(assert (=> d!158355 m!1390241))

(assert (=> b!1507652 m!1390347))

(assert (=> b!1507655 m!1390347))

(assert (=> b!1507482 d!158355))

(declare-fun b!1507666 () Bool)

(declare-fun e!842376 () Bool)

(declare-fun call!68268 () Bool)

(assert (=> b!1507666 (= e!842376 call!68268)))

(declare-fun b!1507667 () Bool)

(declare-fun e!842377 () Bool)

(declare-fun e!842375 () Bool)

(assert (=> b!1507667 (= e!842377 e!842375)))

(declare-fun res!1027817 () Bool)

(assert (=> b!1507667 (=> (not res!1027817) (not e!842375))))

(declare-fun e!842378 () Bool)

(assert (=> b!1507667 (= res!1027817 (not e!842378))))

(declare-fun res!1027818 () Bool)

(assert (=> b!1507667 (=> (not res!1027818) (not e!842378))))

(assert (=> b!1507667 (= res!1027818 (validKeyInArray!0 (select (arr!48521 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158357 () Bool)

(declare-fun res!1027816 () Bool)

(assert (=> d!158357 (=> res!1027816 e!842377)))

(assert (=> d!158357 (= res!1027816 (bvsge #b00000000000000000000000000000000 (size!49071 a!2804)))))

(assert (=> d!158357 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35001) e!842377)))

(declare-fun bm!68265 () Bool)

(declare-fun c!139463 () Bool)

(assert (=> bm!68265 (= call!68268 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139463 (Cons!35000 (select (arr!48521 a!2804) #b00000000000000000000000000000000) Nil!35001) Nil!35001)))))

(declare-fun b!1507668 () Bool)

(assert (=> b!1507668 (= e!842375 e!842376)))

(assert (=> b!1507668 (= c!139463 (validKeyInArray!0 (select (arr!48521 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507669 () Bool)

(assert (=> b!1507669 (= e!842376 call!68268)))

(declare-fun b!1507670 () Bool)

(declare-fun contains!9969 (List!35004 (_ BitVec 64)) Bool)

(assert (=> b!1507670 (= e!842378 (contains!9969 Nil!35001 (select (arr!48521 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158357 (not res!1027816)) b!1507667))

(assert (= (and b!1507667 res!1027818) b!1507670))

(assert (= (and b!1507667 res!1027817) b!1507668))

(assert (= (and b!1507668 c!139463) b!1507669))

(assert (= (and b!1507668 (not c!139463)) b!1507666))

(assert (= (or b!1507669 b!1507666) bm!68265))

(declare-fun m!1390351 () Bool)

(assert (=> b!1507667 m!1390351))

(assert (=> b!1507667 m!1390351))

(declare-fun m!1390353 () Bool)

(assert (=> b!1507667 m!1390353))

(assert (=> bm!68265 m!1390351))

(declare-fun m!1390355 () Bool)

(assert (=> bm!68265 m!1390355))

(assert (=> b!1507668 m!1390351))

(assert (=> b!1507668 m!1390351))

(assert (=> b!1507668 m!1390353))

(assert (=> b!1507670 m!1390351))

(assert (=> b!1507670 m!1390351))

(declare-fun m!1390357 () Bool)

(assert (=> b!1507670 m!1390357))

(assert (=> b!1507489 d!158357))

(declare-fun d!158367 () Bool)

(declare-fun res!1027824 () Bool)

(declare-fun e!842387 () Bool)

(assert (=> d!158367 (=> res!1027824 e!842387)))

(assert (=> d!158367 (= res!1027824 (bvsge #b00000000000000000000000000000000 (size!49071 a!2804)))))

(assert (=> d!158367 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842387)))

(declare-fun b!1507679 () Bool)

(declare-fun e!842386 () Bool)

(declare-fun call!68271 () Bool)

(assert (=> b!1507679 (= e!842386 call!68271)))

(declare-fun b!1507680 () Bool)

(declare-fun e!842385 () Bool)

(assert (=> b!1507680 (= e!842386 e!842385)))

(declare-fun lt!654462 () (_ BitVec 64))

(assert (=> b!1507680 (= lt!654462 (select (arr!48521 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50334 0))(
  ( (Unit!50335) )
))
(declare-fun lt!654463 () Unit!50334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100559 (_ BitVec 64) (_ BitVec 32)) Unit!50334)

(assert (=> b!1507680 (= lt!654463 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654462 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507680 (arrayContainsKey!0 a!2804 lt!654462 #b00000000000000000000000000000000)))

(declare-fun lt!654464 () Unit!50334)

(assert (=> b!1507680 (= lt!654464 lt!654463)))

(declare-fun res!1027823 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100559 (_ BitVec 32)) SeekEntryResult!12692)

(assert (=> b!1507680 (= res!1027823 (= (seekEntryOrOpen!0 (select (arr!48521 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12692 #b00000000000000000000000000000000)))))

(assert (=> b!1507680 (=> (not res!1027823) (not e!842385))))

(declare-fun bm!68268 () Bool)

(assert (=> bm!68268 (= call!68271 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1507681 () Bool)

(assert (=> b!1507681 (= e!842387 e!842386)))

(declare-fun c!139466 () Bool)

(assert (=> b!1507681 (= c!139466 (validKeyInArray!0 (select (arr!48521 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507682 () Bool)

(assert (=> b!1507682 (= e!842385 call!68271)))

(assert (= (and d!158367 (not res!1027824)) b!1507681))

(assert (= (and b!1507681 c!139466) b!1507680))

(assert (= (and b!1507681 (not c!139466)) b!1507679))

(assert (= (and b!1507680 res!1027823) b!1507682))

(assert (= (or b!1507682 b!1507679) bm!68268))

(assert (=> b!1507680 m!1390351))

(declare-fun m!1390359 () Bool)

(assert (=> b!1507680 m!1390359))

(declare-fun m!1390361 () Bool)

(assert (=> b!1507680 m!1390361))

(assert (=> b!1507680 m!1390351))

(declare-fun m!1390363 () Bool)

(assert (=> b!1507680 m!1390363))

(declare-fun m!1390365 () Bool)

(assert (=> bm!68268 m!1390365))

(assert (=> b!1507681 m!1390351))

(assert (=> b!1507681 m!1390351))

(assert (=> b!1507681 m!1390353))

(assert (=> b!1507483 d!158367))

(push 1)

