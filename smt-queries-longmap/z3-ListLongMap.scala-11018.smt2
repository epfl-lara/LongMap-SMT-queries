; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129242 () Bool)

(assert start!129242)

(declare-fun b!1513332 () Bool)

(declare-fun res!1032065 () Bool)

(declare-fun e!844980 () Bool)

(assert (=> b!1513332 (=> (not res!1032065) (not e!844980))))

(declare-datatypes ((array!100912 0))(
  ( (array!100913 (arr!48688 (Array (_ BitVec 32) (_ BitVec 64))) (size!49239 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100912)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100912 (_ BitVec 32)) Bool)

(assert (=> b!1513332 (= res!1032065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513333 () Bool)

(declare-fun res!1032058 () Bool)

(assert (=> b!1513333 (=> (not res!1032058) (not e!844980))))

(declare-datatypes ((List!35158 0))(
  ( (Nil!35155) (Cons!35154 (h!36581 (_ BitVec 64)) (t!49844 List!35158)) )
))
(declare-fun arrayNoDuplicates!0 (array!100912 (_ BitVec 32) List!35158) Bool)

(assert (=> b!1513333 (= res!1032058 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35155))))

(declare-fun b!1513334 () Bool)

(declare-fun e!844983 () Bool)

(assert (=> b!1513334 (= e!844983 (not true))))

(declare-fun e!844982 () Bool)

(assert (=> b!1513334 e!844982))

(declare-fun res!1032067 () Bool)

(assert (=> b!1513334 (=> (not res!1032067) (not e!844982))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1513334 (= res!1032067 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50407 0))(
  ( (Unit!50408) )
))
(declare-fun lt!656120 () Unit!50407)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50407)

(assert (=> b!1513334 (= lt!656120 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513335 () Bool)

(declare-datatypes ((SeekEntryResult!12752 0))(
  ( (MissingZero!12752 (index!53403 (_ BitVec 32))) (Found!12752 (index!53404 (_ BitVec 32))) (Intermediate!12752 (undefined!13564 Bool) (index!53405 (_ BitVec 32)) (x!135339 (_ BitVec 32))) (Undefined!12752) (MissingVacant!12752 (index!53406 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100912 (_ BitVec 32)) SeekEntryResult!12752)

(assert (=> b!1513335 (= e!844982 (= (seekEntry!0 (select (arr!48688 a!2804) j!70) a!2804 mask!2512) (Found!12752 j!70)))))

(declare-fun res!1032068 () Bool)

(assert (=> start!129242 (=> (not res!1032068) (not e!844980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129242 (= res!1032068 (validMask!0 mask!2512))))

(assert (=> start!129242 e!844980))

(assert (=> start!129242 true))

(declare-fun array_inv!37969 (array!100912) Bool)

(assert (=> start!129242 (array_inv!37969 a!2804)))

(declare-fun b!1513336 () Bool)

(declare-fun res!1032059 () Bool)

(assert (=> b!1513336 (=> (not res!1032059) (not e!844980))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513336 (= res!1032059 (and (= (size!49239 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49239 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49239 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513337 () Bool)

(declare-fun res!1032063 () Bool)

(assert (=> b!1513337 (=> (not res!1032063) (not e!844980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513337 (= res!1032063 (validKeyInArray!0 (select (arr!48688 a!2804) j!70)))))

(declare-fun b!1513338 () Bool)

(declare-fun res!1032061 () Bool)

(assert (=> b!1513338 (=> (not res!1032061) (not e!844983))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!656121 () SeekEntryResult!12752)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100912 (_ BitVec 32)) SeekEntryResult!12752)

(assert (=> b!1513338 (= res!1032061 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48688 a!2804) j!70) a!2804 mask!2512) lt!656121))))

(declare-fun b!1513339 () Bool)

(declare-fun res!1032060 () Bool)

(assert (=> b!1513339 (=> (not res!1032060) (not e!844980))))

(assert (=> b!1513339 (= res!1032060 (validKeyInArray!0 (select (arr!48688 a!2804) i!961)))))

(declare-fun b!1513340 () Bool)

(declare-fun res!1032064 () Bool)

(assert (=> b!1513340 (=> (not res!1032064) (not e!844983))))

(declare-fun lt!656122 () SeekEntryResult!12752)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513340 (= res!1032064 (= lt!656122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48688 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48688 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100913 (store (arr!48688 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49239 a!2804)) mask!2512)))))

(declare-fun b!1513341 () Bool)

(assert (=> b!1513341 (= e!844980 e!844983)))

(declare-fun res!1032066 () Bool)

(assert (=> b!1513341 (=> (not res!1032066) (not e!844983))))

(assert (=> b!1513341 (= res!1032066 (= lt!656122 lt!656121))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513341 (= lt!656121 (Intermediate!12752 false resIndex!21 resX!21))))

(assert (=> b!1513341 (= lt!656122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48688 a!2804) j!70) mask!2512) (select (arr!48688 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513342 () Bool)

(declare-fun res!1032062 () Bool)

(assert (=> b!1513342 (=> (not res!1032062) (not e!844980))))

(assert (=> b!1513342 (= res!1032062 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49239 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49239 a!2804))))))

(assert (= (and start!129242 res!1032068) b!1513336))

(assert (= (and b!1513336 res!1032059) b!1513339))

(assert (= (and b!1513339 res!1032060) b!1513337))

(assert (= (and b!1513337 res!1032063) b!1513332))

(assert (= (and b!1513332 res!1032065) b!1513333))

(assert (= (and b!1513333 res!1032058) b!1513342))

(assert (= (and b!1513342 res!1032062) b!1513341))

(assert (= (and b!1513341 res!1032066) b!1513338))

(assert (= (and b!1513338 res!1032061) b!1513340))

(assert (= (and b!1513340 res!1032064) b!1513334))

(assert (= (and b!1513334 res!1032067) b!1513335))

(declare-fun m!1395999 () Bool)

(assert (=> b!1513340 m!1395999))

(declare-fun m!1396001 () Bool)

(assert (=> b!1513340 m!1396001))

(assert (=> b!1513340 m!1396001))

(declare-fun m!1396003 () Bool)

(assert (=> b!1513340 m!1396003))

(assert (=> b!1513340 m!1396003))

(assert (=> b!1513340 m!1396001))

(declare-fun m!1396005 () Bool)

(assert (=> b!1513340 m!1396005))

(declare-fun m!1396007 () Bool)

(assert (=> b!1513333 m!1396007))

(declare-fun m!1396009 () Bool)

(assert (=> b!1513341 m!1396009))

(assert (=> b!1513341 m!1396009))

(declare-fun m!1396011 () Bool)

(assert (=> b!1513341 m!1396011))

(assert (=> b!1513341 m!1396011))

(assert (=> b!1513341 m!1396009))

(declare-fun m!1396013 () Bool)

(assert (=> b!1513341 m!1396013))

(declare-fun m!1396015 () Bool)

(assert (=> start!129242 m!1396015))

(declare-fun m!1396017 () Bool)

(assert (=> start!129242 m!1396017))

(declare-fun m!1396019 () Bool)

(assert (=> b!1513332 m!1396019))

(assert (=> b!1513335 m!1396009))

(assert (=> b!1513335 m!1396009))

(declare-fun m!1396021 () Bool)

(assert (=> b!1513335 m!1396021))

(declare-fun m!1396023 () Bool)

(assert (=> b!1513339 m!1396023))

(assert (=> b!1513339 m!1396023))

(declare-fun m!1396025 () Bool)

(assert (=> b!1513339 m!1396025))

(assert (=> b!1513338 m!1396009))

(assert (=> b!1513338 m!1396009))

(declare-fun m!1396027 () Bool)

(assert (=> b!1513338 m!1396027))

(declare-fun m!1396029 () Bool)

(assert (=> b!1513334 m!1396029))

(declare-fun m!1396031 () Bool)

(assert (=> b!1513334 m!1396031))

(assert (=> b!1513337 m!1396009))

(assert (=> b!1513337 m!1396009))

(declare-fun m!1396033 () Bool)

(assert (=> b!1513337 m!1396033))

(check-sat (not b!1513335) (not b!1513337) (not b!1513341) (not b!1513338) (not b!1513340) (not start!129242) (not b!1513339) (not b!1513332) (not b!1513334) (not b!1513333))
(check-sat)
