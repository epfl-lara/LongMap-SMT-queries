; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129624 () Bool)

(assert start!129624)

(declare-fun b!1521732 () Bool)

(declare-fun res!1040958 () Bool)

(declare-fun e!848625 () Bool)

(assert (=> b!1521732 (=> (not res!1040958) (not e!848625))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13047 0))(
  ( (MissingZero!13047 (index!54583 (_ BitVec 32))) (Found!13047 (index!54584 (_ BitVec 32))) (Intermediate!13047 (undefined!13859 Bool) (index!54585 (_ BitVec 32)) (x!136275 (_ BitVec 32))) (Undefined!13047) (MissingVacant!13047 (index!54586 (_ BitVec 32))) )
))
(declare-fun lt!659416 () SeekEntryResult!13047)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!101299 0))(
  ( (array!101300 (arr!48882 (Array (_ BitVec 32) (_ BitVec 64))) (size!49432 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101299)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101299 (_ BitVec 32)) SeekEntryResult!13047)

(assert (=> b!1521732 (= res!1040958 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48882 a!2804) j!70) a!2804 mask!2512) lt!659416))))

(declare-fun b!1521733 () Bool)

(declare-fun res!1040960 () Bool)

(declare-fun e!848624 () Bool)

(assert (=> b!1521733 (=> (not res!1040960) (not e!848624))))

(declare-datatypes ((List!35365 0))(
  ( (Nil!35362) (Cons!35361 (h!36782 (_ BitVec 64)) (t!50059 List!35365)) )
))
(declare-fun arrayNoDuplicates!0 (array!101299 (_ BitVec 32) List!35365) Bool)

(assert (=> b!1521733 (= res!1040960 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35362))))

(declare-fun b!1521734 () Bool)

(declare-fun res!1040959 () Bool)

(assert (=> b!1521734 (=> (not res!1040959) (not e!848624))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521734 (= res!1040959 (and (= (size!49432 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49432 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49432 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521735 () Bool)

(declare-fun res!1040956 () Bool)

(assert (=> b!1521735 (=> (not res!1040956) (not e!848624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521735 (= res!1040956 (validKeyInArray!0 (select (arr!48882 a!2804) i!961)))))

(declare-fun b!1521736 () Bool)

(declare-fun res!1040957 () Bool)

(assert (=> b!1521736 (=> (not res!1040957) (not e!848624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101299 (_ BitVec 32)) Bool)

(assert (=> b!1521736 (= res!1040957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521737 () Bool)

(assert (=> b!1521737 (= e!848624 e!848625)))

(declare-fun res!1040962 () Bool)

(assert (=> b!1521737 (=> (not res!1040962) (not e!848625))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521737 (= res!1040962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48882 a!2804) j!70) mask!2512) (select (arr!48882 a!2804) j!70) a!2804 mask!2512) lt!659416))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521737 (= lt!659416 (Intermediate!13047 false resIndex!21 resX!21))))

(declare-fun b!1521738 () Bool)

(declare-fun res!1040954 () Bool)

(assert (=> b!1521738 (=> (not res!1040954) (not e!848624))))

(assert (=> b!1521738 (= res!1040954 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49432 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49432 a!2804))))))

(declare-fun b!1521739 () Bool)

(assert (=> b!1521739 (= e!848625 false)))

(declare-fun lt!659415 () SeekEntryResult!13047)

(assert (=> b!1521739 (= lt!659415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48882 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48882 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101300 (store (arr!48882 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49432 a!2804)) mask!2512))))

(declare-fun res!1040955 () Bool)

(assert (=> start!129624 (=> (not res!1040955) (not e!848624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129624 (= res!1040955 (validMask!0 mask!2512))))

(assert (=> start!129624 e!848624))

(assert (=> start!129624 true))

(declare-fun array_inv!37910 (array!101299) Bool)

(assert (=> start!129624 (array_inv!37910 a!2804)))

(declare-fun b!1521740 () Bool)

(declare-fun res!1040961 () Bool)

(assert (=> b!1521740 (=> (not res!1040961) (not e!848624))))

(assert (=> b!1521740 (= res!1040961 (validKeyInArray!0 (select (arr!48882 a!2804) j!70)))))

(assert (= (and start!129624 res!1040955) b!1521734))

(assert (= (and b!1521734 res!1040959) b!1521735))

(assert (= (and b!1521735 res!1040956) b!1521740))

(assert (= (and b!1521740 res!1040961) b!1521736))

(assert (= (and b!1521736 res!1040957) b!1521733))

(assert (= (and b!1521733 res!1040960) b!1521738))

(assert (= (and b!1521738 res!1040954) b!1521737))

(assert (= (and b!1521737 res!1040962) b!1521732))

(assert (= (and b!1521732 res!1040958) b!1521739))

(declare-fun m!1404839 () Bool)

(assert (=> b!1521736 m!1404839))

(declare-fun m!1404841 () Bool)

(assert (=> b!1521737 m!1404841))

(assert (=> b!1521737 m!1404841))

(declare-fun m!1404843 () Bool)

(assert (=> b!1521737 m!1404843))

(assert (=> b!1521737 m!1404843))

(assert (=> b!1521737 m!1404841))

(declare-fun m!1404845 () Bool)

(assert (=> b!1521737 m!1404845))

(declare-fun m!1404847 () Bool)

(assert (=> b!1521739 m!1404847))

(declare-fun m!1404849 () Bool)

(assert (=> b!1521739 m!1404849))

(assert (=> b!1521739 m!1404849))

(declare-fun m!1404851 () Bool)

(assert (=> b!1521739 m!1404851))

(assert (=> b!1521739 m!1404851))

(assert (=> b!1521739 m!1404849))

(declare-fun m!1404853 () Bool)

(assert (=> b!1521739 m!1404853))

(declare-fun m!1404855 () Bool)

(assert (=> b!1521733 m!1404855))

(declare-fun m!1404857 () Bool)

(assert (=> b!1521735 m!1404857))

(assert (=> b!1521735 m!1404857))

(declare-fun m!1404859 () Bool)

(assert (=> b!1521735 m!1404859))

(assert (=> b!1521732 m!1404841))

(assert (=> b!1521732 m!1404841))

(declare-fun m!1404861 () Bool)

(assert (=> b!1521732 m!1404861))

(assert (=> b!1521740 m!1404841))

(assert (=> b!1521740 m!1404841))

(declare-fun m!1404863 () Bool)

(assert (=> b!1521740 m!1404863))

(declare-fun m!1404865 () Bool)

(assert (=> start!129624 m!1404865))

(declare-fun m!1404867 () Bool)

(assert (=> start!129624 m!1404867))

(check-sat (not start!129624) (not b!1521732) (not b!1521737) (not b!1521740) (not b!1521733) (not b!1521735) (not b!1521736) (not b!1521739))
(check-sat)
