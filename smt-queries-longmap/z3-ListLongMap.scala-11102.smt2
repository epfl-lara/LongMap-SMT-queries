; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130004 () Bool)

(assert start!130004)

(declare-fun b!1524079 () Bool)

(declare-fun res!1041876 () Bool)

(declare-fun e!850041 () Bool)

(assert (=> b!1524079 (=> (not res!1041876) (not e!850041))))

(declare-datatypes ((array!101428 0))(
  ( (array!101429 (arr!48940 (Array (_ BitVec 32) (_ BitVec 64))) (size!49491 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101428)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101428 (_ BitVec 32)) Bool)

(assert (=> b!1524079 (= res!1041876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524080 () Bool)

(declare-fun res!1041881 () Bool)

(assert (=> b!1524080 (=> (not res!1041881) (not e!850041))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524080 (= res!1041881 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49491 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49491 a!2804))))))

(declare-fun b!1524081 () Bool)

(declare-fun res!1041883 () Bool)

(assert (=> b!1524081 (=> (not res!1041883) (not e!850041))))

(declare-datatypes ((List!35410 0))(
  ( (Nil!35407) (Cons!35406 (h!36845 (_ BitVec 64)) (t!50096 List!35410)) )
))
(declare-fun arrayNoDuplicates!0 (array!101428 (_ BitVec 32) List!35410) Bool)

(assert (=> b!1524081 (= res!1041883 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35407))))

(declare-fun b!1524082 () Bool)

(declare-fun res!1041875 () Bool)

(assert (=> b!1524082 (=> (not res!1041875) (not e!850041))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1524082 (= res!1041875 (and (= (size!49491 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49491 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49491 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1041882 () Bool)

(assert (=> start!130004 (=> (not res!1041882) (not e!850041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130004 (= res!1041882 (validMask!0 mask!2512))))

(assert (=> start!130004 e!850041))

(assert (=> start!130004 true))

(declare-fun array_inv!38221 (array!101428) Bool)

(assert (=> start!130004 (array_inv!38221 a!2804)))

(declare-fun b!1524083 () Bool)

(declare-fun e!850040 () Bool)

(assert (=> b!1524083 (= e!850041 e!850040)))

(declare-fun res!1041877 () Bool)

(assert (=> b!1524083 (=> (not res!1041877) (not e!850040))))

(declare-datatypes ((SeekEntryResult!12998 0))(
  ( (MissingZero!12998 (index!54387 (_ BitVec 32))) (Found!12998 (index!54388 (_ BitVec 32))) (Intermediate!12998 (undefined!13810 Bool) (index!54389 (_ BitVec 32)) (x!136287 (_ BitVec 32))) (Undefined!12998) (MissingVacant!12998 (index!54390 (_ BitVec 32))) )
))
(declare-fun lt!660286 () SeekEntryResult!12998)

(declare-fun lt!660285 () SeekEntryResult!12998)

(assert (=> b!1524083 (= res!1041877 (= lt!660286 lt!660285))))

(assert (=> b!1524083 (= lt!660285 (Intermediate!12998 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101428 (_ BitVec 32)) SeekEntryResult!12998)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524083 (= lt!660286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48940 a!2804) j!70) mask!2512) (select (arr!48940 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524084 () Bool)

(declare-fun res!1041878 () Bool)

(assert (=> b!1524084 (=> (not res!1041878) (not e!850041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524084 (= res!1041878 (validKeyInArray!0 (select (arr!48940 a!2804) i!961)))))

(declare-fun b!1524085 () Bool)

(declare-fun res!1041879 () Bool)

(assert (=> b!1524085 (=> (not res!1041879) (not e!850041))))

(assert (=> b!1524085 (= res!1041879 (validKeyInArray!0 (select (arr!48940 a!2804) j!70)))))

(declare-fun b!1524086 () Bool)

(assert (=> b!1524086 (= e!850040 (bvsgt #b00000000000000000000000000000000 (size!49491 a!2804)))))

(declare-fun b!1524087 () Bool)

(declare-fun res!1041880 () Bool)

(assert (=> b!1524087 (=> (not res!1041880) (not e!850040))))

(assert (=> b!1524087 (= res!1041880 (= lt!660286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48940 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48940 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101429 (store (arr!48940 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804)) mask!2512)))))

(declare-fun b!1524088 () Bool)

(declare-fun res!1041884 () Bool)

(assert (=> b!1524088 (=> (not res!1041884) (not e!850040))))

(assert (=> b!1524088 (= res!1041884 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48940 a!2804) j!70) a!2804 mask!2512) lt!660285))))

(assert (= (and start!130004 res!1041882) b!1524082))

(assert (= (and b!1524082 res!1041875) b!1524084))

(assert (= (and b!1524084 res!1041878) b!1524085))

(assert (= (and b!1524085 res!1041879) b!1524079))

(assert (= (and b!1524079 res!1041876) b!1524081))

(assert (= (and b!1524081 res!1041883) b!1524080))

(assert (= (and b!1524080 res!1041881) b!1524083))

(assert (= (and b!1524083 res!1041877) b!1524088))

(assert (= (and b!1524088 res!1041884) b!1524087))

(assert (= (and b!1524087 res!1041880) b!1524086))

(declare-fun m!1407057 () Bool)

(assert (=> b!1524084 m!1407057))

(assert (=> b!1524084 m!1407057))

(declare-fun m!1407059 () Bool)

(assert (=> b!1524084 m!1407059))

(declare-fun m!1407061 () Bool)

(assert (=> b!1524083 m!1407061))

(assert (=> b!1524083 m!1407061))

(declare-fun m!1407063 () Bool)

(assert (=> b!1524083 m!1407063))

(assert (=> b!1524083 m!1407063))

(assert (=> b!1524083 m!1407061))

(declare-fun m!1407065 () Bool)

(assert (=> b!1524083 m!1407065))

(declare-fun m!1407067 () Bool)

(assert (=> b!1524087 m!1407067))

(declare-fun m!1407069 () Bool)

(assert (=> b!1524087 m!1407069))

(assert (=> b!1524087 m!1407069))

(declare-fun m!1407071 () Bool)

(assert (=> b!1524087 m!1407071))

(assert (=> b!1524087 m!1407071))

(assert (=> b!1524087 m!1407069))

(declare-fun m!1407073 () Bool)

(assert (=> b!1524087 m!1407073))

(assert (=> b!1524085 m!1407061))

(assert (=> b!1524085 m!1407061))

(declare-fun m!1407075 () Bool)

(assert (=> b!1524085 m!1407075))

(assert (=> b!1524088 m!1407061))

(assert (=> b!1524088 m!1407061))

(declare-fun m!1407077 () Bool)

(assert (=> b!1524088 m!1407077))

(declare-fun m!1407079 () Bool)

(assert (=> b!1524081 m!1407079))

(declare-fun m!1407081 () Bool)

(assert (=> start!130004 m!1407081))

(declare-fun m!1407083 () Bool)

(assert (=> start!130004 m!1407083))

(declare-fun m!1407085 () Bool)

(assert (=> b!1524079 m!1407085))

(check-sat (not b!1524079) (not b!1524085) (not b!1524088) (not b!1524087) (not b!1524083) (not start!130004) (not b!1524084) (not b!1524081))
(check-sat)
