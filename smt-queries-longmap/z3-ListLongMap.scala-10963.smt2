; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128408 () Bool)

(assert start!128408)

(declare-fun b!1506068 () Bool)

(declare-fun res!1026427 () Bool)

(declare-fun e!841761 () Bool)

(assert (=> b!1506068 (=> (not res!1026427) (not e!841761))))

(declare-datatypes ((array!100453 0))(
  ( (array!100454 (arr!48471 (Array (_ BitVec 32) (_ BitVec 64))) (size!49021 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100453)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506068 (= res!1026427 (validKeyInArray!0 (select (arr!48471 a!2804) j!70)))))

(declare-fun b!1506069 () Bool)

(declare-fun res!1026428 () Bool)

(assert (=> b!1506069 (=> (not res!1026428) (not e!841761))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1506069 (= res!1026428 (and (= (size!49021 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49021 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49021 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506070 () Bool)

(assert (=> b!1506070 (= e!841761 false)))

(declare-fun lt!654148 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506070 (= lt!654148 (toIndex!0 (select (arr!48471 a!2804) j!70) mask!2512))))

(declare-fun b!1506071 () Bool)

(declare-fun res!1026426 () Bool)

(assert (=> b!1506071 (=> (not res!1026426) (not e!841761))))

(declare-datatypes ((List!34954 0))(
  ( (Nil!34951) (Cons!34950 (h!36347 (_ BitVec 64)) (t!49648 List!34954)) )
))
(declare-fun arrayNoDuplicates!0 (array!100453 (_ BitVec 32) List!34954) Bool)

(assert (=> b!1506071 (= res!1026426 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34951))))

(declare-fun b!1506072 () Bool)

(declare-fun res!1026429 () Bool)

(assert (=> b!1506072 (=> (not res!1026429) (not e!841761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100453 (_ BitVec 32)) Bool)

(assert (=> b!1506072 (= res!1026429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506073 () Bool)

(declare-fun res!1026424 () Bool)

(assert (=> b!1506073 (=> (not res!1026424) (not e!841761))))

(assert (=> b!1506073 (= res!1026424 (validKeyInArray!0 (select (arr!48471 a!2804) i!961)))))

(declare-fun b!1506074 () Bool)

(declare-fun res!1026425 () Bool)

(assert (=> b!1506074 (=> (not res!1026425) (not e!841761))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506074 (= res!1026425 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49021 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49021 a!2804))))))

(declare-fun res!1026430 () Bool)

(assert (=> start!128408 (=> (not res!1026430) (not e!841761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128408 (= res!1026430 (validMask!0 mask!2512))))

(assert (=> start!128408 e!841761))

(assert (=> start!128408 true))

(declare-fun array_inv!37499 (array!100453) Bool)

(assert (=> start!128408 (array_inv!37499 a!2804)))

(assert (= (and start!128408 res!1026430) b!1506069))

(assert (= (and b!1506069 res!1026428) b!1506073))

(assert (= (and b!1506073 res!1026424) b!1506068))

(assert (= (and b!1506068 res!1026427) b!1506072))

(assert (= (and b!1506072 res!1026429) b!1506071))

(assert (= (and b!1506071 res!1026426) b!1506074))

(assert (= (and b!1506074 res!1026425) b!1506070))

(declare-fun m!1389085 () Bool)

(assert (=> b!1506070 m!1389085))

(assert (=> b!1506070 m!1389085))

(declare-fun m!1389087 () Bool)

(assert (=> b!1506070 m!1389087))

(declare-fun m!1389089 () Bool)

(assert (=> start!128408 m!1389089))

(declare-fun m!1389091 () Bool)

(assert (=> start!128408 m!1389091))

(declare-fun m!1389093 () Bool)

(assert (=> b!1506073 m!1389093))

(assert (=> b!1506073 m!1389093))

(declare-fun m!1389095 () Bool)

(assert (=> b!1506073 m!1389095))

(declare-fun m!1389097 () Bool)

(assert (=> b!1506072 m!1389097))

(declare-fun m!1389099 () Bool)

(assert (=> b!1506071 m!1389099))

(assert (=> b!1506068 m!1389085))

(assert (=> b!1506068 m!1389085))

(declare-fun m!1389101 () Bool)

(assert (=> b!1506068 m!1389101))

(check-sat (not b!1506068) (not b!1506073) (not b!1506072) (not start!128408) (not b!1506071) (not b!1506070))
