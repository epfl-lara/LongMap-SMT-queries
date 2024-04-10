; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128708 () Bool)

(assert start!128708)

(declare-fun b!1508355 () Bool)

(declare-fun res!1028365 () Bool)

(declare-fun e!842677 () Bool)

(assert (=> b!1508355 (=> (not res!1028365) (not e!842677))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100603 0))(
  ( (array!100604 (arr!48540 (Array (_ BitVec 32) (_ BitVec 64))) (size!49090 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100603)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508355 (= res!1028365 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49090 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49090 a!2804))))))

(declare-fun b!1508356 () Bool)

(declare-fun res!1028370 () Bool)

(assert (=> b!1508356 (=> (not res!1028370) (not e!842677))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100603 (_ BitVec 32)) Bool)

(assert (=> b!1508356 (= res!1028370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508357 () Bool)

(declare-fun res!1028366 () Bool)

(assert (=> b!1508357 (=> (not res!1028366) (not e!842677))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508357 (= res!1028366 (validKeyInArray!0 (select (arr!48540 a!2804) i!961)))))

(declare-fun b!1508358 () Bool)

(declare-fun e!842675 () Bool)

(assert (=> b!1508358 (= e!842677 e!842675)))

(declare-fun res!1028364 () Bool)

(assert (=> b!1508358 (=> (not res!1028364) (not e!842675))))

(declare-datatypes ((SeekEntryResult!12711 0))(
  ( (MissingZero!12711 (index!53239 (_ BitVec 32))) (Found!12711 (index!53240 (_ BitVec 32))) (Intermediate!12711 (undefined!13523 Bool) (index!53241 (_ BitVec 32)) (x!134999 (_ BitVec 32))) (Undefined!12711) (MissingVacant!12711 (index!53242 (_ BitVec 32))) )
))
(declare-fun lt!654612 () SeekEntryResult!12711)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100603 (_ BitVec 32)) SeekEntryResult!12711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508358 (= res!1028364 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48540 a!2804) j!70) mask!2512) (select (arr!48540 a!2804) j!70) a!2804 mask!2512) lt!654612))))

(assert (=> b!1508358 (= lt!654612 (Intermediate!12711 false resIndex!21 resX!21))))

(declare-fun res!1028368 () Bool)

(assert (=> start!128708 (=> (not res!1028368) (not e!842677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128708 (= res!1028368 (validMask!0 mask!2512))))

(assert (=> start!128708 e!842677))

(assert (=> start!128708 true))

(declare-fun array_inv!37568 (array!100603) Bool)

(assert (=> start!128708 (array_inv!37568 a!2804)))

(declare-fun b!1508359 () Bool)

(declare-fun res!1028371 () Bool)

(assert (=> b!1508359 (=> (not res!1028371) (not e!842677))))

(declare-datatypes ((List!35023 0))(
  ( (Nil!35020) (Cons!35019 (h!36428 (_ BitVec 64)) (t!49717 List!35023)) )
))
(declare-fun arrayNoDuplicates!0 (array!100603 (_ BitVec 32) List!35023) Bool)

(assert (=> b!1508359 (= res!1028371 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35020))))

(declare-fun b!1508360 () Bool)

(assert (=> b!1508360 (= e!842675 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!654613 () (_ BitVec 32))

(assert (=> b!1508360 (= lt!654613 (toIndex!0 (select (store (arr!48540 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508361 () Bool)

(declare-fun res!1028367 () Bool)

(assert (=> b!1508361 (=> (not res!1028367) (not e!842675))))

(assert (=> b!1508361 (= res!1028367 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48540 a!2804) j!70) a!2804 mask!2512) lt!654612))))

(declare-fun b!1508362 () Bool)

(declare-fun res!1028369 () Bool)

(assert (=> b!1508362 (=> (not res!1028369) (not e!842677))))

(assert (=> b!1508362 (= res!1028369 (and (= (size!49090 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49090 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49090 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508363 () Bool)

(declare-fun res!1028363 () Bool)

(assert (=> b!1508363 (=> (not res!1028363) (not e!842677))))

(assert (=> b!1508363 (= res!1028363 (validKeyInArray!0 (select (arr!48540 a!2804) j!70)))))

(assert (= (and start!128708 res!1028368) b!1508362))

(assert (= (and b!1508362 res!1028369) b!1508357))

(assert (= (and b!1508357 res!1028366) b!1508363))

(assert (= (and b!1508363 res!1028363) b!1508356))

(assert (= (and b!1508356 res!1028370) b!1508359))

(assert (= (and b!1508359 res!1028371) b!1508355))

(assert (= (and b!1508355 res!1028365) b!1508358))

(assert (= (and b!1508358 res!1028364) b!1508361))

(assert (= (and b!1508361 res!1028367) b!1508360))

(declare-fun m!1390859 () Bool)

(assert (=> b!1508359 m!1390859))

(declare-fun m!1390861 () Bool)

(assert (=> b!1508361 m!1390861))

(assert (=> b!1508361 m!1390861))

(declare-fun m!1390863 () Bool)

(assert (=> b!1508361 m!1390863))

(declare-fun m!1390865 () Bool)

(assert (=> start!128708 m!1390865))

(declare-fun m!1390867 () Bool)

(assert (=> start!128708 m!1390867))

(assert (=> b!1508363 m!1390861))

(assert (=> b!1508363 m!1390861))

(declare-fun m!1390869 () Bool)

(assert (=> b!1508363 m!1390869))

(declare-fun m!1390871 () Bool)

(assert (=> b!1508356 m!1390871))

(declare-fun m!1390873 () Bool)

(assert (=> b!1508360 m!1390873))

(declare-fun m!1390875 () Bool)

(assert (=> b!1508360 m!1390875))

(assert (=> b!1508360 m!1390875))

(declare-fun m!1390877 () Bool)

(assert (=> b!1508360 m!1390877))

(declare-fun m!1390879 () Bool)

(assert (=> b!1508357 m!1390879))

(assert (=> b!1508357 m!1390879))

(declare-fun m!1390881 () Bool)

(assert (=> b!1508357 m!1390881))

(assert (=> b!1508358 m!1390861))

(assert (=> b!1508358 m!1390861))

(declare-fun m!1390883 () Bool)

(assert (=> b!1508358 m!1390883))

(assert (=> b!1508358 m!1390883))

(assert (=> b!1508358 m!1390861))

(declare-fun m!1390885 () Bool)

(assert (=> b!1508358 m!1390885))

(check-sat (not b!1508358) (not b!1508359) (not b!1508361) (not b!1508356) (not start!128708) (not b!1508363) (not b!1508357) (not b!1508360))
(check-sat)
