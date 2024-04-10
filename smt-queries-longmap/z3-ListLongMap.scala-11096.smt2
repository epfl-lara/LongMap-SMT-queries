; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129600 () Bool)

(assert start!129600)

(declare-fun b!1521412 () Bool)

(declare-fun res!1040641 () Bool)

(declare-fun e!848521 () Bool)

(assert (=> b!1521412 (=> (not res!1040641) (not e!848521))))

(declare-datatypes ((array!101275 0))(
  ( (array!101276 (arr!48870 (Array (_ BitVec 32) (_ BitVec 64))) (size!49420 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101275)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521412 (= res!1040641 (validKeyInArray!0 (select (arr!48870 a!2804) i!961)))))

(declare-fun res!1040636 () Bool)

(assert (=> start!129600 (=> (not res!1040636) (not e!848521))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129600 (= res!1040636 (validMask!0 mask!2512))))

(assert (=> start!129600 e!848521))

(assert (=> start!129600 true))

(declare-fun array_inv!37898 (array!101275) Bool)

(assert (=> start!129600 (array_inv!37898 a!2804)))

(declare-fun b!1521413 () Bool)

(declare-fun res!1040634 () Bool)

(assert (=> b!1521413 (=> (not res!1040634) (not e!848521))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521413 (= res!1040634 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49420 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49420 a!2804))))))

(declare-fun b!1521414 () Bool)

(declare-fun res!1040639 () Bool)

(assert (=> b!1521414 (=> (not res!1040639) (not e!848521))))

(declare-datatypes ((List!35353 0))(
  ( (Nil!35350) (Cons!35349 (h!36770 (_ BitVec 64)) (t!50047 List!35353)) )
))
(declare-fun arrayNoDuplicates!0 (array!101275 (_ BitVec 32) List!35353) Bool)

(assert (=> b!1521414 (= res!1040639 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35350))))

(declare-fun b!1521415 () Bool)

(declare-fun res!1040638 () Bool)

(assert (=> b!1521415 (=> (not res!1040638) (not e!848521))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1521415 (= res!1040638 (and (= (size!49420 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49420 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49420 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521416 () Bool)

(declare-fun res!1040640 () Bool)

(assert (=> b!1521416 (=> (not res!1040640) (not e!848521))))

(declare-datatypes ((SeekEntryResult!13035 0))(
  ( (MissingZero!13035 (index!54535 (_ BitVec 32))) (Found!13035 (index!54536 (_ BitVec 32))) (Intermediate!13035 (undefined!13847 Bool) (index!54537 (_ BitVec 32)) (x!136231 (_ BitVec 32))) (Undefined!13035) (MissingVacant!13035 (index!54538 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101275 (_ BitVec 32)) SeekEntryResult!13035)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521416 (= res!1040640 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48870 a!2804) j!70) mask!2512) (select (arr!48870 a!2804) j!70) a!2804 mask!2512) (Intermediate!13035 false resIndex!21 resX!21)))))

(declare-fun b!1521417 () Bool)

(declare-fun res!1040637 () Bool)

(assert (=> b!1521417 (=> (not res!1040637) (not e!848521))))

(assert (=> b!1521417 (= res!1040637 (validKeyInArray!0 (select (arr!48870 a!2804) j!70)))))

(declare-fun b!1521418 () Bool)

(declare-fun res!1040635 () Bool)

(assert (=> b!1521418 (=> (not res!1040635) (not e!848521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101275 (_ BitVec 32)) Bool)

(assert (=> b!1521418 (= res!1040635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521419 () Bool)

(assert (=> b!1521419 (= e!848521 false)))

(declare-fun lt!659347 () SeekEntryResult!13035)

(assert (=> b!1521419 (= lt!659347 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48870 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129600 res!1040636) b!1521415))

(assert (= (and b!1521415 res!1040638) b!1521412))

(assert (= (and b!1521412 res!1040641) b!1521417))

(assert (= (and b!1521417 res!1040637) b!1521418))

(assert (= (and b!1521418 res!1040635) b!1521414))

(assert (= (and b!1521414 res!1040639) b!1521413))

(assert (= (and b!1521413 res!1040634) b!1521416))

(assert (= (and b!1521416 res!1040640) b!1521419))

(declare-fun m!1404507 () Bool)

(assert (=> b!1521412 m!1404507))

(assert (=> b!1521412 m!1404507))

(declare-fun m!1404509 () Bool)

(assert (=> b!1521412 m!1404509))

(declare-fun m!1404511 () Bool)

(assert (=> b!1521418 m!1404511))

(declare-fun m!1404513 () Bool)

(assert (=> b!1521416 m!1404513))

(assert (=> b!1521416 m!1404513))

(declare-fun m!1404515 () Bool)

(assert (=> b!1521416 m!1404515))

(assert (=> b!1521416 m!1404515))

(assert (=> b!1521416 m!1404513))

(declare-fun m!1404517 () Bool)

(assert (=> b!1521416 m!1404517))

(assert (=> b!1521419 m!1404513))

(assert (=> b!1521419 m!1404513))

(declare-fun m!1404519 () Bool)

(assert (=> b!1521419 m!1404519))

(assert (=> b!1521417 m!1404513))

(assert (=> b!1521417 m!1404513))

(declare-fun m!1404521 () Bool)

(assert (=> b!1521417 m!1404521))

(declare-fun m!1404523 () Bool)

(assert (=> start!129600 m!1404523))

(declare-fun m!1404525 () Bool)

(assert (=> start!129600 m!1404525))

(declare-fun m!1404527 () Bool)

(assert (=> b!1521414 m!1404527))

(check-sat (not b!1521412) (not b!1521419) (not start!129600) (not b!1521416) (not b!1521414) (not b!1521417) (not b!1521418))
