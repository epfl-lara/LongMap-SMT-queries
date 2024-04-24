; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129986 () Bool)

(assert start!129986)

(declare-fun b!1523834 () Bool)

(declare-fun res!1041630 () Bool)

(declare-fun e!849958 () Bool)

(assert (=> b!1523834 (=> (not res!1041630) (not e!849958))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101410 0))(
  ( (array!101411 (arr!48931 (Array (_ BitVec 32) (_ BitVec 64))) (size!49482 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101410)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12989 0))(
  ( (MissingZero!12989 (index!54351 (_ BitVec 32))) (Found!12989 (index!54352 (_ BitVec 32))) (Intermediate!12989 (undefined!13801 Bool) (index!54353 (_ BitVec 32)) (x!136254 (_ BitVec 32))) (Undefined!12989) (MissingVacant!12989 (index!54354 (_ BitVec 32))) )
))
(declare-fun lt!660232 () SeekEntryResult!12989)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101410 (_ BitVec 32)) SeekEntryResult!12989)

(assert (=> b!1523834 (= res!1041630 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48931 a!2804) j!70) a!2804 mask!2512) lt!660232))))

(declare-fun b!1523835 () Bool)

(declare-fun res!1041631 () Bool)

(declare-fun e!849960 () Bool)

(assert (=> b!1523835 (=> (not res!1041631) (not e!849960))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523835 (= res!1041631 (and (= (size!49482 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49482 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49482 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523836 () Bool)

(declare-fun res!1041632 () Bool)

(assert (=> b!1523836 (=> (not res!1041632) (not e!849960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523836 (= res!1041632 (validKeyInArray!0 (select (arr!48931 a!2804) i!961)))))

(declare-fun res!1041637 () Bool)

(assert (=> start!129986 (=> (not res!1041637) (not e!849960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129986 (= res!1041637 (validMask!0 mask!2512))))

(assert (=> start!129986 e!849960))

(assert (=> start!129986 true))

(declare-fun array_inv!38212 (array!101410) Bool)

(assert (=> start!129986 (array_inv!38212 a!2804)))

(declare-fun b!1523837 () Bool)

(declare-fun res!1041635 () Bool)

(assert (=> b!1523837 (=> (not res!1041635) (not e!849960))))

(assert (=> b!1523837 (= res!1041635 (validKeyInArray!0 (select (arr!48931 a!2804) j!70)))))

(declare-fun b!1523838 () Bool)

(assert (=> b!1523838 (= e!849960 e!849958)))

(declare-fun res!1041636 () Bool)

(assert (=> b!1523838 (=> (not res!1041636) (not e!849958))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523838 (= res!1041636 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48931 a!2804) j!70) mask!2512) (select (arr!48931 a!2804) j!70) a!2804 mask!2512) lt!660232))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523838 (= lt!660232 (Intermediate!12989 false resIndex!21 resX!21))))

(declare-fun b!1523839 () Bool)

(declare-fun res!1041638 () Bool)

(assert (=> b!1523839 (=> (not res!1041638) (not e!849960))))

(assert (=> b!1523839 (= res!1041638 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49482 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49482 a!2804))))))

(declare-fun b!1523840 () Bool)

(declare-fun res!1041634 () Bool)

(assert (=> b!1523840 (=> (not res!1041634) (not e!849960))))

(declare-datatypes ((List!35401 0))(
  ( (Nil!35398) (Cons!35397 (h!36836 (_ BitVec 64)) (t!50087 List!35401)) )
))
(declare-fun arrayNoDuplicates!0 (array!101410 (_ BitVec 32) List!35401) Bool)

(assert (=> b!1523840 (= res!1041634 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35398))))

(declare-fun b!1523841 () Bool)

(assert (=> b!1523841 (= e!849958 false)))

(declare-fun lt!660231 () SeekEntryResult!12989)

(assert (=> b!1523841 (= lt!660231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48931 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48931 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101411 (store (arr!48931 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49482 a!2804)) mask!2512))))

(declare-fun b!1523842 () Bool)

(declare-fun res!1041633 () Bool)

(assert (=> b!1523842 (=> (not res!1041633) (not e!849960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101410 (_ BitVec 32)) Bool)

(assert (=> b!1523842 (= res!1041633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129986 res!1041637) b!1523835))

(assert (= (and b!1523835 res!1041631) b!1523836))

(assert (= (and b!1523836 res!1041632) b!1523837))

(assert (= (and b!1523837 res!1041635) b!1523842))

(assert (= (and b!1523842 res!1041633) b!1523840))

(assert (= (and b!1523840 res!1041634) b!1523839))

(assert (= (and b!1523839 res!1041638) b!1523838))

(assert (= (and b!1523838 res!1041636) b!1523834))

(assert (= (and b!1523834 res!1041630) b!1523841))

(declare-fun m!1406787 () Bool)

(assert (=> b!1523842 m!1406787))

(declare-fun m!1406789 () Bool)

(assert (=> b!1523836 m!1406789))

(assert (=> b!1523836 m!1406789))

(declare-fun m!1406791 () Bool)

(assert (=> b!1523836 m!1406791))

(declare-fun m!1406793 () Bool)

(assert (=> start!129986 m!1406793))

(declare-fun m!1406795 () Bool)

(assert (=> start!129986 m!1406795))

(declare-fun m!1406797 () Bool)

(assert (=> b!1523841 m!1406797))

(declare-fun m!1406799 () Bool)

(assert (=> b!1523841 m!1406799))

(assert (=> b!1523841 m!1406799))

(declare-fun m!1406801 () Bool)

(assert (=> b!1523841 m!1406801))

(assert (=> b!1523841 m!1406801))

(assert (=> b!1523841 m!1406799))

(declare-fun m!1406803 () Bool)

(assert (=> b!1523841 m!1406803))

(declare-fun m!1406805 () Bool)

(assert (=> b!1523837 m!1406805))

(assert (=> b!1523837 m!1406805))

(declare-fun m!1406807 () Bool)

(assert (=> b!1523837 m!1406807))

(assert (=> b!1523838 m!1406805))

(assert (=> b!1523838 m!1406805))

(declare-fun m!1406809 () Bool)

(assert (=> b!1523838 m!1406809))

(assert (=> b!1523838 m!1406809))

(assert (=> b!1523838 m!1406805))

(declare-fun m!1406811 () Bool)

(assert (=> b!1523838 m!1406811))

(assert (=> b!1523834 m!1406805))

(assert (=> b!1523834 m!1406805))

(declare-fun m!1406813 () Bool)

(assert (=> b!1523834 m!1406813))

(declare-fun m!1406815 () Bool)

(assert (=> b!1523840 m!1406815))

(check-sat (not b!1523836) (not b!1523838) (not b!1523837) (not b!1523834) (not b!1523842) (not start!129986) (not b!1523841) (not b!1523840))
(check-sat)
