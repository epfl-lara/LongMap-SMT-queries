; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129348 () Bool)

(assert start!129348)

(declare-fun b!1519600 () Bool)

(declare-fun res!1039509 () Bool)

(declare-fun e!847643 () Bool)

(assert (=> b!1519600 (=> (not res!1039509) (not e!847643))))

(declare-datatypes ((array!101204 0))(
  ( (array!101205 (arr!48839 (Array (_ BitVec 32) (_ BitVec 64))) (size!49389 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101204)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101204 (_ BitVec 32)) Bool)

(assert (=> b!1519600 (= res!1039509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!847645 () Bool)

(declare-fun b!1519601 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13010 0))(
  ( (MissingZero!13010 (index!54435 (_ BitVec 32))) (Found!13010 (index!54436 (_ BitVec 32))) (Intermediate!13010 (undefined!13822 Bool) (index!54437 (_ BitVec 32)) (x!136104 (_ BitVec 32))) (Undefined!13010) (MissingVacant!13010 (index!54438 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101204 (_ BitVec 32)) SeekEntryResult!13010)

(assert (=> b!1519601 (= e!847645 (= (seekEntry!0 (select (arr!48839 a!2804) j!70) a!2804 mask!2512) (Found!13010 j!70)))))

(declare-fun b!1519602 () Bool)

(declare-fun res!1039513 () Bool)

(declare-fun e!847642 () Bool)

(assert (=> b!1519602 (=> (not res!1039513) (not e!847642))))

(declare-fun lt!658717 () SeekEntryResult!13010)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101204 (_ BitVec 32)) SeekEntryResult!13010)

(assert (=> b!1519602 (= res!1039513 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48839 a!2804) j!70) a!2804 mask!2512) lt!658717))))

(declare-fun b!1519603 () Bool)

(declare-fun res!1039507 () Bool)

(assert (=> b!1519603 (=> (not res!1039507) (not e!847643))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519603 (= res!1039507 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49389 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49389 a!2804))))))

(declare-fun b!1519604 () Bool)

(declare-fun res!1039504 () Bool)

(assert (=> b!1519604 (=> (not res!1039504) (not e!847643))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519604 (= res!1039504 (validKeyInArray!0 (select (arr!48839 a!2804) i!961)))))

(declare-fun b!1519605 () Bool)

(declare-fun res!1039503 () Bool)

(assert (=> b!1519605 (=> (not res!1039503) (not e!847643))))

