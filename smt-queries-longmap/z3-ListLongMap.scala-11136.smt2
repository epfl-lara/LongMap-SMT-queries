; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130114 () Bool)

(assert start!130114)

(declare-fun b!1527280 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun e!851255 () Bool)

(declare-datatypes ((array!101527 0))(
  ( (array!101528 (arr!48990 (Array (_ BitVec 32) (_ BitVec 64))) (size!49540 (_ BitVec 32))) )
))
(declare-fun lt!661376 () array!101527)

(declare-fun lt!661377 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13155 0))(
  ( (MissingZero!13155 (index!55015 (_ BitVec 32))) (Found!13155 (index!55016 (_ BitVec 32))) (Intermediate!13155 (undefined!13967 Bool) (index!55017 (_ BitVec 32)) (x!136705 (_ BitVec 32))) (Undefined!13155) (MissingVacant!13155 (index!55018 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101527 (_ BitVec 32)) SeekEntryResult!13155)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101527 (_ BitVec 32)) SeekEntryResult!13155)

(assert (=> b!1527280 (= e!851255 (= (seekEntryOrOpen!0 lt!661377 lt!661376 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661377 lt!661376 mask!2512)))))

(declare-fun b!1527281 () Bool)

(declare-fun res!1045325 () Bool)

(declare-fun e!851254 () Bool)

(assert (=> b!1527281 (=> (not res!1045325) (not e!851254))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun a!2804 () array!101527)

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527281 (= res!1045325 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49540 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49540 a!2804))))))

(declare-fun b!1527282 () Bool)

(declare-fun e!851252 () Bool)

(assert (=> b!1527282 (= e!851252 e!851255)))

(declare-fun res!1045322 () Bool)

