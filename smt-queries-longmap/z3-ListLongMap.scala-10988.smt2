; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128720 () Bool)

(assert start!128720)

(declare-fun b!1508517 () Bool)

(declare-fun res!1028531 () Bool)

(declare-fun e!842729 () Bool)

(assert (=> b!1508517 (=> (not res!1028531) (not e!842729))))

(declare-datatypes ((array!100615 0))(
  ( (array!100616 (arr!48546 (Array (_ BitVec 32) (_ BitVec 64))) (size!49096 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100615)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508517 (= res!1028531 (validKeyInArray!0 (select (arr!48546 a!2804) j!70)))))

(declare-fun b!1508518 () Bool)

(declare-fun res!1028525 () Bool)

(assert (=> b!1508518 (=> (not res!1028525) (not e!842729))))

(declare-datatypes ((List!35029 0))(
  ( (Nil!35026) (Cons!35025 (h!36434 (_ BitVec 64)) (t!49723 List!35029)) )
))
(declare-fun arrayNoDuplicates!0 (array!100615 (_ BitVec 32) List!35029) Bool)

(assert (=> b!1508518 (= res!1028525 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35026))))

(declare-fun res!1028526 () Bool)

(assert (=> start!128720 (=> (not res!1028526) (not e!842729))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128720 (= res!1028526 (validMask!0 mask!2512))))

(assert (=> start!128720 e!842729))

(assert (=> start!128720 true))

(declare-fun array_inv!37574 (array!100615) Bool)

(assert (=> start!128720 (array_inv!37574 a!2804)))

(declare-fun b!1508519 () Bool)

(declare-fun e!842731 () Bool)

(declare-fun lt!654648 () (_ BitVec 32))

(assert (=> b!1508519 (= e!842731 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654648 #b00000000000000000000000000000000) (bvsge lt!654648 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508519 (= lt!654648 (toIndex!0 (select (store (arr!48546 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508520 () Bool)

(declare-fun res!1028533 () Bool)

(assert (=> b!1508520 (=> (not res!1028533) (not e!842729))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508520 (= res!1028533 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49096 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49096 a!2804))))))

(declare-fun b!1508521 () Bool)

(assert (=> b!1508521 (= e!842729 e!842731)))

(declare-fun res!1028528 () Bool)

(assert (=> b!1508521 (=> (not res!1028528) (not e!842731))))

(declare-datatypes ((SeekEntryResult!12717 0))(
  ( (MissingZero!12717 (index!53263 (_ BitVec 32))) (Found!12717 (index!53264 (_ BitVec 32))) (Intermediate!12717 (undefined!13529 Bool) (index!53265 (_ BitVec 32)) (x!135021 (_ BitVec 32))) (Undefined!12717) (MissingVacant!12717 (index!53266 (_ BitVec 32))) )
))
(declare-fun lt!654649 () SeekEntryResult!12717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100615 (_ BitVec 32)) SeekEntryResult!12717)

(assert (=> b!1508521 (= res!1028528 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48546 a!2804) j!70) mask!2512) (select (arr!48546 a!2804) j!70) a!2804 mask!2512) lt!654649))))

(assert (=> b!1508521 (= lt!654649 (Intermediate!12717 false resIndex!21 resX!21))))

(declare-fun b!1508522 () Bool)

(declare-fun res!1028532 () Bool)

(assert (=> b!1508522 (=> (not res!1028532) (not e!842729))))