(assert (=> b!1519605 (= res!1039503 (and (= (size!49389 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49389 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49389 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519606 () Bool)

(assert (=> b!1519606 (= e!847643 e!847642)))

(declare-fun res!1039506 () Bool)

(assert (=> b!1519606 (=> (not res!1039506) (not e!847642))))

(declare-fun lt!658715 () SeekEntryResult!13010)

(assert (=> b!1519606 (= res!1039506 (= lt!658715 lt!658717))))

(assert (=> b!1519606 (= lt!658717 (Intermediate!13010 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519606 (= lt!658715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48839 a!2804) j!70) mask!2512) (select (arr!48839 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519607 () Bool)

(declare-fun res!1039511 () Bool)

(assert (=> b!1519607 (=> (not res!1039511) (not e!847643))))

(assert (=> b!1519607 (= res!1039511 (validKeyInArray!0 (select (arr!48839 a!2804) j!70)))))

(declare-fun res!1039510 () Bool)

(assert (=> start!129348 (=> (not res!1039510) (not e!847643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129348 (= res!1039510 (validMask!0 mask!2512))))

(assert (=> start!129348 e!847643))

(assert (=> start!129348 true))

(declare-fun array_inv!37867 (array!101204) Bool)

(assert (=> start!129348 (array_inv!37867 a!2804)))

(declare-fun b!1519608 () Bool)

(assert (=> b!1519608 (= e!847642 (not (or (not (= (select (arr!48839 a!2804) j!70) (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (= index!487 resIndex!21))))))

(assert (=> b!1519608 e!847645))

(declare-fun res!1039505 () Bool)

(assert (=> b!1519608 (=> (not res!1039505) (not e!847645))))

(assert (=> b!1519608 (= res!1039505 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50888 0))(
  ( (Unit!50889) )
))
(declare-fun lt!658716 () Unit!50888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50888)

(assert (=> b!1519608 (= lt!658716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519609 () Bool)

(declare-fun res!1039512 () Bool)

(assert (=> b!1519609 (=> (not res!1039512) (not e!847642))))

(assert (=> b!1519609 (= res!1039512 (= lt!658715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101205 (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804)) mask!2512)))))

(declare-fun b!1519610 () Bool)

(declare-fun res!1039508 () Bool)

(assert (=> b!1519610 (=> (not res!1039508) (not e!847643))))

(declare-datatypes ((List!35322 0))(
  ( (Nil!35319) (Cons!35318 (h!36730 (_ BitVec 64)) (t!50016 List!35322)) )
))
(declare-fun arrayNoDuplicates!0 (array!101204 (_ BitVec 32) List!35322) Bool)

(assert (=> b!1519610 (= res!1039508 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35319))))

(assert (= (and start!129348 res!1039510) b!1519605))

(assert (= (and b!1519605 res!1039503) b!1519604))

(assert (= (and b!1519604 res!1039504) b!1519607))

(assert (= (and b!1519607 res!1039511) b!1519600))

(assert (= (and b!1519600 res!1039509) b!1519610))

(assert (= (and b!1519610 res!1039508) b!1519603))

(assert (= (and b!1519603 res!1039507) b!1519606))

(assert (= (and b!1519606 res!1039506) b!1519602))

(assert (= (and b!1519602 res!1039513) b!1519609))

(assert (= (and b!1519609 res!1039512) b!1519608))

(assert (= (and b!1519608 res!1039505) b!1519601))

(declare-fun m!1403023 () Bool)

(assert (=> b!1519604 m!1403023))

(assert (=> b!1519604 m!1403023))

(declare-fun m!1403025 () Bool)

(assert (=> b!1519604 m!1403025))

(declare-fun m!1403027 () Bool)

(assert (=> b!1519607 m!1403027))

(assert (=> b!1519607 m!1403027))

(declare-fun m!1403029 () Bool)

(assert (=> b!1519607 m!1403029))

(declare-fun m!1403031 () Bool)

(assert (=> start!129348 m!1403031))

(declare-fun m!1403033 () Bool)

(assert (=> start!129348 m!1403033))

(assert (=> b!1519608 m!1403027))

(declare-fun m!1403035 () Bool)

(assert (=> b!1519608 m!1403035))

(declare-fun m!1403037 () Bool)

(assert (=> b!1519608 m!1403037))

(declare-fun m!1403039 () Bool)

(assert (=> b!1519608 m!1403039))

(declare-fun m!1403041 () Bool)

(assert (=> b!1519608 m!1403041))

(assert (=> b!1519609 m!1403037))

(assert (=> b!1519609 m!1403039))

(assert (=> b!1519609 m!1403039))

(declare-fun m!1403043 () Bool)

(assert (=> b!1519609 m!1403043))

(assert (=> b!1519609 m!1403043))

(assert (=> b!1519609 m!1403039))

(declare-fun m!1403045 () Bool)

(assert (=> b!1519609 m!1403045))

(declare-fun m!1403047 () Bool)

(assert (=> b!1519610 m!1403047))

(declare-fun m!1403049 () Bool)

(assert (=> b!1519600 m!1403049))

(assert (=> b!1519602 m!1403027))

(assert (=> b!1519602 m!1403027))

(declare-fun m!1403051 () Bool)

(assert (=> b!1519602 m!1403051))

(assert (=> b!1519601 m!1403027))

(assert (=> b!1519601 m!1403027))

(declare-fun m!1403053 () Bool)

(assert (=> b!1519601 m!1403053))

(assert (=> b!1519606 m!1403027))

(assert (=> b!1519606 m!1403027))

(declare-fun m!1403055 () Bool)

(assert (=> b!1519606 m!1403055))

(assert (=> b!1519606 m!1403055))

(assert (=> b!1519606 m!1403027))

(declare-fun m!1403057 () Bool)

(assert (=> b!1519606 m!1403057))

(push 1)

(assert (not b!1519608))

(assert (not b!1519609))

(assert (not b!1519606))

(assert (not b!1519610))

(assert (not b!1519604))

(assert (not b!1519600))

(assert (not b!1519607))

(assert (not start!129348))

(assert (not b!1519601))

(assert (not b!1519602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158705 () Bool)

(declare-fun lt!658751 () SeekEntryResult!13010)

(assert (=> d!158705 (and (or (is-MissingVacant!13010 lt!658751) (not (is-Found!13010 lt!658751)) (and (bvsge (index!54436 lt!658751) #b00000000000000000000000000000000) (bvslt (index!54436 lt!658751) (size!49389 a!2804)))) (not (is-MissingVacant!13010 lt!658751)) (or (not (is-Found!13010 lt!658751)) (= (select (arr!48839 a!2804) (index!54436 lt!658751)) (select (arr!48839 a!2804) j!70))))))

(declare-fun e!847687 () SeekEntryResult!13010)

(assert (=> d!158705 (= lt!658751 e!847687)))

(declare-fun c!139604 () Bool)

(declare-fun lt!658749 () SeekEntryResult!13010)

(assert (=> d!158705 (= c!139604 (and (is-Intermediate!13010 lt!658749) (undefined!13822 lt!658749)))))

(assert (=> d!158705 (= lt!658749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48839 a!2804) j!70) mask!2512) (select (arr!48839 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158705 (validMask!0 mask!2512)))

(assert (=> d!158705 (= (seekEntry!0 (select (arr!48839 a!2804) j!70) a!2804 mask!2512) lt!658751)))

(declare-fun b!1519707 () Bool)

(declare-fun e!847688 () SeekEntryResult!13010)

(assert (=> b!1519707 (= e!847688 (Found!13010 (index!54437 lt!658749)))))

(declare-fun b!1519708 () Bool)

(assert (=> b!1519708 (= e!847687 e!847688)))

(declare-fun lt!658748 () (_ BitVec 64))

(assert (=> b!1519708 (= lt!658748 (select (arr!48839 a!2804) (index!54437 lt!658749)))))

(declare-fun c!139602 () Bool)

(assert (=> b!1519708 (= c!139602 (= lt!658748 (select (arr!48839 a!2804) j!70)))))

(declare-fun b!1519709 () Bool)

(assert (=> b!1519709 (= e!847687 Undefined!13010)))

(declare-fun b!1519710 () Bool)

(declare-fun e!847686 () SeekEntryResult!13010)

(declare-fun lt!658750 () SeekEntryResult!13010)

(assert (=> b!1519710 (= e!847686 (ite (is-MissingVacant!13010 lt!658750) (MissingZero!13010 (index!54438 lt!658750)) lt!658750))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101204 (_ BitVec 32)) SeekEntryResult!13010)

(assert (=> b!1519710 (= lt!658750 (seekKeyOrZeroReturnVacant!0 (x!136104 lt!658749) (index!54437 lt!658749) (index!54437 lt!658749) (select (arr!48839 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519711 () Bool)

(declare-fun c!139603 () Bool)

(assert (=> b!1519711 (= c!139603 (= lt!658748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519711 (= e!847688 e!847686)))

(declare-fun b!1519712 () Bool)

(assert (=> b!1519712 (= e!847686 (MissingZero!13010 (index!54437 lt!658749)))))

(assert (= (and d!158705 c!139604) b!1519709))

(assert (= (and d!158705 (not c!139604)) b!1519708))

(assert (= (and b!1519708 c!139602) b!1519707))

(assert (= (and b!1519708 (not c!139602)) b!1519711))

(assert (= (and b!1519711 c!139603) b!1519712))

(assert (= (and b!1519711 (not c!139603)) b!1519710))

(declare-fun m!1403131 () Bool)

(assert (=> d!158705 m!1403131))

(assert (=> d!158705 m!1403027))

(assert (=> d!158705 m!1403055))

(assert (=> d!158705 m!1403055))

(assert (=> d!158705 m!1403027))

(assert (=> d!158705 m!1403057))

(assert (=> d!158705 m!1403031))

(declare-fun m!1403133 () Bool)

(assert (=> b!1519708 m!1403133))

(assert (=> b!1519710 m!1403027))

(declare-fun m!1403135 () Bool)

(assert (=> b!1519710 m!1403135))

(assert (=> b!1519601 d!158705))

(declare-fun b!1519762 () Bool)

(declare-fun lt!658777 () SeekEntryResult!13010)

(assert (=> b!1519762 (and (bvsge (index!54437 lt!658777) #b00000000000000000000000000000000) (bvslt (index!54437 lt!658777) (size!49389 a!2804)))))

(declare-fun res!1039608 () Bool)

(assert (=> b!1519762 (= res!1039608 (= (select (arr!48839 a!2804) (index!54437 lt!658777)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!847724 () Bool)

(assert (=> b!1519762 (=> res!1039608 e!847724)))

(declare-fun b!1519763 () Bool)

(assert (=> b!1519763 (and (bvsge (index!54437 lt!658777) #b00000000000000000000000000000000) (bvslt (index!54437 lt!658777) (size!49389 a!2804)))))

(assert (=> b!1519763 (= e!847724 (= (select (arr!48839 a!2804) (index!54437 lt!658777)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!158709 () Bool)

(declare-fun e!847725 () Bool)

(assert (=> d!158709 e!847725))

(declare-fun c!139621 () Bool)

(assert (=> d!158709 (= c!139621 (and (is-Intermediate!13010 lt!658777) (undefined!13822 lt!658777)))))

(declare-fun e!847723 () SeekEntryResult!13010)

(assert (=> d!158709 (= lt!658777 e!847723)))

(declare-fun c!139620 () Bool)

(assert (=> d!158709 (= c!139620 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!658776 () (_ BitVec 64))

(assert (=> d!158709 (= lt!658776 (select (arr!48839 a!2804) (toIndex!0 (select (arr!48839 a!2804) j!70) mask!2512)))))

(assert (=> d!158709 (validMask!0 mask!2512)))

(assert (=> d!158709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48839 a!2804) j!70) mask!2512) (select (arr!48839 a!2804) j!70) a!2804 mask!2512) lt!658777)))

(declare-fun b!1519764 () Bool)

(assert (=> b!1519764 (= e!847723 (Intermediate!13010 true (toIndex!0 (select (arr!48839 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun e!847721 () SeekEntryResult!13010)

(declare-fun b!1519765 () Bool)

(assert (=> b!1519765 (= e!847721 (Intermediate!13010 false (toIndex!0 (select (arr!48839 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519766 () Bool)

(assert (=> b!1519766 (= e!847725 (bvsge (x!136104 lt!658777) #b01111111111111111111111111111110))))

(declare-fun b!1519767 () Bool)

(declare-fun e!847722 () Bool)

(assert (=> b!1519767 (= e!847725 e!847722)))

(declare-fun res!1039610 () Bool)

(assert (=> b!1519767 (= res!1039610 (and (is-Intermediate!13010 lt!658777) (not (undefined!13822 lt!658777)) (bvslt (x!136104 lt!658777) #b01111111111111111111111111111110) (bvsge (x!136104 lt!658777) #b00000000000000000000000000000000) (bvsge (x!136104 lt!658777) #b00000000000000000000000000000000)))))

(assert (=> b!1519767 (=> (not res!1039610) (not e!847722))))

(declare-fun b!1519768 () Bool)

(assert (=> b!1519768 (= e!847723 e!847721)))

(declare-fun c!139619 () Bool)

(assert (=> b!1519768 (= c!139619 (or (= lt!658776 (select (arr!48839 a!2804) j!70)) (= (bvadd lt!658776 lt!658776) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1519769 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519769 (= e!847721 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48839 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48839 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519770 () Bool)

(assert (=> b!1519770 (and (bvsge (index!54437 lt!658777) #b00000000000000000000000000000000) (bvslt (index!54437 lt!658777) (size!49389 a!2804)))))

(declare-fun res!1039609 () Bool)

(assert (=> b!1519770 (= res!1039609 (= (select (arr!48839 a!2804) (index!54437 lt!658777)) (select (arr!48839 a!2804) j!70)))))

(assert (=> b!1519770 (=> res!1039609 e!847724)))

(assert (=> b!1519770 (= e!847722 e!847724)))

(assert (= (and d!158709 c!139620) b!1519764))

(assert (= (and d!158709 (not c!139620)) b!1519768))

(assert (= (and b!1519768 c!139619) b!1519765))

(assert (= (and b!1519768 (not c!139619)) b!1519769))

(assert (= (and d!158709 c!139621) b!1519766))

(assert (= (and d!158709 (not c!139621)) b!1519767))

(assert (= (and b!1519767 res!1039610) b!1519770))

(assert (= (and b!1519770 (not res!1039609)) b!1519762))

(assert (= (and b!1519762 (not res!1039608)) b!1519763))

(declare-fun m!1403155 () Bool)

(assert (=> b!1519770 m!1403155))

(assert (=> b!1519769 m!1403055))

(declare-fun m!1403157 () Bool)

(assert (=> b!1519769 m!1403157))

(assert (=> b!1519769 m!1403157))

(assert (=> b!1519769 m!1403027))

(declare-fun m!1403159 () Bool)

(assert (=> b!1519769 m!1403159))

(assert (=> b!1519763 m!1403155))

(assert (=> b!1519762 m!1403155))

(assert (=> d!158709 m!1403055))

(declare-fun m!1403161 () Bool)

(assert (=> d!158709 m!1403161))

(assert (=> d!158709 m!1403031))

(assert (=> b!1519606 d!158709))

(declare-fun d!158725 () Bool)

(declare-fun lt!658789 () (_ BitVec 32))

(declare-fun lt!658788 () (_ BitVec 32))

(assert (=> d!158725 (= lt!658789 (bvmul (bvxor lt!658788 (bvlshr lt!658788 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158725 (= lt!658788 ((_ extract 31 0) (bvand (bvxor (select (arr!48839 a!2804) j!70) (bvlshr (select (arr!48839 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158725 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039611 (let ((h!36734 ((_ extract 31 0) (bvand (bvxor (select (arr!48839 a!2804) j!70) (bvlshr (select (arr!48839 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136110 (bvmul (bvxor h!36734 (bvlshr h!36734 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136110 (bvlshr x!136110 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039611 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039611 #b00000000000000000000000000000000))))))

(assert (=> d!158725 (= (toIndex!0 (select (arr!48839 a!2804) j!70) mask!2512) (bvand (bvxor lt!658789 (bvlshr lt!658789 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1519606 d!158725))

(declare-fun d!158731 () Bool)

(declare-fun res!1039634 () Bool)

(declare-fun e!847764 () Bool)

(assert (=> d!158731 (=> res!1039634 e!847764)))

(assert (=> d!158731 (= res!1039634 (bvsge j!70 (size!49389 a!2804)))))

(assert (=> d!158731 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!847764)))

(declare-fun b!1519830 () Bool)

(declare-fun e!847763 () Bool)

(declare-fun call!68319 () Bool)

(assert (=> b!1519830 (= e!847763 call!68319)))

(declare-fun bm!68316 () Bool)

(assert (=> bm!68316 (= call!68319 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1519831 () Bool)

(declare-fun e!847762 () Bool)

(assert (=> b!1519831 (= e!847764 e!847762)))

(declare-fun c!139641 () Bool)

(assert (=> b!1519831 (= c!139641 (validKeyInArray!0 (select (arr!48839 a!2804) j!70)))))

(declare-fun b!1519832 () Bool)

(assert (=> b!1519832 (= e!847762 e!847763)))

(declare-fun lt!658806 () (_ BitVec 64))

(assert (=> b!1519832 (= lt!658806 (select (arr!48839 a!2804) j!70))))

(declare-fun lt!658805 () Unit!50888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101204 (_ BitVec 64) (_ BitVec 32)) Unit!50888)

(assert (=> b!1519832 (= lt!658805 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658806 j!70))))

(declare-fun arrayContainsKey!0 (array!101204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1519832 (arrayContainsKey!0 a!2804 lt!658806 #b00000000000000000000000000000000)))

(declare-fun lt!658804 () Unit!50888)

(assert (=> b!1519832 (= lt!658804 lt!658805)))

(declare-fun res!1039633 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101204 (_ BitVec 32)) SeekEntryResult!13010)

(assert (=> b!1519832 (= res!1039633 (= (seekEntryOrOpen!0 (select (arr!48839 a!2804) j!70) a!2804 mask!2512) (Found!13010 j!70)))))

(assert (=> b!1519832 (=> (not res!1039633) (not e!847763))))

(declare-fun b!1519833 () Bool)

(assert (=> b!1519833 (= e!847762 call!68319)))

(assert (= (and d!158731 (not res!1039634)) b!1519831))

(assert (= (and b!1519831 c!139641) b!1519832))

(assert (= (and b!1519831 (not c!139641)) b!1519833))

(assert (= (and b!1519832 res!1039633) b!1519830))

(assert (= (or b!1519830 b!1519833) bm!68316))

(declare-fun m!1403187 () Bool)

(assert (=> bm!68316 m!1403187))

(assert (=> b!1519831 m!1403027))

(assert (=> b!1519831 m!1403027))

(assert (=> b!1519831 m!1403029))

(assert (=> b!1519832 m!1403027))

(declare-fun m!1403189 () Bool)

(assert (=> b!1519832 m!1403189))

(declare-fun m!1403191 () Bool)

(assert (=> b!1519832 m!1403191))

(assert (=> b!1519832 m!1403027))

(declare-fun m!1403193 () Bool)

(assert (=> b!1519832 m!1403193))

(assert (=> b!1519608 d!158731))

(declare-fun d!158735 () Bool)

(assert (=> d!158735 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!658817 () Unit!50888)

(declare-fun choose!38 (array!101204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50888)

(assert (=> d!158735 (= lt!658817 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158735 (validMask!0 mask!2512)))

(assert (=> d!158735 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!658817)))

(declare-fun bs!43616 () Bool)

(assert (= bs!43616 d!158735))

(assert (=> bs!43616 m!1403041))

(declare-fun m!1403211 () Bool)

(assert (=> bs!43616 m!1403211))

(assert (=> bs!43616 m!1403031))

(assert (=> b!1519608 d!158735))

(declare-fun d!158741 () Bool)

(assert (=> d!158741 (= (validKeyInArray!0 (select (arr!48839 a!2804) j!70)) (and (not (= (select (arr!48839 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48839 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519607 d!158741))

(declare-fun b!1519866 () Bool)

(declare-fun lt!658819 () SeekEntryResult!13010)

(assert (=> b!1519866 (and (bvsge (index!54437 lt!658819) #b00000000000000000000000000000000) (bvslt (index!54437 lt!658819) (size!49389 a!2804)))))

(declare-fun res!1039646 () Bool)

(assert (=> b!1519866 (= res!1039646 (= (select (arr!48839 a!2804) (index!54437 lt!658819)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!847788 () Bool)

(assert (=> b!1519866 (=> res!1039646 e!847788)))

(declare-fun b!1519867 () Bool)

(assert (=> b!1519867 (and (bvsge (index!54437 lt!658819) #b00000000000000000000000000000000) (bvslt (index!54437 lt!658819) (size!49389 a!2804)))))

(assert (=> b!1519867 (= e!847788 (= (select (arr!48839 a!2804) (index!54437 lt!658819)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!158745 () Bool)

(declare-fun e!847789 () Bool)

(assert (=> d!158745 e!847789))

(declare-fun c!139655 () Bool)

(assert (=> d!158745 (= c!139655 (and (is-Intermediate!13010 lt!658819) (undefined!13822 lt!658819)))))

(declare-fun e!847787 () SeekEntryResult!13010)

(assert (=> d!158745 (= lt!658819 e!847787)))

(declare-fun c!139654 () Bool)

(assert (=> d!158745 (= c!139654 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!658818 () (_ BitVec 64))

(assert (=> d!158745 (= lt!658818 (select (arr!48839 a!2804) index!487))))

(assert (=> d!158745 (validMask!0 mask!2512)))

(assert (=> d!158745 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48839 a!2804) j!70) a!2804 mask!2512) lt!658819)))

(declare-fun b!1519868 () Bool)

(assert (=> b!1519868 (= e!847787 (Intermediate!13010 true index!487 x!534))))

(declare-fun b!1519869 () Bool)

(declare-fun e!847785 () SeekEntryResult!13010)

(assert (=> b!1519869 (= e!847785 (Intermediate!13010 false index!487 x!534))))

(declare-fun b!1519870 () Bool)

(assert (=> b!1519870 (= e!847789 (bvsge (x!136104 lt!658819) #b01111111111111111111111111111110))))

(declare-fun b!1519871 () Bool)

(declare-fun e!847786 () Bool)

(assert (=> b!1519871 (= e!847789 e!847786)))

(declare-fun res!1039648 () Bool)

(assert (=> b!1519871 (= res!1039648 (and (is-Intermediate!13010 lt!658819) (not (undefined!13822 lt!658819)) (bvslt (x!136104 lt!658819) #b01111111111111111111111111111110) (bvsge (x!136104 lt!658819) #b00000000000000000000000000000000) (bvsge (x!136104 lt!658819) x!534)))))

(assert (=> b!1519871 (=> (not res!1039648) (not e!847786))))

(declare-fun b!1519872 () Bool)

(assert (=> b!1519872 (= e!847787 e!847785)))

(declare-fun c!139653 () Bool)

(assert (=> b!1519872 (= c!139653 (or (= lt!658818 (select (arr!48839 a!2804) j!70)) (= (bvadd lt!658818 lt!658818) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1519873 () Bool)

(assert (=> b!1519873 (= e!847785 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48839 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519874 () Bool)

(assert (=> b!1519874 (and (bvsge (index!54437 lt!658819) #b00000000000000000000000000000000) (bvslt (index!54437 lt!658819) (size!49389 a!2804)))))

(declare-fun res!1039647 () Bool)

(assert (=> b!1519874 (= res!1039647 (= (select (arr!48839 a!2804) (index!54437 lt!658819)) (select (arr!48839 a!2804) j!70)))))

(assert (=> b!1519874 (=> res!1039647 e!847788)))

(assert (=> b!1519874 (= e!847786 e!847788)))

(assert (= (and d!158745 c!139654) b!1519868))

(assert (= (and d!158745 (not c!139654)) b!1519872))

(assert (= (and b!1519872 c!139653) b!1519869))

(assert (= (and b!1519872 (not c!139653)) b!1519873))

(assert (= (and d!158745 c!139655) b!1519870))

(assert (= (and d!158745 (not c!139655)) b!1519871))

(assert (= (and b!1519871 res!1039648) b!1519874))

(assert (= (and b!1519874 (not res!1039647)) b!1519866))

(assert (= (and b!1519866 (not res!1039646)) b!1519867))

(declare-fun m!1403219 () Bool)

(assert (=> b!1519874 m!1403219))

(declare-fun m!1403221 () Bool)

(assert (=> b!1519873 m!1403221))

(assert (=> b!1519873 m!1403221))

(assert (=> b!1519873 m!1403027))

(declare-fun m!1403223 () Bool)

(assert (=> b!1519873 m!1403223))

(assert (=> b!1519867 m!1403219))

(assert (=> b!1519866 m!1403219))

(declare-fun m!1403225 () Bool)

(assert (=> d!158745 m!1403225))

(assert (=> d!158745 m!1403031))

(assert (=> b!1519602 d!158745))

(declare-fun b!1519875 () Bool)

(declare-fun lt!658821 () SeekEntryResult!13010)

(assert (=> b!1519875 (and (bvsge (index!54437 lt!658821) #b00000000000000000000000000000000) (bvslt (index!54437 lt!658821) (size!49389 (array!101205 (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804)))))))

(declare-fun res!1039649 () Bool)

(assert (=> b!1519875 (= res!1039649 (= (select (arr!48839 (array!101205 (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804))) (index!54437 lt!658821)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!847793 () Bool)

(assert (=> b!1519875 (=> res!1039649 e!847793)))

(declare-fun b!1519876 () Bool)

(assert (=> b!1519876 (and (bvsge (index!54437 lt!658821) #b00000000000000000000000000000000) (bvslt (index!54437 lt!658821) (size!49389 (array!101205 (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804)))))))

(assert (=> b!1519876 (= e!847793 (= (select (arr!48839 (array!101205 (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804))) (index!54437 lt!658821)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!158747 () Bool)

(declare-fun e!847794 () Bool)

(assert (=> d!158747 e!847794))

(declare-fun c!139658 () Bool)

(assert (=> d!158747 (= c!139658 (and (is-Intermediate!13010 lt!658821) (undefined!13822 lt!658821)))))

(declare-fun e!847792 () SeekEntryResult!13010)

(assert (=> d!158747 (= lt!658821 e!847792)))

(declare-fun c!139657 () Bool)

(assert (=> d!158747 (= c!139657 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!658820 () (_ BitVec 64))

(assert (=> d!158747 (= lt!658820 (select (arr!48839 (array!101205 (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804))) (toIndex!0 (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158747 (validMask!0 mask!2512)))

(assert (=> d!158747 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101205 (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804)) mask!2512) lt!658821)))

(declare-fun b!1519877 () Bool)

(assert (=> b!1519877 (= e!847792 (Intermediate!13010 true (toIndex!0 (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun e!847790 () SeekEntryResult!13010)

(declare-fun b!1519878 () Bool)

(assert (=> b!1519878 (= e!847790 (Intermediate!13010 false (toIndex!0 (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519879 () Bool)

(assert (=> b!1519879 (= e!847794 (bvsge (x!136104 lt!658821) #b01111111111111111111111111111110))))

(declare-fun b!1519880 () Bool)

(declare-fun e!847791 () Bool)

(assert (=> b!1519880 (= e!847794 e!847791)))

(declare-fun res!1039651 () Bool)

(assert (=> b!1519880 (= res!1039651 (and (is-Intermediate!13010 lt!658821) (not (undefined!13822 lt!658821)) (bvslt (x!136104 lt!658821) #b01111111111111111111111111111110) (bvsge (x!136104 lt!658821) #b00000000000000000000000000000000) (bvsge (x!136104 lt!658821) #b00000000000000000000000000000000)))))

(assert (=> b!1519880 (=> (not res!1039651) (not e!847791))))

(declare-fun b!1519881 () Bool)

(assert (=> b!1519881 (= e!847792 e!847790)))

(declare-fun c!139656 () Bool)

(assert (=> b!1519881 (= c!139656 (or (= lt!658820 (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!658820 lt!658820) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1519882 () Bool)

(assert (=> b!1519882 (= e!847790 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101205 (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804)) mask!2512))))

(declare-fun b!1519883 () Bool)

(assert (=> b!1519883 (and (bvsge (index!54437 lt!658821) #b00000000000000000000000000000000) (bvslt (index!54437 lt!658821) (size!49389 (array!101205 (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804)))))))

(declare-fun res!1039650 () Bool)

(assert (=> b!1519883 (= res!1039650 (= (select (arr!48839 (array!101205 (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804))) (index!54437 lt!658821)) (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1519883 (=> res!1039650 e!847793)))

(assert (=> b!1519883 (= e!847791 e!847793)))

(assert (= (and d!158747 c!139657) b!1519877))

(assert (= (and d!158747 (not c!139657)) b!1519881))

(assert (= (and b!1519881 c!139656) b!1519878))

(assert (= (and b!1519881 (not c!139656)) b!1519882))

(assert (= (and d!158747 c!139658) b!1519879))

(assert (= (and d!158747 (not c!139658)) b!1519880))

(assert (= (and b!1519880 res!1039651) b!1519883))

(assert (= (and b!1519883 (not res!1039650)) b!1519875))

(assert (= (and b!1519875 (not res!1039649)) b!1519876))

(declare-fun m!1403227 () Bool)

(assert (=> b!1519883 m!1403227))

(assert (=> b!1519882 m!1403043))

(declare-fun m!1403229 () Bool)

(assert (=> b!1519882 m!1403229))

(assert (=> b!1519882 m!1403229))

(assert (=> b!1519882 m!1403039))

(declare-fun m!1403231 () Bool)

(assert (=> b!1519882 m!1403231))

(assert (=> b!1519876 m!1403227))

(assert (=> b!1519875 m!1403227))

(assert (=> d!158747 m!1403043))

(declare-fun m!1403233 () Bool)

(assert (=> d!158747 m!1403233))

(assert (=> d!158747 m!1403031))

(assert (=> b!1519609 d!158747))

(declare-fun d!158749 () Bool)

(declare-fun lt!658823 () (_ BitVec 32))

(declare-fun lt!658822 () (_ BitVec 32))

(assert (=> d!158749 (= lt!658823 (bvmul (bvxor lt!658822 (bvlshr lt!658822 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158749 (= lt!658822 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158749 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039611 (let ((h!36734 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136110 (bvmul (bvxor h!36734 (bvlshr h!36734 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136110 (bvlshr x!136110 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039611 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039611 #b00000000000000000000000000000000))))))

(assert (=> d!158749 (= (toIndex!0 (select (store (arr!48839 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!658823 (bvlshr lt!658823 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1519609 d!158749))

(declare-fun d!158751 () Bool)

(assert (=> d!158751 (= (validKeyInArray!0 (select (arr!48839 a!2804) i!961)) (and (not (= (select (arr!48839 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48839 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519604 d!158751))

(declare-fun d!158753 () Bool)

(assert (=> d!158753 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129348 d!158753))

(declare-fun d!158763 () Bool)

(assert (=> d!158763 (= (array_inv!37867 a!2804) (bvsge (size!49389 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129348 d!158763))

(declare-fun b!1519919 () Bool)

(declare-fun e!847820 () Bool)

(declare-fun call!68329 () Bool)

(assert (=> b!1519919 (= e!847820 call!68329)))

(declare-fun b!1519920 () Bool)

(declare-fun e!847822 () Bool)

(assert (=> b!1519920 (= e!847822 e!847820)))

(declare-fun c!139668 () Bool)

(assert (=> b!1519920 (= c!139668 (validKeyInArray!0 (select (arr!48839 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158765 () Bool)

(declare-fun res!1039669 () Bool)

(declare-fun e!847823 () Bool)

(assert (=> d!158765 (=> res!1039669 e!847823)))

(assert (=> d!158765 (= res!1039669 (bvsge #b00000000000000000000000000000000 (size!49389 a!2804)))))

(assert (=> d!158765 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35319) e!847823)))

(declare-fun b!1519921 () Bool)

(assert (=> b!1519921 (= e!847823 e!847822)))

(declare-fun res!1039670 () Bool)

(assert (=> b!1519921 (=> (not res!1039670) (not e!847822))))

(declare-fun e!847821 () Bool)

(assert (=> b!1519921 (= res!1039670 (not e!847821))))

(declare-fun res!1039671 () Bool)

(assert (=> b!1519921 (=> (not res!1039671) (not e!847821))))

(assert (=> b!1519921 (= res!1039671 (validKeyInArray!0 (select (arr!48839 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519922 () Bool)

(declare-fun contains!9978 (List!35322 (_ BitVec 64)) Bool)

(assert (=> b!1519922 (= e!847821 (contains!9978 Nil!35319 (select (arr!48839 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68326 () Bool)

(assert (=> bm!68326 (= call!68329 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139668 (Cons!35318 (select (arr!48839 a!2804) #b00000000000000000000000000000000) Nil!35319) Nil!35319)))))

(declare-fun b!1519923 () Bool)

(assert (=> b!1519923 (= e!847820 call!68329)))

(assert (= (and d!158765 (not res!1039669)) b!1519921))

(assert (= (and b!1519921 res!1039671) b!1519922))

(assert (= (and b!1519921 res!1039670) b!1519920))

(assert (= (and b!1519920 c!139668) b!1519919))

(assert (= (and b!1519920 (not c!139668)) b!1519923))

(assert (= (or b!1519919 b!1519923) bm!68326))

(declare-fun m!1403261 () Bool)

(assert (=> b!1519920 m!1403261))

(assert (=> b!1519920 m!1403261))

(declare-fun m!1403263 () Bool)

(assert (=> b!1519920 m!1403263))

(assert (=> b!1519921 m!1403261))

(assert (=> b!1519921 m!1403261))

(assert (=> b!1519921 m!1403263))

(assert (=> b!1519922 m!1403261))

(assert (=> b!1519922 m!1403261))

(declare-fun m!1403265 () Bool)

(assert (=> b!1519922 m!1403265))

(assert (=> bm!68326 m!1403261))

(declare-fun m!1403267 () Bool)

(assert (=> bm!68326 m!1403267))

(assert (=> b!1519610 d!158765))

(declare-fun d!158773 () Bool)

(declare-fun res!1039673 () Bool)

(declare-fun e!847826 () Bool)

(assert (=> d!158773 (=> res!1039673 e!847826)))

(assert (=> d!158773 (= res!1039673 (bvsge #b00000000000000000000000000000000 (size!49389 a!2804)))))

(assert (=> d!158773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!847826)))

(declare-fun b!1519924 () Bool)

(declare-fun e!847825 () Bool)

(declare-fun call!68330 () Bool)

(assert (=> b!1519924 (= e!847825 call!68330)))

(declare-fun bm!68327 () Bool)

(assert (=> bm!68327 (= call!68330 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1519925 () Bool)

(declare-fun e!847824 () Bool)

(assert (=> b!1519925 (= e!847826 e!847824)))

(declare-fun c!139669 () Bool)

(assert (=> b!1519925 (= c!139669 (validKeyInArray!0 (select (arr!48839 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519926 () Bool)

(assert (=> b!1519926 (= e!847824 e!847825)))

(declare-fun lt!658851 () (_ BitVec 64))

(assert (=> b!1519926 (= lt!658851 (select (arr!48839 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!658850 () Unit!50888)

(assert (=> b!1519926 (= lt!658850 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658851 #b00000000000000000000000000000000))))

(assert (=> b!1519926 (arrayContainsKey!0 a!2804 lt!658851 #b00000000000000000000000000000000)))

(declare-fun lt!658849 () Unit!50888)

(assert (=> b!1519926 (= lt!658849 lt!658850)))

(declare-fun res!1039672 () Bool)

(assert (=> b!1519926 (= res!1039672 (= (seekEntryOrOpen!0 (select (arr!48839 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13010 #b00000000000000000000000000000000)))))

(assert (=> b!1519926 (=> (not res!1039672) (not e!847825))))

(declare-fun b!1519927 () Bool)

(assert (=> b!1519927 (= e!847824 call!68330)))

(assert (= (and d!158773 (not res!1039673)) b!1519925))

(assert (= (and b!1519925 c!139669) b!1519926))

(assert (= (and b!1519925 (not c!139669)) b!1519927))

(assert (= (and b!1519926 res!1039672) b!1519924))

(assert (= (or b!1519924 b!1519927) bm!68327))

(declare-fun m!1403269 () Bool)

(assert (=> bm!68327 m!1403269))

(assert (=> b!1519925 m!1403261))

(assert (=> b!1519925 m!1403261))

(assert (=> b!1519925 m!1403263))

(assert (=> b!1519926 m!1403261))

(declare-fun m!1403271 () Bool)

(assert (=> b!1519926 m!1403271))

(declare-fun m!1403273 () Bool)

(assert (=> b!1519926 m!1403273))

(assert (=> b!1519926 m!1403261))

(declare-fun m!1403275 () Bool)

(assert (=> b!1519926 m!1403275))

(assert (=> b!1519600 d!158773))

(push 1)

(assert (not b!1519769))

(assert (not d!158747))

(assert (not bm!68316))

(assert (not b!1519921))

(assert (not d!158735))

(assert (not b!1519832))

(assert (not b!1519925))

(assert (not d!158709))

(assert (not b!1519926))

(assert (not b!1519920))

(assert (not d!158705))

(assert (not bm!68327))

(assert (not b!1519882))

(assert (not d!158745))

(assert (not b!1519922))

(assert (not b!1519831))

(assert (not b!1519873))

(assert (not b!1519710))

(assert (not bm!68326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1520055 () Bool)

(declare-fun e!847904 () Bool)

(declare-fun call!68335 () Bool)

(assert (=> b!1520055 (= e!847904 call!68335)))

(declare-fun b!1520056 () Bool)

(declare-fun e!847906 () Bool)

(assert (=> b!1520056 (= e!847906 e!847904)))

(declare-fun c!139716 () Bool)

(assert (=> b!1520056 (= c!139716 (validKeyInArray!0 (select (arr!48839 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!158823 () Bool)

(declare-fun res!1039709 () Bool)

(declare-fun e!847907 () Bool)

(assert (=> d!158823 (=> res!1039709 e!847907)))

(assert (=> d!158823 (= res!1039709 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49389 a!2804)))))

(assert (=> d!158823 (= (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139668 (Cons!35318 (select (arr!48839 a!2804) #b00000000000000000000000000000000) Nil!35319) Nil!35319)) e!847907)))