(assert (=> b!1527282 (=> (not res!1045322) (not e!851255))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1527282 (= res!1045322 (= (seekEntryOrOpen!0 (select (arr!48990 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48990 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527283 () Bool)

(declare-fun e!851256 () Bool)

(assert (=> b!1527283 (= e!851254 e!851256)))

(declare-fun res!1045324 () Bool)

(assert (=> b!1527283 (=> (not res!1045324) (not e!851256))))

(declare-fun lt!661374 () SeekEntryResult!13155)

(declare-fun lt!661378 () SeekEntryResult!13155)

(assert (=> b!1527283 (= res!1045324 (= lt!661374 lt!661378))))

(assert (=> b!1527283 (= lt!661378 (Intermediate!13155 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101527 (_ BitVec 32)) SeekEntryResult!13155)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527283 (= lt!661374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48990 a!2804) j!70) mask!2512) (select (arr!48990 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527284 () Bool)

(declare-fun res!1045323 () Bool)

(assert (=> b!1527284 (=> (not res!1045323) (not e!851254))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527284 (= res!1045323 (validKeyInArray!0 (select (arr!48990 a!2804) i!961)))))

(declare-fun b!1527285 () Bool)

(declare-fun e!851251 () Bool)

(assert (=> b!1527285 (= e!851251 (not true))))

(declare-fun e!851253 () Bool)

(assert (=> b!1527285 e!851253))

(declare-fun res!1045317 () Bool)

(assert (=> b!1527285 (=> (not res!1045317) (not e!851253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101527 (_ BitVec 32)) Bool)

(assert (=> b!1527285 (= res!1045317 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51094 0))(
  ( (Unit!51095) )
))
(declare-fun lt!661375 () Unit!51094)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51094)

(assert (=> b!1527285 (= lt!661375 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527286 () Bool)

(declare-fun res!1045327 () Bool)

(assert (=> b!1527286 (=> (not res!1045327) (not e!851254))))

(declare-datatypes ((List!35473 0))(
  ( (Nil!35470) (Cons!35469 (h!36902 (_ BitVec 64)) (t!50167 List!35473)) )
))
(declare-fun arrayNoDuplicates!0 (array!101527 (_ BitVec 32) List!35473) Bool)

(assert (=> b!1527286 (= res!1045327 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35470))))

(declare-fun b!1527288 () Bool)

(declare-fun res!1045318 () Bool)

(assert (=> b!1527288 (=> (not res!1045318) (not e!851256))))

(assert (=> b!1527288 (= res!1045318 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48990 a!2804) j!70) a!2804 mask!2512) lt!661378))))

(declare-fun b!1527289 () Bool)

(assert (=> b!1527289 (= e!851253 e!851252)))

(declare-fun res!1045314 () Bool)

(assert (=> b!1527289 (=> res!1045314 e!851252)))

(assert (=> b!1527289 (= res!1045314 (or (not (= (select (arr!48990 a!2804) j!70) lt!661377)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48990 a!2804) index!487) (select (arr!48990 a!2804) j!70)) (not (= (select (arr!48990 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527290 () Bool)

(assert (=> b!1527290 (= e!851256 e!851251)))

(declare-fun res!1045316 () Bool)

(assert (=> b!1527290 (=> (not res!1045316) (not e!851251))))

(assert (=> b!1527290 (= res!1045316 (= lt!661374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661377 mask!2512) lt!661377 lt!661376 mask!2512)))))

(assert (=> b!1527290 (= lt!661377 (select (store (arr!48990 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527290 (= lt!661376 (array!101528 (store (arr!48990 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49540 a!2804)))))

(declare-fun b!1527291 () Bool)

(declare-fun res!1045320 () Bool)

(assert (=> b!1527291 (=> (not res!1045320) (not e!851254))))

(assert (=> b!1527291 (= res!1045320 (validKeyInArray!0 (select (arr!48990 a!2804) j!70)))))

(declare-fun b!1527292 () Bool)

(declare-fun res!1045319 () Bool)

(assert (=> b!1527292 (=> (not res!1045319) (not e!851254))))

(assert (=> b!1527292 (= res!1045319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527293 () Bool)

(declare-fun res!1045321 () Bool)

(assert (=> b!1527293 (=> (not res!1045321) (not e!851253))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101527 (_ BitVec 32)) SeekEntryResult!13155)

(assert (=> b!1527293 (= res!1045321 (= (seekEntry!0 (select (arr!48990 a!2804) j!70) a!2804 mask!2512) (Found!13155 j!70)))))

(declare-fun b!1527287 () Bool)

(declare-fun res!1045326 () Bool)

(assert (=> b!1527287 (=> (not res!1045326) (not e!851254))))

(assert (=> b!1527287 (= res!1045326 (and (= (size!49540 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49540 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49540 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1045315 () Bool)

(assert (=> start!130114 (=> (not res!1045315) (not e!851254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130114 (= res!1045315 (validMask!0 mask!2512))))

(assert (=> start!130114 e!851254))

(assert (=> start!130114 true))

(declare-fun array_inv!38018 (array!101527) Bool)

(assert (=> start!130114 (array_inv!38018 a!2804)))

(assert (= (and start!130114 res!1045315) b!1527287))

(assert (= (and b!1527287 res!1045326) b!1527284))

(assert (= (and b!1527284 res!1045323) b!1527291))

(assert (= (and b!1527291 res!1045320) b!1527292))

(assert (= (and b!1527292 res!1045319) b!1527286))

(assert (= (and b!1527286 res!1045327) b!1527281))

(assert (= (and b!1527281 res!1045325) b!1527283))

(assert (= (and b!1527283 res!1045324) b!1527288))

(assert (= (and b!1527288 res!1045318) b!1527290))

(assert (= (and b!1527290 res!1045316) b!1527285))

(assert (= (and b!1527285 res!1045317) b!1527293))

(assert (= (and b!1527293 res!1045321) b!1527289))

(assert (= (and b!1527289 (not res!1045314)) b!1527282))

(assert (= (and b!1527282 res!1045322) b!1527280))

(declare-fun m!1410163 () Bool)

(assert (=> b!1527283 m!1410163))

(assert (=> b!1527283 m!1410163))

(declare-fun m!1410165 () Bool)

(assert (=> b!1527283 m!1410165))

(assert (=> b!1527283 m!1410165))

(assert (=> b!1527283 m!1410163))

(declare-fun m!1410167 () Bool)

(assert (=> b!1527283 m!1410167))

(assert (=> b!1527291 m!1410163))

(assert (=> b!1527291 m!1410163))

(declare-fun m!1410169 () Bool)

(assert (=> b!1527291 m!1410169))

(declare-fun m!1410171 () Bool)

(assert (=> b!1527286 m!1410171))

(declare-fun m!1410173 () Bool)

(assert (=> start!130114 m!1410173))

(declare-fun m!1410175 () Bool)

(assert (=> start!130114 m!1410175))

(declare-fun m!1410177 () Bool)

(assert (=> b!1527290 m!1410177))

(assert (=> b!1527290 m!1410177))

(declare-fun m!1410179 () Bool)

(assert (=> b!1527290 m!1410179))

(declare-fun m!1410181 () Bool)

(assert (=> b!1527290 m!1410181))

(declare-fun m!1410183 () Bool)

(assert (=> b!1527290 m!1410183))

(declare-fun m!1410185 () Bool)

(assert (=> b!1527284 m!1410185))

(assert (=> b!1527284 m!1410185))

(declare-fun m!1410187 () Bool)

(assert (=> b!1527284 m!1410187))

(assert (=> b!1527289 m!1410163))

(declare-fun m!1410189 () Bool)

(assert (=> b!1527289 m!1410189))

(declare-fun m!1410191 () Bool)

(assert (=> b!1527285 m!1410191))

(declare-fun m!1410193 () Bool)

(assert (=> b!1527285 m!1410193))

(declare-fun m!1410195 () Bool)

(assert (=> b!1527280 m!1410195))

(declare-fun m!1410197 () Bool)

(assert (=> b!1527280 m!1410197))

(assert (=> b!1527293 m!1410163))

(assert (=> b!1527293 m!1410163))

(declare-fun m!1410199 () Bool)

(assert (=> b!1527293 m!1410199))

(assert (=> b!1527288 m!1410163))

(assert (=> b!1527288 m!1410163))

(declare-fun m!1410201 () Bool)

(assert (=> b!1527288 m!1410201))

(declare-fun m!1410203 () Bool)

(assert (=> b!1527292 m!1410203))

(assert (=> b!1527282 m!1410163))

(assert (=> b!1527282 m!1410163))

(declare-fun m!1410205 () Bool)

(assert (=> b!1527282 m!1410205))

(assert (=> b!1527282 m!1410163))

(declare-fun m!1410207 () Bool)

(assert (=> b!1527282 m!1410207))

(check-sat (not start!130114) (not b!1527293) (not b!1527285) (not b!1527283) (not b!1527282) (not b!1527292) (not b!1527290) (not b!1527286) (not b!1527291) (not b!1527280) (not b!1527284) (not b!1527288))
(check-sat)
