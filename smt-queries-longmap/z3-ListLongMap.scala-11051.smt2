; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129140 () Bool)

(assert start!129140)

(declare-fun b!1515548 () Bool)

(declare-fun e!845746 () Bool)

(declare-fun e!845749 () Bool)

(assert (=> b!1515548 (= e!845746 e!845749)))

(declare-fun res!1035463 () Bool)

(assert (=> b!1515548 (=> (not res!1035463) (not e!845749))))

(declare-datatypes ((SeekEntryResult!12906 0))(
  ( (MissingZero!12906 (index!54019 (_ BitVec 32))) (Found!12906 (index!54020 (_ BitVec 32))) (Intermediate!12906 (undefined!13718 Bool) (index!54021 (_ BitVec 32)) (x!135720 (_ BitVec 32))) (Undefined!12906) (MissingVacant!12906 (index!54022 (_ BitVec 32))) )
))
(declare-fun lt!656953 () SeekEntryResult!12906)

(declare-fun lt!656958 () SeekEntryResult!12906)

(assert (=> b!1515548 (= res!1035463 (= lt!656953 lt!656958))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515548 (= lt!656958 (Intermediate!12906 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100996 0))(
  ( (array!100997 (arr!48735 (Array (_ BitVec 32) (_ BitVec 64))) (size!49285 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100996)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100996 (_ BitVec 32)) SeekEntryResult!12906)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515548 (= lt!656953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48735 a!2804) j!70) mask!2512) (select (arr!48735 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515549 () Bool)

(declare-fun res!1035460 () Bool)

(assert (=> b!1515549 (=> (not res!1035460) (not e!845746))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1515549 (= res!1035460 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49285 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49285 a!2804))))))

(declare-fun b!1515550 () Bool)

(declare-fun res!1035459 () Bool)

