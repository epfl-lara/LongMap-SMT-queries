; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130320 () Bool)

(assert start!130320)

(declare-fun b!1530113 () Bool)

(declare-fun res!1047822 () Bool)

(declare-fun e!852604 () Bool)

(assert (=> b!1530113 (=> (not res!1047822) (not e!852604))))

(declare-datatypes ((array!101611 0))(
  ( (array!101612 (arr!49030 (Array (_ BitVec 32) (_ BitVec 64))) (size!49582 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101611)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530113 (= res!1047822 (validKeyInArray!0 (select (arr!49030 a!2804) i!961)))))

(declare-fun b!1530114 () Bool)

(declare-fun res!1047826 () Bool)

(assert (=> b!1530114 (=> (not res!1047826) (not e!852604))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1530114 (= res!1047826 (and (= (size!49582 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49582 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49582 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530115 () Bool)

(declare-fun res!1047829 () Bool)

(declare-fun e!852601 () Bool)

(assert (=> b!1530115 (=> (not res!1047829) (not e!852601))))

(declare-datatypes ((SeekEntryResult!13218 0))(
  ( (MissingZero!13218 (index!55267 (_ BitVec 32))) (Found!13218 (index!55268 (_ BitVec 32))) (Intermediate!13218 (undefined!14030 Bool) (index!55269 (_ BitVec 32)) (x!136957 (_ BitVec 32))) (Undefined!13218) (MissingVacant!13218 (index!55270 (_ BitVec 32))) )
))
(declare-fun lt!662529 () SeekEntryResult!13218)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101611 (_ BitVec 32)) SeekEntryResult!13218)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530115 (= res!1047829 (= lt!662529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101612 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804)) mask!2512)))))

(declare-fun b!1530116 () Bool)

(declare-fun e!852603 () Bool)

(assert (=> b!1530116 (= e!852601 (not e!852603))))

(declare-fun res!1047827 () Bool)

