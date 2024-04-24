; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129614 () Bool)

(assert start!129614)

(declare-fun b!1519900 () Bool)

(declare-fun e!848084 () Bool)

(declare-fun e!848083 () Bool)

(assert (=> b!1519900 (= e!848084 (not e!848083))))

(declare-fun res!1038453 () Bool)

(assert (=> b!1519900 (=> res!1038453 e!848083)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101233 0))(
  ( (array!101234 (arr!48847 (Array (_ BitVec 32) (_ BitVec 64))) (size!49398 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101233)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519900 (= res!1038453 (or (not (= (select (arr!48847 a!2804) j!70) (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!848085 () Bool)

(assert (=> b!1519900 e!848085))

(declare-fun res!1038450 () Bool)

(assert (=> b!1519900 (=> (not res!1038450) (not e!848085))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101233 (_ BitVec 32)) Bool)

(assert (=> b!1519900 (= res!1038450 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50725 0))(
  ( (Unit!50726) )
))
(declare-fun lt!658719 () Unit!50725)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50725)

(assert (=> b!1519900 (= lt!658719 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519901 () Bool)

(declare-fun e!848088 () Bool)

(assert (=> b!1519901 (= e!848088 true)))

(declare-fun lt!658718 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12911 0))(
  ( (MissingZero!12911 (index!54039 (_ BitVec 32))) (Found!12911 (index!54040 (_ BitVec 32))) (Intermediate!12911 (undefined!13723 Bool) (index!54041 (_ BitVec 32)) (x!135928 (_ BitVec 32))) (Undefined!12911) (MissingVacant!12911 (index!54042 (_ BitVec 32))) )
))
(declare-fun lt!658716 () SeekEntryResult!12911)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101233 (_ BitVec 32)) SeekEntryResult!12911)

(assert (=> b!1519901 (= lt!658716 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658718 (select (arr!48847 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519902 () Bool)

(declare-fun res!1038451 () Bool)

(declare-fun e!848087 () Bool)

(assert (=> b!1519902 (=> (not res!1038451) (not e!848087))))

(assert (=> b!1519902 (= res!1038451 (and (= (size!49398 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49398 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49398 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519903 () Bool)

(assert (=> b!1519903 (= e!848083 e!848088)))

(declare-fun res!1038444 () Bool)

(assert (=> b!1519903 (=> res!1038444 e!848088)))

(assert (=> b!1519903 (= res!1038444 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658718 #b00000000000000000000000000000000) (bvsge lt!658718 (size!49398 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519903 (= lt!658718 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1519904 () Bool)

(declare-fun res!1038455 () Bool)

(assert (=> b!1519904 (=> (not res!1038455) (not e!848087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519904 (= res!1038455 (validKeyInArray!0 (select (arr!48847 a!2804) j!70)))))

(declare-fun b!1519905 () Bool)

(declare-fun res!1038452 () Bool)

(assert (=> b!1519905 (=> (not res!1038452) (not e!848087))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519905 (= res!1038452 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49398 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49398 a!2804))))))

(declare-fun b!1519907 () Bool)

(assert (=> b!1519907 (= e!848087 e!848084)))

(declare-fun res!1038446 () Bool)

(assert (=> b!1519907 (=> (not res!1038446) (not e!848084))))

(declare-fun lt!658717 () SeekEntryResult!12911)

(declare-fun lt!658720 () SeekEntryResult!12911)

(assert (=> b!1519907 (= res!1038446 (= lt!658717 lt!658720))))

(assert (=> b!1519907 (= lt!658720 (Intermediate!12911 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519907 (= lt!658717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48847 a!2804) j!70) mask!2512) (select (arr!48847 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519908 () Bool)

(declare-fun res!1038449 () Bool)

(assert (=> b!1519908 (=> (not res!1038449) (not e!848087))))

(assert (=> b!1519908 (= res!1038449 (validKeyInArray!0 (select (arr!48847 a!2804) i!961)))))

(declare-fun b!1519909 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101233 (_ BitVec 32)) SeekEntryResult!12911)

(assert (=> b!1519909 (= e!848085 (= (seekEntry!0 (select (arr!48847 a!2804) j!70) a!2804 mask!2512) (Found!12911 j!70)))))

(declare-fun b!1519910 () Bool)

(declare-fun res!1038445 () Bool)

(assert (=> b!1519910 (=> (not res!1038445) (not e!848087))))

(declare-datatypes ((List!35317 0))(
  ( (Nil!35314) (Cons!35313 (h!36743 (_ BitVec 64)) (t!50003 List!35317)) )
))
(declare-fun arrayNoDuplicates!0 (array!101233 (_ BitVec 32) List!35317) Bool)

(assert (=> b!1519910 (= res!1038445 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35314))))

(declare-fun b!1519911 () Bool)

(declare-fun res!1038448 () Bool)

(assert (=> b!1519911 (=> (not res!1038448) (not e!848087))))

(assert (=> b!1519911 (= res!1038448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519912 () Bool)

(declare-fun res!1038454 () Bool)

(assert (=> b!1519912 (=> (not res!1038454) (not e!848084))))

(assert (=> b!1519912 (= res!1038454 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48847 a!2804) j!70) a!2804 mask!2512) lt!658720))))

(declare-fun b!1519906 () Bool)

(declare-fun res!1038443 () Bool)

(assert (=> b!1519906 (=> (not res!1038443) (not e!848084))))

(assert (=> b!1519906 (= res!1038443 (= lt!658717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101234 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49398 a!2804)) mask!2512)))))

(declare-fun res!1038447 () Bool)

(assert (=> start!129614 (=> (not res!1038447) (not e!848087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129614 (= res!1038447 (validMask!0 mask!2512))))

(assert (=> start!129614 e!848087))

(assert (=> start!129614 true))

(declare-fun array_inv!38128 (array!101233) Bool)

(assert (=> start!129614 (array_inv!38128 a!2804)))

(assert (= (and start!129614 res!1038447) b!1519902))

(assert (= (and b!1519902 res!1038451) b!1519908))

(assert (= (and b!1519908 res!1038449) b!1519904))

(assert (= (and b!1519904 res!1038455) b!1519911))

(assert (= (and b!1519911 res!1038448) b!1519910))

(assert (= (and b!1519910 res!1038445) b!1519905))

(assert (= (and b!1519905 res!1038452) b!1519907))

(assert (= (and b!1519907 res!1038446) b!1519912))

(assert (= (and b!1519912 res!1038454) b!1519906))

(assert (= (and b!1519906 res!1038443) b!1519900))

(assert (= (and b!1519900 res!1038450) b!1519909))

(assert (= (and b!1519900 (not res!1038453)) b!1519903))

(assert (= (and b!1519903 (not res!1038444)) b!1519901))

(declare-fun m!1403049 () Bool)

(assert (=> b!1519904 m!1403049))

(assert (=> b!1519904 m!1403049))

(declare-fun m!1403051 () Bool)

(assert (=> b!1519904 m!1403051))

(assert (=> b!1519901 m!1403049))

(assert (=> b!1519901 m!1403049))

(declare-fun m!1403053 () Bool)

(assert (=> b!1519901 m!1403053))

(declare-fun m!1403055 () Bool)

(assert (=> start!129614 m!1403055))

(declare-fun m!1403057 () Bool)

(assert (=> start!129614 m!1403057))

(declare-fun m!1403059 () Bool)

(assert (=> b!1519908 m!1403059))

(assert (=> b!1519908 m!1403059))

(declare-fun m!1403061 () Bool)

(assert (=> b!1519908 m!1403061))

(assert (=> b!1519912 m!1403049))

(assert (=> b!1519912 m!1403049))

(declare-fun m!1403063 () Bool)

(assert (=> b!1519912 m!1403063))

(assert (=> b!1519907 m!1403049))

(assert (=> b!1519907 m!1403049))

(declare-fun m!1403065 () Bool)

(assert (=> b!1519907 m!1403065))

(assert (=> b!1519907 m!1403065))

(assert (=> b!1519907 m!1403049))

(declare-fun m!1403067 () Bool)

(assert (=> b!1519907 m!1403067))

(declare-fun m!1403069 () Bool)

(assert (=> b!1519906 m!1403069))

(declare-fun m!1403071 () Bool)

(assert (=> b!1519906 m!1403071))

(assert (=> b!1519906 m!1403071))

(declare-fun m!1403073 () Bool)

(assert (=> b!1519906 m!1403073))

(assert (=> b!1519906 m!1403073))

(assert (=> b!1519906 m!1403071))

(declare-fun m!1403075 () Bool)

(assert (=> b!1519906 m!1403075))

(assert (=> b!1519900 m!1403049))

(declare-fun m!1403077 () Bool)

(assert (=> b!1519900 m!1403077))

(assert (=> b!1519900 m!1403069))

(assert (=> b!1519900 m!1403071))

(declare-fun m!1403079 () Bool)

(assert (=> b!1519900 m!1403079))

(assert (=> b!1519909 m!1403049))

(assert (=> b!1519909 m!1403049))

(declare-fun m!1403081 () Bool)

(assert (=> b!1519909 m!1403081))

(declare-fun m!1403083 () Bool)

(assert (=> b!1519910 m!1403083))

(declare-fun m!1403085 () Bool)

(assert (=> b!1519903 m!1403085))

(declare-fun m!1403087 () Bool)

(assert (=> b!1519911 m!1403087))

(check-sat (not b!1519910) (not b!1519903) (not b!1519908) (not start!129614) (not b!1519901) (not b!1519911) (not b!1519909) (not b!1519912) (not b!1519906) (not b!1519904) (not b!1519907) (not b!1519900))
(check-sat)
