; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129308 () Bool)

(assert start!129308)

(declare-fun b!1514614 () Bool)

(declare-fun e!845480 () Bool)

(declare-fun e!845483 () Bool)

(assert (=> b!1514614 (= e!845480 e!845483)))

(declare-fun res!1033347 () Bool)

(assert (=> b!1514614 (=> res!1033347 e!845483)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100978 0))(
  ( (array!100979 (arr!48721 (Array (_ BitVec 32) (_ BitVec 64))) (size!49272 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100978)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!656419 () (_ BitVec 64))

(assert (=> b!1514614 (= res!1033347 (or (not (= (select (arr!48721 a!2804) j!70) lt!656419)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48721 a!2804) index!487) (select (arr!48721 a!2804) j!70)) (not (= (select (arr!48721 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514615 () Bool)

(declare-fun res!1033350 () Bool)

(declare-fun e!845481 () Bool)

(assert (=> b!1514615 (=> (not res!1033350) (not e!845481))))

(declare-datatypes ((List!35191 0))(
  ( (Nil!35188) (Cons!35187 (h!36614 (_ BitVec 64)) (t!49877 List!35191)) )
))
(declare-fun arrayNoDuplicates!0 (array!100978 (_ BitVec 32) List!35191) Bool)

(assert (=> b!1514615 (= res!1033350 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35188))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun b!1514616 () Bool)

(declare-datatypes ((SeekEntryResult!12785 0))(
  ( (MissingZero!12785 (index!53535 (_ BitVec 32))) (Found!12785 (index!53536 (_ BitVec 32))) (Intermediate!12785 (undefined!13597 Bool) (index!53537 (_ BitVec 32)) (x!135460 (_ BitVec 32))) (Undefined!12785) (MissingVacant!12785 (index!53538 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100978 (_ BitVec 32)) SeekEntryResult!12785)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100978 (_ BitVec 32)) SeekEntryResult!12785)

(assert (=> b!1514616 (= e!845483 (= (seekEntryOrOpen!0 (select (arr!48721 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48721 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514617 () Bool)

(declare-fun e!845484 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514617 (= e!845484 (not (or (not (= (select (arr!48721 a!2804) j!70) lt!656419)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48721 a!2804) index!487) (select (arr!48721 a!2804) j!70)) (not (= (select (arr!48721 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (= (select (store (arr!48721 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1514617 e!845480))

(declare-fun res!1033345 () Bool)

(assert (=> b!1514617 (=> (not res!1033345) (not e!845480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100978 (_ BitVec 32)) Bool)

(assert (=> b!1514617 (= res!1033345 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50473 0))(
  ( (Unit!50474) )
))
(declare-fun lt!656422 () Unit!50473)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50473)

(assert (=> b!1514617 (= lt!656422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514619 () Bool)

(declare-fun res!1033340 () Bool)

(assert (=> b!1514619 (=> (not res!1033340) (not e!845481))))

(assert (=> b!1514619 (= res!1033340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514620 () Bool)

(declare-fun e!845482 () Bool)

(assert (=> b!1514620 (= e!845482 e!845484)))

(declare-fun res!1033346 () Bool)

(assert (=> b!1514620 (=> (not res!1033346) (not e!845484))))

(declare-fun lt!656420 () SeekEntryResult!12785)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100978 (_ BitVec 32)) SeekEntryResult!12785)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514620 (= res!1033346 (= lt!656420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656419 mask!2512) lt!656419 (array!100979 (store (arr!48721 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49272 a!2804)) mask!2512)))))

(assert (=> b!1514620 (= lt!656419 (select (store (arr!48721 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(declare-fun b!1514621 () Bool)

(declare-fun res!1033351 () Bool)

(assert (=> b!1514621 (=> (not res!1033351) (not e!845481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514621 (= res!1033351 (validKeyInArray!0 (select (arr!48721 a!2804) i!961)))))

(declare-fun b!1514622 () Bool)

(assert (=> b!1514622 (= e!845481 e!845482)))

(declare-fun res!1033348 () Bool)

(assert (=> b!1514622 (=> (not res!1033348) (not e!845482))))

(declare-fun lt!656421 () SeekEntryResult!12785)

(assert (=> b!1514622 (= res!1033348 (= lt!656420 lt!656421))))

(assert (=> b!1514622 (= lt!656421 (Intermediate!12785 false resIndex!21 resX!21))))

(assert (=> b!1514622 (= lt!656420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48721 a!2804) j!70) mask!2512) (select (arr!48721 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514623 () Bool)

(declare-fun res!1033344 () Bool)

(assert (=> b!1514623 (=> (not res!1033344) (not e!845481))))

(assert (=> b!1514623 (= res!1033344 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49272 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49272 a!2804))))))

(declare-fun b!1514624 () Bool)

(declare-fun res!1033341 () Bool)

(assert (=> b!1514624 (=> (not res!1033341) (not e!845481))))

(assert (=> b!1514624 (= res!1033341 (and (= (size!49272 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49272 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49272 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514625 () Bool)

(declare-fun res!1033352 () Bool)

(assert (=> b!1514625 (=> (not res!1033352) (not e!845481))))

(assert (=> b!1514625 (= res!1033352 (validKeyInArray!0 (select (arr!48721 a!2804) j!70)))))

(declare-fun b!1514626 () Bool)

(declare-fun res!1033349 () Bool)

(assert (=> b!1514626 (=> (not res!1033349) (not e!845482))))

(assert (=> b!1514626 (= res!1033349 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48721 a!2804) j!70) a!2804 mask!2512) lt!656421))))

(declare-fun res!1033343 () Bool)

(assert (=> start!129308 (=> (not res!1033343) (not e!845481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129308 (= res!1033343 (validMask!0 mask!2512))))

(assert (=> start!129308 e!845481))

(assert (=> start!129308 true))

(declare-fun array_inv!38002 (array!100978) Bool)

(assert (=> start!129308 (array_inv!38002 a!2804)))

(declare-fun b!1514618 () Bool)

(declare-fun res!1033342 () Bool)

(assert (=> b!1514618 (=> (not res!1033342) (not e!845480))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100978 (_ BitVec 32)) SeekEntryResult!12785)

(assert (=> b!1514618 (= res!1033342 (= (seekEntry!0 (select (arr!48721 a!2804) j!70) a!2804 mask!2512) (Found!12785 j!70)))))

(assert (= (and start!129308 res!1033343) b!1514624))

(assert (= (and b!1514624 res!1033341) b!1514621))

(assert (= (and b!1514621 res!1033351) b!1514625))

(assert (= (and b!1514625 res!1033352) b!1514619))

(assert (= (and b!1514619 res!1033340) b!1514615))

(assert (= (and b!1514615 res!1033350) b!1514623))

(assert (= (and b!1514623 res!1033344) b!1514622))

(assert (= (and b!1514622 res!1033348) b!1514626))

(assert (= (and b!1514626 res!1033349) b!1514620))

(assert (= (and b!1514620 res!1033346) b!1514617))

(assert (= (and b!1514617 res!1033345) b!1514618))

(assert (= (and b!1514618 res!1033342) b!1514614))

(assert (= (and b!1514614 (not res!1033347)) b!1514616))

(declare-fun m!1397373 () Bool)

(assert (=> start!129308 m!1397373))

(declare-fun m!1397375 () Bool)

(assert (=> start!129308 m!1397375))

(declare-fun m!1397377 () Bool)

(assert (=> b!1514614 m!1397377))

(declare-fun m!1397379 () Bool)

(assert (=> b!1514614 m!1397379))

(assert (=> b!1514617 m!1397377))

(declare-fun m!1397381 () Bool)

(assert (=> b!1514617 m!1397381))

(declare-fun m!1397383 () Bool)

(assert (=> b!1514617 m!1397383))

(assert (=> b!1514617 m!1397379))

(declare-fun m!1397385 () Bool)

(assert (=> b!1514617 m!1397385))

(declare-fun m!1397387 () Bool)

(assert (=> b!1514617 m!1397387))

(declare-fun m!1397389 () Bool)

(assert (=> b!1514621 m!1397389))

(assert (=> b!1514621 m!1397389))

(declare-fun m!1397391 () Bool)

(assert (=> b!1514621 m!1397391))

(declare-fun m!1397393 () Bool)

(assert (=> b!1514615 m!1397393))

(assert (=> b!1514622 m!1397377))

(assert (=> b!1514622 m!1397377))

(declare-fun m!1397395 () Bool)

(assert (=> b!1514622 m!1397395))

(assert (=> b!1514622 m!1397395))

(assert (=> b!1514622 m!1397377))

(declare-fun m!1397397 () Bool)

(assert (=> b!1514622 m!1397397))

(assert (=> b!1514625 m!1397377))

(assert (=> b!1514625 m!1397377))

(declare-fun m!1397399 () Bool)

(assert (=> b!1514625 m!1397399))

(assert (=> b!1514626 m!1397377))

(assert (=> b!1514626 m!1397377))

(declare-fun m!1397401 () Bool)

(assert (=> b!1514626 m!1397401))

(declare-fun m!1397403 () Bool)

(assert (=> b!1514619 m!1397403))

(assert (=> b!1514616 m!1397377))

(assert (=> b!1514616 m!1397377))

(declare-fun m!1397405 () Bool)

(assert (=> b!1514616 m!1397405))

(assert (=> b!1514616 m!1397377))

(declare-fun m!1397407 () Bool)

(assert (=> b!1514616 m!1397407))

(declare-fun m!1397409 () Bool)

(assert (=> b!1514620 m!1397409))

(assert (=> b!1514620 m!1397383))

(assert (=> b!1514620 m!1397409))

(declare-fun m!1397411 () Bool)

(assert (=> b!1514620 m!1397411))

(declare-fun m!1397413 () Bool)

(assert (=> b!1514620 m!1397413))

(assert (=> b!1514618 m!1397377))

(assert (=> b!1514618 m!1397377))

(declare-fun m!1397415 () Bool)

(assert (=> b!1514618 m!1397415))

(check-sat (not b!1514626) (not b!1514625) (not b!1514621) (not b!1514622) (not b!1514616) (not b!1514615) (not b!1514618) (not b!1514619) (not b!1514620) (not start!129308) (not b!1514617))
(check-sat)
