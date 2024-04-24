; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129992 () Bool)

(assert start!129992)

(declare-fun b!1523915 () Bool)

(declare-fun res!1041715 () Bool)

(declare-fun e!849987 () Bool)

(assert (=> b!1523915 (=> (not res!1041715) (not e!849987))))

(declare-datatypes ((array!101416 0))(
  ( (array!101417 (arr!48934 (Array (_ BitVec 32) (_ BitVec 64))) (size!49485 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101416)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101416 (_ BitVec 32)) Bool)

(assert (=> b!1523915 (= res!1041715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523916 () Bool)

(declare-fun res!1041711 () Bool)

(assert (=> b!1523916 (=> (not res!1041711) (not e!849987))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523916 (= res!1041711 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49485 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49485 a!2804))))))

(declare-fun b!1523917 () Bool)

(declare-fun res!1041716 () Bool)

(declare-fun e!849986 () Bool)

(assert (=> b!1523917 (=> (not res!1041716) (not e!849986))))

(declare-datatypes ((SeekEntryResult!12992 0))(
  ( (MissingZero!12992 (index!54363 (_ BitVec 32))) (Found!12992 (index!54364 (_ BitVec 32))) (Intermediate!12992 (undefined!13804 Bool) (index!54365 (_ BitVec 32)) (x!136265 (_ BitVec 32))) (Undefined!12992) (MissingVacant!12992 (index!54366 (_ BitVec 32))) )
))
(declare-fun lt!660250 () SeekEntryResult!12992)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101416 (_ BitVec 32)) SeekEntryResult!12992)

(assert (=> b!1523917 (= res!1041716 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48934 a!2804) j!70) a!2804 mask!2512) lt!660250))))

(declare-fun res!1041712 () Bool)

(assert (=> start!129992 (=> (not res!1041712) (not e!849987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129992 (= res!1041712 (validMask!0 mask!2512))))

(assert (=> start!129992 e!849987))

(assert (=> start!129992 true))

(declare-fun array_inv!38215 (array!101416) Bool)

(assert (=> start!129992 (array_inv!38215 a!2804)))

(declare-fun b!1523918 () Bool)

(assert (=> b!1523918 (= e!849987 e!849986)))

(declare-fun res!1041719 () Bool)

(assert (=> b!1523918 (=> (not res!1041719) (not e!849986))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523918 (= res!1041719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48934 a!2804) j!70) mask!2512) (select (arr!48934 a!2804) j!70) a!2804 mask!2512) lt!660250))))

(assert (=> b!1523918 (= lt!660250 (Intermediate!12992 false resIndex!21 resX!21))))

(declare-fun b!1523919 () Bool)

(declare-fun res!1041714 () Bool)

(assert (=> b!1523919 (=> (not res!1041714) (not e!849987))))

(declare-datatypes ((List!35404 0))(
  ( (Nil!35401) (Cons!35400 (h!36839 (_ BitVec 64)) (t!50090 List!35404)) )
))
(declare-fun arrayNoDuplicates!0 (array!101416 (_ BitVec 32) List!35404) Bool)

(assert (=> b!1523919 (= res!1041714 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35401))))

(declare-fun b!1523920 () Bool)

(declare-fun res!1041717 () Bool)

(assert (=> b!1523920 (=> (not res!1041717) (not e!849987))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523920 (= res!1041717 (validKeyInArray!0 (select (arr!48934 a!2804) i!961)))))

(declare-fun b!1523921 () Bool)

(declare-fun res!1041718 () Bool)

(assert (=> b!1523921 (=> (not res!1041718) (not e!849987))))

(assert (=> b!1523921 (= res!1041718 (and (= (size!49485 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49485 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49485 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523922 () Bool)

(declare-fun res!1041713 () Bool)

(assert (=> b!1523922 (=> (not res!1041713) (not e!849987))))

(assert (=> b!1523922 (= res!1041713 (validKeyInArray!0 (select (arr!48934 a!2804) j!70)))))

(declare-fun b!1523923 () Bool)

(assert (=> b!1523923 (= e!849986 false)))

(declare-fun lt!660249 () SeekEntryResult!12992)

(assert (=> b!1523923 (= lt!660249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48934 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48934 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101417 (store (arr!48934 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49485 a!2804)) mask!2512))))

(assert (= (and start!129992 res!1041712) b!1523921))

(assert (= (and b!1523921 res!1041718) b!1523920))

(assert (= (and b!1523920 res!1041717) b!1523922))

(assert (= (and b!1523922 res!1041713) b!1523915))

(assert (= (and b!1523915 res!1041715) b!1523919))

(assert (= (and b!1523919 res!1041714) b!1523916))

(assert (= (and b!1523916 res!1041711) b!1523918))

(assert (= (and b!1523918 res!1041719) b!1523917))

(assert (= (and b!1523917 res!1041716) b!1523923))

(declare-fun m!1406877 () Bool)

(assert (=> b!1523917 m!1406877))

(assert (=> b!1523917 m!1406877))

(declare-fun m!1406879 () Bool)

(assert (=> b!1523917 m!1406879))

(declare-fun m!1406881 () Bool)

(assert (=> start!129992 m!1406881))

(declare-fun m!1406883 () Bool)

(assert (=> start!129992 m!1406883))

(declare-fun m!1406885 () Bool)

(assert (=> b!1523915 m!1406885))

(assert (=> b!1523918 m!1406877))

(assert (=> b!1523918 m!1406877))

(declare-fun m!1406887 () Bool)

(assert (=> b!1523918 m!1406887))

(assert (=> b!1523918 m!1406887))

(assert (=> b!1523918 m!1406877))

(declare-fun m!1406889 () Bool)

(assert (=> b!1523918 m!1406889))

(declare-fun m!1406891 () Bool)

(assert (=> b!1523919 m!1406891))

(declare-fun m!1406893 () Bool)

(assert (=> b!1523920 m!1406893))

(assert (=> b!1523920 m!1406893))

(declare-fun m!1406895 () Bool)

(assert (=> b!1523920 m!1406895))

(assert (=> b!1523922 m!1406877))

(assert (=> b!1523922 m!1406877))

(declare-fun m!1406897 () Bool)

(assert (=> b!1523922 m!1406897))

(declare-fun m!1406899 () Bool)

(assert (=> b!1523923 m!1406899))

(declare-fun m!1406901 () Bool)

(assert (=> b!1523923 m!1406901))

(assert (=> b!1523923 m!1406901))

(declare-fun m!1406903 () Bool)

(assert (=> b!1523923 m!1406903))

(assert (=> b!1523923 m!1406903))

(assert (=> b!1523923 m!1406901))

(declare-fun m!1406905 () Bool)

(assert (=> b!1523923 m!1406905))

(check-sat (not b!1523923) (not b!1523922) (not b!1523920) (not start!129992) (not b!1523917) (not b!1523919) (not b!1523918) (not b!1523915))
(check-sat)
