; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129092 () Bool)

(assert start!129092)

(declare-fun b!1515286 () Bool)

(declare-fun res!1035402 () Bool)

(declare-fun e!845572 () Bool)

(assert (=> b!1515286 (=> (not res!1035402) (not e!845572))))

(declare-datatypes ((array!100948 0))(
  ( (array!100949 (arr!48712 (Array (_ BitVec 32) (_ BitVec 64))) (size!49264 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100948)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100948 (_ BitVec 32)) Bool)

(assert (=> b!1515286 (= res!1035402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1035406 () Bool)

(assert (=> start!129092 (=> (not res!1035406) (not e!845572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129092 (= res!1035406 (validMask!0 mask!2512))))

(assert (=> start!129092 e!845572))

(assert (=> start!129092 true))

(declare-fun array_inv!37945 (array!100948) Bool)

(assert (=> start!129092 (array_inv!37945 a!2804)))

(declare-fun b!1515287 () Bool)

(declare-fun res!1035398 () Bool)

(assert (=> b!1515287 (=> (not res!1035398) (not e!845572))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515287 (= res!1035398 (validKeyInArray!0 (select (arr!48712 a!2804) i!961)))))

(declare-fun b!1515288 () Bool)

(declare-fun e!845574 () Bool)

(declare-fun e!845573 () Bool)

(assert (=> b!1515288 (= e!845574 e!845573)))

(declare-fun res!1035396 () Bool)

(assert (=> b!1515288 (=> (not res!1035396) (not e!845573))))

(declare-fun lt!656715 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12906 0))(
  ( (MissingZero!12906 (index!54019 (_ BitVec 32))) (Found!12906 (index!54020 (_ BitVec 32))) (Intermediate!12906 (undefined!13718 Bool) (index!54021 (_ BitVec 32)) (x!135722 (_ BitVec 32))) (Undefined!12906) (MissingVacant!12906 (index!54022 (_ BitVec 32))) )
))
(declare-fun lt!656720 () SeekEntryResult!12906)

(declare-fun lt!656724 () array!100948)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12906)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515288 (= res!1035396 (= lt!656720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656715 mask!2512) lt!656715 lt!656724 mask!2512)))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1515288 (= lt!656715 (select (store (arr!48712 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515288 (= lt!656724 (array!100949 (store (arr!48712 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49264 a!2804)))))

(declare-fun b!1515289 () Bool)

(declare-fun res!1035407 () Bool)

(assert (=> b!1515289 (=> (not res!1035407) (not e!845574))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!656722 () SeekEntryResult!12906)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1515289 (= res!1035407 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48712 a!2804) j!70) a!2804 mask!2512) lt!656722))))

(declare-fun b!1515290 () Bool)

(declare-fun res!1035401 () Bool)

(assert (=> b!1515290 (=> (not res!1035401) (not e!845572))))

(declare-datatypes ((List!35273 0))(
  ( (Nil!35270) (Cons!35269 (h!36682 (_ BitVec 64)) (t!49959 List!35273)) )
))
(declare-fun arrayNoDuplicates!0 (array!100948 (_ BitVec 32) List!35273) Bool)

(assert (=> b!1515290 (= res!1035401 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35270))))

(declare-fun b!1515291 () Bool)

(declare-fun e!845576 () Bool)

(assert (=> b!1515291 (= e!845573 (not e!845576))))

(declare-fun res!1035400 () Bool)

