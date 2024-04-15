; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129086 () Bool)

(assert start!129086)

(declare-fun b!1515169 () Bool)

(declare-fun e!845513 () Bool)

(declare-fun e!845508 () Bool)

(assert (=> b!1515169 (= e!845513 (not e!845508))))

(declare-fun res!1035278 () Bool)

(assert (=> b!1515169 (=> res!1035278 e!845508)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!656634 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100942 0))(
  ( (array!100943 (arr!48709 (Array (_ BitVec 32) (_ BitVec 64))) (size!49261 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100942)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515169 (= res!1035278 (or (not (= (select (arr!48709 a!2804) j!70) lt!656634)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48709 a!2804) index!487) (select (arr!48709 a!2804) j!70)) (not (= (select (arr!48709 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845511 () Bool)

(assert (=> b!1515169 e!845511))

(declare-fun res!1035279 () Bool)

(assert (=> b!1515169 (=> (not res!1035279) (not e!845511))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100942 (_ BitVec 32)) Bool)

(assert (=> b!1515169 (= res!1035279 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50513 0))(
  ( (Unit!50514) )
))
(declare-fun lt!656631 () Unit!50513)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50513)

(assert (=> b!1515169 (= lt!656631 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515170 () Bool)

(declare-fun e!845514 () Bool)

(assert (=> b!1515170 (= e!845514 e!845513)))

(declare-fun res!1035281 () Bool)

(assert (=> b!1515170 (=> (not res!1035281) (not e!845513))))

(declare-fun lt!656630 () array!100942)

(declare-datatypes ((SeekEntryResult!12903 0))(
  ( (MissingZero!12903 (index!54007 (_ BitVec 32))) (Found!12903 (index!54008 (_ BitVec 32))) (Intermediate!12903 (undefined!13715 Bool) (index!54009 (_ BitVec 32)) (x!135711 (_ BitVec 32))) (Undefined!12903) (MissingVacant!12903 (index!54010 (_ BitVec 32))) )
))
(declare-fun lt!656625 () SeekEntryResult!12903)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12903)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515170 (= res!1035281 (= lt!656625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656634 mask!2512) lt!656634 lt!656630 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515170 (= lt!656634 (select (store (arr!48709 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515170 (= lt!656630 (array!100943 (store (arr!48709 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49261 a!2804)))))

(declare-fun b!1515171 () Bool)

(declare-fun res!1035288 () Bool)

(declare-fun e!845510 () Bool)

(assert (=> b!1515171 (=> (not res!1035288) (not e!845510))))

(assert (=> b!1515171 (= res!1035288 (and (= (size!49261 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49261 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49261 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515172 () Bool)

(assert (=> b!1515172 (= e!845510 e!845514)))

(declare-fun res!1035289 () Bool)

(assert (=> b!1515172 (=> (not res!1035289) (not e!845514))))

(declare-fun lt!656633 () SeekEntryResult!12903)

(assert (=> b!1515172 (= res!1035289 (= lt!656625 lt!656633))))

(assert (=> b!1515172 (= lt!656633 (Intermediate!12903 false resIndex!21 resX!21))))

(assert (=> b!1515172 (= lt!656625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48709 a!2804) j!70) mask!2512) (select (arr!48709 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515173 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12903)

(assert (=> b!1515173 (= e!845511 (= (seekEntry!0 (select (arr!48709 a!2804) j!70) a!2804 mask!2512) (Found!12903 j!70)))))

(declare-fun b!1515174 () Bool)

(declare-fun res!1035286 () Bool)

(assert (=> b!1515174 (=> (not res!1035286) (not e!845510))))

(assert (=> b!1515174 (= res!1035286 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49261 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49261 a!2804))))))

(declare-fun res!1035290 () Bool)

(assert (=> start!129086 (=> (not res!1035290) (not e!845510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129086 (= res!1035290 (validMask!0 mask!2512))))

(assert (=> start!129086 e!845510))

(assert (=> start!129086 true))

(declare-fun array_inv!37942 (array!100942) Bool)

(assert (=> start!129086 (array_inv!37942 a!2804)))

(declare-fun b!1515175 () Bool)

(declare-fun res!1035287 () Bool)

(assert (=> b!1515175 (=> (not res!1035287) (not e!845510))))

(assert (=> b!1515175 (= res!1035287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515176 () Bool)

(declare-fun e!845509 () Bool)

(assert (=> b!1515176 (= e!845509 true)))

(declare-fun lt!656627 () SeekEntryResult!12903)

(declare-fun lt!656628 () SeekEntryResult!12903)

(assert (=> b!1515176 (= lt!656627 lt!656628)))

(declare-fun lt!656632 () Unit!50513)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50513)

(assert (=> b!1515176 (= lt!656632 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515177 () Bool)

(declare-fun res!1035285 () Bool)

(assert (=> b!1515177 (=> (not res!1035285) (not e!845510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515177 (= res!1035285 (validKeyInArray!0 (select (arr!48709 a!2804) j!70)))))

(declare-fun b!1515178 () Bool)

(declare-fun res!1035283 () Bool)

(assert (=> b!1515178 (=> (not res!1035283) (not e!845514))))

(assert (=> b!1515178 (= res!1035283 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48709 a!2804) j!70) a!2804 mask!2512) lt!656633))))

(declare-fun b!1515179 () Bool)

(assert (=> b!1515179 (= e!845508 e!845509)))

(declare-fun res!1035284 () Bool)

(assert (=> b!1515179 (=> res!1035284 e!845509)))

(assert (=> b!1515179 (= res!1035284 (not (= lt!656628 (Found!12903 j!70))))))

(declare-fun lt!656626 () SeekEntryResult!12903)

(assert (=> b!1515179 (= lt!656626 lt!656627)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12903)

(assert (=> b!1515179 (= lt!656627 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656634 lt!656630 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12903)

(assert (=> b!1515179 (= lt!656626 (seekEntryOrOpen!0 lt!656634 lt!656630 mask!2512))))

(declare-fun lt!656629 () SeekEntryResult!12903)

(assert (=> b!1515179 (= lt!656629 lt!656628)))

(assert (=> b!1515179 (= lt!656628 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48709 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515179 (= lt!656629 (seekEntryOrOpen!0 (select (arr!48709 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515180 () Bool)

(declare-fun res!1035280 () Bool)

(assert (=> b!1515180 (=> (not res!1035280) (not e!845510))))

(declare-datatypes ((List!35270 0))(
  ( (Nil!35267) (Cons!35266 (h!36679 (_ BitVec 64)) (t!49956 List!35270)) )
))
(declare-fun arrayNoDuplicates!0 (array!100942 (_ BitVec 32) List!35270) Bool)

(assert (=> b!1515180 (= res!1035280 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35267))))

(declare-fun b!1515181 () Bool)

(declare-fun res!1035282 () Bool)

(assert (=> b!1515181 (=> (not res!1035282) (not e!845510))))

(assert (=> b!1515181 (= res!1035282 (validKeyInArray!0 (select (arr!48709 a!2804) i!961)))))

(assert (= (and start!129086 res!1035290) b!1515171))

(assert (= (and b!1515171 res!1035288) b!1515181))

(assert (= (and b!1515181 res!1035282) b!1515177))

(assert (= (and b!1515177 res!1035285) b!1515175))

(assert (= (and b!1515175 res!1035287) b!1515180))

(assert (= (and b!1515180 res!1035280) b!1515174))

(assert (= (and b!1515174 res!1035286) b!1515172))

(assert (= (and b!1515172 res!1035289) b!1515178))

(assert (= (and b!1515178 res!1035283) b!1515170))

(assert (= (and b!1515170 res!1035281) b!1515169))

(assert (= (and b!1515169 res!1035279) b!1515173))

(assert (= (and b!1515169 (not res!1035278)) b!1515179))

(assert (= (and b!1515179 (not res!1035284)) b!1515176))

(declare-fun m!1397723 () Bool)

(assert (=> start!129086 m!1397723))

(declare-fun m!1397725 () Bool)

(assert (=> start!129086 m!1397725))

(declare-fun m!1397727 () Bool)

(assert (=> b!1515177 m!1397727))

(assert (=> b!1515177 m!1397727))

(declare-fun m!1397729 () Bool)

(assert (=> b!1515177 m!1397729))

(assert (=> b!1515172 m!1397727))

(assert (=> b!1515172 m!1397727))

(declare-fun m!1397731 () Bool)

(assert (=> b!1515172 m!1397731))

(assert (=> b!1515172 m!1397731))

(assert (=> b!1515172 m!1397727))

(declare-fun m!1397733 () Bool)

(assert (=> b!1515172 m!1397733))

(assert (=> b!1515169 m!1397727))

(declare-fun m!1397735 () Bool)

(assert (=> b!1515169 m!1397735))

(declare-fun m!1397737 () Bool)

(assert (=> b!1515169 m!1397737))

(declare-fun m!1397739 () Bool)

(assert (=> b!1515169 m!1397739))

(declare-fun m!1397741 () Bool)

(assert (=> b!1515176 m!1397741))

(assert (=> b!1515178 m!1397727))

(assert (=> b!1515178 m!1397727))

(declare-fun m!1397743 () Bool)

(assert (=> b!1515178 m!1397743))

(assert (=> b!1515173 m!1397727))

(assert (=> b!1515173 m!1397727))

(declare-fun m!1397745 () Bool)

(assert (=> b!1515173 m!1397745))

(declare-fun m!1397747 () Bool)

(assert (=> b!1515180 m!1397747))

(declare-fun m!1397749 () Bool)

(assert (=> b!1515175 m!1397749))

(assert (=> b!1515179 m!1397727))

(declare-fun m!1397751 () Bool)

(assert (=> b!1515179 m!1397751))

(assert (=> b!1515179 m!1397727))

(declare-fun m!1397753 () Bool)

(assert (=> b!1515179 m!1397753))

(declare-fun m!1397755 () Bool)

(assert (=> b!1515179 m!1397755))

(assert (=> b!1515179 m!1397727))

(declare-fun m!1397757 () Bool)

(assert (=> b!1515179 m!1397757))

(declare-fun m!1397759 () Bool)

(assert (=> b!1515181 m!1397759))

(assert (=> b!1515181 m!1397759))

(declare-fun m!1397761 () Bool)

(assert (=> b!1515181 m!1397761))

(declare-fun m!1397763 () Bool)

(assert (=> b!1515170 m!1397763))

(assert (=> b!1515170 m!1397763))

(declare-fun m!1397765 () Bool)

(assert (=> b!1515170 m!1397765))

(declare-fun m!1397767 () Bool)

(assert (=> b!1515170 m!1397767))

(declare-fun m!1397769 () Bool)

(assert (=> b!1515170 m!1397769))

(check-sat (not b!1515181) (not b!1515169) (not b!1515175) (not b!1515177) (not b!1515180) (not b!1515178) (not b!1515179) (not start!129086) (not b!1515172) (not b!1515170) (not b!1515173) (not b!1515176))
(check-sat)
