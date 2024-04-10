; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128574 () Bool)

(assert start!128574)

(declare-fun b!1507329 () Bool)

(declare-fun res!1027547 () Bool)

(declare-fun e!842231 () Bool)

(assert (=> b!1507329 (=> (not res!1027547) (not e!842231))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100547 0))(
  ( (array!100548 (arr!48515 (Array (_ BitVec 32) (_ BitVec 64))) (size!49065 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100547)

(assert (=> b!1507329 (= res!1027547 (and (= (size!49065 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49065 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49065 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1027553 () Bool)

(assert (=> start!128574 (=> (not res!1027553) (not e!842231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128574 (= res!1027553 (validMask!0 mask!2512))))

(assert (=> start!128574 e!842231))

(assert (=> start!128574 true))

(declare-fun array_inv!37543 (array!100547) Bool)

(assert (=> start!128574 (array_inv!37543 a!2804)))

(declare-fun b!1507330 () Bool)

(declare-fun res!1027555 () Bool)

(assert (=> b!1507330 (=> (not res!1027555) (not e!842231))))

(declare-datatypes ((List!34998 0))(
  ( (Nil!34995) (Cons!34994 (h!36397 (_ BitVec 64)) (t!49692 List!34998)) )
))
(declare-fun arrayNoDuplicates!0 (array!100547 (_ BitVec 32) List!34998) Bool)

(assert (=> b!1507330 (= res!1027555 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34995))))

(declare-fun b!1507331 () Bool)

(declare-fun res!1027552 () Bool)

(assert (=> b!1507331 (=> (not res!1027552) (not e!842231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100547 (_ BitVec 32)) Bool)

(assert (=> b!1507331 (= res!1027552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507332 () Bool)

(declare-fun e!842232 () Bool)

(assert (=> b!1507332 (= e!842232 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1507333 () Bool)

(assert (=> b!1507333 (= e!842231 e!842232)))

(declare-fun res!1027554 () Bool)

(assert (=> b!1507333 (=> (not res!1027554) (not e!842232))))

(declare-datatypes ((SeekEntryResult!12686 0))(
  ( (MissingZero!12686 (index!53139 (_ BitVec 32))) (Found!12686 (index!53140 (_ BitVec 32))) (Intermediate!12686 (undefined!13498 Bool) (index!53141 (_ BitVec 32)) (x!134898 (_ BitVec 32))) (Undefined!12686) (MissingVacant!12686 (index!53142 (_ BitVec 32))) )
))
(declare-fun lt!654376 () SeekEntryResult!12686)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100547 (_ BitVec 32)) SeekEntryResult!12686)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507333 (= res!1027554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48515 a!2804) j!70) mask!2512) (select (arr!48515 a!2804) j!70) a!2804 mask!2512) lt!654376))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507333 (= lt!654376 (Intermediate!12686 false resIndex!21 resX!21))))

(declare-fun b!1507334 () Bool)

(declare-fun res!1027551 () Bool)

(assert (=> b!1507334 (=> (not res!1027551) (not e!842231))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507334 (= res!1027551 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49065 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49065 a!2804))))))

(declare-fun b!1507335 () Bool)

(declare-fun res!1027549 () Bool)

(assert (=> b!1507335 (=> (not res!1027549) (not e!842231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507335 (= res!1027549 (validKeyInArray!0 (select (arr!48515 a!2804) i!961)))))

(declare-fun b!1507336 () Bool)

(declare-fun res!1027548 () Bool)

(assert (=> b!1507336 (=> (not res!1027548) (not e!842232))))

(assert (=> b!1507336 (= res!1027548 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48515 a!2804) j!70) a!2804 mask!2512) lt!654376))))

(declare-fun b!1507337 () Bool)

(declare-fun res!1027550 () Bool)

(assert (=> b!1507337 (=> (not res!1027550) (not e!842231))))

(assert (=> b!1507337 (= res!1027550 (validKeyInArray!0 (select (arr!48515 a!2804) j!70)))))

(assert (= (and start!128574 res!1027553) b!1507329))

(assert (= (and b!1507329 res!1027547) b!1507335))

(assert (= (and b!1507335 res!1027549) b!1507337))

(assert (= (and b!1507337 res!1027550) b!1507331))

(assert (= (and b!1507331 res!1027552) b!1507330))

(assert (= (and b!1507330 res!1027555) b!1507334))

(assert (= (and b!1507334 res!1027551) b!1507333))

(assert (= (and b!1507333 res!1027554) b!1507336))

(assert (= (and b!1507336 res!1027548) b!1507332))

(declare-fun m!1390093 () Bool)

(assert (=> b!1507336 m!1390093))

(assert (=> b!1507336 m!1390093))

(declare-fun m!1390095 () Bool)

(assert (=> b!1507336 m!1390095))

(assert (=> b!1507337 m!1390093))

(assert (=> b!1507337 m!1390093))

(declare-fun m!1390097 () Bool)

(assert (=> b!1507337 m!1390097))

(declare-fun m!1390099 () Bool)

(assert (=> start!128574 m!1390099))

(declare-fun m!1390101 () Bool)

(assert (=> start!128574 m!1390101))

(assert (=> b!1507333 m!1390093))

(assert (=> b!1507333 m!1390093))

(declare-fun m!1390103 () Bool)

(assert (=> b!1507333 m!1390103))

(assert (=> b!1507333 m!1390103))

(assert (=> b!1507333 m!1390093))

(declare-fun m!1390105 () Bool)

(assert (=> b!1507333 m!1390105))

(declare-fun m!1390107 () Bool)

(assert (=> b!1507335 m!1390107))

(assert (=> b!1507335 m!1390107))

(declare-fun m!1390109 () Bool)

(assert (=> b!1507335 m!1390109))

(declare-fun m!1390111 () Bool)

(assert (=> b!1507330 m!1390111))

(declare-fun m!1390113 () Bool)

(assert (=> b!1507331 m!1390113))

(push 1)

