; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129582 () Bool)

(assert start!129582)

(declare-fun b!1521529 () Bool)

(declare-fun e!848456 () Bool)

(declare-fun e!848457 () Bool)

(assert (=> b!1521529 (= e!848456 e!848457)))

(declare-fun res!1040965 () Bool)

(assert (=> b!1521529 (=> (not res!1040965) (not e!848457))))

(declare-datatypes ((SeekEntryResult!13050 0))(
  ( (MissingZero!13050 (index!54595 (_ BitVec 32))) (Found!13050 (index!54596 (_ BitVec 32))) (Intermediate!13050 (undefined!13862 Bool) (index!54597 (_ BitVec 32)) (x!136288 (_ BitVec 32))) (Undefined!13050) (MissingVacant!13050 (index!54598 (_ BitVec 32))) )
))
(declare-fun lt!659151 () SeekEntryResult!13050)

(declare-fun lt!659150 () SeekEntryResult!13050)

(assert (=> b!1521529 (= res!1040965 (= lt!659151 lt!659150))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521529 (= lt!659150 (Intermediate!13050 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101257 0))(
  ( (array!101258 (arr!48862 (Array (_ BitVec 32) (_ BitVec 64))) (size!49414 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101257)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101257 (_ BitVec 32)) SeekEntryResult!13050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521529 (= lt!659151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48862 a!2804) j!70) mask!2512) (select (arr!48862 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521530 () Bool)

(declare-fun res!1040966 () Bool)

(assert (=> b!1521530 (=> (not res!1040966) (not e!848457))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521530 (= res!1040966 (= lt!659151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48862 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48862 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101258 (store (arr!48862 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49414 a!2804)) mask!2512)))))

(declare-fun b!1521531 () Bool)

(declare-fun res!1040964 () Bool)

(assert (=> b!1521531 (=> (not res!1040964) (not e!848456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101257 (_ BitVec 32)) Bool)

(assert (=> b!1521531 (= res!1040964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521532 () Bool)

(declare-fun res!1040958 () Bool)

(assert (=> b!1521532 (=> (not res!1040958) (not e!848456))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521532 (= res!1040958 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49414 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49414 a!2804))))))

(declare-fun b!1521533 () Bool)

(declare-fun res!1040960 () Bool)

(assert (=> b!1521533 (=> (not res!1040960) (not e!848457))))

(assert (=> b!1521533 (= res!1040960 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48862 a!2804) j!70) a!2804 mask!2512) lt!659150))))

(declare-fun res!1040957 () Bool)

(assert (=> start!129582 (=> (not res!1040957) (not e!848456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129582 (= res!1040957 (validMask!0 mask!2512))))

(assert (=> start!129582 e!848456))

(assert (=> start!129582 true))

(declare-fun array_inv!38095 (array!101257) Bool)

(assert (=> start!129582 (array_inv!38095 a!2804)))

(declare-fun b!1521534 () Bool)

(declare-fun res!1040961 () Bool)

(assert (=> b!1521534 (=> (not res!1040961) (not e!848456))))

(assert (=> b!1521534 (= res!1040961 (and (= (size!49414 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49414 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49414 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521535 () Bool)

(declare-fun res!1040962 () Bool)

(assert (=> b!1521535 (=> (not res!1040962) (not e!848456))))

(declare-datatypes ((List!35423 0))(
  ( (Nil!35420) (Cons!35419 (h!36841 (_ BitVec 64)) (t!50109 List!35423)) )
))
(declare-fun arrayNoDuplicates!0 (array!101257 (_ BitVec 32) List!35423) Bool)

(assert (=> b!1521535 (= res!1040962 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35420))))

(declare-fun b!1521536 () Bool)

(assert (=> b!1521536 (= e!848457 (bvsgt #b00000000000000000000000000000000 (size!49414 a!2804)))))

(declare-fun b!1521537 () Bool)

(declare-fun res!1040963 () Bool)

(assert (=> b!1521537 (=> (not res!1040963) (not e!848456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521537 (= res!1040963 (validKeyInArray!0 (select (arr!48862 a!2804) j!70)))))

(declare-fun b!1521538 () Bool)

(declare-fun res!1040959 () Bool)

(assert (=> b!1521538 (=> (not res!1040959) (not e!848456))))

(assert (=> b!1521538 (= res!1040959 (validKeyInArray!0 (select (arr!48862 a!2804) i!961)))))

(assert (= (and start!129582 res!1040957) b!1521534))

(assert (= (and b!1521534 res!1040961) b!1521538))

(assert (= (and b!1521538 res!1040959) b!1521537))

(assert (= (and b!1521537 res!1040963) b!1521531))

(assert (= (and b!1521531 res!1040964) b!1521535))

(assert (= (and b!1521535 res!1040962) b!1521532))

(assert (= (and b!1521532 res!1040958) b!1521529))

(assert (= (and b!1521529 res!1040965) b!1521533))

(assert (= (and b!1521533 res!1040960) b!1521530))

(assert (= (and b!1521530 res!1040966) b!1521536))

(declare-fun m!1404081 () Bool)

(assert (=> b!1521535 m!1404081))

(declare-fun m!1404083 () Bool)

(assert (=> b!1521529 m!1404083))

(assert (=> b!1521529 m!1404083))

(declare-fun m!1404085 () Bool)

(assert (=> b!1521529 m!1404085))

(assert (=> b!1521529 m!1404085))

(assert (=> b!1521529 m!1404083))

(declare-fun m!1404087 () Bool)

(assert (=> b!1521529 m!1404087))

(declare-fun m!1404089 () Bool)

(assert (=> b!1521531 m!1404089))

(declare-fun m!1404091 () Bool)

(assert (=> b!1521538 m!1404091))

(assert (=> b!1521538 m!1404091))

(declare-fun m!1404093 () Bool)

(assert (=> b!1521538 m!1404093))

(assert (=> b!1521533 m!1404083))

(assert (=> b!1521533 m!1404083))

(declare-fun m!1404095 () Bool)

(assert (=> b!1521533 m!1404095))

(declare-fun m!1404097 () Bool)

(assert (=> start!129582 m!1404097))

(declare-fun m!1404099 () Bool)

(assert (=> start!129582 m!1404099))

(assert (=> b!1521537 m!1404083))

(assert (=> b!1521537 m!1404083))

(declare-fun m!1404101 () Bool)

(assert (=> b!1521537 m!1404101))

(declare-fun m!1404103 () Bool)

(assert (=> b!1521530 m!1404103))

(declare-fun m!1404105 () Bool)

(assert (=> b!1521530 m!1404105))

(assert (=> b!1521530 m!1404105))

(declare-fun m!1404107 () Bool)

(assert (=> b!1521530 m!1404107))

(assert (=> b!1521530 m!1404107))

(assert (=> b!1521530 m!1404105))

(declare-fun m!1404109 () Bool)

(assert (=> b!1521530 m!1404109))

(check-sat (not b!1521529) (not b!1521538) (not b!1521535) (not b!1521533) (not start!129582) (not b!1521537) (not b!1521531) (not b!1521530))
(check-sat)