(assert (=> b!1508522 (= res!1028532 (and (= (size!49096 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49096 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49096 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508523 () Bool)

(declare-fun res!1028527 () Bool)

(assert (=> b!1508523 (=> (not res!1028527) (not e!842731))))

(assert (=> b!1508523 (= res!1028527 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48546 a!2804) j!70) a!2804 mask!2512) lt!654649))))

(declare-fun b!1508524 () Bool)

(declare-fun res!1028529 () Bool)

(assert (=> b!1508524 (=> (not res!1028529) (not e!842729))))

(assert (=> b!1508524 (= res!1028529 (validKeyInArray!0 (select (arr!48546 a!2804) i!961)))))

(declare-fun b!1508525 () Bool)

(declare-fun res!1028530 () Bool)

(assert (=> b!1508525 (=> (not res!1028530) (not e!842729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100615 (_ BitVec 32)) Bool)

(assert (=> b!1508525 (= res!1028530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128720 res!1028526) b!1508522))

(assert (= (and b!1508522 res!1028532) b!1508524))

(assert (= (and b!1508524 res!1028529) b!1508517))

(assert (= (and b!1508517 res!1028531) b!1508525))

(assert (= (and b!1508525 res!1028530) b!1508518))

(assert (= (and b!1508518 res!1028525) b!1508520))

(assert (= (and b!1508520 res!1028533) b!1508521))

(assert (= (and b!1508521 res!1028528) b!1508523))

(assert (= (and b!1508523 res!1028527) b!1508519))

(declare-fun m!1391027 () Bool)

(assert (=> b!1508525 m!1391027))

(declare-fun m!1391029 () Bool)

(assert (=> b!1508519 m!1391029))

(declare-fun m!1391031 () Bool)

(assert (=> b!1508519 m!1391031))

(assert (=> b!1508519 m!1391031))

(declare-fun m!1391033 () Bool)

(assert (=> b!1508519 m!1391033))

(declare-fun m!1391035 () Bool)

(assert (=> b!1508521 m!1391035))

(assert (=> b!1508521 m!1391035))

(declare-fun m!1391037 () Bool)

(assert (=> b!1508521 m!1391037))

(assert (=> b!1508521 m!1391037))

(assert (=> b!1508521 m!1391035))

(declare-fun m!1391039 () Bool)

(assert (=> b!1508521 m!1391039))

(assert (=> b!1508517 m!1391035))

(assert (=> b!1508517 m!1391035))

(declare-fun m!1391041 () Bool)

(assert (=> b!1508517 m!1391041))

(declare-fun m!1391043 () Bool)

(assert (=> b!1508518 m!1391043))

(declare-fun m!1391045 () Bool)

(assert (=> start!128720 m!1391045))

(declare-fun m!1391047 () Bool)

(assert (=> start!128720 m!1391047))

(assert (=> b!1508523 m!1391035))

(assert (=> b!1508523 m!1391035))

(declare-fun m!1391049 () Bool)

(assert (=> b!1508523 m!1391049))

(declare-fun m!1391051 () Bool)

(assert (=> b!1508524 m!1391051))

(assert (=> b!1508524 m!1391051))

(declare-fun m!1391053 () Bool)

(assert (=> b!1508524 m!1391053))

(check-sat (not b!1508517) (not start!128720) (not b!1508521) (not b!1508525) (not b!1508519) (not b!1508518) (not b!1508523) (not b!1508524))
(check-sat)
(get-model)

(declare-fun e!842755 () SeekEntryResult!12717)

(declare-fun b!1508571 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508571 (= e!842755 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48546 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508572 () Bool)

(declare-fun lt!654660 () SeekEntryResult!12717)

(assert (=> b!1508572 (and (bvsge (index!53265 lt!654660) #b00000000000000000000000000000000) (bvslt (index!53265 lt!654660) (size!49096 a!2804)))))

(declare-fun res!1028568 () Bool)

(assert (=> b!1508572 (= res!1028568 (= (select (arr!48546 a!2804) (index!53265 lt!654660)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842754 () Bool)

(assert (=> b!1508572 (=> res!1028568 e!842754)))

(declare-fun b!1508573 () Bool)

(assert (=> b!1508573 (and (bvsge (index!53265 lt!654660) #b00000000000000000000000000000000) (bvslt (index!53265 lt!654660) (size!49096 a!2804)))))

(declare-fun res!1028567 () Bool)

(assert (=> b!1508573 (= res!1028567 (= (select (arr!48546 a!2804) (index!53265 lt!654660)) (select (arr!48546 a!2804) j!70)))))

(assert (=> b!1508573 (=> res!1028567 e!842754)))

(declare-fun e!842751 () Bool)

(assert (=> b!1508573 (= e!842751 e!842754)))

(declare-fun b!1508574 () Bool)

(assert (=> b!1508574 (= e!842755 (Intermediate!12717 false index!487 x!534))))

(declare-fun d!158445 () Bool)

(declare-fun e!842752 () Bool)

(assert (=> d!158445 e!842752))

(declare-fun c!139544 () Bool)

(get-info :version)

(assert (=> d!158445 (= c!139544 (and ((_ is Intermediate!12717) lt!654660) (undefined!13529 lt!654660)))))

(declare-fun e!842753 () SeekEntryResult!12717)

(assert (=> d!158445 (= lt!654660 e!842753)))

(declare-fun c!139542 () Bool)

(assert (=> d!158445 (= c!139542 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!654661 () (_ BitVec 64))

(assert (=> d!158445 (= lt!654661 (select (arr!48546 a!2804) index!487))))

(assert (=> d!158445 (validMask!0 mask!2512)))

(assert (=> d!158445 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48546 a!2804) j!70) a!2804 mask!2512) lt!654660)))

(declare-fun b!1508575 () Bool)

(assert (=> b!1508575 (= e!842752 (bvsge (x!135021 lt!654660) #b01111111111111111111111111111110))))

(declare-fun b!1508576 () Bool)

(assert (=> b!1508576 (= e!842753 e!842755)))

(declare-fun c!139543 () Bool)

(assert (=> b!1508576 (= c!139543 (or (= lt!654661 (select (arr!48546 a!2804) j!70)) (= (bvadd lt!654661 lt!654661) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508577 () Bool)

(assert (=> b!1508577 (= e!842753 (Intermediate!12717 true index!487 x!534))))

(declare-fun b!1508578 () Bool)

(assert (=> b!1508578 (and (bvsge (index!53265 lt!654660) #b00000000000000000000000000000000) (bvslt (index!53265 lt!654660) (size!49096 a!2804)))))

(assert (=> b!1508578 (= e!842754 (= (select (arr!48546 a!2804) (index!53265 lt!654660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508579 () Bool)

(assert (=> b!1508579 (= e!842752 e!842751)))

(declare-fun res!1028569 () Bool)

(assert (=> b!1508579 (= res!1028569 (and ((_ is Intermediate!12717) lt!654660) (not (undefined!13529 lt!654660)) (bvslt (x!135021 lt!654660) #b01111111111111111111111111111110) (bvsge (x!135021 lt!654660) #b00000000000000000000000000000000) (bvsge (x!135021 lt!654660) x!534)))))

(assert (=> b!1508579 (=> (not res!1028569) (not e!842751))))

(assert (= (and d!158445 c!139542) b!1508577))

(assert (= (and d!158445 (not c!139542)) b!1508576))

(assert (= (and b!1508576 c!139543) b!1508574))

(assert (= (and b!1508576 (not c!139543)) b!1508571))

(assert (= (and d!158445 c!139544) b!1508575))

(assert (= (and d!158445 (not c!139544)) b!1508579))

(assert (= (and b!1508579 res!1028569) b!1508573))

(assert (= (and b!1508573 (not res!1028567)) b!1508572))

(assert (= (and b!1508572 (not res!1028568)) b!1508578))

(declare-fun m!1391083 () Bool)

(assert (=> b!1508578 m!1391083))

(assert (=> b!1508573 m!1391083))

(declare-fun m!1391085 () Bool)

(assert (=> d!158445 m!1391085))

(assert (=> d!158445 m!1391045))

(assert (=> b!1508572 m!1391083))

(declare-fun m!1391087 () Bool)

(assert (=> b!1508571 m!1391087))

(assert (=> b!1508571 m!1391087))

(assert (=> b!1508571 m!1391035))

(declare-fun m!1391089 () Bool)

(assert (=> b!1508571 m!1391089))

(assert (=> b!1508523 d!158445))

(declare-fun d!158449 () Bool)

(assert (=> d!158449 (= (validKeyInArray!0 (select (arr!48546 a!2804) j!70)) (and (not (= (select (arr!48546 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48546 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508517 d!158449))

(declare-fun b!1508580 () Bool)

(declare-fun e!842760 () SeekEntryResult!12717)

(assert (=> b!1508580 (= e!842760 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48546 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48546 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508581 () Bool)

(declare-fun lt!654662 () SeekEntryResult!12717)

(assert (=> b!1508581 (and (bvsge (index!53265 lt!654662) #b00000000000000000000000000000000) (bvslt (index!53265 lt!654662) (size!49096 a!2804)))))

(declare-fun res!1028571 () Bool)

(assert (=> b!1508581 (= res!1028571 (= (select (arr!48546 a!2804) (index!53265 lt!654662)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842759 () Bool)

(assert (=> b!1508581 (=> res!1028571 e!842759)))

(declare-fun b!1508582 () Bool)

(assert (=> b!1508582 (and (bvsge (index!53265 lt!654662) #b00000000000000000000000000000000) (bvslt (index!53265 lt!654662) (size!49096 a!2804)))))

(declare-fun res!1028570 () Bool)

(assert (=> b!1508582 (= res!1028570 (= (select (arr!48546 a!2804) (index!53265 lt!654662)) (select (arr!48546 a!2804) j!70)))))

(assert (=> b!1508582 (=> res!1028570 e!842759)))

(declare-fun e!842756 () Bool)

(assert (=> b!1508582 (= e!842756 e!842759)))

(declare-fun b!1508583 () Bool)

(assert (=> b!1508583 (= e!842760 (Intermediate!12717 false (toIndex!0 (select (arr!48546 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!158451 () Bool)

(declare-fun e!842757 () Bool)

(assert (=> d!158451 e!842757))

(declare-fun c!139547 () Bool)

(assert (=> d!158451 (= c!139547 (and ((_ is Intermediate!12717) lt!654662) (undefined!13529 lt!654662)))))

(declare-fun e!842758 () SeekEntryResult!12717)

(assert (=> d!158451 (= lt!654662 e!842758)))

(declare-fun c!139545 () Bool)

(assert (=> d!158451 (= c!139545 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!654663 () (_ BitVec 64))

(assert (=> d!158451 (= lt!654663 (select (arr!48546 a!2804) (toIndex!0 (select (arr!48546 a!2804) j!70) mask!2512)))))

(assert (=> d!158451 (validMask!0 mask!2512)))

(assert (=> d!158451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48546 a!2804) j!70) mask!2512) (select (arr!48546 a!2804) j!70) a!2804 mask!2512) lt!654662)))

(declare-fun b!1508584 () Bool)

(assert (=> b!1508584 (= e!842757 (bvsge (x!135021 lt!654662) #b01111111111111111111111111111110))))

(declare-fun b!1508585 () Bool)

(assert (=> b!1508585 (= e!842758 e!842760)))

(declare-fun c!139546 () Bool)

(assert (=> b!1508585 (= c!139546 (or (= lt!654663 (select (arr!48546 a!2804) j!70)) (= (bvadd lt!654663 lt!654663) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508586 () Bool)

(assert (=> b!1508586 (= e!842758 (Intermediate!12717 true (toIndex!0 (select (arr!48546 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508587 () Bool)

(assert (=> b!1508587 (and (bvsge (index!53265 lt!654662) #b00000000000000000000000000000000) (bvslt (index!53265 lt!654662) (size!49096 a!2804)))))

(assert (=> b!1508587 (= e!842759 (= (select (arr!48546 a!2804) (index!53265 lt!654662)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508588 () Bool)

(assert (=> b!1508588 (= e!842757 e!842756)))

(declare-fun res!1028572 () Bool)

(assert (=> b!1508588 (= res!1028572 (and ((_ is Intermediate!12717) lt!654662) (not (undefined!13529 lt!654662)) (bvslt (x!135021 lt!654662) #b01111111111111111111111111111110) (bvsge (x!135021 lt!654662) #b00000000000000000000000000000000) (bvsge (x!135021 lt!654662) #b00000000000000000000000000000000)))))

(assert (=> b!1508588 (=> (not res!1028572) (not e!842756))))

(assert (= (and d!158451 c!139545) b!1508586))

(assert (= (and d!158451 (not c!139545)) b!1508585))

(assert (= (and b!1508585 c!139546) b!1508583))

(assert (= (and b!1508585 (not c!139546)) b!1508580))

(assert (= (and d!158451 c!139547) b!1508584))

(assert (= (and d!158451 (not c!139547)) b!1508588))

(assert (= (and b!1508588 res!1028572) b!1508582))

(assert (= (and b!1508582 (not res!1028570)) b!1508581))

(assert (= (and b!1508581 (not res!1028571)) b!1508587))

(declare-fun m!1391091 () Bool)

(assert (=> b!1508587 m!1391091))

(assert (=> b!1508582 m!1391091))

(assert (=> d!158451 m!1391037))

(declare-fun m!1391093 () Bool)

(assert (=> d!158451 m!1391093))

(assert (=> d!158451 m!1391045))

(assert (=> b!1508581 m!1391091))

(assert (=> b!1508580 m!1391037))

(declare-fun m!1391095 () Bool)

(assert (=> b!1508580 m!1391095))

(assert (=> b!1508580 m!1391095))

(assert (=> b!1508580 m!1391035))

(declare-fun m!1391097 () Bool)

(assert (=> b!1508580 m!1391097))

(assert (=> b!1508521 d!158451))

(declare-fun d!158455 () Bool)

(declare-fun lt!654675 () (_ BitVec 32))

(declare-fun lt!654674 () (_ BitVec 32))

(assert (=> d!158455 (= lt!654675 (bvmul (bvxor lt!654674 (bvlshr lt!654674 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158455 (= lt!654674 ((_ extract 31 0) (bvand (bvxor (select (arr!48546 a!2804) j!70) (bvlshr (select (arr!48546 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158455 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028574 (let ((h!36437 ((_ extract 31 0) (bvand (bvxor (select (arr!48546 a!2804) j!70) (bvlshr (select (arr!48546 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135025 (bvmul (bvxor h!36437 (bvlshr h!36437 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135025 (bvlshr x!135025 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028574 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028574 #b00000000000000000000000000000000))))))

(assert (=> d!158455 (= (toIndex!0 (select (arr!48546 a!2804) j!70) mask!2512) (bvand (bvxor lt!654675 (bvlshr lt!654675 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508521 d!158455))

(declare-fun d!158459 () Bool)

(assert (=> d!158459 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128720 d!158459))

(declare-fun d!158465 () Bool)

(assert (=> d!158465 (= (array_inv!37574 a!2804) (bvsge (size!49096 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128720 d!158465))

(declare-fun b!1508645 () Bool)

(declare-fun e!842796 () Bool)

(declare-fun e!842797 () Bool)

(assert (=> b!1508645 (= e!842796 e!842797)))

(declare-fun c!139565 () Bool)

(assert (=> b!1508645 (= c!139565 (validKeyInArray!0 (select (arr!48546 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508646 () Bool)

(declare-fun e!842798 () Bool)

(declare-fun call!68298 () Bool)

(assert (=> b!1508646 (= e!842798 call!68298)))

(declare-fun d!158467 () Bool)

(declare-fun res!1028598 () Bool)

(assert (=> d!158467 (=> res!1028598 e!842796)))

(assert (=> d!158467 (= res!1028598 (bvsge #b00000000000000000000000000000000 (size!49096 a!2804)))))

(assert (=> d!158467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842796)))

(declare-fun b!1508647 () Bool)

(assert (=> b!1508647 (= e!842797 call!68298)))

(declare-fun b!1508648 () Bool)

(assert (=> b!1508648 (= e!842797 e!842798)))

(declare-fun lt!654701 () (_ BitVec 64))

(assert (=> b!1508648 (= lt!654701 (select (arr!48546 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50342 0))(
  ( (Unit!50343) )
))
(declare-fun lt!654699 () Unit!50342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100615 (_ BitVec 64) (_ BitVec 32)) Unit!50342)

(assert (=> b!1508648 (= lt!654699 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654701 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1508648 (arrayContainsKey!0 a!2804 lt!654701 #b00000000000000000000000000000000)))

(declare-fun lt!654700 () Unit!50342)

(assert (=> b!1508648 (= lt!654700 lt!654699)))

(declare-fun res!1028597 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100615 (_ BitVec 32)) SeekEntryResult!12717)

(assert (=> b!1508648 (= res!1028597 (= (seekEntryOrOpen!0 (select (arr!48546 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12717 #b00000000000000000000000000000000)))))

(assert (=> b!1508648 (=> (not res!1028597) (not e!842798))))

(declare-fun bm!68295 () Bool)

(assert (=> bm!68295 (= call!68298 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158467 (not res!1028598)) b!1508645))

(assert (= (and b!1508645 c!139565) b!1508648))

(assert (= (and b!1508645 (not c!139565)) b!1508647))

(assert (= (and b!1508648 res!1028597) b!1508646))

(assert (= (or b!1508646 b!1508647) bm!68295))

(declare-fun m!1391127 () Bool)

(assert (=> b!1508645 m!1391127))

(assert (=> b!1508645 m!1391127))

(declare-fun m!1391129 () Bool)

(assert (=> b!1508645 m!1391129))

(assert (=> b!1508648 m!1391127))

(declare-fun m!1391131 () Bool)

(assert (=> b!1508648 m!1391131))

(declare-fun m!1391133 () Bool)

(assert (=> b!1508648 m!1391133))

(assert (=> b!1508648 m!1391127))

(declare-fun m!1391135 () Bool)

(assert (=> b!1508648 m!1391135))

(declare-fun m!1391137 () Bool)

(assert (=> bm!68295 m!1391137))

(assert (=> b!1508525 d!158467))

(declare-fun d!158477 () Bool)

(assert (=> d!158477 (= (validKeyInArray!0 (select (arr!48546 a!2804) i!961)) (and (not (= (select (arr!48546 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48546 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508524 d!158477))

(declare-fun d!158479 () Bool)

(declare-fun lt!654703 () (_ BitVec 32))

(declare-fun lt!654702 () (_ BitVec 32))

(assert (=> d!158479 (= lt!654703 (bvmul (bvxor lt!654702 (bvlshr lt!654702 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158479 (= lt!654702 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48546 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48546 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158479 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028574 (let ((h!36437 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48546 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48546 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135025 (bvmul (bvxor h!36437 (bvlshr h!36437 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135025 (bvlshr x!135025 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028574 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028574 #b00000000000000000000000000000000))))))

(assert (=> d!158479 (= (toIndex!0 (select (store (arr!48546 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!654703 (bvlshr lt!654703 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508519 d!158479))

(declare-fun b!1508673 () Bool)

(declare-fun e!842817 () Bool)

(declare-fun contains!9973 (List!35029 (_ BitVec 64)) Bool)

(assert (=> b!1508673 (= e!842817 (contains!9973 Nil!35026 (select (arr!48546 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68298 () Bool)

(declare-fun call!68301 () Bool)

(declare-fun c!139574 () Bool)

(assert (=> bm!68298 (= call!68301 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139574 (Cons!35025 (select (arr!48546 a!2804) #b00000000000000000000000000000000) Nil!35026) Nil!35026)))))

(declare-fun d!158481 () Bool)

(declare-fun res!1028610 () Bool)

(declare-fun e!842816 () Bool)

(assert (=> d!158481 (=> res!1028610 e!842816)))

(assert (=> d!158481 (= res!1028610 (bvsge #b00000000000000000000000000000000 (size!49096 a!2804)))))

(assert (=> d!158481 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35026) e!842816)))

(declare-fun b!1508674 () Bool)

(declare-fun e!842818 () Bool)

(declare-fun e!842815 () Bool)

(assert (=> b!1508674 (= e!842818 e!842815)))

(assert (=> b!1508674 (= c!139574 (validKeyInArray!0 (select (arr!48546 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508675 () Bool)

(assert (=> b!1508675 (= e!842816 e!842818)))

(declare-fun res!1028609 () Bool)

(assert (=> b!1508675 (=> (not res!1028609) (not e!842818))))

(assert (=> b!1508675 (= res!1028609 (not e!842817))))

(declare-fun res!1028608 () Bool)

(assert (=> b!1508675 (=> (not res!1028608) (not e!842817))))

(assert (=> b!1508675 (= res!1028608 (validKeyInArray!0 (select (arr!48546 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508676 () Bool)

(assert (=> b!1508676 (= e!842815 call!68301)))

(declare-fun b!1508677 () Bool)

(assert (=> b!1508677 (= e!842815 call!68301)))

(assert (= (and d!158481 (not res!1028610)) b!1508675))

(assert (= (and b!1508675 res!1028608) b!1508673))

(assert (= (and b!1508675 res!1028609) b!1508674))

(assert (= (and b!1508674 c!139574) b!1508677))

(assert (= (and b!1508674 (not c!139574)) b!1508676))

(assert (= (or b!1508677 b!1508676) bm!68298))

(assert (=> b!1508673 m!1391127))

(assert (=> b!1508673 m!1391127))

(declare-fun m!1391139 () Bool)

(assert (=> b!1508673 m!1391139))

(assert (=> bm!68298 m!1391127))

(declare-fun m!1391141 () Bool)

(assert (=> bm!68298 m!1391141))

(assert (=> b!1508674 m!1391127))

(assert (=> b!1508674 m!1391127))

(assert (=> b!1508674 m!1391129))

(assert (=> b!1508675 m!1391127))

(assert (=> b!1508675 m!1391127))

(assert (=> b!1508675 m!1391129))

(assert (=> b!1508518 d!158481))

(check-sat (not b!1508673) (not b!1508645) (not bm!68295) (not bm!68298) (not b!1508571) (not b!1508580) (not b!1508675) (not d!158451) (not b!1508648) (not d!158445) (not b!1508674))
(check-sat)
