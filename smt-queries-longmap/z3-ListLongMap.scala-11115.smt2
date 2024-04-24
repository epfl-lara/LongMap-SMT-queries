; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130176 () Bool)

(assert start!130176)

(declare-fun b!1525870 () Bool)

(declare-fun res!1043300 () Bool)

(declare-fun e!850808 () Bool)

(assert (=> b!1525870 (=> (not res!1043300) (not e!850808))))

(declare-datatypes ((array!101509 0))(
  ( (array!101510 (arr!48979 (Array (_ BitVec 32) (_ BitVec 64))) (size!49530 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101509)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525870 (= res!1043300 (validKeyInArray!0 (select (arr!48979 a!2804) j!70)))))

(declare-fun b!1525871 () Bool)

(declare-fun res!1043299 () Bool)

(assert (=> b!1525871 (=> (not res!1043299) (not e!850808))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1525871 (= res!1043299 (and (= (size!49530 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49530 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49530 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525872 () Bool)

(declare-fun res!1043297 () Bool)

(assert (=> b!1525872 (=> (not res!1043297) (not e!850808))))

(assert (=> b!1525872 (= res!1043297 (validKeyInArray!0 (select (arr!48979 a!2804) i!961)))))

(declare-fun b!1525873 () Bool)

(declare-fun res!1043295 () Bool)

(declare-fun e!850807 () Bool)

(assert (=> b!1525873 (=> (not res!1043295) (not e!850807))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13037 0))(
  ( (MissingZero!13037 (index!54543 (_ BitVec 32))) (Found!13037 (index!54544 (_ BitVec 32))) (Intermediate!13037 (undefined!13849 Bool) (index!54545 (_ BitVec 32)) (x!136442 (_ BitVec 32))) (Undefined!13037) (MissingVacant!13037 (index!54546 (_ BitVec 32))) )
))
(declare-fun lt!660866 () SeekEntryResult!13037)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101509 (_ BitVec 32)) SeekEntryResult!13037)

(assert (=> b!1525873 (= res!1043295 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48979 a!2804) j!70) a!2804 mask!2512) lt!660866))))

(declare-fun b!1525874 () Bool)

(declare-fun e!850810 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101509 (_ BitVec 32)) SeekEntryResult!13037)

(assert (=> b!1525874 (= e!850810 (= (seekEntry!0 (select (arr!48979 a!2804) j!70) a!2804 mask!2512) (Found!13037 j!70)))))

(declare-fun b!1525876 () Bool)

(declare-fun res!1043301 () Bool)

(assert (=> b!1525876 (=> (not res!1043301) (not e!850808))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525876 (= res!1043301 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49530 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49530 a!2804))))))

(declare-fun b!1525877 () Bool)

(declare-fun res!1043292 () Bool)

(assert (=> b!1525877 (=> (not res!1043292) (not e!850808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101509 (_ BitVec 32)) Bool)

(assert (=> b!1525877 (= res!1043292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525878 () Bool)

(declare-fun res!1043293 () Bool)

(assert (=> b!1525878 (=> (not res!1043293) (not e!850807))))

(declare-fun lt!660865 () SeekEntryResult!13037)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525878 (= res!1043293 (= lt!660865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48979 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48979 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101510 (store (arr!48979 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49530 a!2804)) mask!2512)))))

(declare-fun b!1525879 () Bool)

(assert (=> b!1525879 (= e!850807 (not true))))

(assert (=> b!1525879 e!850810))

(declare-fun res!1043296 () Bool)

(assert (=> b!1525879 (=> (not res!1043296) (not e!850810))))

(assert (=> b!1525879 (= res!1043296 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50893 0))(
  ( (Unit!50894) )
))
(declare-fun lt!660867 () Unit!50893)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50893)

