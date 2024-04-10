; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129564 () Bool)

(assert start!129564)

(declare-fun res!1040221 () Bool)

(declare-fun e!848413 () Bool)

(assert (=> start!129564 (=> (not res!1040221) (not e!848413))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129564 (= res!1040221 (validMask!0 mask!2512))))

(assert (=> start!129564 e!848413))

(assert (=> start!129564 true))

(declare-datatypes ((array!101239 0))(
  ( (array!101240 (arr!48852 (Array (_ BitVec 32) (_ BitVec 64))) (size!49402 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101239)

(declare-fun array_inv!37880 (array!101239) Bool)

(assert (=> start!129564 (array_inv!37880 a!2804)))

(declare-fun b!1520993 () Bool)

(declare-fun res!1040216 () Bool)

(assert (=> b!1520993 (=> (not res!1040216) (not e!848413))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520993 (= res!1040216 (validKeyInArray!0 (select (arr!48852 a!2804) j!70)))))

(declare-fun b!1520994 () Bool)

(declare-fun res!1040220 () Bool)

(assert (=> b!1520994 (=> (not res!1040220) (not e!848413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101239 (_ BitVec 32)) Bool)

(assert (=> b!1520994 (= res!1040220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520995 () Bool)

(declare-fun res!1040215 () Bool)

(assert (=> b!1520995 (=> (not res!1040215) (not e!848413))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520995 (= res!1040215 (and (= (size!49402 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49402 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49402 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520996 () Bool)

(declare-fun res!1040217 () Bool)

(assert (=> b!1520996 (=> (not res!1040217) (not e!848413))))

(declare-datatypes ((List!35335 0))(
  ( (Nil!35332) (Cons!35331 (h!36752 (_ BitVec 64)) (t!50029 List!35335)) )
))
(declare-fun arrayNoDuplicates!0 (array!101239 (_ BitVec 32) List!35335) Bool)

(assert (=> b!1520996 (= res!1040217 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35332))))

(declare-fun b!1520997 () Bool)

(declare-fun res!1040218 () Bool)

(assert (=> b!1520997 (=> (not res!1040218) (not e!848413))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520997 (= res!1040218 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49402 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49402 a!2804))))))

(declare-fun b!1520998 () Bool)

(declare-fun res!1040219 () Bool)

(assert (=> b!1520998 (=> (not res!1040219) (not e!848413))))

(assert (=> b!1520998 (= res!1040219 (validKeyInArray!0 (select (arr!48852 a!2804) i!961)))))

(declare-fun b!1520999 () Bool)

(assert (=> b!1520999 (= e!848413 false)))

(declare-fun lt!659293 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520999 (= lt!659293 (toIndex!0 (select (arr!48852 a!2804) j!70) mask!2512))))

(assert (= (and start!129564 res!1040221) b!1520995))

(assert (= (and b!1520995 res!1040215) b!1520998))

(assert (= (and b!1520998 res!1040219) b!1520993))

(assert (= (and b!1520993 res!1040216) b!1520994))

(assert (= (and b!1520994 res!1040220) b!1520996))

(assert (= (and b!1520996 res!1040217) b!1520997))

(assert (= (and b!1520997 res!1040218) b!1520999))

(declare-fun m!1404125 () Bool)

(assert (=> b!1520996 m!1404125))

(declare-fun m!1404127 () Bool)

(assert (=> b!1520993 m!1404127))

(assert (=> b!1520993 m!1404127))

(declare-fun m!1404129 () Bool)

(assert (=> b!1520993 m!1404129))

(declare-fun m!1404131 () Bool)

(assert (=> b!1520998 m!1404131))

(assert (=> b!1520998 m!1404131))

(declare-fun m!1404133 () Bool)

(assert (=> b!1520998 m!1404133))

(declare-fun m!1404135 () Bool)

(assert (=> b!1520994 m!1404135))

(declare-fun m!1404137 () Bool)

(assert (=> start!129564 m!1404137))

(declare-fun m!1404139 () Bool)

(assert (=> start!129564 m!1404139))

(assert (=> b!1520999 m!1404127))

(assert (=> b!1520999 m!1404127))

(declare-fun m!1404141 () Bool)

(assert (=> b!1520999 m!1404141))

(check-sat (not b!1520996) (not b!1520998) (not b!1520994) (not start!129564) (not b!1520993) (not b!1520999))
