; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128930 () Bool)

(assert start!128930)

(declare-fun b!1511335 () Bool)

(declare-fun res!1031247 () Bool)

(declare-fun e!843787 () Bool)

(assert (=> b!1511335 (=> (not res!1031247) (not e!843787))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100786 0))(
  ( (array!100787 (arr!48630 (Array (_ BitVec 32) (_ BitVec 64))) (size!49180 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100786)

(assert (=> b!1511335 (= res!1031247 (and (= (size!49180 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49180 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49180 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!843785 () Bool)

(declare-fun b!1511336 () Bool)

(declare-datatypes ((SeekEntryResult!12801 0))(
  ( (MissingZero!12801 (index!53599 (_ BitVec 32))) (Found!12801 (index!53600 (_ BitVec 32))) (Intermediate!12801 (undefined!13613 Bool) (index!53601 (_ BitVec 32)) (x!135335 (_ BitVec 32))) (Undefined!12801) (MissingVacant!12801 (index!53602 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100786 (_ BitVec 32)) SeekEntryResult!12801)

(assert (=> b!1511336 (= e!843785 (= (seekEntry!0 (select (arr!48630 a!2804) j!70) a!2804 mask!2512) (Found!12801 j!70)))))

(declare-fun b!1511337 () Bool)

(declare-fun res!1031245 () Bool)

(assert (=> b!1511337 (=> (not res!1031245) (not e!843787))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511337 (= res!1031245 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49180 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49180 a!2804))))))

(declare-fun b!1511338 () Bool)

(declare-fun e!843784 () Bool)

(assert (=> b!1511338 (= e!843787 e!843784)))

(declare-fun res!1031240 () Bool)

(assert (=> b!1511338 (=> (not res!1031240) (not e!843784))))

(declare-fun lt!655414 () SeekEntryResult!12801)

(declare-fun lt!655412 () SeekEntryResult!12801)

(assert (=> b!1511338 (= res!1031240 (= lt!655414 lt!655412))))

(assert (=> b!1511338 (= lt!655412 (Intermediate!12801 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100786 (_ BitVec 32)) SeekEntryResult!12801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511338 (= lt!655414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48630 a!2804) j!70) mask!2512) (select (arr!48630 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511339 () Bool)

(declare-fun res!1031241 () Bool)

(assert (=> b!1511339 (=> (not res!1031241) (not e!843787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100786 (_ BitVec 32)) Bool)

(assert (=> b!1511339 (= res!1031241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1031243 () Bool)

(assert (=> start!128930 (=> (not res!1031243) (not e!843787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128930 (= res!1031243 (validMask!0 mask!2512))))

(assert (=> start!128930 e!843787))

(assert (=> start!128930 true))

(declare-fun array_inv!37658 (array!100786) Bool)

(assert (=> start!128930 (array_inv!37658 a!2804)))

(declare-fun b!1511340 () Bool)

(assert (=> b!1511340 (= e!843784 (not true))))

(assert (=> b!1511340 e!843785))

(declare-fun res!1031239 () Bool)

(assert (=> b!1511340 (=> (not res!1031239) (not e!843785))))

(assert (=> b!1511340 (= res!1031239 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50470 0))(
  ( (Unit!50471) )
))
(declare-fun lt!655413 () Unit!50470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50470)

(assert (=> b!1511340 (= lt!655413 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511341 () Bool)

(declare-fun res!1031246 () Bool)

(assert (=> b!1511341 (=> (not res!1031246) (not e!843787))))

(declare-datatypes ((List!35113 0))(
  ( (Nil!35110) (Cons!35109 (h!36521 (_ BitVec 64)) (t!49807 List!35113)) )
))
(declare-fun arrayNoDuplicates!0 (array!100786 (_ BitVec 32) List!35113) Bool)

(assert (=> b!1511341 (= res!1031246 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35110))))

(declare-fun b!1511342 () Bool)

(declare-fun res!1031242 () Bool)

(assert (=> b!1511342 (=> (not res!1031242) (not e!843787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511342 (= res!1031242 (validKeyInArray!0 (select (arr!48630 a!2804) i!961)))))

(declare-fun b!1511343 () Bool)

(declare-fun res!1031238 () Bool)

(assert (=> b!1511343 (=> (not res!1031238) (not e!843784))))

(assert (=> b!1511343 (= res!1031238 (= lt!655414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48630 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48630 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100787 (store (arr!48630 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49180 a!2804)) mask!2512)))))

(declare-fun b!1511344 () Bool)

(declare-fun res!1031244 () Bool)

(assert (=> b!1511344 (=> (not res!1031244) (not e!843784))))

(assert (=> b!1511344 (= res!1031244 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48630 a!2804) j!70) a!2804 mask!2512) lt!655412))))

(declare-fun b!1511345 () Bool)

(declare-fun res!1031248 () Bool)

(assert (=> b!1511345 (=> (not res!1031248) (not e!843787))))

(assert (=> b!1511345 (= res!1031248 (validKeyInArray!0 (select (arr!48630 a!2804) j!70)))))

(assert (= (and start!128930 res!1031243) b!1511335))

(assert (= (and b!1511335 res!1031247) b!1511342))

(assert (= (and b!1511342 res!1031242) b!1511345))

(assert (= (and b!1511345 res!1031248) b!1511339))

(assert (= (and b!1511339 res!1031241) b!1511341))

(assert (= (and b!1511341 res!1031246) b!1511337))

(assert (= (and b!1511337 res!1031245) b!1511338))

(assert (= (and b!1511338 res!1031240) b!1511344))

(assert (= (and b!1511344 res!1031244) b!1511343))

(assert (= (and b!1511343 res!1031238) b!1511340))

(assert (= (and b!1511340 res!1031239) b!1511336))

(declare-fun m!1394023 () Bool)

(assert (=> b!1511340 m!1394023))

(declare-fun m!1394025 () Bool)

(assert (=> b!1511340 m!1394025))

(declare-fun m!1394027 () Bool)

(assert (=> b!1511342 m!1394027))

(assert (=> b!1511342 m!1394027))

(declare-fun m!1394029 () Bool)

(assert (=> b!1511342 m!1394029))

(declare-fun m!1394031 () Bool)

(assert (=> b!1511339 m!1394031))

(declare-fun m!1394033 () Bool)

(assert (=> b!1511338 m!1394033))

(assert (=> b!1511338 m!1394033))

(declare-fun m!1394035 () Bool)

(assert (=> b!1511338 m!1394035))

(assert (=> b!1511338 m!1394035))

(assert (=> b!1511338 m!1394033))

(declare-fun m!1394037 () Bool)

(assert (=> b!1511338 m!1394037))

(declare-fun m!1394039 () Bool)

(assert (=> b!1511343 m!1394039))

(declare-fun m!1394041 () Bool)

(assert (=> b!1511343 m!1394041))

(assert (=> b!1511343 m!1394041))

(declare-fun m!1394043 () Bool)

(assert (=> b!1511343 m!1394043))

(assert (=> b!1511343 m!1394043))

(assert (=> b!1511343 m!1394041))

(declare-fun m!1394045 () Bool)

(assert (=> b!1511343 m!1394045))

(assert (=> b!1511345 m!1394033))

(assert (=> b!1511345 m!1394033))

(declare-fun m!1394047 () Bool)

(assert (=> b!1511345 m!1394047))

(declare-fun m!1394049 () Bool)

(assert (=> start!128930 m!1394049))

(declare-fun m!1394051 () Bool)

(assert (=> start!128930 m!1394051))

(assert (=> b!1511344 m!1394033))

(assert (=> b!1511344 m!1394033))

(declare-fun m!1394053 () Bool)

(assert (=> b!1511344 m!1394053))

(declare-fun m!1394055 () Bool)

(assert (=> b!1511341 m!1394055))

(assert (=> b!1511336 m!1394033))

(assert (=> b!1511336 m!1394033))

(declare-fun m!1394057 () Bool)

(assert (=> b!1511336 m!1394057))

(check-sat (not b!1511339) (not b!1511342) (not b!1511343) (not b!1511341) (not b!1511338) (not b!1511345) (not b!1511340) (not b!1511336) (not start!128930) (not b!1511344))
(check-sat)
