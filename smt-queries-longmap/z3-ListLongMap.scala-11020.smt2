; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129254 () Bool)

(assert start!129254)

(declare-fun b!1513552 () Bool)

(declare-fun res!1032288 () Bool)

(declare-fun e!845065 () Bool)

(assert (=> b!1513552 (=> (not res!1032288) (not e!845065))))

(declare-datatypes ((array!100924 0))(
  ( (array!100925 (arr!48694 (Array (_ BitVec 32) (_ BitVec 64))) (size!49245 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100924)

(declare-datatypes ((List!35164 0))(
  ( (Nil!35161) (Cons!35160 (h!36587 (_ BitVec 64)) (t!49850 List!35164)) )
))
(declare-fun arrayNoDuplicates!0 (array!100924 (_ BitVec 32) List!35164) Bool)

(assert (=> b!1513552 (= res!1032288 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35161))))

(declare-fun b!1513553 () Bool)

(declare-fun res!1032287 () Bool)

(assert (=> b!1513553 (=> (not res!1032287) (not e!845065))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513553 (= res!1032287 (validKeyInArray!0 (select (arr!48694 a!2804) j!70)))))

(declare-fun res!1032278 () Bool)

(assert (=> start!129254 (=> (not res!1032278) (not e!845065))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129254 (= res!1032278 (validMask!0 mask!2512))))

(assert (=> start!129254 e!845065))

(assert (=> start!129254 true))

(declare-fun array_inv!37975 (array!100924) Bool)

(assert (=> start!129254 (array_inv!37975 a!2804)))

(declare-fun b!1513554 () Bool)

(declare-fun e!845064 () Bool)

(declare-fun e!845066 () Bool)

(assert (=> b!1513554 (= e!845064 e!845066)))

(declare-fun res!1032279 () Bool)

(assert (=> b!1513554 (=> res!1032279 e!845066)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513554 (= res!1032279 (or (not (= (select (arr!48694 a!2804) j!70) (select (store (arr!48694 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48694 a!2804) index!487) (select (arr!48694 a!2804) j!70)) (not (= (select (arr!48694 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513555 () Bool)

(declare-fun e!845063 () Bool)

(assert (=> b!1513555 (= e!845065 e!845063)))

(declare-fun res!1032289 () Bool)

(assert (=> b!1513555 (=> (not res!1032289) (not e!845063))))

(declare-datatypes ((SeekEntryResult!12758 0))(
  ( (MissingZero!12758 (index!53427 (_ BitVec 32))) (Found!12758 (index!53428 (_ BitVec 32))) (Intermediate!12758 (undefined!13570 Bool) (index!53429 (_ BitVec 32)) (x!135361 (_ BitVec 32))) (Undefined!12758) (MissingVacant!12758 (index!53430 (_ BitVec 32))) )
))
(declare-fun lt!656175 () SeekEntryResult!12758)

(declare-fun lt!656176 () SeekEntryResult!12758)

(assert (=> b!1513555 (= res!1032289 (= lt!656175 lt!656176))))

(assert (=> b!1513555 (= lt!656176 (Intermediate!12758 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12758)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513555 (= lt!656175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48694 a!2804) j!70) mask!2512) (select (arr!48694 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513556 () Bool)

(declare-fun res!1032284 () Bool)

(assert (=> b!1513556 (=> (not res!1032284) (not e!845065))))

(assert (=> b!1513556 (= res!1032284 (and (= (size!49245 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49245 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49245 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513557 () Bool)

(declare-fun res!1032282 () Bool)

(assert (=> b!1513557 (=> (not res!1032282) (not e!845065))))

(assert (=> b!1513557 (= res!1032282 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49245 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49245 a!2804))))))

(declare-fun b!1513558 () Bool)

(assert (=> b!1513558 (= e!845063 (not (or (not (= (select (arr!48694 a!2804) j!70) (select (store (arr!48694 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48694 a!2804) index!487) (select (arr!48694 a!2804) j!70)) (not (= (select (arr!48694 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1513558 e!845064))

(declare-fun res!1032285 () Bool)

(assert (=> b!1513558 (=> (not res!1032285) (not e!845064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100924 (_ BitVec 32)) Bool)

(assert (=> b!1513558 (= res!1032285 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50419 0))(
  ( (Unit!50420) )
))
(declare-fun lt!656174 () Unit!50419)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50419)

(assert (=> b!1513558 (= lt!656174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513559 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12758)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12758)

(assert (=> b!1513559 (= e!845066 (= (seekEntryOrOpen!0 (select (arr!48694 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48694 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513560 () Bool)

(declare-fun res!1032286 () Bool)

(assert (=> b!1513560 (=> (not res!1032286) (not e!845064))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12758)

(assert (=> b!1513560 (= res!1032286 (= (seekEntry!0 (select (arr!48694 a!2804) j!70) a!2804 mask!2512) (Found!12758 j!70)))))

(declare-fun b!1513561 () Bool)

(declare-fun res!1032280 () Bool)

(assert (=> b!1513561 (=> (not res!1032280) (not e!845065))))

(assert (=> b!1513561 (= res!1032280 (validKeyInArray!0 (select (arr!48694 a!2804) i!961)))))

(declare-fun b!1513562 () Bool)

(declare-fun res!1032290 () Bool)

(assert (=> b!1513562 (=> (not res!1032290) (not e!845063))))

(assert (=> b!1513562 (= res!1032290 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48694 a!2804) j!70) a!2804 mask!2512) lt!656176))))

(declare-fun b!1513563 () Bool)

(declare-fun res!1032281 () Bool)

(assert (=> b!1513563 (=> (not res!1032281) (not e!845065))))

(assert (=> b!1513563 (= res!1032281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513564 () Bool)

(declare-fun res!1032283 () Bool)

(assert (=> b!1513564 (=> (not res!1032283) (not e!845063))))

(assert (=> b!1513564 (= res!1032283 (= lt!656175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48694 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48694 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100925 (store (arr!48694 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49245 a!2804)) mask!2512)))))

(assert (= (and start!129254 res!1032278) b!1513556))

(assert (= (and b!1513556 res!1032284) b!1513561))

(assert (= (and b!1513561 res!1032280) b!1513553))

(assert (= (and b!1513553 res!1032287) b!1513563))

(assert (= (and b!1513563 res!1032281) b!1513552))

(assert (= (and b!1513552 res!1032288) b!1513557))

(assert (= (and b!1513557 res!1032282) b!1513555))

(assert (= (and b!1513555 res!1032289) b!1513562))

(assert (= (and b!1513562 res!1032290) b!1513564))

(assert (= (and b!1513564 res!1032283) b!1513558))

(assert (= (and b!1513558 res!1032285) b!1513560))

(assert (= (and b!1513560 res!1032286) b!1513554))

(assert (= (and b!1513554 (not res!1032279)) b!1513559))

(declare-fun m!1396233 () Bool)

(assert (=> b!1513554 m!1396233))

(declare-fun m!1396235 () Bool)

(assert (=> b!1513554 m!1396235))

(declare-fun m!1396237 () Bool)

(assert (=> b!1513554 m!1396237))

(declare-fun m!1396239 () Bool)

(assert (=> b!1513554 m!1396239))

(assert (=> b!1513559 m!1396233))

(assert (=> b!1513559 m!1396233))

(declare-fun m!1396241 () Bool)

(assert (=> b!1513559 m!1396241))

(assert (=> b!1513559 m!1396233))

(declare-fun m!1396243 () Bool)

(assert (=> b!1513559 m!1396243))

(assert (=> b!1513555 m!1396233))

(assert (=> b!1513555 m!1396233))

(declare-fun m!1396245 () Bool)

(assert (=> b!1513555 m!1396245))

(assert (=> b!1513555 m!1396245))

(assert (=> b!1513555 m!1396233))

(declare-fun m!1396247 () Bool)

(assert (=> b!1513555 m!1396247))

(assert (=> b!1513564 m!1396235))

(assert (=> b!1513564 m!1396237))

(assert (=> b!1513564 m!1396237))

(declare-fun m!1396249 () Bool)

(assert (=> b!1513564 m!1396249))

(assert (=> b!1513564 m!1396249))

(assert (=> b!1513564 m!1396237))

(declare-fun m!1396251 () Bool)

(assert (=> b!1513564 m!1396251))

(declare-fun m!1396253 () Bool)

(assert (=> b!1513552 m!1396253))

(declare-fun m!1396255 () Bool)

(assert (=> start!129254 m!1396255))

(declare-fun m!1396257 () Bool)

(assert (=> start!129254 m!1396257))

(assert (=> b!1513553 m!1396233))

(assert (=> b!1513553 m!1396233))

(declare-fun m!1396259 () Bool)

(assert (=> b!1513553 m!1396259))

(declare-fun m!1396261 () Bool)

(assert (=> b!1513561 m!1396261))

(assert (=> b!1513561 m!1396261))

(declare-fun m!1396263 () Bool)

(assert (=> b!1513561 m!1396263))

(declare-fun m!1396265 () Bool)

(assert (=> b!1513563 m!1396265))

(assert (=> b!1513560 m!1396233))

(assert (=> b!1513560 m!1396233))

(declare-fun m!1396267 () Bool)

(assert (=> b!1513560 m!1396267))

(assert (=> b!1513562 m!1396233))

(assert (=> b!1513562 m!1396233))

(declare-fun m!1396269 () Bool)

(assert (=> b!1513562 m!1396269))

(assert (=> b!1513558 m!1396233))

(declare-fun m!1396271 () Bool)

(assert (=> b!1513558 m!1396271))

(assert (=> b!1513558 m!1396235))

(assert (=> b!1513558 m!1396239))

(assert (=> b!1513558 m!1396237))

(declare-fun m!1396273 () Bool)

(assert (=> b!1513558 m!1396273))

(check-sat (not b!1513563) (not b!1513553) (not b!1513555) (not b!1513562) (not b!1513552) (not b!1513564) (not b!1513558) (not b!1513560) (not b!1513561) (not b!1513559) (not start!129254))
(check-sat)
