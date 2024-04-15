; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128750 () Bool)

(assert start!128750)

(declare-fun res!1029030 () Bool)

(declare-fun e!842827 () Bool)

(assert (=> start!128750 (=> (not res!1029030) (not e!842827))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128750 (= res!1029030 (validMask!0 mask!2512))))

(assert (=> start!128750 e!842827))

(assert (=> start!128750 true))

(declare-datatypes ((array!100606 0))(
  ( (array!100607 (arr!48541 (Array (_ BitVec 32) (_ BitVec 64))) (size!49093 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100606)

(declare-fun array_inv!37774 (array!100606) Bool)

(assert (=> start!128750 (array_inv!37774 a!2804)))

(declare-fun b!1508915 () Bool)

(declare-fun res!1029025 () Bool)

(declare-fun e!842829 () Bool)

(assert (=> b!1508915 (=> (not res!1029025) (not e!842829))))

(declare-datatypes ((SeekEntryResult!12735 0))(
  ( (MissingZero!12735 (index!53335 (_ BitVec 32))) (Found!12735 (index!53336 (_ BitVec 32))) (Intermediate!12735 (undefined!13547 Bool) (index!53337 (_ BitVec 32)) (x!135095 (_ BitVec 32))) (Undefined!12735) (MissingVacant!12735 (index!53338 (_ BitVec 32))) )
))
(declare-fun lt!654549 () SeekEntryResult!12735)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100606 (_ BitVec 32)) SeekEntryResult!12735)

(assert (=> b!1508915 (= res!1029025 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48541 a!2804) j!70) a!2804 mask!2512) lt!654549))))

(declare-fun b!1508916 () Bool)

(declare-fun res!1029024 () Bool)

(assert (=> b!1508916 (=> (not res!1029024) (not e!842827))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508916 (= res!1029024 (validKeyInArray!0 (select (arr!48541 a!2804) i!961)))))

(declare-fun b!1508917 () Bool)

(declare-fun res!1029026 () Bool)

(assert (=> b!1508917 (=> (not res!1029026) (not e!842827))))

(assert (=> b!1508917 (= res!1029026 (and (= (size!49093 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49093 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49093 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508918 () Bool)

(declare-fun res!1029028 () Bool)

(assert (=> b!1508918 (=> (not res!1029028) (not e!842827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100606 (_ BitVec 32)) Bool)

(assert (=> b!1508918 (= res!1029028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508919 () Bool)

(declare-fun res!1029029 () Bool)

(assert (=> b!1508919 (=> (not res!1029029) (not e!842827))))

(assert (=> b!1508919 (= res!1029029 (validKeyInArray!0 (select (arr!48541 a!2804) j!70)))))

(declare-fun b!1508920 () Bool)

(assert (=> b!1508920 (= e!842829 false)))

(declare-fun lt!654548 () SeekEntryResult!12735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508920 (= lt!654548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48541 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48541 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100607 (store (arr!48541 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49093 a!2804)) mask!2512))))

(declare-fun b!1508921 () Bool)

(declare-fun res!1029032 () Bool)

(assert (=> b!1508921 (=> (not res!1029032) (not e!842827))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508921 (= res!1029032 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49093 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49093 a!2804))))))

(declare-fun b!1508922 () Bool)

(assert (=> b!1508922 (= e!842827 e!842829)))

(declare-fun res!1029031 () Bool)

(assert (=> b!1508922 (=> (not res!1029031) (not e!842829))))

(assert (=> b!1508922 (= res!1029031 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48541 a!2804) j!70) mask!2512) (select (arr!48541 a!2804) j!70) a!2804 mask!2512) lt!654549))))

(assert (=> b!1508922 (= lt!654549 (Intermediate!12735 false resIndex!21 resX!21))))

(declare-fun b!1508923 () Bool)

(declare-fun res!1029027 () Bool)

(assert (=> b!1508923 (=> (not res!1029027) (not e!842827))))

(declare-datatypes ((List!35102 0))(
  ( (Nil!35099) (Cons!35098 (h!36511 (_ BitVec 64)) (t!49788 List!35102)) )
))
(declare-fun arrayNoDuplicates!0 (array!100606 (_ BitVec 32) List!35102) Bool)

(assert (=> b!1508923 (= res!1029027 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35099))))

(assert (= (and start!128750 res!1029030) b!1508917))

(assert (= (and b!1508917 res!1029026) b!1508916))

(assert (= (and b!1508916 res!1029024) b!1508919))

(assert (= (and b!1508919 res!1029029) b!1508918))

(assert (= (and b!1508918 res!1029028) b!1508923))

(assert (= (and b!1508923 res!1029027) b!1508921))

(assert (= (and b!1508921 res!1029032) b!1508922))

(assert (= (and b!1508922 res!1029031) b!1508915))

(assert (= (and b!1508915 res!1029025) b!1508920))

(declare-fun m!1390805 () Bool)

(assert (=> b!1508918 m!1390805))

(declare-fun m!1390807 () Bool)

(assert (=> b!1508915 m!1390807))

(assert (=> b!1508915 m!1390807))

(declare-fun m!1390809 () Bool)

(assert (=> b!1508915 m!1390809))

(declare-fun m!1390811 () Bool)

(assert (=> b!1508923 m!1390811))

(declare-fun m!1390813 () Bool)

(assert (=> b!1508920 m!1390813))

(declare-fun m!1390815 () Bool)

(assert (=> b!1508920 m!1390815))

(assert (=> b!1508920 m!1390815))

(declare-fun m!1390817 () Bool)

(assert (=> b!1508920 m!1390817))

(assert (=> b!1508920 m!1390817))

(assert (=> b!1508920 m!1390815))

(declare-fun m!1390819 () Bool)

(assert (=> b!1508920 m!1390819))

(declare-fun m!1390821 () Bool)

(assert (=> start!128750 m!1390821))

(declare-fun m!1390823 () Bool)

(assert (=> start!128750 m!1390823))

(declare-fun m!1390825 () Bool)

(assert (=> b!1508916 m!1390825))

(assert (=> b!1508916 m!1390825))

(declare-fun m!1390827 () Bool)

(assert (=> b!1508916 m!1390827))

(assert (=> b!1508922 m!1390807))

(assert (=> b!1508922 m!1390807))

(declare-fun m!1390829 () Bool)

(assert (=> b!1508922 m!1390829))

(assert (=> b!1508922 m!1390829))

(assert (=> b!1508922 m!1390807))

(declare-fun m!1390831 () Bool)

(assert (=> b!1508922 m!1390831))

(assert (=> b!1508919 m!1390807))

(assert (=> b!1508919 m!1390807))

(declare-fun m!1390833 () Bool)

(assert (=> b!1508919 m!1390833))

(check-sat (not b!1508920) (not b!1508922) (not b!1508923) (not b!1508919) (not b!1508918) (not b!1508915) (not start!128750) (not b!1508916))
(check-sat)
