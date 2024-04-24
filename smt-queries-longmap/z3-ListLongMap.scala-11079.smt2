; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129662 () Bool)

(assert start!129662)

(declare-fun b!1520856 () Bool)

(declare-fun e!848539 () Bool)

(declare-fun e!848541 () Bool)

(assert (=> b!1520856 (= e!848539 (not e!848541))))

(declare-fun res!1039399 () Bool)

(assert (=> b!1520856 (=> res!1039399 e!848541)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101281 0))(
  ( (array!101282 (arr!48871 (Array (_ BitVec 32) (_ BitVec 64))) (size!49422 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101281)

(declare-fun lt!659118 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1520856 (= res!1039399 (or (not (= (select (arr!48871 a!2804) j!70) lt!659118)) (= x!534 resX!21)))))

(declare-fun e!848540 () Bool)

(assert (=> b!1520856 e!848540))

(declare-fun res!1039405 () Bool)

(assert (=> b!1520856 (=> (not res!1039405) (not e!848540))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101281 (_ BitVec 32)) Bool)

(assert (=> b!1520856 (= res!1039405 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50773 0))(
  ( (Unit!50774) )
))
(declare-fun lt!659122 () Unit!50773)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50773)

(assert (=> b!1520856 (= lt!659122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520857 () Bool)

(declare-fun res!1039407 () Bool)

(declare-fun e!848537 () Bool)

(assert (=> b!1520857 (=> (not res!1039407) (not e!848537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520857 (= res!1039407 (validKeyInArray!0 (select (arr!48871 a!2804) j!70)))))

(declare-fun b!1520858 () Bool)

(declare-fun res!1039411 () Bool)

(assert (=> b!1520858 (=> (not res!1039411) (not e!848537))))

(declare-datatypes ((List!35341 0))(
  ( (Nil!35338) (Cons!35337 (h!36767 (_ BitVec 64)) (t!50027 List!35341)) )
))
(declare-fun arrayNoDuplicates!0 (array!101281 (_ BitVec 32) List!35341) Bool)

(assert (=> b!1520858 (= res!1039411 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35338))))

(declare-fun b!1520859 () Bool)

(declare-fun e!848538 () Bool)

(assert (=> b!1520859 (= e!848538 e!848539)))

(declare-fun res!1039408 () Bool)

(assert (=> b!1520859 (=> (not res!1039408) (not e!848539))))

(declare-datatypes ((SeekEntryResult!12935 0))(
  ( (MissingZero!12935 (index!54135 (_ BitVec 32))) (Found!12935 (index!54136 (_ BitVec 32))) (Intermediate!12935 (undefined!13747 Bool) (index!54137 (_ BitVec 32)) (x!136016 (_ BitVec 32))) (Undefined!12935) (MissingVacant!12935 (index!54138 (_ BitVec 32))) )
))
(declare-fun lt!659120 () SeekEntryResult!12935)

(declare-fun lt!659117 () array!101281)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101281 (_ BitVec 32)) SeekEntryResult!12935)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520859 (= res!1039408 (= lt!659120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!659118 mask!2512) lt!659118 lt!659117 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520859 (= lt!659118 (select (store (arr!48871 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1520859 (= lt!659117 (array!101282 (store (arr!48871 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49422 a!2804)))))

(declare-fun b!1520860 () Bool)

(declare-fun res!1039403 () Bool)

(assert (=> b!1520860 (=> (not res!1039403) (not e!848537))))

(assert (=> b!1520860 (= res!1039403 (and (= (size!49422 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49422 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49422 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520861 () Bool)

(declare-fun res!1039404 () Bool)

(declare-fun e!848536 () Bool)

(assert (=> b!1520861 (=> res!1039404 e!848536)))

(declare-fun lt!659116 () SeekEntryResult!12935)

(declare-fun lt!659121 () (_ BitVec 32))

(assert (=> b!1520861 (= res!1039404 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!659121 (select (arr!48871 a!2804) j!70) a!2804 mask!2512) lt!659116)))))

(declare-fun b!1520862 () Bool)

(assert (=> b!1520862 (= e!848536 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101281 (_ BitVec 32)) SeekEntryResult!12935)

(assert (=> b!1520862 (= (seekEntryOrOpen!0 (select (arr!48871 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!659118 lt!659117 mask!2512))))

(declare-fun lt!659119 () Unit!50773)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50773)

(assert (=> b!1520862 (= lt!659119 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!659121 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1520863 () Bool)

(declare-fun res!1039401 () Bool)

(assert (=> b!1520863 (=> (not res!1039401) (not e!848537))))

(assert (=> b!1520863 (= res!1039401 (validKeyInArray!0 (select (arr!48871 a!2804) i!961)))))

(declare-fun b!1520864 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101281 (_ BitVec 32)) SeekEntryResult!12935)

(assert (=> b!1520864 (= e!848540 (= (seekEntry!0 (select (arr!48871 a!2804) j!70) a!2804 mask!2512) (Found!12935 j!70)))))

(declare-fun b!1520865 () Bool)

(assert (=> b!1520865 (= e!848541 e!848536)))

(declare-fun res!1039409 () Bool)

(assert (=> b!1520865 (=> res!1039409 e!848536)))

(assert (=> b!1520865 (= res!1039409 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!659121 #b00000000000000000000000000000000) (bvsge lt!659121 (size!49422 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520865 (= lt!659121 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1520866 () Bool)

(assert (=> b!1520866 (= e!848537 e!848538)))

(declare-fun res!1039412 () Bool)

(assert (=> b!1520866 (=> (not res!1039412) (not e!848538))))

(assert (=> b!1520866 (= res!1039412 (= lt!659120 lt!659116))))

(assert (=> b!1520866 (= lt!659116 (Intermediate!12935 false resIndex!21 resX!21))))

(assert (=> b!1520866 (= lt!659120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48871 a!2804) j!70) mask!2512) (select (arr!48871 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520867 () Bool)

(declare-fun res!1039402 () Bool)

(assert (=> b!1520867 (=> (not res!1039402) (not e!848538))))

(assert (=> b!1520867 (= res!1039402 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48871 a!2804) j!70) a!2804 mask!2512) lt!659116))))

(declare-fun b!1520868 () Bool)

(declare-fun res!1039400 () Bool)

(assert (=> b!1520868 (=> (not res!1039400) (not e!848537))))

(assert (=> b!1520868 (= res!1039400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1039410 () Bool)

(assert (=> start!129662 (=> (not res!1039410) (not e!848537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129662 (= res!1039410 (validMask!0 mask!2512))))

(assert (=> start!129662 e!848537))

(assert (=> start!129662 true))

(declare-fun array_inv!38152 (array!101281) Bool)

(assert (=> start!129662 (array_inv!38152 a!2804)))

(declare-fun b!1520869 () Bool)

(declare-fun res!1039406 () Bool)

(assert (=> b!1520869 (=> (not res!1039406) (not e!848537))))

(assert (=> b!1520869 (= res!1039406 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49422 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49422 a!2804))))))

(assert (= (and start!129662 res!1039410) b!1520860))

(assert (= (and b!1520860 res!1039403) b!1520863))

(assert (= (and b!1520863 res!1039401) b!1520857))

(assert (= (and b!1520857 res!1039407) b!1520868))

(assert (= (and b!1520868 res!1039400) b!1520858))

(assert (= (and b!1520858 res!1039411) b!1520869))

(assert (= (and b!1520869 res!1039406) b!1520866))

(assert (= (and b!1520866 res!1039412) b!1520867))

(assert (= (and b!1520867 res!1039402) b!1520859))

(assert (= (and b!1520859 res!1039408) b!1520856))

(assert (= (and b!1520856 res!1039405) b!1520864))

(assert (= (and b!1520856 (not res!1039399)) b!1520865))

(assert (= (and b!1520865 (not res!1039409)) b!1520861))

(assert (= (and b!1520861 (not res!1039404)) b!1520862))

(declare-fun m!1404045 () Bool)

(assert (=> b!1520856 m!1404045))

(declare-fun m!1404047 () Bool)

(assert (=> b!1520856 m!1404047))

(declare-fun m!1404049 () Bool)

(assert (=> b!1520856 m!1404049))

(assert (=> b!1520862 m!1404045))

(assert (=> b!1520862 m!1404045))

(declare-fun m!1404051 () Bool)

(assert (=> b!1520862 m!1404051))

(declare-fun m!1404053 () Bool)

(assert (=> b!1520862 m!1404053))

(declare-fun m!1404055 () Bool)

(assert (=> b!1520862 m!1404055))

(declare-fun m!1404057 () Bool)

(assert (=> b!1520868 m!1404057))

(declare-fun m!1404059 () Bool)

(assert (=> start!129662 m!1404059))

(declare-fun m!1404061 () Bool)

(assert (=> start!129662 m!1404061))

(declare-fun m!1404063 () Bool)

(assert (=> b!1520863 m!1404063))

(assert (=> b!1520863 m!1404063))

(declare-fun m!1404065 () Bool)

(assert (=> b!1520863 m!1404065))

(assert (=> b!1520867 m!1404045))

(assert (=> b!1520867 m!1404045))

(declare-fun m!1404067 () Bool)

(assert (=> b!1520867 m!1404067))

(declare-fun m!1404069 () Bool)

(assert (=> b!1520859 m!1404069))

(assert (=> b!1520859 m!1404069))

(declare-fun m!1404071 () Bool)

(assert (=> b!1520859 m!1404071))

(declare-fun m!1404073 () Bool)

(assert (=> b!1520859 m!1404073))

(declare-fun m!1404075 () Bool)

(assert (=> b!1520859 m!1404075))

(assert (=> b!1520864 m!1404045))

(assert (=> b!1520864 m!1404045))

(declare-fun m!1404077 () Bool)

(assert (=> b!1520864 m!1404077))

(declare-fun m!1404079 () Bool)

(assert (=> b!1520858 m!1404079))

(assert (=> b!1520866 m!1404045))

(assert (=> b!1520866 m!1404045))

(declare-fun m!1404081 () Bool)

(assert (=> b!1520866 m!1404081))

(assert (=> b!1520866 m!1404081))

(assert (=> b!1520866 m!1404045))

(declare-fun m!1404083 () Bool)

(assert (=> b!1520866 m!1404083))

(declare-fun m!1404085 () Bool)

(assert (=> b!1520865 m!1404085))

(assert (=> b!1520857 m!1404045))

(assert (=> b!1520857 m!1404045))

(declare-fun m!1404087 () Bool)

(assert (=> b!1520857 m!1404087))

(assert (=> b!1520861 m!1404045))

(assert (=> b!1520861 m!1404045))

(declare-fun m!1404089 () Bool)

(assert (=> b!1520861 m!1404089))

(check-sat (not b!1520868) (not b!1520858) (not b!1520867) (not start!129662) (not b!1520865) (not b!1520857) (not b!1520856) (not b!1520866) (not b!1520863) (not b!1520861) (not b!1520864) (not b!1520859) (not b!1520862))
(check-sat)
