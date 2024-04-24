; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129810 () Bool)

(assert start!129810)

(declare-fun b!1522449 () Bool)

(declare-fun res!1040612 () Bool)

(declare-fun e!849368 () Bool)

(assert (=> b!1522449 (=> (not res!1040612) (not e!849368))))

(declare-datatypes ((SeekEntryResult!12961 0))(
  ( (MissingZero!12961 (index!54239 (_ BitVec 32))) (Found!12961 (index!54240 (_ BitVec 32))) (Intermediate!12961 (undefined!13773 Bool) (index!54241 (_ BitVec 32)) (x!136118 (_ BitVec 32))) (Undefined!12961) (MissingVacant!12961 (index!54242 (_ BitVec 32))) )
))
(declare-fun lt!659821 () SeekEntryResult!12961)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101336 0))(
  ( (array!101337 (arr!48897 (Array (_ BitVec 32) (_ BitVec 64))) (size!49448 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101336)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101336 (_ BitVec 32)) SeekEntryResult!12961)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522449 (= res!1040612 (= lt!659821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101337 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804)) mask!2512)))))

(declare-fun b!1522450 () Bool)

(declare-fun res!1040617 () Bool)

(declare-fun e!849366 () Bool)

(assert (=> b!1522450 (=> (not res!1040617) (not e!849366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522450 (= res!1040617 (validKeyInArray!0 (select (arr!48897 a!2804) j!70)))))

(declare-fun b!1522451 () Bool)

(declare-fun res!1040618 () Bool)

(assert (=> b!1522451 (=> (not res!1040618) (not e!849366))))

(declare-datatypes ((List!35367 0))(
  ( (Nil!35364) (Cons!35363 (h!36796 (_ BitVec 64)) (t!50053 List!35367)) )
))
(declare-fun arrayNoDuplicates!0 (array!101336 (_ BitVec 32) List!35367) Bool)

(assert (=> b!1522451 (= res!1040618 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35364))))

(declare-fun b!1522452 () Bool)

(declare-fun res!1040619 () Bool)

(assert (=> b!1522452 (=> (not res!1040619) (not e!849368))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!659820 () SeekEntryResult!12961)

(assert (=> b!1522452 (= res!1040619 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48897 a!2804) j!70) a!2804 mask!2512) lt!659820))))

(declare-fun b!1522453 () Bool)

(declare-fun res!1040613 () Bool)

(assert (=> b!1522453 (=> (not res!1040613) (not e!849366))))

