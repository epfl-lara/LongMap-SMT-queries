; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129134 () Bool)

(assert start!129134)

(declare-fun e!844324 () Bool)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((array!100804 0))(
  ( (array!100805 (arr!48634 (Array (_ BitVec 32) (_ BitVec 64))) (size!49185 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100804)

(declare-fun b!1511541 () Bool)

(assert (=> b!1511541 (= e!844324 (not (or (not (= (select (arr!48634 a!2804) j!70) (select (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48634 a!2804) index!487) (select (arr!48634 a!2804) j!70))) (not (= j!70 index!487)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!844326 () Bool)

(assert (=> b!1511541 e!844326))

(declare-fun res!1030268 () Bool)

(assert (=> b!1511541 (=> (not res!1030268) (not e!844326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100804 (_ BitVec 32)) Bool)

(assert (=> b!1511541 (= res!1030268 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50299 0))(
  ( (Unit!50300) )
))
(declare-fun lt!655634 () Unit!50299)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50299)

(assert (=> b!1511541 (= lt!655634 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511542 () Bool)

(declare-datatypes ((SeekEntryResult!12698 0))(
  ( (MissingZero!12698 (index!53187 (_ BitVec 32))) (Found!12698 (index!53188 (_ BitVec 32))) (Intermediate!12698 (undefined!13510 Bool) (index!53189 (_ BitVec 32)) (x!135141 (_ BitVec 32))) (Undefined!12698) (MissingVacant!12698 (index!53190 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100804 (_ BitVec 32)) SeekEntryResult!12698)

(assert (=> b!1511542 (= e!844326 (= (seekEntry!0 (select (arr!48634 a!2804) j!70) a!2804 mask!2512) (Found!12698 j!70)))))

(declare-fun b!1511543 () Bool)

(declare-fun res!1030267 () Bool)

(declare-fun e!844325 () Bool)

(assert (=> b!1511543 (=> (not res!1030267) (not e!844325))))

(declare-datatypes ((List!35104 0))(
  ( (Nil!35101) (Cons!35100 (h!36527 (_ BitVec 64)) (t!49790 List!35104)) )
))
(declare-fun arrayNoDuplicates!0 (array!100804 (_ BitVec 32) List!35104) Bool)

(assert (=> b!1511543 (= res!1030267 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35101))))

(declare-fun b!1511544 () Bool)

(declare-fun res!1030273 () Bool)

(assert (=> b!1511544 (=> (not res!1030273) (not e!844325))))

(assert (=> b!1511544 (= res!1030273 (and (= (size!49185 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49185 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49185 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511545 () Bool)

(declare-fun res!1030271 () Bool)

(assert (=> b!1511545 (=> (not res!1030271) (not e!844325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511545 (= res!1030271 (validKeyInArray!0 (select (arr!48634 a!2804) j!70)))))

(declare-fun b!1511546 () Bool)

(declare-fun res!1030272 () Bool)

(assert (=> b!1511546 (=> (not res!1030272) (not e!844324))))

(declare-fun lt!655635 () SeekEntryResult!12698)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100804 (_ BitVec 32)) SeekEntryResult!12698)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511546 (= res!1030272 (= lt!655635 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100805 (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49185 a!2804)) mask!2512)))))

(declare-fun b!1511547 () Bool)

(assert (=> b!1511547 (= e!844325 e!844324)))

(declare-fun res!1030277 () Bool)

(assert (=> b!1511547 (=> (not res!1030277) (not e!844324))))

(declare-fun lt!655636 () SeekEntryResult!12698)

(assert (=> b!1511547 (= res!1030277 (= lt!655635 lt!655636))))

(assert (=> b!1511547 (= lt!655636 (Intermediate!12698 false resIndex!21 resX!21))))

(assert (=> b!1511547 (= lt!655635 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48634 a!2804) j!70) mask!2512) (select (arr!48634 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511548 () Bool)

(declare-fun res!1030276 () Bool)

(assert (=> b!1511548 (=> (not res!1030276) (not e!844324))))

(assert (=> b!1511548 (= res!1030276 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48634 a!2804) j!70) a!2804 mask!2512) lt!655636))))

(declare-fun b!1511549 () Bool)

(declare-fun res!1030270 () Bool)

(assert (=> b!1511549 (=> (not res!1030270) (not e!844325))))

(assert (=> b!1511549 (= res!1030270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511550 () Bool)

(declare-fun res!1030269 () Bool)

(assert (=> b!1511550 (=> (not res!1030269) (not e!844325))))

(assert (=> b!1511550 (= res!1030269 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49185 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49185 a!2804))))))

(declare-fun res!1030274 () Bool)

(assert (=> start!129134 (=> (not res!1030274) (not e!844325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129134 (= res!1030274 (validMask!0 mask!2512))))

(assert (=> start!129134 e!844325))

(assert (=> start!129134 true))

(declare-fun array_inv!37915 (array!100804) Bool)

(assert (=> start!129134 (array_inv!37915 a!2804)))

(declare-fun b!1511551 () Bool)

(declare-fun res!1030275 () Bool)

(assert (=> b!1511551 (=> (not res!1030275) (not e!844325))))

(assert (=> b!1511551 (= res!1030275 (validKeyInArray!0 (select (arr!48634 a!2804) i!961)))))

(assert (= (and start!129134 res!1030274) b!1511544))

(assert (= (and b!1511544 res!1030273) b!1511551))

(assert (= (and b!1511551 res!1030275) b!1511545))

(assert (= (and b!1511545 res!1030271) b!1511549))

(assert (= (and b!1511549 res!1030270) b!1511543))

(assert (= (and b!1511543 res!1030267) b!1511550))

(assert (= (and b!1511550 res!1030269) b!1511547))

(assert (= (and b!1511547 res!1030277) b!1511548))

(assert (= (and b!1511548 res!1030276) b!1511546))

(assert (= (and b!1511546 res!1030272) b!1511541))

(assert (= (and b!1511541 res!1030268) b!1511542))

(declare-fun m!1394013 () Bool)

(assert (=> b!1511549 m!1394013))

(declare-fun m!1394015 () Bool)

(assert (=> b!1511547 m!1394015))

(assert (=> b!1511547 m!1394015))

(declare-fun m!1394017 () Bool)

(assert (=> b!1511547 m!1394017))

(assert (=> b!1511547 m!1394017))

(assert (=> b!1511547 m!1394015))

(declare-fun m!1394019 () Bool)

(assert (=> b!1511547 m!1394019))

(assert (=> b!1511542 m!1394015))

(assert (=> b!1511542 m!1394015))

(declare-fun m!1394021 () Bool)

(assert (=> b!1511542 m!1394021))

(assert (=> b!1511548 m!1394015))

(assert (=> b!1511548 m!1394015))

(declare-fun m!1394023 () Bool)

(assert (=> b!1511548 m!1394023))

(assert (=> b!1511541 m!1394015))

(declare-fun m!1394025 () Bool)

(assert (=> b!1511541 m!1394025))

(declare-fun m!1394027 () Bool)

(assert (=> b!1511541 m!1394027))

(declare-fun m!1394029 () Bool)

(assert (=> b!1511541 m!1394029))

(declare-fun m!1394031 () Bool)

(assert (=> b!1511541 m!1394031))

(declare-fun m!1394033 () Bool)

(assert (=> b!1511541 m!1394033))

(declare-fun m!1394035 () Bool)

(assert (=> b!1511551 m!1394035))

(assert (=> b!1511551 m!1394035))

(declare-fun m!1394037 () Bool)

(assert (=> b!1511551 m!1394037))

(declare-fun m!1394039 () Bool)

(assert (=> start!129134 m!1394039))

(declare-fun m!1394041 () Bool)

(assert (=> start!129134 m!1394041))

(assert (=> b!1511546 m!1394027))

(assert (=> b!1511546 m!1394031))

(assert (=> b!1511546 m!1394031))

(declare-fun m!1394043 () Bool)

(assert (=> b!1511546 m!1394043))

(assert (=> b!1511546 m!1394043))

(assert (=> b!1511546 m!1394031))

(declare-fun m!1394045 () Bool)

(assert (=> b!1511546 m!1394045))

(assert (=> b!1511545 m!1394015))

(assert (=> b!1511545 m!1394015))

(declare-fun m!1394047 () Bool)

(assert (=> b!1511545 m!1394047))

(declare-fun m!1394049 () Bool)

(assert (=> b!1511543 m!1394049))

(check-sat (not b!1511551) (not b!1511549) (not start!129134) (not b!1511547) (not b!1511541) (not b!1511543) (not b!1511545) (not b!1511548) (not b!1511542) (not b!1511546))
(check-sat)
