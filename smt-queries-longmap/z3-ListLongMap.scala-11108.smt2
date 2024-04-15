; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129702 () Bool)

(assert start!129702)

(declare-fun b!1522572 () Bool)

(declare-fun e!848940 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101296 0))(
  ( (array!101297 (arr!48880 (Array (_ BitVec 32) (_ BitVec 64))) (size!49432 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101296)

(declare-datatypes ((SeekEntryResult!13068 0))(
  ( (MissingZero!13068 (index!54667 (_ BitVec 32))) (Found!13068 (index!54668 (_ BitVec 32))) (Intermediate!13068 (undefined!13880 Bool) (index!54669 (_ BitVec 32)) (x!136365 (_ BitVec 32))) (Undefined!13068) (MissingVacant!13068 (index!54670 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101296 (_ BitVec 32)) SeekEntryResult!13068)

(assert (=> b!1522572 (= e!848940 (= (seekEntry!0 (select (arr!48880 a!2804) j!70) a!2804 mask!2512) (Found!13068 j!70)))))

(declare-fun b!1522573 () Bool)

(declare-fun res!1041666 () Bool)

(declare-fun e!848941 () Bool)

(assert (=> b!1522573 (=> (not res!1041666) (not e!848941))))

(declare-datatypes ((List!35441 0))(
  ( (Nil!35438) (Cons!35437 (h!36862 (_ BitVec 64)) (t!50127 List!35441)) )
))
(declare-fun arrayNoDuplicates!0 (array!101296 (_ BitVec 32) List!35441) Bool)

(assert (=> b!1522573 (= res!1041666 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35438))))

(declare-fun b!1522574 () Bool)

(declare-fun e!848939 () Bool)

(assert (=> b!1522574 (= e!848941 e!848939)))

(declare-fun res!1041671 () Bool)

(assert (=> b!1522574 (=> (not res!1041671) (not e!848939))))

(declare-fun lt!659516 () SeekEntryResult!13068)

(declare-fun lt!659517 () SeekEntryResult!13068)

(assert (=> b!1522574 (= res!1041671 (= lt!659516 lt!659517))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522574 (= lt!659517 (Intermediate!13068 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101296 (_ BitVec 32)) SeekEntryResult!13068)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522574 (= lt!659516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48880 a!2804) j!70) mask!2512) (select (arr!48880 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1041665 () Bool)

(assert (=> start!129702 (=> (not res!1041665) (not e!848941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129702 (= res!1041665 (validMask!0 mask!2512))))

(assert (=> start!129702 e!848941))

(assert (=> start!129702 true))

(declare-fun array_inv!38113 (array!101296) Bool)

(assert (=> start!129702 (array_inv!38113 a!2804)))

(declare-fun b!1522575 () Bool)

(declare-fun res!1041663 () Bool)

(assert (=> b!1522575 (=> (not res!1041663) (not e!848941))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522575 (= res!1041663 (and (= (size!49432 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49432 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49432 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522576 () Bool)

(declare-fun res!1041670 () Bool)

(assert (=> b!1522576 (=> (not res!1041670) (not e!848941))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1522576 (= res!1041670 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49432 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49432 a!2804))))))

(declare-fun b!1522577 () Bool)

(declare-fun res!1041672 () Bool)

(assert (=> b!1522577 (=> (not res!1041672) (not e!848941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522577 (= res!1041672 (validKeyInArray!0 (select (arr!48880 a!2804) j!70)))))

(declare-fun b!1522578 () Bool)

(declare-fun res!1041668 () Bool)

(assert (=> b!1522578 (=> (not res!1041668) (not e!848941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101296 (_ BitVec 32)) Bool)

(assert (=> b!1522578 (= res!1041668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522579 () Bool)

(declare-fun res!1041669 () Bool)

(assert (=> b!1522579 (=> (not res!1041669) (not e!848939))))

(assert (=> b!1522579 (= res!1041669 (= lt!659516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48880 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48880 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101297 (store (arr!48880 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49432 a!2804)) mask!2512)))))

(declare-fun b!1522580 () Bool)

(declare-fun res!1041667 () Bool)

(assert (=> b!1522580 (=> (not res!1041667) (not e!848941))))

(assert (=> b!1522580 (= res!1041667 (validKeyInArray!0 (select (arr!48880 a!2804) i!961)))))

(declare-fun b!1522581 () Bool)

(declare-fun res!1041673 () Bool)

(assert (=> b!1522581 (=> (not res!1041673) (not e!848939))))

(assert (=> b!1522581 (= res!1041673 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48880 a!2804) j!70) a!2804 mask!2512) lt!659517))))

(declare-fun b!1522582 () Bool)

(assert (=> b!1522582 (= e!848939 (not true))))

(assert (=> b!1522582 e!848940))

(declare-fun res!1041664 () Bool)

(assert (=> b!1522582 (=> (not res!1041664) (not e!848940))))

(assert (=> b!1522582 (= res!1041664 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50759 0))(
  ( (Unit!50760) )
))
(declare-fun lt!659515 () Unit!50759)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50759)

(assert (=> b!1522582 (= lt!659515 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129702 res!1041665) b!1522575))

(assert (= (and b!1522575 res!1041663) b!1522580))

(assert (= (and b!1522580 res!1041667) b!1522577))

(assert (= (and b!1522577 res!1041672) b!1522578))

(assert (= (and b!1522578 res!1041668) b!1522573))

(assert (= (and b!1522573 res!1041666) b!1522576))

(assert (= (and b!1522576 res!1041670) b!1522574))

(assert (= (and b!1522574 res!1041671) b!1522581))

(assert (= (and b!1522581 res!1041673) b!1522579))

(assert (= (and b!1522579 res!1041669) b!1522582))

(assert (= (and b!1522582 res!1041664) b!1522572))

(declare-fun m!1405061 () Bool)

(assert (=> b!1522578 m!1405061))

(declare-fun m!1405063 () Bool)

(assert (=> b!1522574 m!1405063))

(assert (=> b!1522574 m!1405063))

(declare-fun m!1405065 () Bool)

(assert (=> b!1522574 m!1405065))

(assert (=> b!1522574 m!1405065))

(assert (=> b!1522574 m!1405063))

(declare-fun m!1405067 () Bool)

(assert (=> b!1522574 m!1405067))

(declare-fun m!1405069 () Bool)

(assert (=> b!1522582 m!1405069))

(declare-fun m!1405071 () Bool)

(assert (=> b!1522582 m!1405071))

(declare-fun m!1405073 () Bool)

(assert (=> b!1522579 m!1405073))

(declare-fun m!1405075 () Bool)

(assert (=> b!1522579 m!1405075))

(assert (=> b!1522579 m!1405075))

(declare-fun m!1405077 () Bool)

(assert (=> b!1522579 m!1405077))

(assert (=> b!1522579 m!1405077))

(assert (=> b!1522579 m!1405075))

(declare-fun m!1405079 () Bool)

(assert (=> b!1522579 m!1405079))

(declare-fun m!1405081 () Bool)

(assert (=> start!129702 m!1405081))

(declare-fun m!1405083 () Bool)

(assert (=> start!129702 m!1405083))

(assert (=> b!1522577 m!1405063))

(assert (=> b!1522577 m!1405063))

(declare-fun m!1405085 () Bool)

(assert (=> b!1522577 m!1405085))

(assert (=> b!1522581 m!1405063))

(assert (=> b!1522581 m!1405063))

(declare-fun m!1405087 () Bool)

(assert (=> b!1522581 m!1405087))

(declare-fun m!1405089 () Bool)

(assert (=> b!1522580 m!1405089))

(assert (=> b!1522580 m!1405089))

(declare-fun m!1405091 () Bool)

(assert (=> b!1522580 m!1405091))

(declare-fun m!1405093 () Bool)

(assert (=> b!1522573 m!1405093))

(assert (=> b!1522572 m!1405063))

(assert (=> b!1522572 m!1405063))

(declare-fun m!1405095 () Bool)

(assert (=> b!1522572 m!1405095))

(check-sat (not b!1522574) (not b!1522577) (not b!1522573) (not b!1522572) (not b!1522581) (not b!1522582) (not start!129702) (not b!1522578) (not b!1522579) (not b!1522580))
(check-sat)
