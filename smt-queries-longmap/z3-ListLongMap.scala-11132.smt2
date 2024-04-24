; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130470 () Bool)

(assert start!130470)

(declare-fun b!1529026 () Bool)

(declare-fun res!1045583 () Bool)

(declare-fun e!852397 () Bool)

(assert (=> b!1529026 (=> (not res!1045583) (not e!852397))))

(declare-datatypes ((array!101620 0))(
  ( (array!101621 (arr!49030 (Array (_ BitVec 32) (_ BitVec 64))) (size!49581 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101620)

(declare-datatypes ((List!35500 0))(
  ( (Nil!35497) (Cons!35496 (h!36947 (_ BitVec 64)) (t!50186 List!35500)) )
))
(declare-fun arrayNoDuplicates!0 (array!101620 (_ BitVec 32) List!35500) Bool)

(assert (=> b!1529026 (= res!1045583 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35497))))

(declare-fun b!1529027 () Bool)

(declare-fun e!852400 () Bool)

(assert (=> b!1529027 (= e!852400 (not true))))

(declare-fun e!852398 () Bool)

(assert (=> b!1529027 e!852398))

(declare-fun res!1045575 () Bool)

(assert (=> b!1529027 (=> (not res!1045575) (not e!852398))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101620 (_ BitVec 32)) Bool)

(assert (=> b!1529027 (= res!1045575 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50995 0))(
  ( (Unit!50996) )
))
(declare-fun lt!662057 () Unit!50995)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50995)

(assert (=> b!1529027 (= lt!662057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529028 () Bool)

(declare-fun res!1045580 () Bool)

(assert (=> b!1529028 (=> (not res!1045580) (not e!852398))))

(declare-datatypes ((SeekEntryResult!13088 0))(
  ( (MissingZero!13088 (index!54747 (_ BitVec 32))) (Found!13088 (index!54748 (_ BitVec 32))) (Intermediate!13088 (undefined!13900 Bool) (index!54749 (_ BitVec 32)) (x!136653 (_ BitVec 32))) (Undefined!13088) (MissingVacant!13088 (index!54750 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101620 (_ BitVec 32)) SeekEntryResult!13088)

(assert (=> b!1529028 (= res!1045580 (= (seekEntry!0 (select (arr!49030 a!2804) j!70) a!2804 mask!2512) (Found!13088 j!70)))))

(declare-fun b!1529029 () Bool)

(declare-fun res!1045586 () Bool)

(declare-fun e!852401 () Bool)

(assert (=> b!1529029 (=> (not res!1045586) (not e!852401))))

(declare-fun lt!662054 () SeekEntryResult!13088)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101620 (_ BitVec 32)) SeekEntryResult!13088)

(assert (=> b!1529029 (= res!1045586 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49030 a!2804) j!70) a!2804 mask!2512) lt!662054))))

(declare-fun b!1529030 () Bool)

(assert (=> b!1529030 (= e!852401 e!852400)))

(declare-fun res!1045578 () Bool)

(assert (=> b!1529030 (=> (not res!1045578) (not e!852400))))

(declare-fun lt!662058 () array!101620)

(declare-fun lt!662056 () SeekEntryResult!13088)

(declare-fun lt!662055 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529030 (= res!1045578 (= lt!662056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662055 mask!2512) lt!662055 lt!662058 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529030 (= lt!662055 (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1529030 (= lt!662058 (array!101621 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49581 a!2804)))))

(declare-fun b!1529031 () Bool)

(declare-fun res!1045587 () Bool)

(assert (=> b!1529031 (=> (not res!1045587) (not e!852397))))

(assert (=> b!1529031 (= res!1045587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529032 () Bool)

(declare-fun res!1045579 () Bool)

(assert (=> b!1529032 (=> (not res!1045579) (not e!852397))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529032 (= res!1045579 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49581 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49581 a!2804))))))

(declare-fun b!1529033 () Bool)

(declare-fun res!1045574 () Bool)

(assert (=> b!1529033 (=> (not res!1045574) (not e!852397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529033 (= res!1045574 (validKeyInArray!0 (select (arr!49030 a!2804) i!961)))))

(declare-fun res!1045576 () Bool)

(assert (=> start!130470 (=> (not res!1045576) (not e!852397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130470 (= res!1045576 (validMask!0 mask!2512))))

(assert (=> start!130470 e!852397))

(assert (=> start!130470 true))

(declare-fun array_inv!38311 (array!101620) Bool)

(assert (=> start!130470 (array_inv!38311 a!2804)))

(declare-fun b!1529034 () Bool)

(declare-fun res!1045582 () Bool)

(assert (=> b!1529034 (=> (not res!1045582) (not e!852397))))

(assert (=> b!1529034 (= res!1045582 (validKeyInArray!0 (select (arr!49030 a!2804) j!70)))))

(declare-fun b!1529035 () Bool)

(assert (=> b!1529035 (= e!852397 e!852401)))

(declare-fun res!1045584 () Bool)

(assert (=> b!1529035 (=> (not res!1045584) (not e!852401))))

(assert (=> b!1529035 (= res!1045584 (= lt!662056 lt!662054))))

(assert (=> b!1529035 (= lt!662054 (Intermediate!13088 false resIndex!21 resX!21))))

(assert (=> b!1529035 (= lt!662056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49030 a!2804) j!70) mask!2512) (select (arr!49030 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529036 () Bool)

(declare-fun e!852399 () Bool)

(assert (=> b!1529036 (= e!852398 e!852399)))

(declare-fun res!1045585 () Bool)

(assert (=> b!1529036 (=> res!1045585 e!852399)))

(assert (=> b!1529036 (= res!1045585 (or (not (= (select (arr!49030 a!2804) j!70) lt!662055)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49030 a!2804) index!487) (select (arr!49030 a!2804) j!70)) (not (= (select (arr!49030 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1529037 () Bool)

(declare-fun res!1045581 () Bool)

(assert (=> b!1529037 (=> (not res!1045581) (not e!852397))))

(assert (=> b!1529037 (= res!1045581 (and (= (size!49581 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49581 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49581 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529038 () Bool)

(declare-fun e!852403 () Bool)

(assert (=> b!1529038 (= e!852399 e!852403)))

(declare-fun res!1045577 () Bool)

(assert (=> b!1529038 (=> (not res!1045577) (not e!852403))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101620 (_ BitVec 32)) SeekEntryResult!13088)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101620 (_ BitVec 32)) SeekEntryResult!13088)

(assert (=> b!1529038 (= res!1045577 (= (seekEntryOrOpen!0 (select (arr!49030 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49030 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1529039 () Bool)

(assert (=> b!1529039 (= e!852403 (= (seekEntryOrOpen!0 lt!662055 lt!662058 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662055 lt!662058 mask!2512)))))

(assert (= (and start!130470 res!1045576) b!1529037))

(assert (= (and b!1529037 res!1045581) b!1529033))

(assert (= (and b!1529033 res!1045574) b!1529034))

(assert (= (and b!1529034 res!1045582) b!1529031))

(assert (= (and b!1529031 res!1045587) b!1529026))

(assert (= (and b!1529026 res!1045583) b!1529032))

(assert (= (and b!1529032 res!1045579) b!1529035))

(assert (= (and b!1529035 res!1045584) b!1529029))

(assert (= (and b!1529029 res!1045586) b!1529030))

(assert (= (and b!1529030 res!1045578) b!1529027))

(assert (= (and b!1529027 res!1045575) b!1529028))

(assert (= (and b!1529028 res!1045580) b!1529036))

(assert (= (and b!1529036 (not res!1045585)) b!1529038))

(assert (= (and b!1529038 res!1045577) b!1529039))

(declare-fun m!1411705 () Bool)

(assert (=> b!1529036 m!1411705))

(declare-fun m!1411707 () Bool)

(assert (=> b!1529036 m!1411707))

(declare-fun m!1411709 () Bool)

(assert (=> b!1529031 m!1411709))

(declare-fun m!1411711 () Bool)

(assert (=> start!130470 m!1411711))

(declare-fun m!1411713 () Bool)

(assert (=> start!130470 m!1411713))

(declare-fun m!1411715 () Bool)

(assert (=> b!1529026 m!1411715))

(assert (=> b!1529034 m!1411705))

(assert (=> b!1529034 m!1411705))

(declare-fun m!1411717 () Bool)

(assert (=> b!1529034 m!1411717))

(assert (=> b!1529028 m!1411705))

(assert (=> b!1529028 m!1411705))

(declare-fun m!1411719 () Bool)

(assert (=> b!1529028 m!1411719))

(declare-fun m!1411721 () Bool)

(assert (=> b!1529039 m!1411721))

(declare-fun m!1411723 () Bool)

(assert (=> b!1529039 m!1411723))

(declare-fun m!1411725 () Bool)

(assert (=> b!1529030 m!1411725))

(assert (=> b!1529030 m!1411725))

(declare-fun m!1411727 () Bool)

(assert (=> b!1529030 m!1411727))

(declare-fun m!1411729 () Bool)

(assert (=> b!1529030 m!1411729))

(declare-fun m!1411731 () Bool)

(assert (=> b!1529030 m!1411731))

(declare-fun m!1411733 () Bool)

(assert (=> b!1529033 m!1411733))

(assert (=> b!1529033 m!1411733))

(declare-fun m!1411735 () Bool)

(assert (=> b!1529033 m!1411735))

(declare-fun m!1411737 () Bool)

(assert (=> b!1529027 m!1411737))

(declare-fun m!1411739 () Bool)

(assert (=> b!1529027 m!1411739))

(assert (=> b!1529038 m!1411705))

(assert (=> b!1529038 m!1411705))

(declare-fun m!1411741 () Bool)

(assert (=> b!1529038 m!1411741))

(assert (=> b!1529038 m!1411705))

(declare-fun m!1411743 () Bool)

(assert (=> b!1529038 m!1411743))

(assert (=> b!1529029 m!1411705))

(assert (=> b!1529029 m!1411705))

(declare-fun m!1411745 () Bool)

(assert (=> b!1529029 m!1411745))

(assert (=> b!1529035 m!1411705))

(assert (=> b!1529035 m!1411705))

(declare-fun m!1411747 () Bool)

(assert (=> b!1529035 m!1411747))

(assert (=> b!1529035 m!1411747))

(assert (=> b!1529035 m!1411705))

(declare-fun m!1411749 () Bool)

(assert (=> b!1529035 m!1411749))

(check-sat (not start!130470) (not b!1529034) (not b!1529027) (not b!1529035) (not b!1529028) (not b!1529031) (not b!1529033) (not b!1529029) (not b!1529039) (not b!1529030) (not b!1529038) (not b!1529026))
(check-sat)