(assert (=> b!1525879 (= lt!660867 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525880 () Bool)

(declare-fun res!1043294 () Bool)

(assert (=> b!1525880 (=> (not res!1043294) (not e!850808))))

(declare-datatypes ((List!35449 0))(
  ( (Nil!35446) (Cons!35445 (h!36887 (_ BitVec 64)) (t!50135 List!35449)) )
))
(declare-fun arrayNoDuplicates!0 (array!101509 (_ BitVec 32) List!35449) Bool)

(assert (=> b!1525880 (= res!1043294 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35446))))

(declare-fun res!1043298 () Bool)

(assert (=> start!130176 (=> (not res!1043298) (not e!850808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130176 (= res!1043298 (validMask!0 mask!2512))))

(assert (=> start!130176 e!850808))

(assert (=> start!130176 true))

(declare-fun array_inv!38260 (array!101509) Bool)

(assert (=> start!130176 (array_inv!38260 a!2804)))

(declare-fun b!1525875 () Bool)

(assert (=> b!1525875 (= e!850808 e!850807)))

(declare-fun res!1043291 () Bool)

(assert (=> b!1525875 (=> (not res!1043291) (not e!850807))))

(assert (=> b!1525875 (= res!1043291 (= lt!660865 lt!660866))))

(assert (=> b!1525875 (= lt!660866 (Intermediate!13037 false resIndex!21 resX!21))))

(assert (=> b!1525875 (= lt!660865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48979 a!2804) j!70) mask!2512) (select (arr!48979 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130176 res!1043298) b!1525871))

(assert (= (and b!1525871 res!1043299) b!1525872))

(assert (= (and b!1525872 res!1043297) b!1525870))

(assert (= (and b!1525870 res!1043300) b!1525877))

(assert (= (and b!1525877 res!1043292) b!1525880))

(assert (= (and b!1525880 res!1043294) b!1525876))

(assert (= (and b!1525876 res!1043301) b!1525875))

(assert (= (and b!1525875 res!1043291) b!1525873))

(assert (= (and b!1525873 res!1043295) b!1525878))

(assert (= (and b!1525878 res!1043293) b!1525879))

(assert (= (and b!1525879 res!1043296) b!1525874))

(declare-fun m!1408849 () Bool)

(assert (=> b!1525870 m!1408849))

(assert (=> b!1525870 m!1408849))

(declare-fun m!1408851 () Bool)

(assert (=> b!1525870 m!1408851))

(declare-fun m!1408853 () Bool)

(assert (=> b!1525880 m!1408853))

(assert (=> b!1525874 m!1408849))

(assert (=> b!1525874 m!1408849))

(declare-fun m!1408855 () Bool)

(assert (=> b!1525874 m!1408855))

(assert (=> b!1525873 m!1408849))

(assert (=> b!1525873 m!1408849))

(declare-fun m!1408857 () Bool)

(assert (=> b!1525873 m!1408857))

(declare-fun m!1408859 () Bool)

(assert (=> start!130176 m!1408859))

(declare-fun m!1408861 () Bool)

(assert (=> start!130176 m!1408861))

(declare-fun m!1408863 () Bool)

(assert (=> b!1525879 m!1408863))

(declare-fun m!1408865 () Bool)

(assert (=> b!1525879 m!1408865))

(declare-fun m!1408867 () Bool)

(assert (=> b!1525878 m!1408867))

(declare-fun m!1408869 () Bool)

(assert (=> b!1525878 m!1408869))

(assert (=> b!1525878 m!1408869))

(declare-fun m!1408871 () Bool)

(assert (=> b!1525878 m!1408871))

(assert (=> b!1525878 m!1408871))

(assert (=> b!1525878 m!1408869))

(declare-fun m!1408873 () Bool)

(assert (=> b!1525878 m!1408873))

(declare-fun m!1408875 () Bool)

(assert (=> b!1525877 m!1408875))

(declare-fun m!1408877 () Bool)

(assert (=> b!1525872 m!1408877))

(assert (=> b!1525872 m!1408877))

(declare-fun m!1408879 () Bool)

(assert (=> b!1525872 m!1408879))

(assert (=> b!1525875 m!1408849))

(assert (=> b!1525875 m!1408849))

(declare-fun m!1408881 () Bool)

(assert (=> b!1525875 m!1408881))

(assert (=> b!1525875 m!1408881))

(assert (=> b!1525875 m!1408849))

(declare-fun m!1408883 () Bool)

(assert (=> b!1525875 m!1408883))

(check-sat (not start!130176) (not b!1525880) (not b!1525875) (not b!1525870) (not b!1525879) (not b!1525873) (not b!1525878) (not b!1525874) (not b!1525877) (not b!1525872))
(check-sat)
