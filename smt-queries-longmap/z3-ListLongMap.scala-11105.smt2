; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129600 () Bool)

(assert start!129600)

(declare-fun b!1521790 () Bool)

(declare-fun res!1041223 () Bool)

(declare-fun e!848537 () Bool)

(assert (=> b!1521790 (=> (not res!1041223) (not e!848537))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101275 0))(
  ( (array!101276 (arr!48871 (Array (_ BitVec 32) (_ BitVec 64))) (size!49423 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101275)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521790 (= res!1041223 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49423 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49423 a!2804))))))

(declare-fun b!1521791 () Bool)

(declare-fun res!1041219 () Bool)

(assert (=> b!1521791 (=> (not res!1041219) (not e!848537))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521791 (= res!1041219 (validKeyInArray!0 (select (arr!48871 a!2804) j!70)))))

(declare-fun b!1521793 () Bool)

(declare-fun res!1041226 () Bool)

(assert (=> b!1521793 (=> (not res!1041226) (not e!848537))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101275 (_ BitVec 32)) Bool)

(assert (=> b!1521793 (= res!1041226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521794 () Bool)

(declare-fun res!1041225 () Bool)

(declare-fun e!848536 () Bool)

(assert (=> b!1521794 (=> (not res!1041225) (not e!848536))))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13059 0))(
  ( (MissingZero!13059 (index!54631 (_ BitVec 32))) (Found!13059 (index!54632 (_ BitVec 32))) (Intermediate!13059 (undefined!13871 Bool) (index!54633 (_ BitVec 32)) (x!136321 (_ BitVec 32))) (Undefined!13059) (MissingVacant!13059 (index!54634 (_ BitVec 32))) )
))
(declare-fun lt!659208 () SeekEntryResult!13059)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101275 (_ BitVec 32)) SeekEntryResult!13059)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521794 (= res!1041225 (= lt!659208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48871 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48871 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101276 (store (arr!48871 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49423 a!2804)) mask!2512)))))

(declare-fun b!1521795 () Bool)

(declare-fun res!1041222 () Bool)

(assert (=> b!1521795 (=> (not res!1041222) (not e!848537))))

(declare-datatypes ((List!35432 0))(
  ( (Nil!35429) (Cons!35428 (h!36850 (_ BitVec 64)) (t!50118 List!35432)) )
))
(declare-fun arrayNoDuplicates!0 (array!101275 (_ BitVec 32) List!35432) Bool)

(assert (=> b!1521795 (= res!1041222 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35429))))

(declare-fun b!1521796 () Bool)

(assert (=> b!1521796 (= e!848536 (not true))))

(assert (=> b!1521796 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50741 0))(
  ( (Unit!50742) )
))
(declare-fun lt!659206 () Unit!50741)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50741)

(assert (=> b!1521796 (= lt!659206 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1521797 () Bool)

(assert (=> b!1521797 (= e!848537 e!848536)))

(declare-fun res!1041224 () Bool)

(assert (=> b!1521797 (=> (not res!1041224) (not e!848536))))

(declare-fun lt!659207 () SeekEntryResult!13059)

(assert (=> b!1521797 (= res!1041224 (= lt!659208 lt!659207))))

(assert (=> b!1521797 (= lt!659207 (Intermediate!13059 false resIndex!21 resX!21))))

(assert (=> b!1521797 (= lt!659208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48871 a!2804) j!70) mask!2512) (select (arr!48871 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521798 () Bool)

(declare-fun res!1041227 () Bool)

(assert (=> b!1521798 (=> (not res!1041227) (not e!848537))))

(assert (=> b!1521798 (= res!1041227 (and (= (size!49423 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49423 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49423 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521799 () Bool)

(declare-fun res!1041221 () Bool)

(assert (=> b!1521799 (=> (not res!1041221) (not e!848537))))

(assert (=> b!1521799 (= res!1041221 (validKeyInArray!0 (select (arr!48871 a!2804) i!961)))))

(declare-fun res!1041220 () Bool)

(assert (=> start!129600 (=> (not res!1041220) (not e!848537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129600 (= res!1041220 (validMask!0 mask!2512))))

(assert (=> start!129600 e!848537))

(assert (=> start!129600 true))

(declare-fun array_inv!38104 (array!101275) Bool)

(assert (=> start!129600 (array_inv!38104 a!2804)))

(declare-fun b!1521792 () Bool)

(declare-fun res!1041218 () Bool)

(assert (=> b!1521792 (=> (not res!1041218) (not e!848536))))

(assert (=> b!1521792 (= res!1041218 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48871 a!2804) j!70) a!2804 mask!2512) lt!659207))))

(assert (= (and start!129600 res!1041220) b!1521798))

(assert (= (and b!1521798 res!1041227) b!1521799))

(assert (= (and b!1521799 res!1041221) b!1521791))

(assert (= (and b!1521791 res!1041219) b!1521793))

(assert (= (and b!1521793 res!1041226) b!1521795))

(assert (= (and b!1521795 res!1041222) b!1521790))

(assert (= (and b!1521790 res!1041223) b!1521797))

(assert (= (and b!1521797 res!1041224) b!1521792))

(assert (= (and b!1521792 res!1041218) b!1521794))

(assert (= (and b!1521794 res!1041225) b!1521796))

(declare-fun m!1404351 () Bool)

(assert (=> b!1521792 m!1404351))

(assert (=> b!1521792 m!1404351))

(declare-fun m!1404353 () Bool)

(assert (=> b!1521792 m!1404353))

(declare-fun m!1404355 () Bool)

(assert (=> b!1521793 m!1404355))

(declare-fun m!1404357 () Bool)

(assert (=> b!1521799 m!1404357))

(assert (=> b!1521799 m!1404357))

(declare-fun m!1404359 () Bool)

(assert (=> b!1521799 m!1404359))

(assert (=> b!1521791 m!1404351))

(assert (=> b!1521791 m!1404351))

(declare-fun m!1404361 () Bool)

(assert (=> b!1521791 m!1404361))

(declare-fun m!1404363 () Bool)

(assert (=> b!1521794 m!1404363))

(declare-fun m!1404365 () Bool)

(assert (=> b!1521794 m!1404365))

(assert (=> b!1521794 m!1404365))

(declare-fun m!1404367 () Bool)

(assert (=> b!1521794 m!1404367))

(assert (=> b!1521794 m!1404367))

(assert (=> b!1521794 m!1404365))

(declare-fun m!1404369 () Bool)

(assert (=> b!1521794 m!1404369))

(declare-fun m!1404371 () Bool)

(assert (=> b!1521795 m!1404371))

(declare-fun m!1404373 () Bool)

(assert (=> b!1521796 m!1404373))

(declare-fun m!1404375 () Bool)

(assert (=> b!1521796 m!1404375))

(declare-fun m!1404377 () Bool)

(assert (=> start!129600 m!1404377))

(declare-fun m!1404379 () Bool)

(assert (=> start!129600 m!1404379))

(assert (=> b!1521797 m!1404351))

(assert (=> b!1521797 m!1404351))

(declare-fun m!1404381 () Bool)

(assert (=> b!1521797 m!1404381))

(assert (=> b!1521797 m!1404381))

(assert (=> b!1521797 m!1404351))

(declare-fun m!1404383 () Bool)

(assert (=> b!1521797 m!1404383))

(check-sat (not b!1521792) (not b!1521793) (not start!129600) (not b!1521791) (not b!1521796) (not b!1521794) (not b!1521799) (not b!1521797) (not b!1521795))
(check-sat)