(assert (=> b!1515550 (=> (not res!1035459) (not e!845746))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515550 (= res!1035459 (and (= (size!49285 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49285 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49285 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515551 () Bool)

(declare-fun e!845748 () Bool)

(declare-fun e!845744 () Bool)

(assert (=> b!1515551 (= e!845748 e!845744)))

(declare-fun res!1035456 () Bool)

(assert (=> b!1515551 (=> res!1035456 e!845744)))

(declare-fun lt!656959 () SeekEntryResult!12906)

(assert (=> b!1515551 (= res!1035456 (not (= lt!656959 (Found!12906 j!70))))))

(declare-fun lt!656954 () SeekEntryResult!12906)

(declare-fun lt!656955 () SeekEntryResult!12906)

(assert (=> b!1515551 (= lt!656954 lt!656955)))

(declare-fun lt!656952 () (_ BitVec 64))

(declare-fun lt!656951 () array!100996)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100996 (_ BitVec 32)) SeekEntryResult!12906)

(assert (=> b!1515551 (= lt!656955 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656952 lt!656951 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100996 (_ BitVec 32)) SeekEntryResult!12906)

(assert (=> b!1515551 (= lt!656954 (seekEntryOrOpen!0 lt!656952 lt!656951 mask!2512))))

(declare-fun lt!656957 () SeekEntryResult!12906)

(assert (=> b!1515551 (= lt!656957 lt!656959)))

(assert (=> b!1515551 (= lt!656959 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48735 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515551 (= lt!656957 (seekEntryOrOpen!0 (select (arr!48735 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515553 () Bool)

(declare-fun res!1035452 () Bool)

(assert (=> b!1515553 (=> (not res!1035452) (not e!845749))))

(assert (=> b!1515553 (= res!1035452 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48735 a!2804) j!70) a!2804 mask!2512) lt!656958))))

(declare-fun b!1515554 () Bool)

(declare-fun e!845743 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100996 (_ BitVec 32)) SeekEntryResult!12906)

(assert (=> b!1515554 (= e!845743 (= (seekEntry!0 (select (arr!48735 a!2804) j!70) a!2804 mask!2512) (Found!12906 j!70)))))

(declare-fun b!1515555 () Bool)

(declare-fun res!1035455 () Bool)

(assert (=> b!1515555 (=> (not res!1035455) (not e!845746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515555 (= res!1035455 (validKeyInArray!0 (select (arr!48735 a!2804) j!70)))))

(declare-fun b!1515556 () Bool)

(declare-fun e!845745 () Bool)

(assert (=> b!1515556 (= e!845749 e!845745)))

(declare-fun res!1035458 () Bool)

(assert (=> b!1515556 (=> (not res!1035458) (not e!845745))))

(assert (=> b!1515556 (= res!1035458 (= lt!656953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656952 mask!2512) lt!656952 lt!656951 mask!2512)))))

(assert (=> b!1515556 (= lt!656952 (select (store (arr!48735 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515556 (= lt!656951 (array!100997 (store (arr!48735 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49285 a!2804)))))

(declare-fun b!1515557 () Bool)

(assert (=> b!1515557 (= e!845745 (not e!845748))))

(declare-fun res!1035451 () Bool)

(assert (=> b!1515557 (=> res!1035451 e!845748)))

(assert (=> b!1515557 (= res!1035451 (or (not (= (select (arr!48735 a!2804) j!70) lt!656952)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48735 a!2804) index!487) (select (arr!48735 a!2804) j!70)) (not (= (select (arr!48735 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515557 e!845743))

(declare-fun res!1035454 () Bool)

(assert (=> b!1515557 (=> (not res!1035454) (not e!845743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100996 (_ BitVec 32)) Bool)

(assert (=> b!1515557 (= res!1035454 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50680 0))(
  ( (Unit!50681) )
))
(declare-fun lt!656950 () Unit!50680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50680)

(assert (=> b!1515557 (= lt!656950 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515558 () Bool)

(declare-fun res!1035462 () Bool)

(assert (=> b!1515558 (=> (not res!1035462) (not e!845746))))

(declare-datatypes ((List!35218 0))(
  ( (Nil!35215) (Cons!35214 (h!36626 (_ BitVec 64)) (t!49912 List!35218)) )
))
(declare-fun arrayNoDuplicates!0 (array!100996 (_ BitVec 32) List!35218) Bool)

(assert (=> b!1515558 (= res!1035462 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35215))))

(declare-fun res!1035461 () Bool)

(assert (=> start!129140 (=> (not res!1035461) (not e!845746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129140 (= res!1035461 (validMask!0 mask!2512))))

(assert (=> start!129140 e!845746))

(assert (=> start!129140 true))

(declare-fun array_inv!37763 (array!100996) Bool)

(assert (=> start!129140 (array_inv!37763 a!2804)))

(declare-fun b!1515552 () Bool)

(assert (=> b!1515552 (= e!845744 true)))

(assert (=> b!1515552 (= lt!656955 lt!656959)))

(declare-fun lt!656956 () Unit!50680)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50680)

(assert (=> b!1515552 (= lt!656956 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515559 () Bool)

(declare-fun res!1035457 () Bool)

(assert (=> b!1515559 (=> (not res!1035457) (not e!845746))))

(assert (=> b!1515559 (= res!1035457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515560 () Bool)

(declare-fun res!1035453 () Bool)

(assert (=> b!1515560 (=> (not res!1035453) (not e!845746))))

(assert (=> b!1515560 (= res!1035453 (validKeyInArray!0 (select (arr!48735 a!2804) i!961)))))

(assert (= (and start!129140 res!1035461) b!1515550))

(assert (= (and b!1515550 res!1035459) b!1515560))

(assert (= (and b!1515560 res!1035453) b!1515555))

(assert (= (and b!1515555 res!1035455) b!1515559))

(assert (= (and b!1515559 res!1035457) b!1515558))

(assert (= (and b!1515558 res!1035462) b!1515549))

(assert (= (and b!1515549 res!1035460) b!1515548))

(assert (= (and b!1515548 res!1035463) b!1515553))

(assert (= (and b!1515553 res!1035452) b!1515556))

(assert (= (and b!1515556 res!1035458) b!1515557))

(assert (= (and b!1515557 res!1035454) b!1515554))

(assert (= (and b!1515557 (not res!1035451)) b!1515551))

(assert (= (and b!1515551 (not res!1035456)) b!1515552))

(declare-fun m!1398679 () Bool)

(assert (=> b!1515557 m!1398679))

(declare-fun m!1398681 () Bool)

(assert (=> b!1515557 m!1398681))

(declare-fun m!1398683 () Bool)

(assert (=> b!1515557 m!1398683))

(declare-fun m!1398685 () Bool)

(assert (=> b!1515557 m!1398685))

(declare-fun m!1398687 () Bool)

(assert (=> b!1515556 m!1398687))

(assert (=> b!1515556 m!1398687))

(declare-fun m!1398689 () Bool)

(assert (=> b!1515556 m!1398689))

(declare-fun m!1398691 () Bool)

(assert (=> b!1515556 m!1398691))

(declare-fun m!1398693 () Bool)

(assert (=> b!1515556 m!1398693))

(assert (=> b!1515555 m!1398679))

(assert (=> b!1515555 m!1398679))

(declare-fun m!1398695 () Bool)

(assert (=> b!1515555 m!1398695))

(assert (=> b!1515554 m!1398679))

(assert (=> b!1515554 m!1398679))

(declare-fun m!1398697 () Bool)

(assert (=> b!1515554 m!1398697))

(declare-fun m!1398699 () Bool)

(assert (=> b!1515552 m!1398699))

(declare-fun m!1398701 () Bool)

(assert (=> start!129140 m!1398701))

(declare-fun m!1398703 () Bool)

(assert (=> start!129140 m!1398703))

(declare-fun m!1398705 () Bool)

(assert (=> b!1515560 m!1398705))

(assert (=> b!1515560 m!1398705))

(declare-fun m!1398707 () Bool)

(assert (=> b!1515560 m!1398707))

(assert (=> b!1515553 m!1398679))

(assert (=> b!1515553 m!1398679))

(declare-fun m!1398709 () Bool)

(assert (=> b!1515553 m!1398709))

(declare-fun m!1398711 () Bool)

(assert (=> b!1515559 m!1398711))

(declare-fun m!1398713 () Bool)

(assert (=> b!1515558 m!1398713))

(assert (=> b!1515548 m!1398679))

(assert (=> b!1515548 m!1398679))

(declare-fun m!1398715 () Bool)

(assert (=> b!1515548 m!1398715))

(assert (=> b!1515548 m!1398715))

(assert (=> b!1515548 m!1398679))

(declare-fun m!1398717 () Bool)

(assert (=> b!1515548 m!1398717))

(assert (=> b!1515551 m!1398679))

(declare-fun m!1398719 () Bool)

(assert (=> b!1515551 m!1398719))

(assert (=> b!1515551 m!1398679))

(declare-fun m!1398721 () Bool)

(assert (=> b!1515551 m!1398721))

(assert (=> b!1515551 m!1398679))

(declare-fun m!1398723 () Bool)

(assert (=> b!1515551 m!1398723))

(declare-fun m!1398725 () Bool)

(assert (=> b!1515551 m!1398725))

(check-sat (not b!1515548) (not b!1515552) (not b!1515558) (not start!129140) (not b!1515551) (not b!1515560) (not b!1515556) (not b!1515555) (not b!1515559) (not b!1515557) (not b!1515553) (not b!1515554))
(check-sat)
