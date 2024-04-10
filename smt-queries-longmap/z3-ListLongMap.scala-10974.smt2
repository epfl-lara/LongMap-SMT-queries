; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128510 () Bool)

(assert start!128510)

(declare-fun b!1506860 () Bool)

(declare-fun res!1027186 () Bool)

(declare-fun e!842022 () Bool)

(assert (=> b!1506860 (=> (not res!1027186) (not e!842022))))

(declare-datatypes ((array!100522 0))(
  ( (array!100523 (arr!48504 (Array (_ BitVec 32) (_ BitVec 64))) (size!49054 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100522)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100522 (_ BitVec 32)) Bool)

(assert (=> b!1506860 (= res!1027186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506861 () Bool)

(declare-fun res!1027188 () Bool)

(assert (=> b!1506861 (=> (not res!1027188) (not e!842022))))

(declare-datatypes ((List!34987 0))(
  ( (Nil!34984) (Cons!34983 (h!36383 (_ BitVec 64)) (t!49681 List!34987)) )
))
(declare-fun arrayNoDuplicates!0 (array!100522 (_ BitVec 32) List!34987) Bool)

(assert (=> b!1506861 (= res!1027188 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34984))))

(declare-fun b!1506862 () Bool)

(declare-fun res!1027187 () Bool)

(assert (=> b!1506862 (=> (not res!1027187) (not e!842022))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506862 (= res!1027187 (and (= (size!49054 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49054 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49054 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506863 () Bool)

(declare-fun res!1027185 () Bool)

(assert (=> b!1506863 (=> (not res!1027185) (not e!842022))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506863 (= res!1027185 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49054 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49054 a!2804))))))

(declare-fun b!1506864 () Bool)

(declare-fun res!1027183 () Bool)

(assert (=> b!1506864 (=> (not res!1027183) (not e!842022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506864 (= res!1027183 (validKeyInArray!0 (select (arr!48504 a!2804) j!70)))))

(declare-fun res!1027189 () Bool)

(assert (=> start!128510 (=> (not res!1027189) (not e!842022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128510 (= res!1027189 (validMask!0 mask!2512))))

(assert (=> start!128510 e!842022))

(assert (=> start!128510 true))

(declare-fun array_inv!37532 (array!100522) Bool)

(assert (=> start!128510 (array_inv!37532 a!2804)))

(declare-fun b!1506865 () Bool)

(assert (=> b!1506865 (= e!842022 false)))

(declare-datatypes ((SeekEntryResult!12675 0))(
  ( (MissingZero!12675 (index!53095 (_ BitVec 32))) (Found!12675 (index!53096 (_ BitVec 32))) (Intermediate!12675 (undefined!13487 Bool) (index!53097 (_ BitVec 32)) (x!134849 (_ BitVec 32))) (Undefined!12675) (MissingVacant!12675 (index!53098 (_ BitVec 32))) )
))
(declare-fun lt!654274 () SeekEntryResult!12675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100522 (_ BitVec 32)) SeekEntryResult!12675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506865 (= lt!654274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48504 a!2804) j!70) mask!2512) (select (arr!48504 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506866 () Bool)

(declare-fun res!1027184 () Bool)

(assert (=> b!1506866 (=> (not res!1027184) (not e!842022))))

(assert (=> b!1506866 (= res!1027184 (validKeyInArray!0 (select (arr!48504 a!2804) i!961)))))

(assert (= (and start!128510 res!1027189) b!1506862))

(assert (= (and b!1506862 res!1027187) b!1506866))

(assert (= (and b!1506866 res!1027184) b!1506864))

(assert (= (and b!1506864 res!1027183) b!1506860))

(assert (= (and b!1506860 res!1027186) b!1506861))

(assert (= (and b!1506861 res!1027188) b!1506863))

(assert (= (and b!1506863 res!1027185) b!1506865))

(declare-fun m!1389759 () Bool)

(assert (=> start!128510 m!1389759))

(declare-fun m!1389761 () Bool)

(assert (=> start!128510 m!1389761))

(declare-fun m!1389763 () Bool)

(assert (=> b!1506861 m!1389763))

(declare-fun m!1389765 () Bool)

(assert (=> b!1506860 m!1389765))

(declare-fun m!1389767 () Bool)

(assert (=> b!1506865 m!1389767))

(assert (=> b!1506865 m!1389767))

(declare-fun m!1389769 () Bool)

(assert (=> b!1506865 m!1389769))

(assert (=> b!1506865 m!1389769))

(assert (=> b!1506865 m!1389767))

(declare-fun m!1389771 () Bool)

(assert (=> b!1506865 m!1389771))

(declare-fun m!1389773 () Bool)

(assert (=> b!1506866 m!1389773))

(assert (=> b!1506866 m!1389773))

(declare-fun m!1389775 () Bool)

(assert (=> b!1506866 m!1389775))

(assert (=> b!1506864 m!1389767))

(assert (=> b!1506864 m!1389767))

(declare-fun m!1389777 () Bool)

(assert (=> b!1506864 m!1389777))

(check-sat (not b!1506866) (not b!1506860) (not b!1506864) (not b!1506861) (not start!128510) (not b!1506865))
