; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129334 () Bool)

(assert start!129334)

(declare-fun b!1519330 () Bool)

(declare-fun res!1039238 () Bool)

(declare-fun e!847521 () Bool)

(assert (=> b!1519330 (=> (not res!1039238) (not e!847521))))

(declare-datatypes ((array!101190 0))(
  ( (array!101191 (arr!48832 (Array (_ BitVec 32) (_ BitVec 64))) (size!49382 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101190)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101190 (_ BitVec 32)) Bool)

(assert (=> b!1519330 (= res!1039238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519331 () Bool)

(declare-fun e!847525 () Bool)

(assert (=> b!1519331 (= e!847521 e!847525)))

(declare-fun res!1039234 () Bool)

(assert (=> b!1519331 (=> (not res!1039234) (not e!847525))))

(declare-datatypes ((SeekEntryResult!13003 0))(
  ( (MissingZero!13003 (index!54407 (_ BitVec 32))) (Found!13003 (index!54408 (_ BitVec 32))) (Intermediate!13003 (undefined!13815 Bool) (index!54409 (_ BitVec 32)) (x!136073 (_ BitVec 32))) (Undefined!13003) (MissingVacant!13003 (index!54410 (_ BitVec 32))) )
))
(declare-fun lt!658612 () SeekEntryResult!13003)

(declare-fun lt!658618 () SeekEntryResult!13003)

(assert (=> b!1519331 (= res!1039234 (= lt!658612 lt!658618))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1519331 (= lt!658618 (Intermediate!13003 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101190 (_ BitVec 32)) SeekEntryResult!13003)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519331 (= lt!658612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48832 a!2804) j!70) mask!2512) (select (arr!48832 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519332 () Bool)

(declare-fun res!1039244 () Bool)

(assert (=> b!1519332 (=> (not res!1039244) (not e!847521))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519332 (= res!1039244 (validKeyInArray!0 (select (arr!48832 a!2804) i!961)))))

(declare-fun b!1519333 () Bool)

(declare-fun res!1039237 () Bool)

(assert (=> b!1519333 (=> (not res!1039237) (not e!847521))))

(assert (=> b!1519333 (= res!1039237 (and (= (size!49382 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49382 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49382 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!847524 () Bool)

(declare-fun b!1519334 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101190 (_ BitVec 32)) SeekEntryResult!13003)

(assert (=> b!1519334 (= e!847524 (= (seekEntry!0 (select (arr!48832 a!2804) j!70) a!2804 mask!2512) (Found!13003 j!70)))))

(declare-fun b!1519335 () Bool)

(declare-fun e!847523 () Bool)

(declare-fun e!847522 () Bool)

(assert (=> b!1519335 (= e!847523 e!847522)))

(declare-fun res!1039235 () Bool)

(assert (=> b!1519335 (=> res!1039235 e!847522)))

(declare-fun lt!658617 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519335 (= res!1039235 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658617 #b00000000000000000000000000000000) (bvsge lt!658617 (size!49382 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519335 (= lt!658617 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519336 () Bool)

(declare-fun res!1039233 () Bool)

(assert (=> b!1519336 (=> res!1039233 e!847522)))

(assert (=> b!1519336 (= res!1039233 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658617 (select (arr!48832 a!2804) j!70) a!2804 mask!2512) lt!658618)))))

(declare-fun b!1519337 () Bool)

(declare-fun res!1039240 () Bool)

(assert (=> b!1519337 (=> (not res!1039240) (not e!847521))))

(assert (=> b!1519337 (= res!1039240 (validKeyInArray!0 (select (arr!48832 a!2804) j!70)))))

(declare-fun res!1039236 () Bool)

(assert (=> start!129334 (=> (not res!1039236) (not e!847521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129334 (= res!1039236 (validMask!0 mask!2512))))

(assert (=> start!129334 e!847521))

(assert (=> start!129334 true))

(declare-fun array_inv!37860 (array!101190) Bool)

(assert (=> start!129334 (array_inv!37860 a!2804)))

(declare-fun b!1519338 () Bool)

(declare-fun res!1039243 () Bool)

(assert (=> b!1519338 (=> (not res!1039243) (not e!847521))))

(assert (=> b!1519338 (= res!1039243 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49382 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49382 a!2804))))))

(declare-fun b!1519339 () Bool)

(declare-fun res!1039239 () Bool)

(assert (=> b!1519339 (=> (not res!1039239) (not e!847525))))

(assert (=> b!1519339 (= res!1039239 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48832 a!2804) j!70) a!2804 mask!2512) lt!658618))))

(declare-fun b!1519340 () Bool)

(declare-fun e!847520 () Bool)

(assert (=> b!1519340 (= e!847525 e!847520)))

(declare-fun res!1039242 () Bool)

(assert (=> b!1519340 (=> (not res!1039242) (not e!847520))))

(declare-fun lt!658616 () (_ BitVec 64))

(declare-fun lt!658615 () array!101190)

(assert (=> b!1519340 (= res!1039242 (= lt!658612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658616 mask!2512) lt!658616 lt!658615 mask!2512)))))

(assert (=> b!1519340 (= lt!658616 (select (store (arr!48832 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519340 (= lt!658615 (array!101191 (store (arr!48832 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49382 a!2804)))))

(declare-fun b!1519341 () Bool)

(assert (=> b!1519341 (= e!847522 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101190 (_ BitVec 32)) SeekEntryResult!13003)

(assert (=> b!1519341 (= (seekEntryOrOpen!0 (select (arr!48832 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658616 lt!658615 mask!2512))))

(declare-datatypes ((Unit!50874 0))(
  ( (Unit!50875) )
))
(declare-fun lt!658613 () Unit!50874)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50874)

(assert (=> b!1519341 (= lt!658613 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658617 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1519342 () Bool)

(assert (=> b!1519342 (= e!847520 (not e!847523))))

(declare-fun res!1039245 () Bool)

(assert (=> b!1519342 (=> res!1039245 e!847523)))

(assert (=> b!1519342 (= res!1039245 (or (not (= (select (arr!48832 a!2804) j!70) lt!658616)) (= x!534 resX!21)))))

(assert (=> b!1519342 e!847524))

(declare-fun res!1039246 () Bool)

(assert (=> b!1519342 (=> (not res!1039246) (not e!847524))))

(assert (=> b!1519342 (= res!1039246 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658614 () Unit!50874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50874)

(assert (=> b!1519342 (= lt!658614 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519343 () Bool)

(declare-fun res!1039241 () Bool)

(assert (=> b!1519343 (=> (not res!1039241) (not e!847521))))

(declare-datatypes ((List!35315 0))(
  ( (Nil!35312) (Cons!35311 (h!36723 (_ BitVec 64)) (t!50009 List!35315)) )
))
(declare-fun arrayNoDuplicates!0 (array!101190 (_ BitVec 32) List!35315) Bool)

(assert (=> b!1519343 (= res!1039241 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35312))))

(assert (= (and start!129334 res!1039236) b!1519333))

(assert (= (and b!1519333 res!1039237) b!1519332))

(assert (= (and b!1519332 res!1039244) b!1519337))

(assert (= (and b!1519337 res!1039240) b!1519330))

(assert (= (and b!1519330 res!1039238) b!1519343))

(assert (= (and b!1519343 res!1039241) b!1519338))

(assert (= (and b!1519338 res!1039243) b!1519331))

(assert (= (and b!1519331 res!1039234) b!1519339))

(assert (= (and b!1519339 res!1039239) b!1519340))

(assert (= (and b!1519340 res!1039242) b!1519342))

(assert (= (and b!1519342 res!1039246) b!1519334))

(assert (= (and b!1519342 (not res!1039245)) b!1519335))

(assert (= (and b!1519335 (not res!1039235)) b!1519336))

(assert (= (and b!1519336 (not res!1039233)) b!1519341))

(declare-fun m!1402725 () Bool)

(assert (=> b!1519335 m!1402725))

(declare-fun m!1402727 () Bool)

(assert (=> b!1519337 m!1402727))

(assert (=> b!1519337 m!1402727))

(declare-fun m!1402729 () Bool)

(assert (=> b!1519337 m!1402729))

(declare-fun m!1402731 () Bool)

(assert (=> b!1519343 m!1402731))

(assert (=> b!1519334 m!1402727))

(assert (=> b!1519334 m!1402727))

(declare-fun m!1402733 () Bool)

(assert (=> b!1519334 m!1402733))

(declare-fun m!1402735 () Bool)

(assert (=> b!1519330 m!1402735))

(assert (=> b!1519342 m!1402727))

(declare-fun m!1402737 () Bool)

(assert (=> b!1519342 m!1402737))

(declare-fun m!1402739 () Bool)

(assert (=> b!1519342 m!1402739))

(declare-fun m!1402741 () Bool)

(assert (=> b!1519340 m!1402741))

(assert (=> b!1519340 m!1402741))

(declare-fun m!1402743 () Bool)

(assert (=> b!1519340 m!1402743))

(declare-fun m!1402745 () Bool)

(assert (=> b!1519340 m!1402745))

(declare-fun m!1402747 () Bool)

(assert (=> b!1519340 m!1402747))

(assert (=> b!1519331 m!1402727))

(assert (=> b!1519331 m!1402727))

(declare-fun m!1402749 () Bool)

(assert (=> b!1519331 m!1402749))

(assert (=> b!1519331 m!1402749))

(assert (=> b!1519331 m!1402727))

(declare-fun m!1402751 () Bool)

(assert (=> b!1519331 m!1402751))

(assert (=> b!1519336 m!1402727))

(assert (=> b!1519336 m!1402727))

(declare-fun m!1402753 () Bool)

(assert (=> b!1519336 m!1402753))

(assert (=> b!1519339 m!1402727))

(assert (=> b!1519339 m!1402727))

(declare-fun m!1402755 () Bool)

(assert (=> b!1519339 m!1402755))

(assert (=> b!1519341 m!1402727))

(assert (=> b!1519341 m!1402727))

(declare-fun m!1402757 () Bool)

(assert (=> b!1519341 m!1402757))

(declare-fun m!1402759 () Bool)

(assert (=> b!1519341 m!1402759))

(declare-fun m!1402761 () Bool)

(assert (=> b!1519341 m!1402761))

(declare-fun m!1402763 () Bool)

(assert (=> start!129334 m!1402763))

(declare-fun m!1402765 () Bool)

(assert (=> start!129334 m!1402765))

(declare-fun m!1402767 () Bool)

(assert (=> b!1519332 m!1402767))

(assert (=> b!1519332 m!1402767))

(declare-fun m!1402769 () Bool)

(assert (=> b!1519332 m!1402769))

(push 1)