(assert (=> b!1522453 (= res!1040613 (and (= (size!49448 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49448 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49448 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522454 () Bool)

(declare-fun e!849369 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101336 (_ BitVec 32)) SeekEntryResult!12961)

(assert (=> b!1522454 (= e!849369 (= (seekEntry!0 (select (arr!48897 a!2804) j!70) a!2804 mask!2512) (Found!12961 j!70)))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1522455 () Bool)

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1522455 (= e!849368 (not (or (not (= (select (arr!48897 a!2804) j!70) (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48897 a!2804) index!487) (select (arr!48897 a!2804) j!70))) (= j!70 index!487))))))

(assert (=> b!1522455 e!849369))

(declare-fun res!1040621 () Bool)

(assert (=> b!1522455 (=> (not res!1040621) (not e!849369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101336 (_ BitVec 32)) Bool)

(assert (=> b!1522455 (= res!1040621 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50825 0))(
  ( (Unit!50826) )
))
(declare-fun lt!659819 () Unit!50825)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50825)

(assert (=> b!1522455 (= lt!659819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522456 () Bool)

(declare-fun res!1040615 () Bool)

(assert (=> b!1522456 (=> (not res!1040615) (not e!849366))))

(assert (=> b!1522456 (= res!1040615 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49448 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49448 a!2804))))))

(declare-fun b!1522457 () Bool)

(declare-fun res!1040620 () Bool)

(assert (=> b!1522457 (=> (not res!1040620) (not e!849366))))

(assert (=> b!1522457 (= res!1040620 (validKeyInArray!0 (select (arr!48897 a!2804) i!961)))))

(declare-fun res!1040614 () Bool)

(assert (=> start!129810 (=> (not res!1040614) (not e!849366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129810 (= res!1040614 (validMask!0 mask!2512))))

(assert (=> start!129810 e!849366))

(assert (=> start!129810 true))

(declare-fun array_inv!38178 (array!101336) Bool)

(assert (=> start!129810 (array_inv!38178 a!2804)))

(declare-fun b!1522458 () Bool)

(assert (=> b!1522458 (= e!849366 e!849368)))

(declare-fun res!1040616 () Bool)

(assert (=> b!1522458 (=> (not res!1040616) (not e!849368))))

(assert (=> b!1522458 (= res!1040616 (= lt!659821 lt!659820))))

(assert (=> b!1522458 (= lt!659820 (Intermediate!12961 false resIndex!21 resX!21))))

(assert (=> b!1522458 (= lt!659821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48897 a!2804) j!70) mask!2512) (select (arr!48897 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522459 () Bool)

(declare-fun res!1040611 () Bool)

(assert (=> b!1522459 (=> (not res!1040611) (not e!849366))))

(assert (=> b!1522459 (= res!1040611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129810 res!1040614) b!1522453))

(assert (= (and b!1522453 res!1040613) b!1522457))

(assert (= (and b!1522457 res!1040620) b!1522450))

(assert (= (and b!1522450 res!1040617) b!1522459))

(assert (= (and b!1522459 res!1040611) b!1522451))

(assert (= (and b!1522451 res!1040618) b!1522456))

(assert (= (and b!1522456 res!1040615) b!1522458))

(assert (= (and b!1522458 res!1040616) b!1522452))

(assert (= (and b!1522452 res!1040619) b!1522449))

(assert (= (and b!1522449 res!1040612) b!1522455))

(assert (= (and b!1522455 res!1040621) b!1522454))

(declare-fun m!1405651 () Bool)

(assert (=> b!1522451 m!1405651))

(declare-fun m!1405653 () Bool)

(assert (=> b!1522457 m!1405653))

(assert (=> b!1522457 m!1405653))

(declare-fun m!1405655 () Bool)

(assert (=> b!1522457 m!1405655))

(declare-fun m!1405657 () Bool)

(assert (=> b!1522455 m!1405657))

(declare-fun m!1405659 () Bool)

(assert (=> b!1522455 m!1405659))

(declare-fun m!1405661 () Bool)

(assert (=> b!1522455 m!1405661))

(declare-fun m!1405663 () Bool)

(assert (=> b!1522455 m!1405663))

(declare-fun m!1405665 () Bool)

(assert (=> b!1522455 m!1405665))

(declare-fun m!1405667 () Bool)

(assert (=> b!1522455 m!1405667))

(declare-fun m!1405669 () Bool)

(assert (=> b!1522459 m!1405669))

(assert (=> b!1522450 m!1405657))

(assert (=> b!1522450 m!1405657))

(declare-fun m!1405671 () Bool)

(assert (=> b!1522450 m!1405671))

(assert (=> b!1522454 m!1405657))

(assert (=> b!1522454 m!1405657))

(declare-fun m!1405673 () Bool)

(assert (=> b!1522454 m!1405673))

(assert (=> b!1522458 m!1405657))

(assert (=> b!1522458 m!1405657))

(declare-fun m!1405675 () Bool)

(assert (=> b!1522458 m!1405675))

(assert (=> b!1522458 m!1405675))

(assert (=> b!1522458 m!1405657))

(declare-fun m!1405677 () Bool)

(assert (=> b!1522458 m!1405677))

(assert (=> b!1522452 m!1405657))

(assert (=> b!1522452 m!1405657))

(declare-fun m!1405679 () Bool)

(assert (=> b!1522452 m!1405679))

(assert (=> b!1522449 m!1405661))

(assert (=> b!1522449 m!1405665))

(assert (=> b!1522449 m!1405665))

(declare-fun m!1405681 () Bool)

(assert (=> b!1522449 m!1405681))

(assert (=> b!1522449 m!1405681))

(assert (=> b!1522449 m!1405665))

(declare-fun m!1405683 () Bool)

(assert (=> b!1522449 m!1405683))

(declare-fun m!1405685 () Bool)

(assert (=> start!129810 m!1405685))

(declare-fun m!1405687 () Bool)

(assert (=> start!129810 m!1405687))

(push 1)

(assert (not b!1522452))

(assert (not b!1522455))

(assert (not b!1522449))

(assert (not b!1522459))

(assert (not start!129810))

(assert (not b!1522451))

(assert (not b!1522457))

(assert (not b!1522458))

(assert (not b!1522454))

(assert (not b!1522450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1522537 () Bool)

(declare-fun e!849425 () Bool)

(declare-fun lt!659853 () SeekEntryResult!12961)

(assert (=> b!1522537 (= e!849425 (bvsge (x!136118 lt!659853) #b01111111111111111111111111111110))))

(declare-fun d!159509 () Bool)

(assert (=> d!159509 e!849425))

(declare-fun c!140500 () Bool)

(assert (=> d!159509 (= c!140500 (and (is-Intermediate!12961 lt!659853) (undefined!13773 lt!659853)))))

(declare-fun e!849423 () SeekEntryResult!12961)

(assert (=> d!159509 (= lt!659853 e!849423)))

(declare-fun c!140498 () Bool)

(assert (=> d!159509 (= c!140498 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659854 () (_ BitVec 64))

(assert (=> d!159509 (= lt!659854 (select (arr!48897 a!2804) (toIndex!0 (select (arr!48897 a!2804) j!70) mask!2512)))))

(assert (=> d!159509 (validMask!0 mask!2512)))

(assert (=> d!159509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48897 a!2804) j!70) mask!2512) (select (arr!48897 a!2804) j!70) a!2804 mask!2512) lt!659853)))

(declare-fun b!1522538 () Bool)

(assert (=> b!1522538 (and (bvsge (index!54241 lt!659853) #b00000000000000000000000000000000) (bvslt (index!54241 lt!659853) (size!49448 a!2804)))))

(declare-fun e!849421 () Bool)

(assert (=> b!1522538 (= e!849421 (= (select (arr!48897 a!2804) (index!54241 lt!659853)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522539 () Bool)

(assert (=> b!1522539 (and (bvsge (index!54241 lt!659853) #b00000000000000000000000000000000) (bvslt (index!54241 lt!659853) (size!49448 a!2804)))))

(declare-fun res!1040653 () Bool)

(assert (=> b!1522539 (= res!1040653 (= (select (arr!48897 a!2804) (index!54241 lt!659853)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522539 (=> res!1040653 e!849421)))

(declare-fun b!1522540 () Bool)

(declare-fun e!849422 () SeekEntryResult!12961)

(assert (=> b!1522540 (= e!849423 e!849422)))

(declare-fun c!140499 () Bool)

(assert (=> b!1522540 (= c!140499 (or (= lt!659854 (select (arr!48897 a!2804) j!70)) (= (bvadd lt!659854 lt!659854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522541 () Bool)

(declare-fun e!849424 () Bool)

(assert (=> b!1522541 (= e!849425 e!849424)))

(declare-fun res!1040651 () Bool)

(assert (=> b!1522541 (= res!1040651 (and (is-Intermediate!12961 lt!659853) (not (undefined!13773 lt!659853)) (bvslt (x!136118 lt!659853) #b01111111111111111111111111111110) (bvsge (x!136118 lt!659853) #b00000000000000000000000000000000) (bvsge (x!136118 lt!659853) #b00000000000000000000000000000000)))))

(assert (=> b!1522541 (=> (not res!1040651) (not e!849424))))

(declare-fun b!1522542 () Bool)

(assert (=> b!1522542 (= e!849423 (Intermediate!12961 true (toIndex!0 (select (arr!48897 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522543 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522543 (= e!849422 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48897 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48897 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522544 () Bool)

(assert (=> b!1522544 (= e!849422 (Intermediate!12961 false (toIndex!0 (select (arr!48897 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522545 () Bool)

(assert (=> b!1522545 (and (bvsge (index!54241 lt!659853) #b00000000000000000000000000000000) (bvslt (index!54241 lt!659853) (size!49448 a!2804)))))

(declare-fun res!1040652 () Bool)

(assert (=> b!1522545 (= res!1040652 (= (select (arr!48897 a!2804) (index!54241 lt!659853)) (select (arr!48897 a!2804) j!70)))))

(assert (=> b!1522545 (=> res!1040652 e!849421)))

(assert (=> b!1522545 (= e!849424 e!849421)))

(assert (= (and d!159509 c!140498) b!1522542))

(assert (= (and d!159509 (not c!140498)) b!1522540))

(assert (= (and b!1522540 c!140499) b!1522544))

(assert (= (and b!1522540 (not c!140499)) b!1522543))

(assert (= (and d!159509 c!140500) b!1522537))

(assert (= (and d!159509 (not c!140500)) b!1522541))

(assert (= (and b!1522541 res!1040651) b!1522545))

(assert (= (and b!1522545 (not res!1040652)) b!1522539))

(assert (= (and b!1522539 (not res!1040653)) b!1522538))

(declare-fun m!1405725 () Bool)

(assert (=> b!1522538 m!1405725))

(assert (=> b!1522539 m!1405725))

(assert (=> b!1522543 m!1405675))

(declare-fun m!1405727 () Bool)

(assert (=> b!1522543 m!1405727))

(assert (=> b!1522543 m!1405727))

(assert (=> b!1522543 m!1405657))

(declare-fun m!1405729 () Bool)

(assert (=> b!1522543 m!1405729))

(assert (=> b!1522545 m!1405725))

(assert (=> d!159509 m!1405675))

(declare-fun m!1405731 () Bool)

(assert (=> d!159509 m!1405731))

(assert (=> d!159509 m!1405685))

(assert (=> b!1522458 d!159509))

(declare-fun d!159517 () Bool)

(declare-fun lt!659860 () (_ BitVec 32))

(declare-fun lt!659859 () (_ BitVec 32))

(assert (=> d!159517 (= lt!659860 (bvmul (bvxor lt!659859 (bvlshr lt!659859 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159517 (= lt!659859 ((_ extract 31 0) (bvand (bvxor (select (arr!48897 a!2804) j!70) (bvlshr (select (arr!48897 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159517 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040654 (let ((h!36797 ((_ extract 31 0) (bvand (bvxor (select (arr!48897 a!2804) j!70) (bvlshr (select (arr!48897 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136120 (bvmul (bvxor h!36797 (bvlshr h!36797 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136120 (bvlshr x!136120 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040654 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040654 #b00000000000000000000000000000000))))))

(assert (=> d!159517 (= (toIndex!0 (select (arr!48897 a!2804) j!70) mask!2512) (bvand (bvxor lt!659860 (bvlshr lt!659860 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1522458 d!159517))

(declare-fun d!159521 () Bool)

(declare-fun res!1040664 () Bool)

(declare-fun e!849440 () Bool)

(assert (=> d!159521 (=> res!1040664 e!849440)))

(assert (=> d!159521 (= res!1040664 (bvsge #b00000000000000000000000000000000 (size!49448 a!2804)))))

(assert (=> d!159521 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35364) e!849440)))

(declare-fun b!1522561 () Bool)

(declare-fun e!849439 () Bool)

(assert (=> b!1522561 (= e!849440 e!849439)))

(declare-fun res!1040666 () Bool)

(assert (=> b!1522561 (=> (not res!1040666) (not e!849439))))

(declare-fun e!849441 () Bool)

(assert (=> b!1522561 (= res!1040666 (not e!849441))))

(declare-fun res!1040665 () Bool)

(assert (=> b!1522561 (=> (not res!1040665) (not e!849441))))

(assert (=> b!1522561 (= res!1040665 (validKeyInArray!0 (select (arr!48897 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522562 () Bool)

(declare-fun e!849438 () Bool)

(declare-fun call!68479 () Bool)

(assert (=> b!1522562 (= e!849438 call!68479)))

(declare-fun bm!68476 () Bool)

(declare-fun c!140504 () Bool)

(assert (=> bm!68476 (= call!68479 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140504 (Cons!35363 (select (arr!48897 a!2804) #b00000000000000000000000000000000) Nil!35364) Nil!35364)))))

(declare-fun b!1522563 () Bool)

(assert (=> b!1522563 (= e!849438 call!68479)))

(declare-fun b!1522564 () Bool)

(assert (=> b!1522564 (= e!849439 e!849438)))

(assert (=> b!1522564 (= c!140504 (validKeyInArray!0 (select (arr!48897 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522565 () Bool)

(declare-fun contains!10027 (List!35367 (_ BitVec 64)) Bool)

(assert (=> b!1522565 (= e!849441 (contains!10027 Nil!35364 (select (arr!48897 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159521 (not res!1040664)) b!1522561))

(assert (= (and b!1522561 res!1040665) b!1522565))

(assert (= (and b!1522561 res!1040666) b!1522564))

(assert (= (and b!1522564 c!140504) b!1522562))

(assert (= (and b!1522564 (not c!140504)) b!1522563))

(assert (= (or b!1522562 b!1522563) bm!68476))

(declare-fun m!1405737 () Bool)

(assert (=> b!1522561 m!1405737))

(assert (=> b!1522561 m!1405737))

(declare-fun m!1405739 () Bool)

(assert (=> b!1522561 m!1405739))

(assert (=> bm!68476 m!1405737))

(declare-fun m!1405741 () Bool)

(assert (=> bm!68476 m!1405741))

(assert (=> b!1522564 m!1405737))

(assert (=> b!1522564 m!1405737))

(assert (=> b!1522564 m!1405739))

(assert (=> b!1522565 m!1405737))

(assert (=> b!1522565 m!1405737))

(declare-fun m!1405743 () Bool)

(assert (=> b!1522565 m!1405743))

(assert (=> b!1522451 d!159521))

(declare-fun d!159523 () Bool)

(assert (=> d!159523 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129810 d!159523))

(declare-fun d!159525 () Bool)

(assert (=> d!159525 (= (array_inv!38178 a!2804) (bvsge (size!49448 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129810 d!159525))

(declare-fun b!1522574 () Bool)

(declare-fun e!849450 () Bool)

(declare-fun lt!659865 () SeekEntryResult!12961)

(assert (=> b!1522574 (= e!849450 (bvsge (x!136118 lt!659865) #b01111111111111111111111111111110))))

(declare-fun d!159527 () Bool)

(assert (=> d!159527 e!849450))

(declare-fun c!140511 () Bool)

(assert (=> d!159527 (= c!140511 (and (is-Intermediate!12961 lt!659865) (undefined!13773 lt!659865)))))

(declare-fun e!849448 () SeekEntryResult!12961)

(assert (=> d!159527 (= lt!659865 e!849448)))

(declare-fun c!140509 () Bool)

(assert (=> d!159527 (= c!140509 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!659866 () (_ BitVec 64))

(assert (=> d!159527 (= lt!659866 (select (arr!48897 a!2804) index!487))))

(assert (=> d!159527 (validMask!0 mask!2512)))

(assert (=> d!159527 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48897 a!2804) j!70) a!2804 mask!2512) lt!659865)))

(declare-fun b!1522575 () Bool)

(assert (=> b!1522575 (and (bvsge (index!54241 lt!659865) #b00000000000000000000000000000000) (bvslt (index!54241 lt!659865) (size!49448 a!2804)))))

(declare-fun e!849446 () Bool)

(assert (=> b!1522575 (= e!849446 (= (select (arr!48897 a!2804) (index!54241 lt!659865)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522576 () Bool)

(assert (=> b!1522576 (and (bvsge (index!54241 lt!659865) #b00000000000000000000000000000000) (bvslt (index!54241 lt!659865) (size!49448 a!2804)))))

(declare-fun res!1040669 () Bool)

(assert (=> b!1522576 (= res!1040669 (= (select (arr!48897 a!2804) (index!54241 lt!659865)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522576 (=> res!1040669 e!849446)))

(declare-fun b!1522577 () Bool)

(declare-fun e!849447 () SeekEntryResult!12961)

(assert (=> b!1522577 (= e!849448 e!849447)))

(declare-fun c!140510 () Bool)

(assert (=> b!1522577 (= c!140510 (or (= lt!659866 (select (arr!48897 a!2804) j!70)) (= (bvadd lt!659866 lt!659866) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522578 () Bool)

(declare-fun e!849449 () Bool)

(assert (=> b!1522578 (= e!849450 e!849449)))

(declare-fun res!1040667 () Bool)

(assert (=> b!1522578 (= res!1040667 (and (is-Intermediate!12961 lt!659865) (not (undefined!13773 lt!659865)) (bvslt (x!136118 lt!659865) #b01111111111111111111111111111110) (bvsge (x!136118 lt!659865) #b00000000000000000000000000000000) (bvsge (x!136118 lt!659865) x!534)))))

(assert (=> b!1522578 (=> (not res!1040667) (not e!849449))))

(declare-fun b!1522579 () Bool)

(assert (=> b!1522579 (= e!849448 (Intermediate!12961 true index!487 x!534))))

(declare-fun b!1522580 () Bool)

(assert (=> b!1522580 (= e!849447 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48897 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522581 () Bool)

(assert (=> b!1522581 (= e!849447 (Intermediate!12961 false index!487 x!534))))

(declare-fun b!1522582 () Bool)

(assert (=> b!1522582 (and (bvsge (index!54241 lt!659865) #b00000000000000000000000000000000) (bvslt (index!54241 lt!659865) (size!49448 a!2804)))))

(declare-fun res!1040668 () Bool)

(assert (=> b!1522582 (= res!1040668 (= (select (arr!48897 a!2804) (index!54241 lt!659865)) (select (arr!48897 a!2804) j!70)))))

(assert (=> b!1522582 (=> res!1040668 e!849446)))

(assert (=> b!1522582 (= e!849449 e!849446)))

(assert (= (and d!159527 c!140509) b!1522579))

(assert (= (and d!159527 (not c!140509)) b!1522577))

(assert (= (and b!1522577 c!140510) b!1522581))

(assert (= (and b!1522577 (not c!140510)) b!1522580))

(assert (= (and d!159527 c!140511) b!1522574))

(assert (= (and d!159527 (not c!140511)) b!1522578))

(assert (= (and b!1522578 res!1040667) b!1522582))

(assert (= (and b!1522582 (not res!1040668)) b!1522576))

(assert (= (and b!1522576 (not res!1040669)) b!1522575))

(declare-fun m!1405745 () Bool)

(assert (=> b!1522575 m!1405745))

(assert (=> b!1522576 m!1405745))

(declare-fun m!1405747 () Bool)

(assert (=> b!1522580 m!1405747))

(assert (=> b!1522580 m!1405747))

(assert (=> b!1522580 m!1405657))

(declare-fun m!1405749 () Bool)

(assert (=> b!1522580 m!1405749))

(assert (=> b!1522582 m!1405745))

(assert (=> d!159527 m!1405663))

(assert (=> d!159527 m!1405685))

(assert (=> b!1522452 d!159527))

(declare-fun d!159529 () Bool)

(assert (=> d!159529 (= (validKeyInArray!0 (select (arr!48897 a!2804) i!961)) (and (not (= (select (arr!48897 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48897 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522457 d!159529))

(declare-fun d!159531 () Bool)

(assert (=> d!159531 (= (validKeyInArray!0 (select (arr!48897 a!2804) j!70)) (and (not (= (select (arr!48897 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48897 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522450 d!159531))

(declare-fun b!1522628 () Bool)

(declare-fun e!849479 () Bool)

(declare-fun call!68482 () Bool)

(assert (=> b!1522628 (= e!849479 call!68482)))

(declare-fun b!1522629 () Bool)

(declare-fun e!849478 () Bool)

(assert (=> b!1522629 (= e!849479 e!849478)))

(declare-fun lt!659880 () (_ BitVec 64))

(assert (=> b!1522629 (= lt!659880 (select (arr!48897 a!2804) j!70))))

(declare-fun lt!659881 () Unit!50825)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101336 (_ BitVec 64) (_ BitVec 32)) Unit!50825)

(assert (=> b!1522629 (= lt!659881 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659880 j!70))))

(declare-fun arrayContainsKey!0 (array!101336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1522629 (arrayContainsKey!0 a!2804 lt!659880 #b00000000000000000000000000000000)))

(declare-fun lt!659879 () Unit!50825)

(assert (=> b!1522629 (= lt!659879 lt!659881)))

(declare-fun res!1040689 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101336 (_ BitVec 32)) SeekEntryResult!12961)

(assert (=> b!1522629 (= res!1040689 (= (seekEntryOrOpen!0 (select (arr!48897 a!2804) j!70) a!2804 mask!2512) (Found!12961 j!70)))))

(assert (=> b!1522629 (=> (not res!1040689) (not e!849478))))

(declare-fun b!1522630 () Bool)

(declare-fun e!849480 () Bool)

(assert (=> b!1522630 (= e!849480 e!849479)))

(declare-fun c!140525 () Bool)

(assert (=> b!1522630 (= c!140525 (validKeyInArray!0 (select (arr!48897 a!2804) j!70)))))

(declare-fun bm!68479 () Bool)

(assert (=> bm!68479 (= call!68482 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159533 () Bool)

(declare-fun res!1040690 () Bool)

(assert (=> d!159533 (=> res!1040690 e!849480)))

(assert (=> d!159533 (= res!1040690 (bvsge j!70 (size!49448 a!2804)))))

(assert (=> d!159533 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!849480)))

(declare-fun b!1522631 () Bool)

(assert (=> b!1522631 (= e!849478 call!68482)))

(assert (= (and d!159533 (not res!1040690)) b!1522630))

(assert (= (and b!1522630 c!140525) b!1522629))

(assert (= (and b!1522630 (not c!140525)) b!1522628))

(assert (= (and b!1522629 res!1040689) b!1522631))

(assert (= (or b!1522631 b!1522628) bm!68479))

(assert (=> b!1522629 m!1405657))

(declare-fun m!1405759 () Bool)

(assert (=> b!1522629 m!1405759))

(declare-fun m!1405761 () Bool)

(assert (=> b!1522629 m!1405761))

(assert (=> b!1522629 m!1405657))

(declare-fun m!1405763 () Bool)

(assert (=> b!1522629 m!1405763))

(assert (=> b!1522630 m!1405657))

(assert (=> b!1522630 m!1405657))

(assert (=> b!1522630 m!1405671))

(declare-fun m!1405765 () Bool)

(assert (=> bm!68479 m!1405765))

(assert (=> b!1522455 d!159533))

(declare-fun d!159537 () Bool)

(assert (=> d!159537 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659886 () Unit!50825)

(declare-fun choose!38 (array!101336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50825)

(assert (=> d!159537 (= lt!659886 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159537 (validMask!0 mask!2512)))

(assert (=> d!159537 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659886)))

(declare-fun bs!43648 () Bool)

(assert (= bs!43648 d!159537))

(assert (=> bs!43648 m!1405667))

(declare-fun m!1405775 () Bool)

(assert (=> bs!43648 m!1405775))

(assert (=> bs!43648 m!1405685))

(assert (=> b!1522455 d!159537))

(declare-fun d!159541 () Bool)

(declare-fun lt!659917 () SeekEntryResult!12961)

(assert (=> d!159541 (and (or (is-MissingVacant!12961 lt!659917) (not (is-Found!12961 lt!659917)) (and (bvsge (index!54240 lt!659917) #b00000000000000000000000000000000) (bvslt (index!54240 lt!659917) (size!49448 a!2804)))) (not (is-MissingVacant!12961 lt!659917)) (or (not (is-Found!12961 lt!659917)) (= (select (arr!48897 a!2804) (index!54240 lt!659917)) (select (arr!48897 a!2804) j!70))))))

(declare-fun e!849509 () SeekEntryResult!12961)

(assert (=> d!159541 (= lt!659917 e!849509)))

(declare-fun c!140546 () Bool)

(declare-fun lt!659918 () SeekEntryResult!12961)

(assert (=> d!159541 (= c!140546 (and (is-Intermediate!12961 lt!659918) (undefined!13773 lt!659918)))))

(assert (=> d!159541 (= lt!659918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48897 a!2804) j!70) mask!2512) (select (arr!48897 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159541 (validMask!0 mask!2512)))

(assert (=> d!159541 (= (seekEntry!0 (select (arr!48897 a!2804) j!70) a!2804 mask!2512) lt!659917)))

(declare-fun b!1522680 () Bool)

(assert (=> b!1522680 (= e!849509 Undefined!12961)))

(declare-fun b!1522681 () Bool)

(declare-fun c!140544 () Bool)

(declare-fun lt!659919 () (_ BitVec 64))

(assert (=> b!1522681 (= c!140544 (= lt!659919 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849508 () SeekEntryResult!12961)

(declare-fun e!849507 () SeekEntryResult!12961)

(assert (=> b!1522681 (= e!849508 e!849507)))

(declare-fun b!1522682 () Bool)

(declare-fun lt!659920 () SeekEntryResult!12961)

(assert (=> b!1522682 (= e!849507 (ite (is-MissingVacant!12961 lt!659920) (MissingZero!12961 (index!54242 lt!659920)) lt!659920))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101336 (_ BitVec 32)) SeekEntryResult!12961)

(assert (=> b!1522682 (= lt!659920 (seekKeyOrZeroReturnVacant!0 (x!136118 lt!659918) (index!54241 lt!659918) (index!54241 lt!659918) (select (arr!48897 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522683 () Bool)

(assert (=> b!1522683 (= e!849508 (Found!12961 (index!54241 lt!659918)))))

(declare-fun b!1522684 () Bool)

(assert (=> b!1522684 (= e!849507 (MissingZero!12961 (index!54241 lt!659918)))))

(declare-fun b!1522685 () Bool)

(assert (=> b!1522685 (= e!849509 e!849508)))

(assert (=> b!1522685 (= lt!659919 (select (arr!48897 a!2804) (index!54241 lt!659918)))))

(declare-fun c!140545 () Bool)

(assert (=> b!1522685 (= c!140545 (= lt!659919 (select (arr!48897 a!2804) j!70)))))

(assert (= (and d!159541 c!140546) b!1522680))

(assert (= (and d!159541 (not c!140546)) b!1522685))

(assert (= (and b!1522685 c!140545) b!1522683))

(assert (= (and b!1522685 (not c!140545)) b!1522681))

(assert (= (and b!1522681 c!140544) b!1522684))

(assert (= (and b!1522681 (not c!140544)) b!1522682))

(declare-fun m!1405799 () Bool)

(assert (=> d!159541 m!1405799))

(assert (=> d!159541 m!1405657))

(assert (=> d!159541 m!1405675))

(assert (=> d!159541 m!1405675))

(assert (=> d!159541 m!1405657))

(assert (=> d!159541 m!1405677))

(assert (=> d!159541 m!1405685))

(assert (=> b!1522682 m!1405657))

(declare-fun m!1405801 () Bool)

(assert (=> b!1522682 m!1405801))

(declare-fun m!1405803 () Bool)

(assert (=> b!1522685 m!1405803))

(assert (=> b!1522454 d!159541))

(declare-fun b!1522694 () Bool)

(declare-fun e!849517 () Bool)

(declare-fun call!68483 () Bool)

(assert (=> b!1522694 (= e!849517 call!68483)))

(declare-fun b!1522695 () Bool)

(declare-fun e!849516 () Bool)

(assert (=> b!1522695 (= e!849517 e!849516)))

(declare-fun lt!659928 () (_ BitVec 64))

(assert (=> b!1522695 (= lt!659928 (select (arr!48897 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659929 () Unit!50825)

(assert (=> b!1522695 (= lt!659929 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659928 #b00000000000000000000000000000000))))

(assert (=> b!1522695 (arrayContainsKey!0 a!2804 lt!659928 #b00000000000000000000000000000000)))

(declare-fun lt!659927 () Unit!50825)

(assert (=> b!1522695 (= lt!659927 lt!659929)))

(declare-fun res!1040709 () Bool)

(assert (=> b!1522695 (= res!1040709 (= (seekEntryOrOpen!0 (select (arr!48897 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12961 #b00000000000000000000000000000000)))))

(assert (=> b!1522695 (=> (not res!1040709) (not e!849516))))

(declare-fun b!1522696 () Bool)

(declare-fun e!849518 () Bool)

(assert (=> b!1522696 (= e!849518 e!849517)))

(declare-fun c!140549 () Bool)

(assert (=> b!1522696 (= c!140549 (validKeyInArray!0 (select (arr!48897 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68480 () Bool)

(assert (=> bm!68480 (= call!68483 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159559 () Bool)

(declare-fun res!1040710 () Bool)

(assert (=> d!159559 (=> res!1040710 e!849518)))

(assert (=> d!159559 (= res!1040710 (bvsge #b00000000000000000000000000000000 (size!49448 a!2804)))))

(assert (=> d!159559 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!849518)))

(declare-fun b!1522697 () Bool)

(assert (=> b!1522697 (= e!849516 call!68483)))

(assert (= (and d!159559 (not res!1040710)) b!1522696))

(assert (= (and b!1522696 c!140549) b!1522695))

(assert (= (and b!1522696 (not c!140549)) b!1522694))

(assert (= (and b!1522695 res!1040709) b!1522697))

(assert (= (or b!1522697 b!1522694) bm!68480))

(assert (=> b!1522695 m!1405737))

(declare-fun m!1405805 () Bool)

(assert (=> b!1522695 m!1405805))

(declare-fun m!1405807 () Bool)

(assert (=> b!1522695 m!1405807))

(assert (=> b!1522695 m!1405737))

(declare-fun m!1405809 () Bool)

(assert (=> b!1522695 m!1405809))

(assert (=> b!1522696 m!1405737))

(assert (=> b!1522696 m!1405737))

(assert (=> b!1522696 m!1405739))

(declare-fun m!1405811 () Bool)

(assert (=> bm!68480 m!1405811))

(assert (=> b!1522459 d!159559))

(declare-fun b!1522698 () Bool)

(declare-fun e!849523 () Bool)

(declare-fun lt!659930 () SeekEntryResult!12961)

(assert (=> b!1522698 (= e!849523 (bvsge (x!136118 lt!659930) #b01111111111111111111111111111110))))

(declare-fun d!159561 () Bool)

(assert (=> d!159561 e!849523))

(declare-fun c!140552 () Bool)

(assert (=> d!159561 (= c!140552 (and (is-Intermediate!12961 lt!659930) (undefined!13773 lt!659930)))))

(declare-fun e!849521 () SeekEntryResult!12961)

(assert (=> d!159561 (= lt!659930 e!849521)))

(declare-fun c!140550 () Bool)

(assert (=> d!159561 (= c!140550 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659931 () (_ BitVec 64))

(assert (=> d!159561 (= lt!659931 (select (arr!48897 (array!101337 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804))) (toIndex!0 (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159561 (validMask!0 mask!2512)))

(assert (=> d!159561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101337 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804)) mask!2512) lt!659930)))

(declare-fun b!1522699 () Bool)

(assert (=> b!1522699 (and (bvsge (index!54241 lt!659930) #b00000000000000000000000000000000) (bvslt (index!54241 lt!659930) (size!49448 (array!101337 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804)))))))

(declare-fun e!849519 () Bool)

(assert (=> b!1522699 (= e!849519 (= (select (arr!48897 (array!101337 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804))) (index!54241 lt!659930)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522700 () Bool)

(assert (=> b!1522700 (and (bvsge (index!54241 lt!659930) #b00000000000000000000000000000000) (bvslt (index!54241 lt!659930) (size!49448 (array!101337 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804)))))))

(declare-fun res!1040713 () Bool)

(assert (=> b!1522700 (= res!1040713 (= (select (arr!48897 (array!101337 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804))) (index!54241 lt!659930)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522700 (=> res!1040713 e!849519)))

(declare-fun b!1522701 () Bool)

(declare-fun e!849520 () SeekEntryResult!12961)

(assert (=> b!1522701 (= e!849521 e!849520)))

(declare-fun c!140551 () Bool)

(assert (=> b!1522701 (= c!140551 (or (= lt!659931 (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659931 lt!659931) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522702 () Bool)

(declare-fun e!849522 () Bool)

(assert (=> b!1522702 (= e!849523 e!849522)))

(declare-fun res!1040711 () Bool)

(assert (=> b!1522702 (= res!1040711 (and (is-Intermediate!12961 lt!659930) (not (undefined!13773 lt!659930)) (bvslt (x!136118 lt!659930) #b01111111111111111111111111111110) (bvsge (x!136118 lt!659930) #b00000000000000000000000000000000) (bvsge (x!136118 lt!659930) #b00000000000000000000000000000000)))))

(assert (=> b!1522702 (=> (not res!1040711) (not e!849522))))

(declare-fun b!1522703 () Bool)

(assert (=> b!1522703 (= e!849521 (Intermediate!12961 true (toIndex!0 (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522704 () Bool)

(assert (=> b!1522704 (= e!849520 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101337 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804)) mask!2512))))

(declare-fun b!1522705 () Bool)

(assert (=> b!1522705 (= e!849520 (Intermediate!12961 false (toIndex!0 (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522706 () Bool)

(assert (=> b!1522706 (and (bvsge (index!54241 lt!659930) #b00000000000000000000000000000000) (bvslt (index!54241 lt!659930) (size!49448 (array!101337 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804)))))))

(declare-fun res!1040712 () Bool)

(assert (=> b!1522706 (= res!1040712 (= (select (arr!48897 (array!101337 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804))) (index!54241 lt!659930)) (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1522706 (=> res!1040712 e!849519)))

(assert (=> b!1522706 (= e!849522 e!849519)))

(assert (= (and d!159561 c!140550) b!1522703))

(assert (= (and d!159561 (not c!140550)) b!1522701))

(assert (= (and b!1522701 c!140551) b!1522705))

(assert (= (and b!1522701 (not c!140551)) b!1522704))

(assert (= (and d!159561 c!140552) b!1522698))

(assert (= (and d!159561 (not c!140552)) b!1522702))

(assert (= (and b!1522702 res!1040711) b!1522706))

(assert (= (and b!1522706 (not res!1040712)) b!1522700))

(assert (= (and b!1522700 (not res!1040713)) b!1522699))

(declare-fun m!1405813 () Bool)

(assert (=> b!1522699 m!1405813))

(assert (=> b!1522700 m!1405813))

(assert (=> b!1522704 m!1405681))

(declare-fun m!1405815 () Bool)

(assert (=> b!1522704 m!1405815))

(assert (=> b!1522704 m!1405815))

(assert (=> b!1522704 m!1405665))

(declare-fun m!1405817 () Bool)

(assert (=> b!1522704 m!1405817))

(assert (=> b!1522706 m!1405813))

(assert (=> d!159561 m!1405681))

(declare-fun m!1405819 () Bool)

(assert (=> d!159561 m!1405819))

(assert (=> d!159561 m!1405685))

(assert (=> b!1522449 d!159561))

(declare-fun d!159563 () Bool)

(declare-fun lt!659933 () (_ BitVec 32))

(declare-fun lt!659932 () (_ BitVec 32))

(assert (=> d!159563 (= lt!659933 (bvmul (bvxor lt!659932 (bvlshr lt!659932 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159563 (= lt!659932 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159563 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040654 (let ((h!36797 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136120 (bvmul (bvxor h!36797 (bvlshr h!36797 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136120 (bvlshr x!136120 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040654 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040654 #b00000000000000000000000000000000))))))

(assert (=> d!159563 (= (toIndex!0 (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659933 (bvlshr lt!659933 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1522449 d!159563))

(push 1)

(assert (not d!159537))

(assert (not d!159541))

(assert (not d!159527))

(assert (not d!159509))

(assert (not b!1522696))

(assert (not b!1522564))

(assert (not b!1522630))

(assert (not b!1522695))

(assert (not b!1522682))

(assert (not bm!68479))

(assert (not b!1522629))

(assert (not b!1522543))

(assert (not b!1522565))

(assert (not b!1522561))

(assert (not b!1522580))

(assert (not bm!68476))

(assert (not d!159561))

(assert (not bm!68480))

(assert (not b!1522704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