(assert (=> b!1530116 (=> res!1047827 e!852603)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1530116 (= res!1047827 (or (not (= (select (arr!49030 a!2804) j!70) (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852600 () Bool)

(assert (=> b!1530116 e!852600))

(declare-fun res!1047824 () Bool)

(assert (=> b!1530116 (=> (not res!1047824) (not e!852600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101611 (_ BitVec 32)) Bool)

(assert (=> b!1530116 (= res!1047824 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51059 0))(
  ( (Unit!51060) )
))
(declare-fun lt!662526 () Unit!51059)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51059)

(assert (=> b!1530116 (= lt!662526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun lt!662527 () (_ BitVec 32))

(declare-fun b!1530117 () Bool)

(assert (=> b!1530117 (= e!852603 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (and (bvsge lt!662527 #b00000000000000000000000000000000) (bvslt lt!662527 (size!49582 a!2804)))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530117 (= lt!662527 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530119 () Bool)

(declare-fun res!1047828 () Bool)

(assert (=> b!1530119 (=> (not res!1047828) (not e!852604))))

(assert (=> b!1530119 (= res!1047828 (validKeyInArray!0 (select (arr!49030 a!2804) j!70)))))

(declare-fun b!1530120 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101611 (_ BitVec 32)) SeekEntryResult!13218)

(assert (=> b!1530120 (= e!852600 (= (seekEntry!0 (select (arr!49030 a!2804) j!70) a!2804 mask!2512) (Found!13218 j!70)))))

(declare-fun b!1530121 () Bool)

(declare-fun res!1047832 () Bool)

(assert (=> b!1530121 (=> (not res!1047832) (not e!852604))))

(declare-datatypes ((List!35591 0))(
  ( (Nil!35588) (Cons!35587 (h!37027 (_ BitVec 64)) (t!50277 List!35591)) )
))
(declare-fun arrayNoDuplicates!0 (array!101611 (_ BitVec 32) List!35591) Bool)

(assert (=> b!1530121 (= res!1047832 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35588))))

(declare-fun b!1530122 () Bool)

(declare-fun res!1047831 () Bool)

(assert (=> b!1530122 (=> (not res!1047831) (not e!852601))))

(declare-fun lt!662528 () SeekEntryResult!13218)

(assert (=> b!1530122 (= res!1047831 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49030 a!2804) j!70) a!2804 mask!2512) lt!662528))))

(declare-fun b!1530123 () Bool)

(assert (=> b!1530123 (= e!852604 e!852601)))

(declare-fun res!1047830 () Bool)

(assert (=> b!1530123 (=> (not res!1047830) (not e!852601))))

(assert (=> b!1530123 (= res!1047830 (= lt!662529 lt!662528))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530123 (= lt!662528 (Intermediate!13218 false resIndex!21 resX!21))))

(assert (=> b!1530123 (= lt!662529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49030 a!2804) j!70) mask!2512) (select (arr!49030 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530124 () Bool)

(declare-fun res!1047823 () Bool)

(assert (=> b!1530124 (=> (not res!1047823) (not e!852604))))

(assert (=> b!1530124 (= res!1047823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530118 () Bool)

(declare-fun res!1047821 () Bool)

(assert (=> b!1530118 (=> (not res!1047821) (not e!852604))))

(assert (=> b!1530118 (= res!1047821 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49582 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49582 a!2804))))))

(declare-fun res!1047825 () Bool)

(assert (=> start!130320 (=> (not res!1047825) (not e!852604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130320 (= res!1047825 (validMask!0 mask!2512))))

(assert (=> start!130320 e!852604))

(assert (=> start!130320 true))

(declare-fun array_inv!38263 (array!101611) Bool)

(assert (=> start!130320 (array_inv!38263 a!2804)))

(assert (= (and start!130320 res!1047825) b!1530114))

(assert (= (and b!1530114 res!1047826) b!1530113))

(assert (= (and b!1530113 res!1047822) b!1530119))

(assert (= (and b!1530119 res!1047828) b!1530124))

(assert (= (and b!1530124 res!1047823) b!1530121))

(assert (= (and b!1530121 res!1047832) b!1530118))

(assert (= (and b!1530118 res!1047821) b!1530123))

(assert (= (and b!1530123 res!1047830) b!1530122))

(assert (= (and b!1530122 res!1047831) b!1530115))

(assert (= (and b!1530115 res!1047829) b!1530116))

(assert (= (and b!1530116 res!1047824) b!1530120))

(assert (= (and b!1530116 (not res!1047827)) b!1530117))

(declare-fun m!1412405 () Bool)

(assert (=> b!1530120 m!1412405))

(assert (=> b!1530120 m!1412405))

(declare-fun m!1412407 () Bool)

(assert (=> b!1530120 m!1412407))

(assert (=> b!1530123 m!1412405))

(assert (=> b!1530123 m!1412405))

(declare-fun m!1412409 () Bool)

(assert (=> b!1530123 m!1412409))

(assert (=> b!1530123 m!1412409))

(assert (=> b!1530123 m!1412405))

(declare-fun m!1412411 () Bool)

(assert (=> b!1530123 m!1412411))

(declare-fun m!1412413 () Bool)

(assert (=> b!1530124 m!1412413))

(assert (=> b!1530122 m!1412405))

(assert (=> b!1530122 m!1412405))

(declare-fun m!1412415 () Bool)

(assert (=> b!1530122 m!1412415))

(assert (=> b!1530116 m!1412405))

(declare-fun m!1412417 () Bool)

(assert (=> b!1530116 m!1412417))

(declare-fun m!1412419 () Bool)

(assert (=> b!1530116 m!1412419))

(declare-fun m!1412421 () Bool)

(assert (=> b!1530116 m!1412421))

(declare-fun m!1412423 () Bool)

(assert (=> b!1530116 m!1412423))

(declare-fun m!1412425 () Bool)

(assert (=> start!130320 m!1412425))

(declare-fun m!1412427 () Bool)

(assert (=> start!130320 m!1412427))

(declare-fun m!1412429 () Bool)

(assert (=> b!1530113 m!1412429))

(assert (=> b!1530113 m!1412429))

(declare-fun m!1412431 () Bool)

(assert (=> b!1530113 m!1412431))

(declare-fun m!1412433 () Bool)

(assert (=> b!1530117 m!1412433))

(assert (=> b!1530119 m!1412405))

(assert (=> b!1530119 m!1412405))

(declare-fun m!1412435 () Bool)

(assert (=> b!1530119 m!1412435))

(assert (=> b!1530115 m!1412419))

(assert (=> b!1530115 m!1412421))

(assert (=> b!1530115 m!1412421))

(declare-fun m!1412437 () Bool)

(assert (=> b!1530115 m!1412437))

(assert (=> b!1530115 m!1412437))

(assert (=> b!1530115 m!1412421))

(declare-fun m!1412439 () Bool)

(assert (=> b!1530115 m!1412439))

(declare-fun m!1412441 () Bool)

(assert (=> b!1530121 m!1412441))

(check-sat (not b!1530119) (not b!1530113) (not b!1530124) (not b!1530117) (not b!1530116) (not b!1530120) (not b!1530121) (not b!1530122) (not b!1530115) (not b!1530123) (not start!130320))
(check-sat)
(get-model)

(declare-fun b!1530215 () Bool)

(declare-fun lt!662559 () SeekEntryResult!13218)

(assert (=> b!1530215 (and (bvsge (index!55269 lt!662559) #b00000000000000000000000000000000) (bvslt (index!55269 lt!662559) (size!49582 a!2804)))))

(declare-fun res!1047912 () Bool)

(assert (=> b!1530215 (= res!1047912 (= (select (arr!49030 a!2804) (index!55269 lt!662559)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852645 () Bool)

(assert (=> b!1530215 (=> res!1047912 e!852645)))

(declare-fun b!1530216 () Bool)

(assert (=> b!1530216 (and (bvsge (index!55269 lt!662559) #b00000000000000000000000000000000) (bvslt (index!55269 lt!662559) (size!49582 a!2804)))))

(declare-fun res!1047911 () Bool)

(assert (=> b!1530216 (= res!1047911 (= (select (arr!49030 a!2804) (index!55269 lt!662559)) (select (arr!49030 a!2804) j!70)))))

(assert (=> b!1530216 (=> res!1047911 e!852645)))

(declare-fun e!852646 () Bool)

(assert (=> b!1530216 (= e!852646 e!852645)))

(declare-fun b!1530217 () Bool)

(declare-fun e!852648 () Bool)

(assert (=> b!1530217 (= e!852648 (bvsge (x!136957 lt!662559) #b01111111111111111111111111111110))))

(declare-fun b!1530218 () Bool)

(declare-fun e!852647 () SeekEntryResult!13218)

(assert (=> b!1530218 (= e!852647 (Intermediate!13218 true index!487 x!534))))

(declare-fun b!1530219 () Bool)

(assert (=> b!1530219 (= e!852648 e!852646)))

(declare-fun res!1047913 () Bool)

(get-info :version)

(assert (=> b!1530219 (= res!1047913 (and ((_ is Intermediate!13218) lt!662559) (not (undefined!14030 lt!662559)) (bvslt (x!136957 lt!662559) #b01111111111111111111111111111110) (bvsge (x!136957 lt!662559) #b00000000000000000000000000000000) (bvsge (x!136957 lt!662559) x!534)))))

(assert (=> b!1530219 (=> (not res!1047913) (not e!852646))))

(declare-fun e!852649 () SeekEntryResult!13218)

(declare-fun b!1530220 () Bool)

(assert (=> b!1530220 (= e!852649 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49030 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530221 () Bool)

(assert (=> b!1530221 (= e!852647 e!852649)))

(declare-fun lt!662558 () (_ BitVec 64))

(declare-fun c!140710 () Bool)

(assert (=> b!1530221 (= c!140710 (or (= lt!662558 (select (arr!49030 a!2804) j!70)) (= (bvadd lt!662558 lt!662558) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!159577 () Bool)

(assert (=> d!159577 e!852648))

(declare-fun c!140712 () Bool)

(assert (=> d!159577 (= c!140712 (and ((_ is Intermediate!13218) lt!662559) (undefined!14030 lt!662559)))))

(assert (=> d!159577 (= lt!662559 e!852647)))

(declare-fun c!140711 () Bool)

(assert (=> d!159577 (= c!140711 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159577 (= lt!662558 (select (arr!49030 a!2804) index!487))))

(assert (=> d!159577 (validMask!0 mask!2512)))

(assert (=> d!159577 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49030 a!2804) j!70) a!2804 mask!2512) lt!662559)))

(declare-fun b!1530222 () Bool)

(assert (=> b!1530222 (and (bvsge (index!55269 lt!662559) #b00000000000000000000000000000000) (bvslt (index!55269 lt!662559) (size!49582 a!2804)))))

(assert (=> b!1530222 (= e!852645 (= (select (arr!49030 a!2804) (index!55269 lt!662559)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530223 () Bool)

(assert (=> b!1530223 (= e!852649 (Intermediate!13218 false index!487 x!534))))

(assert (= (and d!159577 c!140711) b!1530218))

(assert (= (and d!159577 (not c!140711)) b!1530221))

(assert (= (and b!1530221 c!140710) b!1530223))

(assert (= (and b!1530221 (not c!140710)) b!1530220))

(assert (= (and d!159577 c!140712) b!1530217))

(assert (= (and d!159577 (not c!140712)) b!1530219))

(assert (= (and b!1530219 res!1047913) b!1530216))

(assert (= (and b!1530216 (not res!1047911)) b!1530215))

(assert (= (and b!1530215 (not res!1047912)) b!1530222))

(declare-fun m!1412519 () Bool)

(assert (=> b!1530215 m!1412519))

(assert (=> b!1530216 m!1412519))

(declare-fun m!1412521 () Bool)

(assert (=> d!159577 m!1412521))

(assert (=> d!159577 m!1412425))

(assert (=> b!1530220 m!1412433))

(assert (=> b!1530220 m!1412433))

(assert (=> b!1530220 m!1412405))

(declare-fun m!1412523 () Bool)

(assert (=> b!1530220 m!1412523))

(assert (=> b!1530222 m!1412519))

(assert (=> b!1530122 d!159577))

(declare-fun d!159579 () Bool)

(declare-fun lt!662562 () (_ BitVec 32))

(assert (=> d!159579 (and (bvsge lt!662562 #b00000000000000000000000000000000) (bvslt lt!662562 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159579 (= lt!662562 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159579 (validMask!0 mask!2512)))

(assert (=> d!159579 (= (nextIndex!0 index!487 x!534 mask!2512) lt!662562)))

(declare-fun bs!43839 () Bool)

(assert (= bs!43839 d!159579))

(declare-fun m!1412525 () Bool)

(assert (=> bs!43839 m!1412525))

(assert (=> bs!43839 m!1412425))

(assert (=> b!1530117 d!159579))

(declare-fun b!1530224 () Bool)

(declare-fun lt!662564 () SeekEntryResult!13218)

(assert (=> b!1530224 (and (bvsge (index!55269 lt!662564) #b00000000000000000000000000000000) (bvslt (index!55269 lt!662564) (size!49582 (array!101612 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804)))))))

(declare-fun res!1047915 () Bool)

(assert (=> b!1530224 (= res!1047915 (= (select (arr!49030 (array!101612 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804))) (index!55269 lt!662564)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852650 () Bool)

(assert (=> b!1530224 (=> res!1047915 e!852650)))

(declare-fun b!1530225 () Bool)

(assert (=> b!1530225 (and (bvsge (index!55269 lt!662564) #b00000000000000000000000000000000) (bvslt (index!55269 lt!662564) (size!49582 (array!101612 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804)))))))

(declare-fun res!1047914 () Bool)

(assert (=> b!1530225 (= res!1047914 (= (select (arr!49030 (array!101612 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804))) (index!55269 lt!662564)) (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1530225 (=> res!1047914 e!852650)))

(declare-fun e!852651 () Bool)

(assert (=> b!1530225 (= e!852651 e!852650)))

(declare-fun b!1530226 () Bool)

(declare-fun e!852653 () Bool)

(assert (=> b!1530226 (= e!852653 (bvsge (x!136957 lt!662564) #b01111111111111111111111111111110))))

(declare-fun b!1530227 () Bool)

(declare-fun e!852652 () SeekEntryResult!13218)

(assert (=> b!1530227 (= e!852652 (Intermediate!13218 true (toIndex!0 (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530228 () Bool)

(assert (=> b!1530228 (= e!852653 e!852651)))

(declare-fun res!1047916 () Bool)

(assert (=> b!1530228 (= res!1047916 (and ((_ is Intermediate!13218) lt!662564) (not (undefined!14030 lt!662564)) (bvslt (x!136957 lt!662564) #b01111111111111111111111111111110) (bvsge (x!136957 lt!662564) #b00000000000000000000000000000000) (bvsge (x!136957 lt!662564) #b00000000000000000000000000000000)))))

(assert (=> b!1530228 (=> (not res!1047916) (not e!852651))))

(declare-fun b!1530229 () Bool)

(declare-fun e!852654 () SeekEntryResult!13218)

(assert (=> b!1530229 (= e!852654 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101612 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804)) mask!2512))))

(declare-fun b!1530230 () Bool)

(assert (=> b!1530230 (= e!852652 e!852654)))

(declare-fun c!140713 () Bool)

(declare-fun lt!662563 () (_ BitVec 64))

(assert (=> b!1530230 (= c!140713 (or (= lt!662563 (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!662563 lt!662563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!159581 () Bool)

(assert (=> d!159581 e!852653))

(declare-fun c!140715 () Bool)

(assert (=> d!159581 (= c!140715 (and ((_ is Intermediate!13218) lt!662564) (undefined!14030 lt!662564)))))

(assert (=> d!159581 (= lt!662564 e!852652)))

(declare-fun c!140714 () Bool)

(assert (=> d!159581 (= c!140714 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159581 (= lt!662563 (select (arr!49030 (array!101612 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804))) (toIndex!0 (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159581 (validMask!0 mask!2512)))

(assert (=> d!159581 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101612 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804)) mask!2512) lt!662564)))

(declare-fun b!1530231 () Bool)

(assert (=> b!1530231 (and (bvsge (index!55269 lt!662564) #b00000000000000000000000000000000) (bvslt (index!55269 lt!662564) (size!49582 (array!101612 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804)))))))

(assert (=> b!1530231 (= e!852650 (= (select (arr!49030 (array!101612 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804))) (index!55269 lt!662564)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530232 () Bool)

(assert (=> b!1530232 (= e!852654 (Intermediate!13218 false (toIndex!0 (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159581 c!140714) b!1530227))

(assert (= (and d!159581 (not c!140714)) b!1530230))

(assert (= (and b!1530230 c!140713) b!1530232))

(assert (= (and b!1530230 (not c!140713)) b!1530229))

(assert (= (and d!159581 c!140715) b!1530226))

(assert (= (and d!159581 (not c!140715)) b!1530228))

(assert (= (and b!1530228 res!1047916) b!1530225))

(assert (= (and b!1530225 (not res!1047914)) b!1530224))

(assert (= (and b!1530224 (not res!1047915)) b!1530231))

(declare-fun m!1412527 () Bool)

(assert (=> b!1530224 m!1412527))

(assert (=> b!1530225 m!1412527))

(assert (=> d!159581 m!1412437))

(declare-fun m!1412529 () Bool)

(assert (=> d!159581 m!1412529))

(assert (=> d!159581 m!1412425))

(assert (=> b!1530229 m!1412437))

(declare-fun m!1412531 () Bool)

(assert (=> b!1530229 m!1412531))

(assert (=> b!1530229 m!1412531))

(assert (=> b!1530229 m!1412421))

(declare-fun m!1412533 () Bool)

(assert (=> b!1530229 m!1412533))

(assert (=> b!1530231 m!1412527))

(assert (=> b!1530115 d!159581))

(declare-fun d!159583 () Bool)

(declare-fun lt!662570 () (_ BitVec 32))

(declare-fun lt!662569 () (_ BitVec 32))

(assert (=> d!159583 (= lt!662570 (bvmul (bvxor lt!662569 (bvlshr lt!662569 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159583 (= lt!662569 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159583 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1047917 (let ((h!37030 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136962 (bvmul (bvxor h!37030 (bvlshr h!37030 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136962 (bvlshr x!136962 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1047917 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1047917 #b00000000000000000000000000000000))))))

(assert (=> d!159583 (= (toIndex!0 (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!662570 (bvlshr lt!662570 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530115 d!159583))

(declare-fun b!1530241 () Bool)

(declare-fun e!852663 () Bool)

(declare-fun e!852661 () Bool)

(assert (=> b!1530241 (= e!852663 e!852661)))

(declare-fun c!140718 () Bool)

(assert (=> b!1530241 (= c!140718 (validKeyInArray!0 (select (arr!49030 a!2804) j!70)))))

(declare-fun b!1530242 () Bool)

(declare-fun e!852662 () Bool)

(declare-fun call!68479 () Bool)

(assert (=> b!1530242 (= e!852662 call!68479)))

(declare-fun b!1530243 () Bool)

(assert (=> b!1530243 (= e!852661 e!852662)))

(declare-fun lt!662579 () (_ BitVec 64))

(assert (=> b!1530243 (= lt!662579 (select (arr!49030 a!2804) j!70))))

(declare-fun lt!662578 () Unit!51059)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101611 (_ BitVec 64) (_ BitVec 32)) Unit!51059)

(assert (=> b!1530243 (= lt!662578 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662579 j!70))))

(declare-fun arrayContainsKey!0 (array!101611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1530243 (arrayContainsKey!0 a!2804 lt!662579 #b00000000000000000000000000000000)))

(declare-fun lt!662577 () Unit!51059)

(assert (=> b!1530243 (= lt!662577 lt!662578)))

(declare-fun res!1047922 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101611 (_ BitVec 32)) SeekEntryResult!13218)

(assert (=> b!1530243 (= res!1047922 (= (seekEntryOrOpen!0 (select (arr!49030 a!2804) j!70) a!2804 mask!2512) (Found!13218 j!70)))))

(assert (=> b!1530243 (=> (not res!1047922) (not e!852662))))

(declare-fun bm!68476 () Bool)

(assert (=> bm!68476 (= call!68479 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1530244 () Bool)

(assert (=> b!1530244 (= e!852661 call!68479)))

(declare-fun d!159585 () Bool)

(declare-fun res!1047923 () Bool)

(assert (=> d!159585 (=> res!1047923 e!852663)))

(assert (=> d!159585 (= res!1047923 (bvsge j!70 (size!49582 a!2804)))))

(assert (=> d!159585 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!852663)))

(assert (= (and d!159585 (not res!1047923)) b!1530241))

(assert (= (and b!1530241 c!140718) b!1530243))

(assert (= (and b!1530241 (not c!140718)) b!1530244))

(assert (= (and b!1530243 res!1047922) b!1530242))

(assert (= (or b!1530242 b!1530244) bm!68476))

(assert (=> b!1530241 m!1412405))

(assert (=> b!1530241 m!1412405))

(assert (=> b!1530241 m!1412435))

(assert (=> b!1530243 m!1412405))

(declare-fun m!1412535 () Bool)

(assert (=> b!1530243 m!1412535))

(declare-fun m!1412537 () Bool)

(assert (=> b!1530243 m!1412537))

(assert (=> b!1530243 m!1412405))

(declare-fun m!1412539 () Bool)

(assert (=> b!1530243 m!1412539))

(declare-fun m!1412541 () Bool)

(assert (=> bm!68476 m!1412541))

(assert (=> b!1530116 d!159585))

(declare-fun d!159587 () Bool)

(assert (=> d!159587 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!662582 () Unit!51059)

(declare-fun choose!38 (array!101611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51059)

(assert (=> d!159587 (= lt!662582 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159587 (validMask!0 mask!2512)))

(assert (=> d!159587 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!662582)))

(declare-fun bs!43840 () Bool)

(assert (= bs!43840 d!159587))

(assert (=> bs!43840 m!1412423))

(declare-fun m!1412543 () Bool)

(assert (=> bs!43840 m!1412543))

(assert (=> bs!43840 m!1412425))

(assert (=> b!1530116 d!159587))

(declare-fun d!159589 () Bool)

(assert (=> d!159589 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130320 d!159589))

(declare-fun d!159597 () Bool)

(assert (=> d!159597 (= (array_inv!38263 a!2804) (bvsge (size!49582 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130320 d!159597))

(declare-fun b!1530263 () Bool)

(declare-fun e!852681 () Bool)

(declare-fun call!68484 () Bool)

(assert (=> b!1530263 (= e!852681 call!68484)))

(declare-fun d!159599 () Bool)

(declare-fun res!1047935 () Bool)

(declare-fun e!852678 () Bool)

(assert (=> d!159599 (=> res!1047935 e!852678)))

(assert (=> d!159599 (= res!1047935 (bvsge #b00000000000000000000000000000000 (size!49582 a!2804)))))

(assert (=> d!159599 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35588) e!852678)))

(declare-fun b!1530264 () Bool)

(declare-fun e!852679 () Bool)

(declare-fun contains!9964 (List!35591 (_ BitVec 64)) Bool)

(assert (=> b!1530264 (= e!852679 (contains!9964 Nil!35588 (select (arr!49030 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530265 () Bool)

(declare-fun e!852680 () Bool)

(assert (=> b!1530265 (= e!852680 e!852681)))

(declare-fun c!140723 () Bool)

(assert (=> b!1530265 (= c!140723 (validKeyInArray!0 (select (arr!49030 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530266 () Bool)

(assert (=> b!1530266 (= e!852681 call!68484)))

(declare-fun b!1530267 () Bool)

(assert (=> b!1530267 (= e!852678 e!852680)))

(declare-fun res!1047934 () Bool)

(assert (=> b!1530267 (=> (not res!1047934) (not e!852680))))

(assert (=> b!1530267 (= res!1047934 (not e!852679))))

(declare-fun res!1047936 () Bool)

(assert (=> b!1530267 (=> (not res!1047936) (not e!852679))))

(assert (=> b!1530267 (= res!1047936 (validKeyInArray!0 (select (arr!49030 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68481 () Bool)

(assert (=> bm!68481 (= call!68484 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140723 (Cons!35587 (select (arr!49030 a!2804) #b00000000000000000000000000000000) Nil!35588) Nil!35588)))))

(assert (= (and d!159599 (not res!1047935)) b!1530267))

(assert (= (and b!1530267 res!1047936) b!1530264))

(assert (= (and b!1530267 res!1047934) b!1530265))

(assert (= (and b!1530265 c!140723) b!1530266))

(assert (= (and b!1530265 (not c!140723)) b!1530263))

(assert (= (or b!1530266 b!1530263) bm!68481))

(declare-fun m!1412545 () Bool)

(assert (=> b!1530264 m!1412545))

(assert (=> b!1530264 m!1412545))

(declare-fun m!1412547 () Bool)

(assert (=> b!1530264 m!1412547))

(assert (=> b!1530265 m!1412545))

(assert (=> b!1530265 m!1412545))

(declare-fun m!1412549 () Bool)

(assert (=> b!1530265 m!1412549))

(assert (=> b!1530267 m!1412545))

(assert (=> b!1530267 m!1412545))

(assert (=> b!1530267 m!1412549))

(assert (=> bm!68481 m!1412545))

(declare-fun m!1412551 () Bool)

(assert (=> bm!68481 m!1412551))

(assert (=> b!1530121 d!159599))

(declare-fun d!159605 () Bool)

(assert (=> d!159605 (= (validKeyInArray!0 (select (arr!49030 a!2804) j!70)) (and (not (= (select (arr!49030 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49030 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530119 d!159605))

(declare-fun b!1530303 () Bool)

(declare-fun e!852702 () SeekEntryResult!13218)

(assert (=> b!1530303 (= e!852702 Undefined!13218)))

(declare-fun b!1530304 () Bool)

(declare-fun e!852701 () SeekEntryResult!13218)

(declare-fun lt!662612 () SeekEntryResult!13218)

(assert (=> b!1530304 (= e!852701 (MissingZero!13218 (index!55269 lt!662612)))))

(declare-fun b!1530305 () Bool)

(declare-fun c!140742 () Bool)

(declare-fun lt!662613 () (_ BitVec 64))

(assert (=> b!1530305 (= c!140742 (= lt!662613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852700 () SeekEntryResult!13218)

(assert (=> b!1530305 (= e!852700 e!852701)))

(declare-fun b!1530306 () Bool)

(assert (=> b!1530306 (= e!852700 (Found!13218 (index!55269 lt!662612)))))

(declare-fun b!1530307 () Bool)

(assert (=> b!1530307 (= e!852702 e!852700)))

(assert (=> b!1530307 (= lt!662613 (select (arr!49030 a!2804) (index!55269 lt!662612)))))

(declare-fun c!140741 () Bool)

(assert (=> b!1530307 (= c!140741 (= lt!662613 (select (arr!49030 a!2804) j!70)))))

(declare-fun d!159607 () Bool)

(declare-fun lt!662615 () SeekEntryResult!13218)

(assert (=> d!159607 (and (or ((_ is MissingVacant!13218) lt!662615) (not ((_ is Found!13218) lt!662615)) (and (bvsge (index!55268 lt!662615) #b00000000000000000000000000000000) (bvslt (index!55268 lt!662615) (size!49582 a!2804)))) (not ((_ is MissingVacant!13218) lt!662615)) (or (not ((_ is Found!13218) lt!662615)) (= (select (arr!49030 a!2804) (index!55268 lt!662615)) (select (arr!49030 a!2804) j!70))))))

(assert (=> d!159607 (= lt!662615 e!852702)))

(declare-fun c!140740 () Bool)

(assert (=> d!159607 (= c!140740 (and ((_ is Intermediate!13218) lt!662612) (undefined!14030 lt!662612)))))

(assert (=> d!159607 (= lt!662612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49030 a!2804) j!70) mask!2512) (select (arr!49030 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159607 (validMask!0 mask!2512)))

(assert (=> d!159607 (= (seekEntry!0 (select (arr!49030 a!2804) j!70) a!2804 mask!2512) lt!662615)))

(declare-fun b!1530302 () Bool)

(declare-fun lt!662614 () SeekEntryResult!13218)

(assert (=> b!1530302 (= e!852701 (ite ((_ is MissingVacant!13218) lt!662614) (MissingZero!13218 (index!55270 lt!662614)) lt!662614))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101611 (_ BitVec 32)) SeekEntryResult!13218)

(assert (=> b!1530302 (= lt!662614 (seekKeyOrZeroReturnVacant!0 (x!136957 lt!662612) (index!55269 lt!662612) (index!55269 lt!662612) (select (arr!49030 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159607 c!140740) b!1530303))

(assert (= (and d!159607 (not c!140740)) b!1530307))

(assert (= (and b!1530307 c!140741) b!1530306))

(assert (= (and b!1530307 (not c!140741)) b!1530305))

(assert (= (and b!1530305 c!140742) b!1530304))

(assert (= (and b!1530305 (not c!140742)) b!1530302))

(declare-fun m!1412571 () Bool)

(assert (=> b!1530307 m!1412571))

(declare-fun m!1412573 () Bool)

(assert (=> d!159607 m!1412573))

(assert (=> d!159607 m!1412405))

(assert (=> d!159607 m!1412409))

(assert (=> d!159607 m!1412409))

(assert (=> d!159607 m!1412405))

(assert (=> d!159607 m!1412411))

(assert (=> d!159607 m!1412425))

(assert (=> b!1530302 m!1412405))

(declare-fun m!1412575 () Bool)

(assert (=> b!1530302 m!1412575))

(assert (=> b!1530120 d!159607))

(declare-fun b!1530308 () Bool)

(declare-fun lt!662617 () SeekEntryResult!13218)

(assert (=> b!1530308 (and (bvsge (index!55269 lt!662617) #b00000000000000000000000000000000) (bvslt (index!55269 lt!662617) (size!49582 a!2804)))))

(declare-fun res!1047940 () Bool)

(assert (=> b!1530308 (= res!1047940 (= (select (arr!49030 a!2804) (index!55269 lt!662617)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852703 () Bool)

(assert (=> b!1530308 (=> res!1047940 e!852703)))

(declare-fun b!1530309 () Bool)

(assert (=> b!1530309 (and (bvsge (index!55269 lt!662617) #b00000000000000000000000000000000) (bvslt (index!55269 lt!662617) (size!49582 a!2804)))))

(declare-fun res!1047939 () Bool)

(assert (=> b!1530309 (= res!1047939 (= (select (arr!49030 a!2804) (index!55269 lt!662617)) (select (arr!49030 a!2804) j!70)))))

(assert (=> b!1530309 (=> res!1047939 e!852703)))

(declare-fun e!852704 () Bool)

(assert (=> b!1530309 (= e!852704 e!852703)))

(declare-fun b!1530310 () Bool)

(declare-fun e!852706 () Bool)

(assert (=> b!1530310 (= e!852706 (bvsge (x!136957 lt!662617) #b01111111111111111111111111111110))))

(declare-fun e!852705 () SeekEntryResult!13218)

(declare-fun b!1530311 () Bool)

(assert (=> b!1530311 (= e!852705 (Intermediate!13218 true (toIndex!0 (select (arr!49030 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530312 () Bool)

(assert (=> b!1530312 (= e!852706 e!852704)))

(declare-fun res!1047941 () Bool)

(assert (=> b!1530312 (= res!1047941 (and ((_ is Intermediate!13218) lt!662617) (not (undefined!14030 lt!662617)) (bvslt (x!136957 lt!662617) #b01111111111111111111111111111110) (bvsge (x!136957 lt!662617) #b00000000000000000000000000000000) (bvsge (x!136957 lt!662617) #b00000000000000000000000000000000)))))

(assert (=> b!1530312 (=> (not res!1047941) (not e!852704))))

(declare-fun e!852707 () SeekEntryResult!13218)

(declare-fun b!1530313 () Bool)

(assert (=> b!1530313 (= e!852707 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49030 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49030 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530314 () Bool)

(assert (=> b!1530314 (= e!852705 e!852707)))

(declare-fun lt!662616 () (_ BitVec 64))

(declare-fun c!140743 () Bool)

(assert (=> b!1530314 (= c!140743 (or (= lt!662616 (select (arr!49030 a!2804) j!70)) (= (bvadd lt!662616 lt!662616) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!159615 () Bool)

(assert (=> d!159615 e!852706))

(declare-fun c!140745 () Bool)

(assert (=> d!159615 (= c!140745 (and ((_ is Intermediate!13218) lt!662617) (undefined!14030 lt!662617)))))

(assert (=> d!159615 (= lt!662617 e!852705)))

(declare-fun c!140744 () Bool)

(assert (=> d!159615 (= c!140744 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159615 (= lt!662616 (select (arr!49030 a!2804) (toIndex!0 (select (arr!49030 a!2804) j!70) mask!2512)))))

(assert (=> d!159615 (validMask!0 mask!2512)))

(assert (=> d!159615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49030 a!2804) j!70) mask!2512) (select (arr!49030 a!2804) j!70) a!2804 mask!2512) lt!662617)))

(declare-fun b!1530315 () Bool)

(assert (=> b!1530315 (and (bvsge (index!55269 lt!662617) #b00000000000000000000000000000000) (bvslt (index!55269 lt!662617) (size!49582 a!2804)))))

(assert (=> b!1530315 (= e!852703 (= (select (arr!49030 a!2804) (index!55269 lt!662617)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530316 () Bool)

(assert (=> b!1530316 (= e!852707 (Intermediate!13218 false (toIndex!0 (select (arr!49030 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159615 c!140744) b!1530311))

(assert (= (and d!159615 (not c!140744)) b!1530314))

(assert (= (and b!1530314 c!140743) b!1530316))

(assert (= (and b!1530314 (not c!140743)) b!1530313))

(assert (= (and d!159615 c!140745) b!1530310))

(assert (= (and d!159615 (not c!140745)) b!1530312))

(assert (= (and b!1530312 res!1047941) b!1530309))

(assert (= (and b!1530309 (not res!1047939)) b!1530308))

(assert (= (and b!1530308 (not res!1047940)) b!1530315))

(declare-fun m!1412577 () Bool)

(assert (=> b!1530308 m!1412577))

(assert (=> b!1530309 m!1412577))

(assert (=> d!159615 m!1412409))

(declare-fun m!1412579 () Bool)

(assert (=> d!159615 m!1412579))

(assert (=> d!159615 m!1412425))

(assert (=> b!1530313 m!1412409))

(declare-fun m!1412581 () Bool)

(assert (=> b!1530313 m!1412581))

(assert (=> b!1530313 m!1412581))

(assert (=> b!1530313 m!1412405))

(declare-fun m!1412583 () Bool)

(assert (=> b!1530313 m!1412583))

(assert (=> b!1530315 m!1412577))

(assert (=> b!1530123 d!159615))

(declare-fun d!159617 () Bool)

(declare-fun lt!662623 () (_ BitVec 32))

(declare-fun lt!662622 () (_ BitVec 32))

(assert (=> d!159617 (= lt!662623 (bvmul (bvxor lt!662622 (bvlshr lt!662622 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159617 (= lt!662622 ((_ extract 31 0) (bvand (bvxor (select (arr!49030 a!2804) j!70) (bvlshr (select (arr!49030 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159617 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1047917 (let ((h!37030 ((_ extract 31 0) (bvand (bvxor (select (arr!49030 a!2804) j!70) (bvlshr (select (arr!49030 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136962 (bvmul (bvxor h!37030 (bvlshr h!37030 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136962 (bvlshr x!136962 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1047917 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1047917 #b00000000000000000000000000000000))))))

(assert (=> d!159617 (= (toIndex!0 (select (arr!49030 a!2804) j!70) mask!2512) (bvand (bvxor lt!662623 (bvlshr lt!662623 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530123 d!159617))

(declare-fun b!1530329 () Bool)

(declare-fun e!852716 () Bool)

(declare-fun e!852714 () Bool)

(assert (=> b!1530329 (= e!852716 e!852714)))

(declare-fun c!140752 () Bool)

(assert (=> b!1530329 (= c!140752 (validKeyInArray!0 (select (arr!49030 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530330 () Bool)

(declare-fun e!852715 () Bool)

(declare-fun call!68486 () Bool)

(assert (=> b!1530330 (= e!852715 call!68486)))

(declare-fun b!1530331 () Bool)

(assert (=> b!1530331 (= e!852714 e!852715)))

(declare-fun lt!662626 () (_ BitVec 64))

(assert (=> b!1530331 (= lt!662626 (select (arr!49030 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!662625 () Unit!51059)

(assert (=> b!1530331 (= lt!662625 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662626 #b00000000000000000000000000000000))))

(assert (=> b!1530331 (arrayContainsKey!0 a!2804 lt!662626 #b00000000000000000000000000000000)))

(declare-fun lt!662624 () Unit!51059)

(assert (=> b!1530331 (= lt!662624 lt!662625)))

(declare-fun res!1047942 () Bool)

(assert (=> b!1530331 (= res!1047942 (= (seekEntryOrOpen!0 (select (arr!49030 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13218 #b00000000000000000000000000000000)))))

(assert (=> b!1530331 (=> (not res!1047942) (not e!852715))))

(declare-fun bm!68483 () Bool)

(assert (=> bm!68483 (= call!68486 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1530332 () Bool)

(assert (=> b!1530332 (= e!852714 call!68486)))

(declare-fun d!159619 () Bool)

(declare-fun res!1047943 () Bool)

(assert (=> d!159619 (=> res!1047943 e!852716)))

(assert (=> d!159619 (= res!1047943 (bvsge #b00000000000000000000000000000000 (size!49582 a!2804)))))

(assert (=> d!159619 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!852716)))

(assert (= (and d!159619 (not res!1047943)) b!1530329))

(assert (= (and b!1530329 c!140752) b!1530331))

(assert (= (and b!1530329 (not c!140752)) b!1530332))

(assert (= (and b!1530331 res!1047942) b!1530330))

(assert (= (or b!1530330 b!1530332) bm!68483))

(assert (=> b!1530329 m!1412545))

(assert (=> b!1530329 m!1412545))

(assert (=> b!1530329 m!1412549))

(assert (=> b!1530331 m!1412545))

(declare-fun m!1412585 () Bool)

(assert (=> b!1530331 m!1412585))

(declare-fun m!1412587 () Bool)

(assert (=> b!1530331 m!1412587))

(assert (=> b!1530331 m!1412545))

(declare-fun m!1412589 () Bool)

(assert (=> b!1530331 m!1412589))

(declare-fun m!1412591 () Bool)

(assert (=> bm!68483 m!1412591))

(assert (=> b!1530124 d!159619))

(declare-fun d!159621 () Bool)

(assert (=> d!159621 (= (validKeyInArray!0 (select (arr!49030 a!2804) i!961)) (and (not (= (select (arr!49030 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49030 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530113 d!159621))

(check-sat (not b!1530264) (not d!159577) (not d!159607) (not d!159587) (not d!159581) (not bm!68476) (not b!1530229) (not b!1530302) (not b!1530243) (not b!1530241) (not b!1530313) (not bm!68481) (not b!1530267) (not d!159615) (not bm!68483) (not b!1530329) (not b!1530331) (not d!159579) (not b!1530265) (not b!1530220))
(check-sat)