(assert (=> b!1515291 (=> res!1035400 e!845576)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515291 (= res!1035400 (or (not (= (select (arr!48712 a!2804) j!70) lt!656715)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48712 a!2804) index!487) (select (arr!48712 a!2804) j!70)) (not (= (select (arr!48712 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845571 () Bool)

(assert (=> b!1515291 e!845571))

(declare-fun res!1035405 () Bool)

(assert (=> b!1515291 (=> (not res!1035405) (not e!845571))))

(assert (=> b!1515291 (= res!1035405 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50519 0))(
  ( (Unit!50520) )
))
(declare-fun lt!656716 () Unit!50519)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50519)

(assert (=> b!1515291 (= lt!656716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515292 () Bool)

(declare-fun res!1035395 () Bool)

(assert (=> b!1515292 (=> (not res!1035395) (not e!845572))))

(assert (=> b!1515292 (= res!1035395 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49264 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49264 a!2804))))))

(declare-fun b!1515293 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12906)

(assert (=> b!1515293 (= e!845571 (= (seekEntry!0 (select (arr!48712 a!2804) j!70) a!2804 mask!2512) (Found!12906 j!70)))))

(declare-fun b!1515294 () Bool)

(declare-fun res!1035397 () Bool)

(assert (=> b!1515294 (=> (not res!1035397) (not e!845572))))

(assert (=> b!1515294 (= res!1035397 (and (= (size!49264 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49264 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49264 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515295 () Bool)

(declare-fun e!845575 () Bool)

(assert (=> b!1515295 (= e!845576 e!845575)))

(declare-fun res!1035404 () Bool)

(assert (=> b!1515295 (=> res!1035404 e!845575)))

(declare-fun lt!656723 () SeekEntryResult!12906)

(assert (=> b!1515295 (= res!1035404 (not (= lt!656723 (Found!12906 j!70))))))

(declare-fun lt!656721 () SeekEntryResult!12906)

(declare-fun lt!656719 () SeekEntryResult!12906)

(assert (=> b!1515295 (= lt!656721 lt!656719)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12906)

(assert (=> b!1515295 (= lt!656719 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656715 lt!656724 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12906)

(assert (=> b!1515295 (= lt!656721 (seekEntryOrOpen!0 lt!656715 lt!656724 mask!2512))))

(declare-fun lt!656718 () SeekEntryResult!12906)

(assert (=> b!1515295 (= lt!656718 lt!656723)))

(assert (=> b!1515295 (= lt!656723 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48712 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515295 (= lt!656718 (seekEntryOrOpen!0 (select (arr!48712 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515296 () Bool)

(assert (=> b!1515296 (= e!845572 e!845574)))

(declare-fun res!1035403 () Bool)

(assert (=> b!1515296 (=> (not res!1035403) (not e!845574))))

(assert (=> b!1515296 (= res!1035403 (= lt!656720 lt!656722))))

(assert (=> b!1515296 (= lt!656722 (Intermediate!12906 false resIndex!21 resX!21))))

(assert (=> b!1515296 (= lt!656720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48712 a!2804) j!70) mask!2512) (select (arr!48712 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515297 () Bool)

(declare-fun res!1035399 () Bool)

(assert (=> b!1515297 (=> (not res!1035399) (not e!845572))))

(assert (=> b!1515297 (= res!1035399 (validKeyInArray!0 (select (arr!48712 a!2804) j!70)))))

(declare-fun b!1515298 () Bool)

(assert (=> b!1515298 (= e!845575 (bvsge mask!2512 #b00000000000000000000000000000000))))

(assert (=> b!1515298 (= lt!656719 lt!656723)))

(declare-fun lt!656717 () Unit!50519)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50519)

(assert (=> b!1515298 (= lt!656717 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(assert (= (and start!129092 res!1035406) b!1515294))

(assert (= (and b!1515294 res!1035397) b!1515287))

(assert (= (and b!1515287 res!1035398) b!1515297))

(assert (= (and b!1515297 res!1035399) b!1515286))

(assert (= (and b!1515286 res!1035402) b!1515290))

(assert (= (and b!1515290 res!1035401) b!1515292))

(assert (= (and b!1515292 res!1035395) b!1515296))

(assert (= (and b!1515296 res!1035403) b!1515289))

(assert (= (and b!1515289 res!1035407) b!1515288))

(assert (= (and b!1515288 res!1035396) b!1515291))

(assert (= (and b!1515291 res!1035405) b!1515293))

(assert (= (and b!1515291 (not res!1035400)) b!1515295))

(assert (= (and b!1515295 (not res!1035404)) b!1515298))

(declare-fun m!1397867 () Bool)

(assert (=> b!1515295 m!1397867))

(declare-fun m!1397869 () Bool)

(assert (=> b!1515295 m!1397869))

(declare-fun m!1397871 () Bool)

(assert (=> b!1515295 m!1397871))

(assert (=> b!1515295 m!1397869))

(assert (=> b!1515295 m!1397869))

(declare-fun m!1397873 () Bool)

(assert (=> b!1515295 m!1397873))

(declare-fun m!1397875 () Bool)

(assert (=> b!1515295 m!1397875))

(declare-fun m!1397877 () Bool)

(assert (=> b!1515290 m!1397877))

(declare-fun m!1397879 () Bool)

(assert (=> b!1515298 m!1397879))

(declare-fun m!1397881 () Bool)

(assert (=> start!129092 m!1397881))

(declare-fun m!1397883 () Bool)

(assert (=> start!129092 m!1397883))

(assert (=> b!1515291 m!1397869))

(declare-fun m!1397885 () Bool)

(assert (=> b!1515291 m!1397885))

(declare-fun m!1397887 () Bool)

(assert (=> b!1515291 m!1397887))

(declare-fun m!1397889 () Bool)

(assert (=> b!1515291 m!1397889))

(declare-fun m!1397891 () Bool)

(assert (=> b!1515286 m!1397891))

(declare-fun m!1397893 () Bool)

(assert (=> b!1515287 m!1397893))

(assert (=> b!1515287 m!1397893))

(declare-fun m!1397895 () Bool)

(assert (=> b!1515287 m!1397895))

(declare-fun m!1397897 () Bool)

(assert (=> b!1515288 m!1397897))

(assert (=> b!1515288 m!1397897))

(declare-fun m!1397899 () Bool)

(assert (=> b!1515288 m!1397899))

(declare-fun m!1397901 () Bool)

(assert (=> b!1515288 m!1397901))

(declare-fun m!1397903 () Bool)

(assert (=> b!1515288 m!1397903))

(assert (=> b!1515289 m!1397869))

(assert (=> b!1515289 m!1397869))

(declare-fun m!1397905 () Bool)

(assert (=> b!1515289 m!1397905))

(assert (=> b!1515296 m!1397869))

(assert (=> b!1515296 m!1397869))

(declare-fun m!1397907 () Bool)

(assert (=> b!1515296 m!1397907))

(assert (=> b!1515296 m!1397907))

(assert (=> b!1515296 m!1397869))

(declare-fun m!1397909 () Bool)

(assert (=> b!1515296 m!1397909))

(assert (=> b!1515293 m!1397869))

(assert (=> b!1515293 m!1397869))

(declare-fun m!1397911 () Bool)

(assert (=> b!1515293 m!1397911))

(assert (=> b!1515297 m!1397869))

(assert (=> b!1515297 m!1397869))

(declare-fun m!1397913 () Bool)

(assert (=> b!1515297 m!1397913))

(check-sat (not b!1515293) (not b!1515289) (not b!1515298) (not b!1515288) (not b!1515290) (not b!1515295) (not b!1515297) (not b!1515296) (not b!1515287) (not start!129092) (not b!1515291) (not b!1515286))
(check-sat)
