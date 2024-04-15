; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129044 () Bool)

(assert start!129044)

(declare-fun b!1514325 () Bool)

(declare-fun res!1034447 () Bool)

(declare-fun e!845072 () Bool)

(assert (=> b!1514325 (=> (not res!1034447) (not e!845072))))

(declare-datatypes ((array!100900 0))(
  ( (array!100901 (arr!48688 (Array (_ BitVec 32) (_ BitVec 64))) (size!49240 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100900)

(declare-datatypes ((List!35249 0))(
  ( (Nil!35246) (Cons!35245 (h!36658 (_ BitVec 64)) (t!49935 List!35249)) )
))
(declare-fun arrayNoDuplicates!0 (array!100900 (_ BitVec 32) List!35249) Bool)

(assert (=> b!1514325 (= res!1034447 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35246))))

(declare-fun b!1514326 () Bool)

(declare-fun res!1034441 () Bool)

(assert (=> b!1514326 (=> (not res!1034441) (not e!845072))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514326 (= res!1034441 (validKeyInArray!0 (select (arr!48688 a!2804) i!961)))))

(declare-fun b!1514327 () Bool)

(declare-fun res!1034440 () Bool)

(declare-fun e!845073 () Bool)

(assert (=> b!1514327 (=> (not res!1034440) (not e!845073))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12882 0))(
  ( (MissingZero!12882 (index!53923 (_ BitVec 32))) (Found!12882 (index!53924 (_ BitVec 32))) (Intermediate!12882 (undefined!13694 Bool) (index!53925 (_ BitVec 32)) (x!135634 (_ BitVec 32))) (Undefined!12882) (MissingVacant!12882 (index!53926 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100900 (_ BitVec 32)) SeekEntryResult!12882)

(assert (=> b!1514327 (= res!1034440 (= (seekEntry!0 (select (arr!48688 a!2804) j!70) a!2804 mask!2512) (Found!12882 j!70)))))

(declare-fun res!1034435 () Bool)

(assert (=> start!129044 (=> (not res!1034435) (not e!845072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129044 (= res!1034435 (validMask!0 mask!2512))))

(assert (=> start!129044 e!845072))

(assert (=> start!129044 true))

(declare-fun array_inv!37921 (array!100900) Bool)

(assert (=> start!129044 (array_inv!37921 a!2804)))

(declare-fun b!1514328 () Bool)

(declare-fun e!845070 () Bool)

(assert (=> b!1514328 (= e!845072 e!845070)))

(declare-fun res!1034438 () Bool)

(assert (=> b!1514328 (=> (not res!1034438) (not e!845070))))

(declare-fun lt!656123 () SeekEntryResult!12882)

(declare-fun lt!656120 () SeekEntryResult!12882)

(assert (=> b!1514328 (= res!1034438 (= lt!656123 lt!656120))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514328 (= lt!656120 (Intermediate!12882 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100900 (_ BitVec 32)) SeekEntryResult!12882)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514328 (= lt!656123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48688 a!2804) j!70) mask!2512) (select (arr!48688 a!2804) j!70) a!2804 mask!2512))))

(declare-fun lt!656124 () array!100900)

(declare-fun lt!656122 () (_ BitVec 64))

(declare-fun b!1514329 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun e!845069 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100900 (_ BitVec 32)) SeekEntryResult!12882)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100900 (_ BitVec 32)) SeekEntryResult!12882)

(assert (=> b!1514329 (= e!845069 (= (seekEntryOrOpen!0 lt!656122 lt!656124 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656122 lt!656124 mask!2512)))))

(declare-fun b!1514330 () Bool)

(declare-fun e!845068 () Bool)

(assert (=> b!1514330 (= e!845070 e!845068)))

(declare-fun res!1034445 () Bool)

(assert (=> b!1514330 (=> (not res!1034445) (not e!845068))))

(assert (=> b!1514330 (= res!1034445 (= lt!656123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656122 mask!2512) lt!656122 lt!656124 mask!2512)))))

