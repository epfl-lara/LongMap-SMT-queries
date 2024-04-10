; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128886 () Bool)

(assert start!128886)

(declare-fun b!1510609 () Bool)

(declare-fun res!1030522 () Bool)

(declare-fun e!843520 () Bool)

(assert (=> b!1510609 (=> (not res!1030522) (not e!843520))))

(declare-datatypes ((array!100742 0))(
  ( (array!100743 (arr!48608 (Array (_ BitVec 32) (_ BitVec 64))) (size!49158 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100742)

(declare-datatypes ((List!35091 0))(
  ( (Nil!35088) (Cons!35087 (h!36499 (_ BitVec 64)) (t!49785 List!35091)) )
))
(declare-fun arrayNoDuplicates!0 (array!100742 (_ BitVec 32) List!35091) Bool)

(assert (=> b!1510609 (= res!1030522 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35088))))

(declare-fun b!1510610 () Bool)

(declare-fun res!1030517 () Bool)

(assert (=> b!1510610 (=> (not res!1030517) (not e!843520))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510610 (= res!1030517 (validKeyInArray!0 (select (arr!48608 a!2804) i!961)))))

(declare-fun b!1510611 () Bool)

(declare-fun res!1030516 () Bool)

(assert (=> b!1510611 (=> (not res!1030516) (not e!843520))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1510611 (= res!1030516 (and (= (size!49158 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49158 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49158 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1030515 () Bool)

(assert (=> start!128886 (=> (not res!1030515) (not e!843520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128886 (= res!1030515 (validMask!0 mask!2512))))

(assert (=> start!128886 e!843520))

(assert (=> start!128886 true))

(declare-fun array_inv!37636 (array!100742) Bool)

(assert (=> start!128886 (array_inv!37636 a!2804)))

(declare-fun b!1510612 () Bool)

(declare-fun res!1030513 () Bool)

(assert (=> b!1510612 (=> (not res!1030513) (not e!843520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100742 (_ BitVec 32)) Bool)

(assert (=> b!1510612 (= res!1030513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510613 () Bool)

(declare-fun res!1030518 () Bool)

(assert (=> b!1510613 (=> (not res!1030518) (not e!843520))))

(assert (=> b!1510613 (= res!1030518 (validKeyInArray!0 (select (arr!48608 a!2804) j!70)))))

(declare-fun b!1510614 () Bool)

(declare-fun res!1030514 () Bool)

(assert (=> b!1510614 (=> (not res!1030514) (not e!843520))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510614 (= res!1030514 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49158 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49158 a!2804))))))

(declare-fun b!1510615 () Bool)

(declare-fun res!1030512 () Bool)

(declare-fun e!843522 () Bool)

(assert (=> b!1510615 (=> (not res!1030512) (not e!843522))))

(declare-datatypes ((SeekEntryResult!12779 0))(
  ( (MissingZero!12779 (index!53511 (_ BitVec 32))) (Found!12779 (index!53512 (_ BitVec 32))) (Intermediate!12779 (undefined!13591 Bool) (index!53513 (_ BitVec 32)) (x!135257 (_ BitVec 32))) (Undefined!12779) (MissingVacant!12779 (index!53514 (_ BitVec 32))) )
))
(declare-fun lt!655214 () SeekEntryResult!12779)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100742 (_ BitVec 32)) SeekEntryResult!12779)

(assert (=> b!1510615 (= res!1030512 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48608 a!2804) j!70) a!2804 mask!2512) lt!655214))))

(declare-fun b!1510616 () Bool)

(assert (=> b!1510616 (= e!843520 e!843522)))

(declare-fun res!1030519 () Bool)

(assert (=> b!1510616 (=> (not res!1030519) (not e!843522))))

(declare-fun lt!655216 () SeekEntryResult!12779)

(assert (=> b!1510616 (= res!1030519 (= lt!655216 lt!655214))))

(assert (=> b!1510616 (= lt!655214 (Intermediate!12779 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510616 (= lt!655216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48608 a!2804) j!70) mask!2512) (select (arr!48608 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510617 () Bool)

(assert (=> b!1510617 (= e!843522 (not true))))

(declare-fun e!843521 () Bool)

(assert (=> b!1510617 e!843521))

(declare-fun res!1030521 () Bool)

(assert (=> b!1510617 (=> (not res!1030521) (not e!843521))))

(assert (=> b!1510617 (= res!1030521 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50426 0))(
  ( (Unit!50427) )
))
(declare-fun lt!655215 () Unit!50426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50426)

(assert (=> b!1510617 (= lt!655215 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510618 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100742 (_ BitVec 32)) SeekEntryResult!12779)

(assert (=> b!1510618 (= e!843521 (= (seekEntry!0 (select (arr!48608 a!2804) j!70) a!2804 mask!2512) (Found!12779 j!70)))))

(declare-fun b!1510619 () Bool)

(declare-fun res!1030520 () Bool)

(assert (=> b!1510619 (=> (not res!1030520) (not e!843522))))

(assert (=> b!1510619 (= res!1030520 (= lt!655216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48608 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48608 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100743 (store (arr!48608 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49158 a!2804)) mask!2512)))))

(assert (= (and start!128886 res!1030515) b!1510611))

(assert (= (and b!1510611 res!1030516) b!1510610))

(assert (= (and b!1510610 res!1030517) b!1510613))

(assert (= (and b!1510613 res!1030518) b!1510612))

(assert (= (and b!1510612 res!1030513) b!1510609))

(assert (= (and b!1510609 res!1030522) b!1510614))

(assert (= (and b!1510614 res!1030514) b!1510616))

(assert (= (and b!1510616 res!1030519) b!1510615))

(assert (= (and b!1510615 res!1030512) b!1510619))

(assert (= (and b!1510619 res!1030520) b!1510617))

(assert (= (and b!1510617 res!1030521) b!1510618))

(declare-fun m!1393219 () Bool)

(assert (=> b!1510618 m!1393219))

(assert (=> b!1510618 m!1393219))

(declare-fun m!1393221 () Bool)

(assert (=> b!1510618 m!1393221))

(assert (=> b!1510613 m!1393219))

(assert (=> b!1510613 m!1393219))

(declare-fun m!1393223 () Bool)

(assert (=> b!1510613 m!1393223))

(declare-fun m!1393225 () Bool)

(assert (=> start!128886 m!1393225))

(declare-fun m!1393227 () Bool)

(assert (=> start!128886 m!1393227))

(declare-fun m!1393229 () Bool)

(assert (=> b!1510617 m!1393229))

(declare-fun m!1393231 () Bool)

(assert (=> b!1510617 m!1393231))

(declare-fun m!1393233 () Bool)

(assert (=> b!1510612 m!1393233))

(assert (=> b!1510616 m!1393219))

(assert (=> b!1510616 m!1393219))

(declare-fun m!1393235 () Bool)

(assert (=> b!1510616 m!1393235))

(assert (=> b!1510616 m!1393235))

(assert (=> b!1510616 m!1393219))

(declare-fun m!1393237 () Bool)

(assert (=> b!1510616 m!1393237))

(declare-fun m!1393239 () Bool)

(assert (=> b!1510609 m!1393239))

(declare-fun m!1393241 () Bool)

(assert (=> b!1510610 m!1393241))

(assert (=> b!1510610 m!1393241))

(declare-fun m!1393243 () Bool)

(assert (=> b!1510610 m!1393243))

(declare-fun m!1393245 () Bool)

(assert (=> b!1510619 m!1393245))

(declare-fun m!1393247 () Bool)

(assert (=> b!1510619 m!1393247))

(assert (=> b!1510619 m!1393247))

(declare-fun m!1393249 () Bool)

(assert (=> b!1510619 m!1393249))

(assert (=> b!1510619 m!1393249))

(assert (=> b!1510619 m!1393247))

(declare-fun m!1393251 () Bool)

(assert (=> b!1510619 m!1393251))

(assert (=> b!1510615 m!1393219))

(assert (=> b!1510615 m!1393219))

(declare-fun m!1393253 () Bool)

(assert (=> b!1510615 m!1393253))

(push 1)

