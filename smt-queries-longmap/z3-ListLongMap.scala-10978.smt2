; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128522 () Bool)

(assert start!128522)

(declare-fun res!1027413 () Bool)

(declare-fun e!842017 () Bool)

(assert (=> start!128522 (=> (not res!1027413) (not e!842017))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128522 (= res!1027413 (validMask!0 mask!2512))))

(assert (=> start!128522 e!842017))

(assert (=> start!128522 true))

(declare-datatypes ((array!100495 0))(
  ( (array!100496 (arr!48490 (Array (_ BitVec 32) (_ BitVec 64))) (size!49042 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100495)

(declare-fun array_inv!37723 (array!100495) Bool)

(assert (=> start!128522 (array_inv!37723 a!2804)))

(declare-fun b!1506989 () Bool)

(declare-fun e!842019 () Bool)

(assert (=> b!1506989 (= e!842017 e!842019)))

(declare-fun res!1027416 () Bool)

(assert (=> b!1506989 (=> (not res!1027416) (not e!842019))))

(declare-datatypes ((SeekEntryResult!12684 0))(
  ( (MissingZero!12684 (index!53131 (_ BitVec 32))) (Found!12684 (index!53132 (_ BitVec 32))) (Intermediate!12684 (undefined!13496 Bool) (index!53133 (_ BitVec 32)) (x!134890 (_ BitVec 32))) (Undefined!12684) (MissingVacant!12684 (index!53134 (_ BitVec 32))) )
))
(declare-fun lt!654081 () SeekEntryResult!12684)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100495 (_ BitVec 32)) SeekEntryResult!12684)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506989 (= res!1027416 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48490 a!2804) j!70) mask!2512) (select (arr!48490 a!2804) j!70) a!2804 mask!2512) lt!654081))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1506989 (= lt!654081 (Intermediate!12684 false resIndex!21 resX!21))))

(declare-fun b!1506990 () Bool)

(declare-fun res!1027418 () Bool)

(assert (=> b!1506990 (=> (not res!1027418) (not e!842017))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506990 (= res!1027418 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49042 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49042 a!2804))))))

(declare-fun b!1506991 () Bool)

(declare-fun res!1027421 () Bool)

(assert (=> b!1506991 (=> (not res!1027421) (not e!842017))))

(declare-datatypes ((List!35051 0))(
  ( (Nil!35048) (Cons!35047 (h!36451 (_ BitVec 64)) (t!49737 List!35051)) )
))
(declare-fun arrayNoDuplicates!0 (array!100495 (_ BitVec 32) List!35051) Bool)

(assert (=> b!1506991 (= res!1027421 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35048))))

(declare-fun b!1506992 () Bool)

(declare-fun res!1027419 () Bool)

(assert (=> b!1506992 (=> (not res!1027419) (not e!842017))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506992 (= res!1027419 (and (= (size!49042 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49042 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49042 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506993 () Bool)

(assert (=> b!1506993 (= e!842019 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1506994 () Bool)

(declare-fun res!1027417 () Bool)

(assert (=> b!1506994 (=> (not res!1027417) (not e!842019))))

(assert (=> b!1506994 (= res!1027417 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48490 a!2804) j!70) a!2804 mask!2512) lt!654081))))

(declare-fun b!1506995 () Bool)

(declare-fun res!1027414 () Bool)

(assert (=> b!1506995 (=> (not res!1027414) (not e!842017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506995 (= res!1027414 (validKeyInArray!0 (select (arr!48490 a!2804) i!961)))))

(declare-fun b!1506996 () Bool)

(declare-fun res!1027420 () Bool)

(assert (=> b!1506996 (=> (not res!1027420) (not e!842017))))

(assert (=> b!1506996 (= res!1027420 (validKeyInArray!0 (select (arr!48490 a!2804) j!70)))))

(declare-fun b!1506997 () Bool)

(declare-fun res!1027415 () Bool)

(assert (=> b!1506997 (=> (not res!1027415) (not e!842017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100495 (_ BitVec 32)) Bool)

(assert (=> b!1506997 (= res!1027415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128522 res!1027413) b!1506992))

(assert (= (and b!1506992 res!1027419) b!1506995))

(assert (= (and b!1506995 res!1027414) b!1506996))

(assert (= (and b!1506996 res!1027420) b!1506997))

(assert (= (and b!1506997 res!1027415) b!1506991))

(assert (= (and b!1506991 res!1027421) b!1506990))

(assert (= (and b!1506990 res!1027418) b!1506989))

(assert (= (and b!1506989 res!1027416) b!1506994))

(assert (= (and b!1506994 res!1027417) b!1506993))

(declare-fun m!1389185 () Bool)

(assert (=> b!1506994 m!1389185))

(assert (=> b!1506994 m!1389185))

(declare-fun m!1389187 () Bool)

(assert (=> b!1506994 m!1389187))

(declare-fun m!1389189 () Bool)

(assert (=> start!128522 m!1389189))

(declare-fun m!1389191 () Bool)

(assert (=> start!128522 m!1389191))

(declare-fun m!1389193 () Bool)

(assert (=> b!1506997 m!1389193))

(declare-fun m!1389195 () Bool)

(assert (=> b!1506995 m!1389195))

(assert (=> b!1506995 m!1389195))

(declare-fun m!1389197 () Bool)

(assert (=> b!1506995 m!1389197))

(assert (=> b!1506996 m!1389185))

(assert (=> b!1506996 m!1389185))

(declare-fun m!1389199 () Bool)

(assert (=> b!1506996 m!1389199))

(declare-fun m!1389201 () Bool)

(assert (=> b!1506991 m!1389201))

(assert (=> b!1506989 m!1389185))

(assert (=> b!1506989 m!1389185))

(declare-fun m!1389203 () Bool)

(assert (=> b!1506989 m!1389203))

(assert (=> b!1506989 m!1389203))

(assert (=> b!1506989 m!1389185))

(declare-fun m!1389205 () Bool)

(assert (=> b!1506989 m!1389205))

(check-sat (not start!128522) (not b!1506994) (not b!1506995) (not b!1506997) (not b!1506991) (not b!1506996) (not b!1506989))
(check-sat)