(assert (=> b!1514330 (= lt!656122 (select (store (arr!48688 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514330 (= lt!656124 (array!100901 (store (arr!48688 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49240 a!2804)))))

(declare-fun b!1514331 () Bool)

(declare-fun e!845071 () Bool)

(assert (=> b!1514331 (= e!845073 e!845071)))

(declare-fun res!1034446 () Bool)

(assert (=> b!1514331 (=> res!1034446 e!845071)))

(assert (=> b!1514331 (= res!1034446 (or (not (= (select (arr!48688 a!2804) j!70) lt!656122)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48688 a!2804) index!487) (select (arr!48688 a!2804) j!70)) (not (= (select (arr!48688 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514332 () Bool)

(assert (=> b!1514332 (= e!845071 e!845069)))

(declare-fun res!1034443 () Bool)

(assert (=> b!1514332 (=> (not res!1034443) (not e!845069))))

(assert (=> b!1514332 (= res!1034443 (= (seekEntryOrOpen!0 (select (arr!48688 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48688 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514333 () Bool)

(declare-fun res!1034444 () Bool)

(assert (=> b!1514333 (=> (not res!1034444) (not e!845072))))

(assert (=> b!1514333 (= res!1034444 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49240 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49240 a!2804))))))

(declare-fun b!1514334 () Bool)

(declare-fun res!1034442 () Bool)

(assert (=> b!1514334 (=> (not res!1034442) (not e!845070))))

(assert (=> b!1514334 (= res!1034442 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48688 a!2804) j!70) a!2804 mask!2512) lt!656120))))

(declare-fun b!1514335 () Bool)

(declare-fun res!1034434 () Bool)

(assert (=> b!1514335 (=> (not res!1034434) (not e!845072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100900 (_ BitVec 32)) Bool)

(assert (=> b!1514335 (= res!1034434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514336 () Bool)

(declare-fun res!1034436 () Bool)

(assert (=> b!1514336 (=> (not res!1034436) (not e!845072))))

(assert (=> b!1514336 (= res!1034436 (and (= (size!49240 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49240 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49240 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514337 () Bool)

(assert (=> b!1514337 (= e!845068 (not true))))

(assert (=> b!1514337 e!845073))

(declare-fun res!1034437 () Bool)

(assert (=> b!1514337 (=> (not res!1034437) (not e!845073))))

(assert (=> b!1514337 (= res!1034437 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50471 0))(
  ( (Unit!50472) )
))
(declare-fun lt!656121 () Unit!50471)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50471)

(assert (=> b!1514337 (= lt!656121 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514338 () Bool)

(declare-fun res!1034439 () Bool)

(assert (=> b!1514338 (=> (not res!1034439) (not e!845072))))

(assert (=> b!1514338 (= res!1034439 (validKeyInArray!0 (select (arr!48688 a!2804) j!70)))))

(assert (= (and start!129044 res!1034435) b!1514336))

(assert (= (and b!1514336 res!1034436) b!1514326))

(assert (= (and b!1514326 res!1034441) b!1514338))

(assert (= (and b!1514338 res!1034439) b!1514335))

(assert (= (and b!1514335 res!1034434) b!1514325))

(assert (= (and b!1514325 res!1034447) b!1514333))

(assert (= (and b!1514333 res!1034444) b!1514328))

(assert (= (and b!1514328 res!1034438) b!1514334))

(assert (= (and b!1514334 res!1034442) b!1514330))

(assert (= (and b!1514330 res!1034445) b!1514337))

(assert (= (and b!1514337 res!1034437) b!1514327))

(assert (= (and b!1514327 res!1034440) b!1514331))

(assert (= (and b!1514331 (not res!1034446)) b!1514332))

(assert (= (and b!1514332 res!1034443) b!1514329))

(declare-fun m!1396733 () Bool)

(assert (=> b!1514331 m!1396733))

(declare-fun m!1396735 () Bool)

(assert (=> b!1514331 m!1396735))

(declare-fun m!1396737 () Bool)

(assert (=> b!1514335 m!1396737))

(assert (=> b!1514334 m!1396733))

(assert (=> b!1514334 m!1396733))

(declare-fun m!1396739 () Bool)

(assert (=> b!1514334 m!1396739))

(assert (=> b!1514338 m!1396733))

(assert (=> b!1514338 m!1396733))

(declare-fun m!1396741 () Bool)

(assert (=> b!1514338 m!1396741))

(assert (=> b!1514328 m!1396733))

(assert (=> b!1514328 m!1396733))

(declare-fun m!1396743 () Bool)

(assert (=> b!1514328 m!1396743))

(assert (=> b!1514328 m!1396743))

(assert (=> b!1514328 m!1396733))

(declare-fun m!1396745 () Bool)

(assert (=> b!1514328 m!1396745))

(assert (=> b!1514332 m!1396733))

(assert (=> b!1514332 m!1396733))

(declare-fun m!1396747 () Bool)

(assert (=> b!1514332 m!1396747))

(assert (=> b!1514332 m!1396733))

(declare-fun m!1396749 () Bool)

(assert (=> b!1514332 m!1396749))

(declare-fun m!1396751 () Bool)

(assert (=> b!1514337 m!1396751))

(declare-fun m!1396753 () Bool)

(assert (=> b!1514337 m!1396753))

(declare-fun m!1396755 () Bool)

(assert (=> b!1514326 m!1396755))

(assert (=> b!1514326 m!1396755))

(declare-fun m!1396757 () Bool)

(assert (=> b!1514326 m!1396757))

(declare-fun m!1396759 () Bool)

(assert (=> b!1514325 m!1396759))

(declare-fun m!1396761 () Bool)

(assert (=> b!1514329 m!1396761))

(declare-fun m!1396763 () Bool)

(assert (=> b!1514329 m!1396763))

(declare-fun m!1396765 () Bool)

(assert (=> b!1514330 m!1396765))

(assert (=> b!1514330 m!1396765))

(declare-fun m!1396767 () Bool)

(assert (=> b!1514330 m!1396767))

(declare-fun m!1396769 () Bool)

(assert (=> b!1514330 m!1396769))

(declare-fun m!1396771 () Bool)

(assert (=> b!1514330 m!1396771))

(declare-fun m!1396773 () Bool)

(assert (=> start!129044 m!1396773))

(declare-fun m!1396775 () Bool)

(assert (=> start!129044 m!1396775))

(assert (=> b!1514327 m!1396733))

(assert (=> b!1514327 m!1396733))

(declare-fun m!1396777 () Bool)

(assert (=> b!1514327 m!1396777))

(check-sat (not b!1514325) (not b!1514327) (not b!1514337) (not b!1514329) (not b!1514334) (not b!1514326) (not b!1514335) (not b!1514332) (not b!1514328) (not b!1514338) (not start!129044) (not b!1514330))
(check-sat)
